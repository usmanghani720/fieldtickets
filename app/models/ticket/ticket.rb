require 'fx_datetime'

# A Ticket is used by a crew chief Employee to report their work back to management and payroll.
class Ticket::Ticket < ActiveRecord::Base
  include CreatedBy
  
  acts_as_paranoid
  
  # For accounting purposes, what are the ticket costs billed to?
  enum bill_to: {
    job: 0,
    job_correction: 1,
    cancelled_job: 2,
    # non-job items below
    weather: 3,
    overhead: 4,
    office_staff: 5,
    transport: 6,
    shop: 7
  }
  
  # If the ticket is billed to "Job" or "Cancelled Job", it'll reference the Job here.
  belongs_to :job
  
  has_many :employees
  #has_many :employee_entries, through: :employees
  # no need for this yet
  
  has_many :vehicles
  #has_many :vehicle_entries, through: :vehicles
  # no need for this yet
  
  has_many :mills, -> { mills }, class_name: '::Ticket::Vehicle'
  # has_many :mill_entries, source: :vehicle_entries, through: :mills
  # couldn't get this working
  
  has_many :notes
  
    
  # Whether the Customer's representative has signed off on the Job.
  enum approval: { pending_approval: 0, approved: 1, disapproved: 2 }
  
  # Use Paperclip to attach a customer signature
  has_attached_file :approval_signature,
    styles: {
      thumb: "150x300>",
      normal: "1000x1000>"
    }
  validates_attachment_content_type :approval_signature, content_type: /\Aimage\/.*\Z/
  
  # If customer has approved or disapproved, certain info is required.
  with_options unless: :pending_approval?, presence: true do |ticket|
    ticket.validates :approval_name_and_title, length: { minimum: 9 }
    ticket.validates :approval_email, email: true
    ticket.validates :approval_signature
  end
  
  # Require feedback only if customer has DISAPPROVED.
  validates :approval_feedback, presence: true, if: :disapproved?

  # Make sure milling dimensions, if entered, are a number greater than 0
  with_options if: :milling_dimensions_required? do |t|
    t.validates :milling_length, numericality: { greater_than: 0 }
    t.validates :milling_width, numericality: { greater_than: 0 }
    t.validates :milling_depth, numericality: {
      greater_than: 0,
      less_than_or_equal_to: 24
    }
  end
  
  with_options numericality: { greater_than_or_equal_to: 0 }, allow_blank: true do |t|
    t.validates :delays_trucks
    t.validates :delays_paving
    t.validates :delays_mot
    t.validates :delays_other
  end
  validates :delays_notes, presence: true, if: :delays_present?
  
  with_options numericality: { greater_than_or_equal_to: 0 }, allow_blank: true do |t|
    t.validates :supplies_teeth
    t.validates :supplies_holders
    t.validates :supplies_oil
  end
  
  # If this Ticket shouldn't be attached to a Job, set job to nil.
  before_save :erase_job_if_not_needed
  
  after_create :add_crew_chief_to_employees
  
  # For now, crew_chief is locked to the creator.
  # In the future, it can be overridden here.
  def crew_chief
    creator
  end
  
  # Earliest mill start time, used for customer reports
  # Latest mill end time, used for customer reports, nil if ongoing
  def mill_times
    start_time = nil
    end_time = nil
    end_time_is_nil = false
    
    mills.each do |mill|
      entries = mill.entries.on_the_job
      
      if not entries.blank?
      
        if entry_time = entries.first.time
          if (not start_time) or (start_time < entry_time)
            start_time = entry_time
          end
        end
        
        if entry_time = entries.last.time_end
          if (not end_time) or (end_time < entry_time)
            end_time = entry_time
          end
        else
          end_time_is_nil = true
        end
        
      end
      
    end
    
    # a nil means the job is still ongoing
    if end_time_is_nil
      [start_time, nil]
    else
      [start_time, end_time]
    end
  end
  

  # Allow UI accessor field :job_name_entry to SET the :job_id OR :job_name_override as appropriate
  def job_name_entry=(new_value)
    self.job = Job.where(display_name: new_value).first
    
    if self.job
      self.job_name_override = nil
    else
      self.job_name_override = new_value
    end
  end
  
  # Allow UI accessor field :job_name_entry to READ the :job_id OR :job_name_override as appropriate
  def job_name_entry
    if job
      job.to_s
    else
      job_name_override
    end
  end
  
  # Returns true if any delays are entered
  def delays_present?
    [:trucks, :paving, :mot, :other].each do |delay_type|
      val = self["delays_#{delay_type}"].to_f
      return true if val > 0
    end
    false
  end
  
  # Adds up delays in hours
  def delays_total
    total = 0
    
    [:trucks, :paving, :mot, :other].each do |delay_type|
      val = self["delays_#{delay_type}"].to_f
      total += val
    end
    
    total
  end
  
  # Should the Ticket be attached to a Job?
  def job_required?
    case bill_to
    when 'job', 'job_correction', 'cancelled_job'
      true
    else
      false
    end
  end
  
  # Is the billing yet to be filled out?
  def bill_to_blank?
    job_required? and job.blank?
  end
  
  # If any milling dimensions are inputted, they should all be required.
  # This is really just for validations.
  def milling_dimensions_required?
    milling_length.present? or milling_width.present? or milling_depth.present?
  end
  
  # Calculate the dimensions of the milled area
  def milling_square_feet
    if milling_length.present? and milling_width.present?
      milling_length * milling_width
    end
  end
  
  # Calculate the dimensions of the milled area
  # …converted to square yards
  def milling_square_yards
    if milling_square_feet
      (milling_square_feet / 9).to_i
    end
  end
  
  def finalized?
    finalized_at.present?
  end
  
  def finalize!
    update(finalized_at: Time.now)
  end

  
  private
  
    def add_crew_chief_to_employees
      if crew_chief and crew_chief.crew_chief?
        ticket_employee = employees.create(employee: creator)
      end
    end
  
    # If this Ticket shouldn't be attached to a Job, set job to nil.
      def erase_job_if_not_needed
      if not job_required?
        self.job = nil
      end
    end
end

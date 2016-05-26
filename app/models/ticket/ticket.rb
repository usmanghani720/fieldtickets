require 'fx_datetime'

# A Ticket is used by a crew chief Employee to report their work back to management and payroll.
class Ticket::Ticket < ActiveRecord::Base
  acts_as_paranoid
  
  # For accounting purposes, what are the ticket costs billed to?
  enum bill_to: {
    'Job' => 0,
    'Cancelled Job' => 1,
    # non-job items below
    'Weather' => 2,
    'Overhead' => 3,
    'Office Staff' => 4,
    'Transport' => 5,
    'Shop Time' => 6
  }
  
  # If the ticket is billed to "Job" or "Cancelled Job", it'll reference the Job here.
  belongs_to :job
  
  has_many :employees
  has_many :vehicles
    
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
  with_options unless: :pending_approval? do |ticket|
    ticket.validates :approval_name_and_title, presence: true, length: { minimum: 9 }
    ticket.validates :approval_email, presence: true, email: true
    ticket.validates :approval_signature, presence: true
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
    when 'Job', 'Cancelled Job'
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
  
    # If this Ticket shouldn't be attached to a Job, set job to nil.
      def erase_job_if_not_needed
      if not job_required?
        self.job = nil
      end
    end
end

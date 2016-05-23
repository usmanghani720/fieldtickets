require 'fx_datetime'

# A Ticket is used by a crew chief Employee to report their work back to management and payroll.
#
class Ticket < ActiveRecord::Base
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
  
  has_many :equipment_entries
  has_many :employee_entries
    
  # Whether the Customer's representative has signed off on the Job.
  # 
  enum approval: { not_yet_approved: 0, approved: 1, disapproved: 2 }
  
  # Use Paperclip to attach a customer signature
  #
  has_attached_file :approval_signature,
    styles: {
      thumb: "150x300>",
      normal: "1000x1000>"
    }
  validates_attachment_content_type :approval_signature, content_type: /\Aimage\/.*\Z/
  
  # If customer has approved or disapproved, certain info is required.
  #
  with_options unless: :not_yet_approved? do |ticket|
    ticket.validates :approval_name_and_title, presence: true
    ticket.validates :approval_email, presence: true, email: true
    ticket.validates :approval_signature, presence: true
  end
  
  # Require feedback only if customer has DISAPPROVED.
  #
  validates :approval_feedback, presence: true, if: :disapproved?

  # Make sure milling dimensions, if entered, are a number greater than 0
  #
  with_options if: :milling_dimensions_required? do |ticket|
    ticket.validates :milling_length, numericality: { greater_than: 0 }
    ticket.validates :milling_width, numericality: { greater_than: 0 }
    ticket.validates :milling_depth, numericality: {
      greater_than: 0,
      less_than_or_equal_to: 24
    }
  end
  
  # If this Ticket shouldn't be attached to a Job, set job to nil.
  #
  before_save :erase_job_if_not_needed
  
  # Should the Ticket be attached to a Job?
  #
  def job_required?
    case bill_to
    when 'Job', 'Cancelled Job'
      true
    else
      false
    end
  end
  
  # If any milling dimensions are inputted, they should all be required.
  #
  def milling_dimensions_required?
    milling_length.present? or milling_width.present? or milling_depth.present?
  end
  
  # Calculate the dimensions of the milled area
  # 
  def milling_square_feet
    if milling_length.present? and milling_width.present?
      milling_length * milling_width
    end
  end
  
  # Calculate the dimensions of the milled area
  # …converted to square yards
  # 
  def milling_square_yards
    if milling_square_feet
      (milling_square_feet / 9).to_i
    end
  end

  
  private
  
    # If this Ticket shouldn't be attached to a Job, set job to nil.
    #
    def erase_job_if_not_needed
      if not job_required?
        self.job = nil
      end
    end
end
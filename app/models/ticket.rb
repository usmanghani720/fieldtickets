require 'fx_datetime'

class Ticket < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :job
  
  has_many :equipment_entries
  has_many :employee_entries
  
  # Use Paperclip to attach a customer signature
  #
  has_attached_file :customer_signature,
    styles: {
      thumb: "150x300>",
      normal: "1000x1000>"
    }
  validates_attachment_content_type :customer_signature, content_type: /\Aimage\/.*\Z/
  
  # If customer has approved or disapproved, certain info is required.
  #
  validates :customer_name_and_title, presence: true, if: "not customer_approved_work.nil?"
  validates :customer_signature, presence: true, if: "not customer_approved_work.nil?"
  validates :customer_feedback, presence: true, if: "customer_approved_work === false"
  
  before_save :erase_job_if_not_needed
  
  # Should the Ticket be attached to a Job?
  #
  def job_required?
    ['Job', 'Cancelled Job'].include? bill_to
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

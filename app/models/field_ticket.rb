require 'fx_datetime'

class FieldTicket < ActiveRecord::Base
  belongs_to :job
  belongs_to :non_job
  
  BILLING_TYPES = ['Job', '-', 'Weather', 'Overhead', 'Office Staff', 'Transport', 'Equipment Maintenance & Repair', 'Job Cancelled']
  
  has_attached_file :customer_signature,
    styles: {
      thumb: "150x300>",
      normal: "1000x1000>"
    }
  validates_attachment_content_type :customer_signature, content_type: /\Aimage\/.*\Z/
  
  def reference_name
    id
  end
  
  def model_reference_name
    "#{humanize} # #{reference_name}"
  end
  
end

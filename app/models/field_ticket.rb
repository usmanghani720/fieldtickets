require 'fx_datetime'

class FieldTicket < ActiveRecord::Base
  belongs_to :job
  
  BILLING_TYPES = ['Job', 'Cancelled Job', ['-', 'data-divider' => 'true'], 'Weather', 'Overhead', 'Office Staff', 'Transport', 'Equipment Maintenance & Repair']
  
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
  
  def square_yards
    if length.to_i > 0 and width.to_i > 0
      (length * width).to_i
    end
  end
  
  def square_yards_human(default = 'Not entered')
    if square_yards
      "#{square_yards} square yards"
    else
      default
    end
  end
  
end

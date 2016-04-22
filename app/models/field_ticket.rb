class FieldTicket < ActiveRecord::Base
  belongs_to :job
  belongs_to :non_job
  
  has_attached_file :customer_signature,
    styles: {
      thumb: "150x300>",
      normal: "1000x1000>"
    }
  validates_attachment_content_type :customer_signature, content_type: /\Aimage\/.*\Z/
  
  
  
end

require 'fx_datetime'

class FieldTicket < ActiveRecord::Base
  belongs_to :job
  belongs_to :non_job
  
  has_attached_file :customer_signature,
    styles: {
      thumb: "150x300>",
      normal: "1000x1000>"
    }
  validates_attachment_content_type :customer_signature, content_type: /\Aimage\/.*\Z/
  
  # def started_at=(time)
  #   if time.is_a? String
  #     self[:started_at] = Chronic.parse(time)
  #   else
  #     self[:started_at] = time
  #   end
  # end
  # 
  # def finished_at=(time)
  #   if time.is_a? String
  #     self[:finished_at] = Chronic.parse(time)
  #   else
  #     self[:finished_at] = time
  #   end
  # end
  
end

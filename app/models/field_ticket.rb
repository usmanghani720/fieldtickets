class FieldTicket < ActiveRecord::Base
  belongs_to :job
  belongs_to :non_job
end

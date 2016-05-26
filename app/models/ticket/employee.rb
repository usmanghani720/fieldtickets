class Ticket::Employee < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :employee
end

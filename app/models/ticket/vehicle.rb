class Ticket::Vehicle < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
end

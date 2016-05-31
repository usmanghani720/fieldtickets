class Ticket::Note < ActiveRecord::Base
  include CreatedBy
  
  belongs_to :ticket
  
  validates :note, presence: true
  validates :note_type, presence: true
  
  enum note_type: { internal: 1, to_customer: 2, from_customer: 3 }
  # Customer comment type not yet used
end
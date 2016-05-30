class Ticket::NoteDecorator < Draper::Decorator
  delegate_all
  
  def attribution
    "— #{object.creator}, #{object.created_at}"
  end
end

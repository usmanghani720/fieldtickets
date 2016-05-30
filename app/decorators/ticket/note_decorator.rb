class Ticket::NoteDecorator < Draper::Decorator
  delegate_all
  
  def attribution
    '— ' + object.employee.to_s + ', ' + object.created_at.to_s
  end
end

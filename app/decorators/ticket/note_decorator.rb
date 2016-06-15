class Ticket::NoteDecorator < Draper::Decorator
  delegate_all
  
  def attribution
    if object.from_customer?
      "— #{object.ticket.approval_name_and_title}, #{object.ticket.job.customer}, #{object.created_at}"
    else
      "— #{object.creator}, #{object.created_at}"
    end
  end
end

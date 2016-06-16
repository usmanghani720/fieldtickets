class Ticket::CustomerMailer < ApplicationMailer
  def ticket_approval_email(ticket)
    @ticket = ticket.decorate
    
    mail(
      to: @ticket.approval_email,
      subject: "Work Confirmation for Ticket ##{@ticket.number}"
    ) do |format|
      format.text
      format.html
      format.pdf do
        attachment = WickedPdf.new.pdf_from_string(
          render_to_string(
            pdf: 'results',
            template: 'ticket/approval/results',
            locals: { ticket: @ticket },
            layout: 'pdf.html'
          )
        )
        attachments["confirmation-#{@ticket.number}.pdf"] = attachment
      end
    end
  end
end

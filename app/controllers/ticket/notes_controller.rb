class Ticket::NotesController < Ticket::BaseController
  decorates_assigned :note
  
  def index
    @notes = @ticket.notes.decorate
  end
  
  def new
    @note = @ticket.notes.new
  end
  
  def create
    @note = @ticket.notes.new(note_params)

    if @note.save
      redirect_to ticket_notes_path(@ticket), notice: 'Note was successfully created.'
    else
      render :new
    end
  end
  
  private
  
    def note_params
      params.require(:ticket_note).permit(:note, :note_type)
    end
  
end
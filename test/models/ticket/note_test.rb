require "test_helper"

class Ticket::NoteTest < ActiveSupport::TestCase
  def note
    @note ||= Ticket::Note.new
  end

  def test_valid
    assert note.valid?
  end
end

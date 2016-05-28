$ ->
  # When any field in the form has changed, show form buttons
  $('form :input').on 'input', ->
    $("#autoshow-form-buttons").fadeIn()

  $('form .btn').click ->
    $("#autoshow-form-buttons").fadeIn()

  # Restore the form to original values when Undo is clicked
  $('#undo-my-changes').click ->
    $('form')[0].reset()
    $('#autoshow-form-buttons').fadeOut()
    $('form input')[0].dispatchEvent(new Event('change'));
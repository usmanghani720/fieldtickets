# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# When asking for signature capture, make the reset button do something!!
$ ->
  $('#reset_signature_canvas').click ->
    hasSignature = false
    input.value = ''
    signaturePad.clear()
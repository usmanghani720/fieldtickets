// Safari blocks the UI as soon as a form is submitted
// This behaviour prevents us from doing animations inside buttons
// This is a workaround to give the render engine some time before blocking

// This depends on jQuery browser to know if the current browser is Safari
// We happened to have that dependency when I implemeneted this workaround

$(function () {
  if (!(navigator.vendor.indexOf("Apple")==0 && /\sSafari\//.test(navigator.userAgent))) {
    return;
  }

  var formHandler = function (e) {
    var rails = $.rails;
    var form = $(this),
      remote = form.data('remote') !== undefined,
      blankRequiredInputs,
      nonBlankFileInputs;

    if (!rails.allowAction(form)) return rails.stopEverything(e);

    // skip other logic when required values are missing or file upload is present
    if (form.attr('novalidate') == undefined) {
      blankRequiredInputs = rails.blankInputs(form, rails.requiredInputSelector);
      if (blankRequiredInputs && rails.fire(form, 'ajax:aborted:required', [blankRequiredInputs])) {
        return rails.stopEverything(e);
      }
    }

    if (remote) {
      nonBlankFileInputs = rails.nonBlankInputs(form, rails.fileInputSelector);
      if (nonBlankFileInputs) {
        // slight timeout so that the submit button gets properly serialized
        // (make it easy for event handler to serialize form without disabled values)
        setTimeout(function(){ rails.disableFormElements(form); }, 13);
        var aborted = rails.fire(form, 'ajax:aborted:file', [nonBlankFileInputs]);

        // re-enable form elements if event bindings return false (canceling normal form submission)
        if (!aborted) { setTimeout(function(){ rails.enableFormElements(form); }, 13); }

        return aborted;
      }

      rails.handleRemote(form);
      return false;

    } else {
      if (!e.isTrigger) {
        e.preventDefault();
        rails.disableFormElements(form);
        setTimeout(function(){ form.trigger('submit'); }, 13);
      }
    }
  };

  $(document).undelegate('form', 'submit.rails');
  $(document).delegate('form', 'submit.rails', formHandler);
});

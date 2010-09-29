// Always send the authenticity_token with ajax
$(document).ajaxSend(function(event, request, settings) {
    if ( settings.type == 'post' ) {
  settings.data = (settings.data ? settings.data + "&" : "")
    + "authenticity_token=" + encodeURIComponent( AUTH_TOKEN );
  request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    }
});

// When I say html I really mean script for rails
$.ajaxSettings.accepts.html = $.ajaxSettings.accepts.script

// Stuff for nested models
function insert_fields(link, method, content) {
  var new_id = new Date().getTime()
  var regexp = new RegExp("new_"+method, "g")
  var div = "#"+method;
  if ($(div).val() == null) {
    alert('Could not insert. Could not find '+div);
  } else {
    $(div).append(content.replace(regexp, new_id));
  }
}

function remove_fields(link) {
  var hidden_field = $(link).prev("input[type=hidden]");
  if (hidden_field) {
    hidden_field.val('1');
  }
  $(link).closest('.fields').hide();
}

jQuery.fn.limitMaxlength = function(options){

  var settings = jQuery.extend({
    attribute: "maxlength",
    onLimit: function(){},
    onEdit: function(){}
  }, options);

  // Event handler to limit the textarea
  var onEdit = function(){
    var textarea = jQuery(this);
    var maxlength = parseInt(textarea.attr(settings.attribute));

    if(textarea.val().length > maxlength){
      textarea.val(textarea.val().substr(0, maxlength));

      // Call the onlimit handler within the scope of the textarea
      jQuery.proxy(settings.onLimit, this)();
    }

    // Call the onEdit handler within the scope of the textarea
    jQuery.proxy(settings.onEdit, this)(maxlength - textarea.val().length);
  }

  this.each(onEdit);

  return this.keyup(onEdit)
        .keydown(onEdit)
        .focus(onEdit)
        .live('input paste', onEdit);
}

$(document).ready(function() {
    var onEditCallback = function(remaining) {
      $(this).parent().next('p').html('Characters remaining ' + remaining);
      if (remaining > 0) {
        $(this).css('background-color', 'white');
      }
    }

    var onLimitCallback = function(){
      alert('limit');
      $(this).css('background-color', 'red');
    }

    $('textarea[maxlength]').limitMaxlength({
      onEdit: onEditCallback,
      onLimit: onLimitCallback
  });
});

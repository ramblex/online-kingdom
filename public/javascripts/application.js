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

$('#match_event_id').change(function() {
  var event_id = $(this).val();
  $.ajax({
    url: '/events/'+event_id+'/groups.js',
    type: 'get',
    datatype: 'html',
    success: function(data) {$("select#match_group_id").html(data);}
  });
});
$.ajaxSettings.accepts.html = $.ajaxSettings.accepts.script

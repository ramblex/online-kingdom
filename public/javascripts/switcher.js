function update_content(content_id, data) {
  $(content_id).html($(content_id, data).html());
  $("#pagination").html($("#pagination", data).html());
}

function switcher(switcher_id, content_id, func) {
  return false;
  if (func === undefined) {
    func = function(data) {update_content(content_id, data)}
  }

  $(switcher_id+" li a").first().addClass('selected');

  // Category links
  $(switcher_id+" li a").click(function() {
    var category_url = $(this).attr("href");
    $(switcher_id+" li a").removeClass("selected");
    $(this).addClass("selected");
    $.ajax({
      // Display a waiting animated icon
      beforeSend: function() { $(content_id).html('<div id="loading"><img src="/images/loading.gif" />Processing...</div>') },
      url: category_url,
      type: 'get',
      datatype: 'html',
      success: func
    });
    return false;
  });

  // Pagination links
  $(".pagination a").click(function() {
    page_url = $(this).attr('href');
    $.ajax({
      beforeSend: function() { $(content_id).html('processing...') },
      url: page_url,
      type: 'get',
      datatype: 'html',
      success: function(data) {update_content(content_id, data)}
    });
    return false;
  });

}
// When I say html I really mean script for rails
$.ajaxSettings.accepts.html = $.ajaxSettings.accepts.script

function update_content(content_id, data) {
  $(content_id).html($(content_id, data).html());
  $("#pagination").html($("#pagination", data).html());
}

function switcher(switcher_id, content_id) {
  // Category links
  $(switcher_id+" li a").click(function() {
    var category_url = $(this).attr("href");
    $(switcher_id+" li a").removeClass("selected");
    $(this).addClass("selected");
    $.ajax({
      url: category_url,
      type: 'get',
      datatype: 'html',
      success: function(data) {update_content(content_id, data)}
    });
    return false;
  });

  // Pagination links
  $(".pagination a").click(function() {
    page_url = $(this).attr('href');
    $.ajax({
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

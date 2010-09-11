function update_news(data) {
  $("#paginated-news-list").html($("#paginated-news-list", data).html());
  $("#pagination").html($("#pagination", data).html());
}

// Category links
$("#news-category li a").click(function() {
  var category_url = $(this).attr("href");
  $("#news-category li a").removeClass("selected");
  $(this).addClass("selected");
  console.log(category_url);
  $.ajax({
    url: category_url,
    type: 'get',
    datatype: 'html',
    success: function(data) {update_news(data)}
  });
  return false;
});

// Pagination links
$(".pagination a").click(function() {
  page_url = $(this).attr('href');
  console.log(page_url);
  $.ajax({
    url: page_url,
    type: 'get',
    datatype: 'html',
    success: function(data) {update_news(data)}
  });
  return false;
});

// When I say html I really mean script for rails
$.ajaxSettings.accepts.html = $.ajaxSettings.accepts.script

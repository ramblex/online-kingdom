$("#roller-image-links li").hover(function() {
  $("#roller-hovered-title").html($(this)
    .children(".roller-news-item-title").html());
},
  function() {
    $("#roller-hovered-title").html("");
  }
);
$("#roller-image-links li").click(function() {
  $(".roller-img").attr("src", "/images/news-images/"+$(this).children(".roller-news-item-file").html());
  $(".roller-desc .roller-title").html($(this)
    .children(".roller-news-item-title").html());
  $("#roller-content").html($(this).children(".roller-news-item-content").html());
  $(".roller-desc a").attr("href", $(this).children("a").attr("href"));
  $("#roller-image-links li a").removeClass("selected");
  $(this).children("a").addClass("selected");
  return false;
});

$(".right-col-title-links li a").click(function () {
  var category_id = $(this).attr("href").substring(1);
  $(".right-col-title-links li a").removeClass('sel');
  $(this).addClass('sel');
  $.post('/home/fetch_matches/'+category_id,
    function(data) {
      $("#match-ticker").html(data);
    });
  return false;
});

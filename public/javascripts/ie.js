$(".button").wrap('<div class="ie-border"></div>');
$(".box").wrap('<div class="ie-border"></div>');
$(".ie-border").each(function() {
  var c = $(this).children().first().css('border-left-color');
  $(this).css('background', c);
});
$(".box").corner('6px');
$(".button").corner('6px');
$(".ie-border").corner('6px');

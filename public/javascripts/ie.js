$(".button").wrap('<div class="ie-border"></div>');
$(".box").wrap('<div class="ie-border"></div>');
$(".ie-border").each(function() {
  var c = $(this).children().first().css('border-left-color');
  $(this).css('background', c);
});
$(".box").corner('4px');
$(".button").corner('4px');
$(".ie-border").corner('4px');

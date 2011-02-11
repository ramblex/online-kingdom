$(".button").wrap('<div class="ie-border"></div>');
$(".box").wrap('<div class="ie-border"></div>');
$(".ie-border").each(function() {
  var c = $(this).children().first().css('border-left-color');
  $(this).css('background', c);
});
$(".box").corner('5px');
$(".box").parent().css('margin-bottom', '5px');
$(".box").css('margin', '0');
$(".button").corner('5px');
$(".ie-border").corner('5px');

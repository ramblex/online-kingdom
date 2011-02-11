$(".box").corner("5px").wrap('<div class="ie-border" />');
$(".button").corner("5px").wrap('<div class="ie-border" />');
$(".ie-border:first-child").each(function() {
  var border_colour = $(this).css('border-left-color');
  alert(border_colour);
  $(this).parent().css('background-color', border_colour);
});
$(".ie-border").css('padding', '1px').corner('5px');

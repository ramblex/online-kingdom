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

jQuery.fn.limitMaxlength = function(options){

  var settings = jQuery.extend({
    attribute: "maxlength",
    onLimit: function(){},
    onEdit: function(){}
  }, options);

  // Event handler to limit the textarea
  var onEdit = function(){
    var textarea = jQuery(this);
    var maxlength = parseInt(textarea.attr(settings.attribute));

    if(textarea.val().length > maxlength){
      textarea.val(textarea.val().substr(0, maxlength));

      // Call the onlimit handler within the scope of the textarea
      jQuery.proxy(settings.onLimit, this)();
    }

    // Call the onEdit handler within the scope of the textarea
    jQuery.proxy(settings.onEdit, this)(maxlength - textarea.val().length);
  }

  this.each(onEdit);

  return this.keyup(onEdit)
        .keydown(onEdit)
        .focus(onEdit)
        .live('input paste', onEdit);
}

$(document).ready(function() {
    var onEditCallback = function(remaining) {
      $(this).parent().next('p').html('Characters remaining ' + remaining);
      if (remaining > 0) {
        $(this).css('background-color', 'white');
      }
    }

    var onLimitCallback = function(){
      alert('limit');
      $(this).css('background-color', 'red');
    }

    $('textarea[maxlength]').limitMaxlength({
      onEdit: onEditCallback,
      onLimit: onLimitCallback
    });

    $("#flash-notice").fadeOut(6000);
    $("#admin-nav").css({opacity: 0.6});
});

function toggle_admin() {
  $("#admin-nav #hidden").toggle();
}

(function($){

// Creating the sweetPages jQuery plugin:
$.fn.sweetPages = function(opts){
  // If no options were passed, create an empty opts object
  if(!opts) opts = {};

  var resultsPerPage = opts.perPage || 3;

  // The plugin works best for unordered lists, althugh ols would do just as well:
  var ul = this;
  var container = '.comment-container';
  var li = ul.find(container);

  li.each(function(){
          // Calculating the height of each li element, and storing it with the data method:
          var el = $(this);
          el.data('height',el.outerHeight(true));
  });

  // Calculating the total number of pages:
  var pagesNumber = Math.ceil(li.length/resultsPerPage);

  // If the pages are less than two, do nothing:
  if(pagesNumber<2) return this;

  // Creating the controls div:
  var swControls = $('<div class="swControls">');

  for(var i=0;i<pagesNumber;i++)
  {
    // Slice a portion of the lis, and wrap it in a swPage div:
    li.slice(i*resultsPerPage,(i+1)*resultsPerPage).wrapAll('<div class="swPage" />');
    
    // Adding a link to the swControls div:
    swControls.append('<a href="" class="swShowPage">'+(i+1)+'</a>');
  }

  ul.append(swControls);
  
  var swPage = ul.find('.swPage');
  swPage.each(function(){
    // Looping through all the newly created pages:
    var elem = $(this);
    var totalHeight = 0;
    elem.find(container).each(function() {
      totalHeight += $(this).height() + 10;
    });
    elem.height(totalHeight);
  });
  
  swPage.wrapAll('<div class="swSlider" />');

  // Setting the height of the ul to the height of the tallest page:
  //ul.height(maxHeight);

  var swSlider = ul.find('.swSlider');

  var hyperLinks = ul.find('a.swShowPage');

  hyperLinks.click(function(e){
    // If one of the control links is clicked, slide the swSlider div 
    // (which contains all the pages) and mark it as active:

    ul.find('.reply-form').hide();
    $(this).addClass('current').siblings().removeClass('current');
    var idx = parseInt($(this).text() - 1);
    var margin = 0;
    var previous_pages = ul.find('.swPage:lt('+idx+')');
    previous_pages.each(function() {margin+= $(this).height()});
    margin += (idx + 1) * 10;
    var height = ul.find('.swPage:eq('+idx+')').height();
    ul.height(height);

    swSlider.stop().animate({'margin-top':-(margin)},'slow');
    e.preventDefault();
  });
  
  // Mark the first link as active the first time this code runs:
  hyperLinks.eq(0).addClass('current');
  ul.height(ul.find('.swPage:eq(0)').height());
  
  return this;
  
}})(jQuery);

var ready;

ready = function() { 
  //  on click text area autofocus it, so that you can click back into it
  $('#entry_content').focus();
  $("#entry_content").click(function() {
    $('#entry_content').focus();
  });

  // this removes the ability to shift+arrow in order to highlight.
  $("#entry_content").keydown(function(event) {
  var arrowKeys = [37, 38, 39, 40]
   if(event.shiftKey && jQuery.inArray(event.keyCode, arrowKeys) !== -1)
   {
      event.preventDefault();
   }
  });

  // This makes typing fade in and out as a user types
  $('#entry_content').keydown(function(event) {
    $('#typing').fadeIn(10).fadeOut(100);
    $('#typing').css('z-index', 0)
  });

  // pop up the explanation stuff
  $('#explanation').fadeIn();
  $('#explanation').click(function() {
    $('#explanation').fadeOut();
    $('#entry_content').focus();
  });

}; ////


// stuff to work with rurbo links
$(document).ready(ready);
$(document).on('page:load', ready);
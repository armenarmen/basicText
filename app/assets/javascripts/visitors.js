//  on click text area autofocus it, so that you can click back into it
$(document).ready(function() {
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
});
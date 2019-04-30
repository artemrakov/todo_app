$(document).ready(function() {
  $('input#item_done').each(function() {
    $(this).on('change', function() {
      $(this).closest('form').submit();
    });
  });
});

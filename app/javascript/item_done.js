$(document).ready(function() {
  $('input#item_state').each(function() {
    $(this).on('change', function() {
      $(this).closest('form').submit();
    });
  });
});

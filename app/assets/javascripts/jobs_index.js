$(document).ready(function(){
  $('div.change-tag-all').addClass('active');

  $('div.change-tag-button').on('click', function(e) {
    $('div.change-tag-button').removeClass('active');
    $(this).addClass('active');
  });
});

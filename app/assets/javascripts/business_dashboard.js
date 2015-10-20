$(document).ready(function(){
  $(".change-status-button").click(function(){
    $(".job").hide();
  });
  $(".change-status-pending").click(function(){
    $( ".job-status-pending" ).show();
  });
  $(".change-status-active").click(function(){
    $( ".job-status-active" ).show();
  });
  $(".change-status-retired").click(function(){
    $( ".job-status-retired" ).show();
  });
  $(".change-status-all").click(function(){
    $( ".job" ).show();
  });

  $('div.gh-form-button').on('click', function(e) {
    $('div.gh-form-button').removeClass('active');
    $('div.gh-form-button').css('color', '#fff');
    $(this).addClass('active');
    $(this).css('color', '#4D2A4B');
  });
})

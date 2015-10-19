$(document).ready(function(){
  $(".change-tag-button").click(function(){
    $(".job").hide();
  });
  $(".change-tag-js").click(function(){
    $( ".job-tag-js" ).show();
  });
  $(".change-tag-ruby").click(function(){
    $( ".job-tag-ruby" ).show();
  });
  $(".change-tag-php").click(function(){
    $( ".job-tag-php" ).show();
  });
  $(".change-tag-all").click(function(){
    $( ".job" ).show();
  });
})

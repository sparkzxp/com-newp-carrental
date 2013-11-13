//menu
$(document).ready(function(){
  
  $('div.mainlevel').mousemove(function(){
  $(this).find('ul').slideDown();//you can give it a speed
  });
  $('div.mainlevel').mouseleave(function(){
  $(this).find('ul').slideUp("fast");
  });
  
});


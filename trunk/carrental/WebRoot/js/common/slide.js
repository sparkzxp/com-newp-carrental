//menu
$(document).ready(function() {

	$('div.mainlevel').mousemove(function() {
		$(this).find('ul').slideDown();// you can give it a speed
	});
	$('div.mainlevel').mouseleave(function() {
		$(this).find('ul').slideUp("fast");
	});

});

function showsub(value){
	for (var ii = 0; ii <= 1; ii++){
		var mainbav = document.getElementById("mainbav" + ii);
		var submenu = document.getElementById("submenu" + ii);
		if( mainbav == null ) break;
		if(ii == value){
			mainbav.className="current";
			submenu.style.display="block";
                               
		}else if(ii != value){
			mainbav.className="";
			submenu.style.display="none";
		}
	}
}
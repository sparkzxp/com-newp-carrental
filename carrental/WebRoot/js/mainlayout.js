$(document).ready(function(e) {
	var windowWidth = $(window).width();
	var windowHeight = $(window).height();

	$('#left').height(windowHeight - 135);
	$('#content').css({
		'width' : windowWidth - 230,
		'height' : windowHeight - 155
	});
	$('#content iframe').css({
		'width' : windowWidth - 230,
		'height' : windowHeight - 155
	});

	$(window).resize(function() {
		windowWidth = $(window).width();
		windowHeight = $(window).height();
		$('#left').height(windowHeight - 135);
		$('#content').css({
			'width' : windowWidth - 230,
			'height' : windowHeight - 155
		});
		$('#content iframe').css({
			'width' : windowWidth - 230,
			'height' : windowHeight - 155
		});
	});

});
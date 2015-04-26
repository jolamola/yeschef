$(document).ready(function(){

	$(".slide-menu-toggle").on("click", function(event){
		event.preventDefault();

		var menu = $('.slideout-menu');
		var menuWidth = $('.slideout-menu').width();

		menu.toggleClass('open');

		if(menu.hasClass('open')) {
			menu.animate({
				left: '0px'
			});
		} else {
			menu.animate({
				left: -menuWidth
			}, 250);
		}



	});




});
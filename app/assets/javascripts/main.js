//= require ./colorgy/components/toast.js
//= require ./colorgy/components/message_bar.js

$(document).on('click', '.popup-btn', function(){
	$(this).parent().parent('.popup-notification').addClass('close');
})
$(document).on('click', '.steps-intro-btn', function(){
	$('.group-leader-notice').addClass('active');
})
$(document).on('click', '.notice-btn', function(){
	$('.black-mask').removeClass('active');
	$('.layer1').addClass('active');
	$("html").removeClass('lock');
	$("body").removeClass('lock');
})
$(window).scroll(function(){
	var windowWidth = window.innerWidth;
	if( windowWidth > 992 ){
		var windowOffsetTop = $('.navbar-fixed').children("nav").height();
		if($(this).scrollTop() >= windowOffsetTop){
			$('.nav-wrapper').addClass('scroll-down');
		}
		else{
			$('.nav-wrapper').removeClass('scroll-down');
		}
	}
});

$('.slide-field-trigger').click(function(){
	var triggerName = $(this).attr('href');
	var targetName = triggerName.substring(1, triggerName.length);
	$('#' + targetName).slideToggle(300);
});

$('.collapse-field-with-title .title').click(function(){
	$(this).children('.trigger').toggleClass('active');
	$(this).siblings('.content').slideToggle(300);
});

function popupNotice(title, content){
	$('.black-mask').addClass('active');

	$('<div class="popup-notification"><div class="popup-title">'
			+ title +
		'</div><div class="popup-content"><div class="row"><div class="col-md-12"><p>'
			+ content +
		'</p></div></div></div><div class="popup-footer"><button class="popup-btn notice-btn">了解</button></div></div>').appendTo('body');
}


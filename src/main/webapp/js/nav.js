// 네비게이션 메뉴 on/off 애니메이션
function navSwitch() {
	var navMenu = document.querySelector(".nav-menu");

	if (navMenu.classList.length == 1 || navMenu.classList.item(1) == "off") {
		navMenu.classList.remove("off");
		navMenu.classList.add("on");
	} else {
		navMenu.classList.remove("on");
		navMenu.classList.add("off");
	}
};


/*var didScroll;
var lastScrollTop = 0; 
var delta = 5; // 동작의 구현이 시작되는 위치 
var navbarHeight = $('nav').outerHeight(); // 영향을 받을 요소를 선택


// 스크롤시에 사용자가 스크롤했다는 것을 알림 
$(window).scroll(function(event) { 
	didScroll = true; 
});
	
// hasScrolled()를 실행하고 didScroll 상태를 재설정 
setInterval(function() { 
	if (didScroll) { 
		hasScrolled(); 
		didScroll = false; 
	} 
}, 250);

function hasScrolled() {
	var st = $(this).scrollTop();
	
	// Make sure they scroll more than delta
	if(Math.abs(lastScrollTop - st) <= delta)
		return;
	
	// If they scrolled down and are past the navbar, add class .nav-up.
	// This is necessary so you never see what is "behind" the navbar.
	if (st > lastScrollTop && st > navbarHeight){
		//Scroll Down
		$('nav').removeClass('nav-down').addClass('nav-up');
	}else{
		//Scroll Up
		if(st + $(window).height() < $(document).height()) {
			$('nav').removeClass('nav-up').addClass('nav-down');
		}
	}
	lastScrollTop = st;
}*/


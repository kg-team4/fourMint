<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


<!-- Java Script -->
<script src="../js/nav.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>

<!-- css -->
<nav id="nav">
	<div id="nav-area">
		<div class="nav-menu">
			<ul>
				<li></li>
				<li class="medium-menu"><a href="/marketBoardList.do?count=1" class="category">동네 중고</a>
					<ul>
						<li><a href="marketDetailList.do?kind=디지털 · 가전">디지털 · 가전</a></li>
						<li><a href="marketDetailList.do?kind=가구 · 인테리어">가구 · 인테리어</a></li>
						<li><a href="marketDetailList.do?kind=유아동 · 출산">유아동 · 출산</a></li>
						<li><a href="marketDetailList.do?kind=생활 · 가공식품">생활 · 가공식품</a></li>
						<li><a href="marketDetailList.do?kind=스포츠 · 레저">스포츠 · 레저</a></li>
						<li><a href="marketDetailList.do?kind=여성의류">여성의류</a></li>
						<li><a href="marketDetailList.do?kind=남성의류">남성의류</a></li>
						<li><a href="marketDetailList.do?kind=패션잡화">패션잡화</a></li>
						<li><a href="marketDetailList.do?kind=게임 · 취미">게임 · 취미</a></li>
						<li><a href="marketDetailList.do?kind=뷰티 · 미용">뷰티 · 미용</a></li>
						<li><a href="marketDetailList.do?kind=반려동물용품">반려동물용품</a></li>
						<li><a href="marketDetailList.do?kind=도서 · 음반">도서 · 음반</a></li>
						<li><a href="marketDetailList.do?kind=기타">기타</a></li>
						<li><a href="marketDetailList.do?kind=삽니다">삽니다</a></li>
					</ul>
				</li>
			
				<li class="medium-menu">
					<a href="marketSell.do" class="category">판매하기</a>
				</li>
				
				<li class="medium-menu"><a href="/communityBoardList.do?count=1" class="category">커뮤니티</a>
					<ul>
						<li><a href="communityDetailList.do?big_no=소식">소식</a></li>
						<li><a href="communityDetailList.do?big_no=질문">질문</a></li>
						<li><a href="communityDetailList.do?big_no=모임">모임</a></li>
						<li><a href="communityDetailList.do?big_no=맛집">맛집</a></li>
						<li><a href="communityDetailList.do?big_no=분실센터">분실센터</a></li>
						<li><a href="communityDetailList.do?big_no=사진전">사진전</a></li>
					</ul>
				</li>
	
				<li class="medium-menu"><a href="storeBoardList.do?count=1" class="category">스토어</a>
					<ul>
						<li><a href="storeDetailList.do?kind=주방">주방</a></li>
						<li><a href="storeDetailList.do?kind=욕실">욕실</a></li>
						<li><a href="storeDetailList.do?kind=생활">생활</a></li>
						<li><a href="storeDetailList.do?kind=굿즈">굿즈</a></li>
					</ul>
				</li>
				<li></li>
			</ul>
		</div>
	</div>
</nav>

<script>

// Hide Header on on scroll down

var didScroll;

var lastScrollTop = 0;

var delta = 5;

var navbarHeight = $('nav').outerHeight();

$(window).scroll(function(event){

    didScroll = true;

});

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

        // Scroll Down

        $('nav').removeClass('nav').addClass('nav-up');
        $('nav').stop().slideUp(400);
        
        /* if($('nav').removeClass('nav').addClass('nav-up')){
        	$('nav').first().stop(true, true).slideUp(500);
        	
        }  */
        

    } else {

        // Scroll Up

         /* if(st + $(window).height() < $(document).height()) {   */

           $('nav').removeClass('nav-up').addClass('nav-down');
           $('nav').stop().slideDown(400);
            
           /* if($('nav').removeClass('nav-up').addClass('nav-down')){
            	$('nav').first().stop(true, true).slideDown(500);
            }  */
            

        /* }  */ 

    }

    lastScrollTop = st;

}
/* 
$(window).scroll(function(event){
	if(){
		
	}
	  $(this).find('nav').first().stop(true, true).slideDown(300);
	});

	$('nav').on('hide.bs.dropdown', function(e){
	  $(this).find('.dropdown-menu').first().stop(true, true).slideUp(200);
	});
 */
</script>
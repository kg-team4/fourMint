<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Java Script -->
<script src="../js/nav.js"></script>

<!-- css -->
<nav>
	<div id="nav-area">
		<!-- <div id="menu-area">
			<img src="../img/menu.png" id="nav-icon" onclick="navSwitch();">
		</div> -->
		<div class="nav-menu">
			<ul>
				<li></li>
				<li class="medium-menu"><a href="/marketBoardList.do?count=1" class="category">동네 중고</a>
				<ul>
					<li><a href="marketDetailList.do?big_no=1">디지털 · 가전</a></li>
					<li><a href="marketDetailList.do?big_no=2">가구 · 인테리어</a></li>
					<li><a href="marketDetailList.do?big_no=3">유아동 · 유아도서</a></li>
					<li><a href="marketDetailList.do?big_no=4">생활 · 가공식품</a></li>
					<li><a href="marketDetailList.do?big_no=5">스포츠 · 레저</a></li>
					<li><a href="marketDetailList.do?big_no=6">여성잡화</a></li>
					<li><a href="marketDetailList.do?big_no=7">여성의류</a></li>
					<li><a href="marketDetailList.do?big_no=8">남성패션 · 잡화</a></li>
					<li><a href="marketDetailList.do?big_no=9">게임 · 취미</a></li>
					<li><a href="marketDetailList.do?big_no=10">뷰티 · 미용</a></li>
					<li><a href="marketDetailList.do?big_no=11">반려동물</a></li>
					<li><a href="marketDetailList.do?big_no=12">도서 · 티켓 · 음반</a></li>
					<li><a href="marketDetailList.do?big_no=13">기타</a></li>
					<li><a href="marketDetailList.do?big_no=14">삽니다</a></li>
				</ul>
			</li>
			
			<li class="medium-menu">
				<a href="sell.do" class="category">판매하기</a>
			</li>
			
			<li class="medium-menu"><a href="/communityBoardList.do?count=1" class="category">우리동네</a>
				<ul>
					<li><a href="communityDetailList.do?board_no=2&promotion_cate_num=1">소식</a></li>
					<li><a href="communityDetailList.do?board_no=2&promotion_cate_num=2">질문</a></li>
					<li><a href="communityDetailList.do?board_no=2&promotion_cate_num=3">모임</a></li>
					<li><a href="communityDetailList.do?board_no=2&promotion_cate_num=4">맛집</a></li>
					<li><a href="communityDetailList.do?board_no=2&promotion_cate_num=5">분실센터</a></li>
					<li><a href="communityDetailList.do?board_no=2&promotion_cate_num=6">사진전</a></li>
				</ul>
			</li>

			<li class="medium-menu"><a href="storeBoardList.do?count=1" class="category">스토어</a>
				<ul>
					<li><a href="storeDetailList.do?board_no=3&promotion_cate_num=1">주방</a></li>
					<li><a href="storeDetailList.do?board_no=3&promotion_cate_num=2">욕실</a></li>
					<li><a href="storeDetailList.do?board_no=3&promotion_cate_num=3">생활</a></li>
					<li><a href="storeDetailList.do?board_no=3&promotion_cate_num=4">굿즈</a></li>
				</ul>
			</li>
			<li></li>
			<!-- <li class="medium-menu">
			<a href="../board/promotion_write.jsp" class="category"> 홍보하기</a></li>
			-->
			</ul>
		</div>
	</div>
</nav>
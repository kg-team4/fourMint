<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!------------------------------------- 사이드바 -------------------------------------->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<!-- 사이드바 - 로고(브랜드) -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">민트마켓</div>
	</a>
	<!-- 구분선 -->
	<hr class="sidebar-divider my-0">
	<!-- 메뉴 - 대시보드 -->
	<li class="nav-item active"><a class="nav-link" href="index.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>대시보드</span></a></li>
	<!-- 구분선 -->
	<hr class="sidebar-divider">
	<!-- 메뉴 이름 -->
	<div class="sidebar-heading">인터페이스</div>
	<!-- 메뉴 - 페이지 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>구성</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">커스텀 구성:</h6>
				<a class="collapse-item" href="buttons.jsp">버튼</a> <a class="collapse-item" href="cards.jsp">카드</a>
			</div>
		</div></li>
	<!-- 메뉴 - 유틸 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i class="fas fa-fw fa-wrench"></i> <span>유틸</span>
	</a>
		<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">커스텀 유틸:</h6>
				<a class="collapse-item" href="utilities-color.jsp">색</a> <a class="collapse-item" href="utilities-border.jsp">테두리</a> <a class="collapse-item" href="utilities-animation.jsp">애니메이션</a> <a class="collapse-item" href="utilities-other.jsp">기타</a>
			</div>
		</div></li>
	<!-- 구분선 -->
	<hr class="sidebar-divider">
	<!-- 메뉴 이름 -->
	<div class="sidebar-heading">애드온</div>
	<!-- 메뉴 - 페이지 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i> <span>페이지</span>
	</a>
		<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">로그인 화면:</h6>
				<a class="collapse-item" href="login.jsp">로그인</a> <a class="collapse-item" href="register.jsp">회원가입</a> <a class="collapse-item" href="forgot-password.jsp">비밀번호 찾기</a>
				<div class="collapse-divider"></div>
				<h6 class="collapse-header">기타 페이지:</h6>
				<a class="collapse-item" href="404.jsp">404 페이지</a> <a class="collapse-item" href="blank.jsp">빈 페이지</a>
			</div>
		</div></li>
	<!-- 메뉴 - 차트 -->
	<li class="nav-item"><a class="nav-link" href="charts.jsp"> <i class="fas fa-fw fa-chart-area"></i> <span>차트</span></a></li>
	<!-- 메뉴 - 테이블 -->
	<li class="nav-item"><a class="nav-link" href="tables.jsp"> <i class="fas fa-fw fa-table"></i> <span>테이블</span></a></li>
	<!-- 구분선 -->
	<hr class="sidebar-divider d-none d-md-block">
	<!-- 사이드바 토글 -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
<!------------------------------- 사이드바 끝------------------------------->
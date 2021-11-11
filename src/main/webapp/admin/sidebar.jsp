<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!------------------------------------- 사이드바 -------------------------------------->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">
	<!-- 사이드바 - 로고(브랜드) -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="home.mdo">
		<div class="sidebar-brand-icon rotate-n-15">			
			<img src="admin/img/adminlogo.png">
		</div>
		<div class="sidebar-brand-text mx-3">민트마켓</div>
	</a>
	<!-- 구분선 -->
	<hr class="sidebar-divider my-0">
	<!-- 메뉴 - 대시보드 -->
	<li class="nav-item active"><a class="nav-link" href="home.mdo"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>게시판</span></a></li>
	<!-- 구분선 -->
	<hr class="sidebar-divider">
	<!-- 메뉴 이름 -->
	<!-- 메뉴 - 페이지 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="pages.mdo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>구성</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">커스텀 구성:</h6>
				<a class="collapse-item" href="buttons.mdo">광고/배너관리</a> 
				<a class="collapse-item" href="cards.mdo">매출관리</a>
			</div>
		</div></li>
	<!-- 메뉴 - 유틸 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i class="fas fa-fw fa-wrench"></i> 
	<span>글</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">글 관리:</h6>
				<a class="collapse-item" href="utilities-board.mdo">등록된 글 관리</a>
				<a class="collapse-item" href="utilities-annoucement.mdo">중고거래 관련 공지 글 관리</a> 
				<a class="collapse-item" href="utilities-boardmanage.mdo">자체 상품 글 관리</a> 
				<a class="collapse-item" href="utilities-usedfaq.mdo">중고거래FAQ</a>
			</div>
		</div></li>
	<!-- 구분선 -->
	<hr class="sidebar-divider">
	<!-- 메뉴 이름 -->	
	<!-- 메뉴 - 페이지 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i> 
	<span>페이지</span>
	</a>
		<div id="collapsePages" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">카테고리 페이지:</h6>
				<a class="collapse-item" href="login.mdo">회원 관리 페이지</a> 
				<a class="collapse-item" href="register.mdo">상품관리 페이지</a> 
				<a class="collapse-item" href="forgot-password.mdo">고객센터 페이지</a>
				<div class="collapse-divider"></div>
				<h6 class="collapse-header">거래 페이지:</h6>
				<a class="collapse-item" href="404.mdo">거래 현횡 조회 페이지</a> 
				<a class="collapse-item" href="blank.mdo">거래 분포도 페이지</a>
			</div>
		</div></li>
	<!-- 메뉴 - 차트 -->
	<li class="nav-item"><a class="nav-link" href="charts.mdo"> <i class="fas fa-fw fa-chart-area"></i> <span>차트</span></a></li>
	<!-- 메뉴 - 테이블 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#tablesUtilities" aria-expanded="true" aria-controls="tableseUtilities"> <i class="fas fa-fw fa-table"></i>
	 <span>테이블</span>
	</a>
		<div id="tablesUtilities" class="collapse" aria-labelledby="headingtables" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="tables-header">테이블 유틸:</h6>
				<a class="collapse-item" href="tables-member.mdo">회원목록</a>
				<a class="collapse-item" href="tables-used.mdo">중고 물품 목록</a> 
				<a class="collapse-item" href="tables-purchasehistory.mdo">거래내역</a> 
				<a class="collapse-item" href="tables-blacklist.mdo">블랙리스트 목록</a>
				<a class="collapse-item" href="tables-storegoods.mdo">스토어 물품 목록</a>
			</div>
		</div></li>				
	<!-- 구분선 -->
	<hr class="sidebar-divider d-none d-md-block">
	<!-- 사이드바 토글 -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
<!------------------------------- 사이드바 끝------------------------------->
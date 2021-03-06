<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!------------------------------------- 사이드바 -------------------------------------->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<!-- 사이드바 - 로고(브랜드) -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="home.mdo">
		<div class="sidebar-brand-icon rotate-n-15">			
			<img src="${pageContext.request.contextPath}/resources/admin/img/adminlogo.png" style="width:65px; height:65px">
		</div>
		<div class="sidebar-brand-text mx-3" style="color:#514c57; font-size:20px;">민트마켓</div>
	</a>
	<!-- 구분선 -->
	<hr class="sidebar-divider my-0">
	<!-- 메뉴 - 대시보드 -->
	<li class="nav-item active"><a class="nav-link" href="home.mdo"><i class="fas fa-fw fa-tachometer-alt"></i> <span style="color:#514c57;  font-size:16px;">대시보드</span></a></li>
	<!-- 구분선 -->
	<hr class="sidebar-divider">
	<!-- 메뉴 이름 -->
	<!-- 메뉴 - 페이지 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="pages.mdo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span style="color:#514c57;  font-size:14px;">관리</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style="color:black; font-size:14px">회원 관리</h6>
				<a class="collapse-item" href="memberpage.mdo">- 회원</a>
				<a class="collapse-item" href="report_list.mdo">- 신고/블랙리스트</a>
 
				<h6 class="collapse-header" style="color:black; font-size:14px">사이트 관리</h6>
				<a class="collapse-item" href="merchandise.mdo">- 상품 </a> 
				<a class="collapse-item" href="cards.mdo">- 매출</a>				
				<a class="collapse-item" href="buttons.mdo">- 광고/배너</a> 
				<a class="collapse-item" href="customercenter.mdo">- Q&A</a>
			</div>
		</div></li>
	<!-- 메뉴 - 유틸 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i class="fas fa-fw fa-wrench"></i> 
	<span style="color:#514c57; font-size:14px;">글</span>
	</a>
		<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style="color:black; font-size:14px">중고거래</h6>
				<a class="collapse-item" href="utilities-board.mdo">- 중고거래 글</a>
				<h6 class="collapse-header" style="color:black; font-size:14px">고객센터</h6>
				<a class="collapse-item" href="utilities-annoucement.mdo">- 공지사항</a> 
				<a class="collapse-item" href="utilities-usedfaq.mdo?category=all">- FAQ</a>
			</div>
		</div></li>
	<!-- 구분선 -->
	<hr class="sidebar-divider">
	<!-- 메뉴 이름 -->	
	<!-- 메뉴 - 페이지 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i> <span style="color:#514c57 ; font-size:14px;">거래 조회</span>
	</a>
		<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style="color:black; font-size:14px">중고 거래 </h6>
				<a class="collapse-item" href="usedstatus.mdo">- 중고 거래 현황</a> 
				<h6 class="collapse-header"style="color:black; font-size:14px">스토어 거래 </h6>
				<a class="collapse-item" href="storestatus.mdo">- 스토어 거래 현황</a> 
				<a class="collapse-item" href="storecancelstatus.mdo">- 주문 취소 요청</a> 
				<a class="collapse-item" href="storecancelrefundcomplete.mdo">- 주문 취소/반품 완료</a> 
			</div>
		</div></li>
	<!-- 메뉴 - 차트 -->
	<li class="nav-item"><a class="nav-link" href="charts.mdo"> <i class="fas fa-fw fa-chart-area"></i> <span style="color:#514c57; font-size:14px;">차트</span></a></li>
	<!-- 메뉴 - 테이블 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#tablesUtilities" aria-expanded="true" aria-controls="tableseUtilities"> <i class="fas fa-fw fa-table"></i>
	 <span style="color:#514c57; font-size:14px; ">목록</span>
	</a>
		<div id="tablesUtilities" class="collapse" aria-labelledby="headingtables" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style="color:black; font-size:14px">목록</h6>
				<a class="collapse-item" href="tables-member.mdo">- 회원</a>
				<a class="collapse-item" href="tables-used.mdo">- 중고 물품</a> 
				<a class="collapse-item" href="tables-purchasehistory.mdo">- 거래내역</a> 
				<a class="collapse-item" href="tables-blacklist.mdo">- 신고/블랙리스트</a>
				<a class="collapse-item" href="tables-storegoods.mdo">- 스토어 상품</a>
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
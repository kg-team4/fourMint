<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	<!-- 사이드바 토글: 모바일 화면 -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>
	<!-- 검색창 -->
	<form
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
<!-- 		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small" value="백미라,이정빈,김주호,박동녘,장형준">		
		</div> -->
	</form>
	<!-- 최상단 메뉴: 네비 버튼 -->
	<ul class="navbar-nav ml-auto">
		<!-- 검색 버튼 -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> <!-- 검색: 드롭다운 -->
			<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>
		<%-- <!-- 알림 버튼 -->
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- 알림 개수 -->
				<span class="badge badge-danger badge-counter"></span>
		</a> <!-- 알림: 드롭다운 -->
			<div
				class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="alertsDropdown">
				<h6 class="dropdown-header">신고목록 알림</h6>
				<a class="dropdown-item d-flex align-items-center" href="tables-blacklist.mdo">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div> 
					<c:forEach var="report" items="${lists}">
						<div>
							<div class="small text-gray-500">${report.reported}</div>
							<span class="font-weight-bold">${report.reason }</span>
						</div>
					</c:forEach>
				</a>
			</div>
		</li>
		<!-- 메시지 버튼 -->
		<li class="nav-item dropdown no-arrow mx-1">
		<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false">
			 <i class="fas fa-envelope fa-fw"></i> 
			<!-- 메시지 개수 -->
				<span class="badge badge-danger badge-counter">7</span>
		</a>
		 <!-- 메시지: 드롭다운 -->
			<div
				class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="messagesDropdown">
				<h6 class="dropdown-header">메시지 센터</h6>
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="dropdown-list-image mr-3">
						<img class="rounded-circle" src="img/undraw_profile_1.svg"
							alt="...">
						<div class="status-indicator bg-success"></div>
					</div>
					<div class="font-weight-bold">
						<div class="text-truncate">Hi there! I am wondering if you
							can help me with a problem I've been having.</div>
						<div class="small text-gray-500">Emily Fowler · 58m</div>
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="dropdown-list-image mr-3">
						<img class="rounded-circle" src="img/undraw_profile_2.svg"
							alt="...">
						<div class="status-indicator"></div>
					</div>
					<div>
						<div class="text-truncate">I have the photos that you
							ordered last month, how would you like them sent to you?</div>
						<div class="small text-gray-500">Jae Chun · 1d</div>
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="dropdown-list-image mr-3">
						<img class="rounded-circle" src="img/undraw_profile_3.svg"
							alt="...">
						<div class="status-indicator bg-warning"></div>
					</div>
					<div>
						<div class="text-truncate">Last month's report looks great,
							I am very happy with the progress so far, keep up the good work!</div>
						<div class="small text-gray-500">Morgan Alvarez · 2d</div>
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="dropdown-list-image mr-3">
						<img class="rounded-circle"
							src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
						<div class="status-indicator bg-success"></div>
					</div>
				</a> <a class="dropdown-item text-center small text-gray-500" href="#">Read
					More Messages</a>
			</div>
			</li>
		<div class="topbar-divider d-none d-sm-block"></div> --%>
		<!-- 마이페이지 -->
		<li class="nav-item dropdown no-arrow"><a style="color:gray; text-decoration: none;"href="login.mdo" > 로그아웃</a> <!-- 마이페이지: 드롭다운 -->
			<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="profile.mdo"> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400" ></i> 로그아웃
				</a>
				<div class="dropdown-divider"></div>
				<ul>
					<c:choose>
						<c:when test="${empty admin_id}">
							<li><a href="login.mdo">로그인</a></li>
							<li><a href="register.mdo">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="logout.mdo">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div></li>
	</ul>
</nav>

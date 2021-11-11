<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>어서오세요! 당근마켓!</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="../css/1.header.css" type="text/css" rel="stylesheet">
<link href="../css/2.nav.css" type="text/css" rel="stylesheet">
<link href="../css/3.promotion.css" type="text/css" rel="stylesheet">
<link href="../css/4.article.css" type="text/css" rel="stylesheet">
<link href="../css/5.footer.css" type="text/css" rel="stylesheet">
<script src="../js/jquery-3.6.0.min.js"></script>

<style>
</style>
</head>

<body>
		<header>
			<div class="logo">
				<a href="home.do"><img src="../img/mintmarket_logo.png"></a>
			</div>
			<div class="search">
				<form action="../board/used_all_post_list.jsp" method="get" style="border: 1px solid white;">
					<input type="hidden" name="type" value="post_title">
					<input type="text" class="search-bar" name="keyword" placeholder="${session.result}"> 
					<input type="submit" class="search-icon" value="">
				</form>
			</div>
			<div class="sign">
					<img src="../img/user_icon.png" class="user-icon">
				<ul>
					<li><a href="login.do">로그인</a></li>
					<li><a href="join.do">회원가입</a></li>
					<li><button id="btn_mint_talk"><img src="../img/shopping-cart.png" style= height:18px;width:20px"></button></li>
					<li><button id="btn_mint_talk"><img src="../img/message.png" style= height:18px;width:20px"></button></li>
					<!-- <li><a href="logout.do">로그아웃</a></li>
					<li><a href="info.do?no=1">마이페이지</a></li> -->
				</ul>
			</div>
		</header>
		
<jsp:include page="../template/nav.jsp"></jsp:include>		
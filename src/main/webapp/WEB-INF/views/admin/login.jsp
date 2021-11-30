<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>민트마켓 관리자 로그인</title>
<!-- 폰트 설정 -->
<link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.css" rel="stylesheet">
<style>
	ul {
		list-style: none;
	}
	
	a {
		text-decoration: none;
	}
	
	img {
		border: none;
		vertical-align: top;
	}
	
	.c_wrap {
		width: 500px;
		margin: 0 auto;
		position: relative;
		border: 2px solid #000;
	}
	
	.carousel {
		width: 400px;
		margin: 0 auto;
		border: 2px solid aqua;
		overflow: hidden;
	}
	
	.carousel .list {
		width: 1600px;
		margin-left: -400px;
	}
	
	.carousel .list:after {
		content: "";
		display: block;
		clear: both;
	}
	
	.carousel .list li {
		float: left;
		height: 200px;
		width: 400px;
		color: white;
		font-size: 50px;
	}
	
	.carousel .list li.a1 {
		background-color: red;
	}
	
	.carousel .list li.a2 {
		background-color: blue;
	}
	
	.carousel .list li.a3 {
		background-color: green;
	}
	
	.carousel .list li.a4 {
		background-color: gray;
	}
	
	.prev {
		position: absolute;
		left: 0px;
		top: 50%;
		width: 25px;
		height: 50px;
		background-color: #000;
		color: #fff;
		margin-top: -25px;
	}
	
	.next {
		position: absolute;
		right: 0px;
		top: 50%;
		width: 25px;
		height: 50px;
		background-color: #000;
		color: #fff;
		margin-top: -25px;
	}
</style>
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<!-- 캐러셀 -->
							<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
							<div class="c_wrap">
								<div class="carousel">
									<ul class="list">
										<li class="a1"><img src="${pageContext.request.contextPath}/resources/admin/img/adminlogo.png" class="d-block w-100" alt="..."></li>
										<li class="a2"><img src="${pageContext.request.contextPath}/resources/admin/img/four.jpg" class="d-block w-100" alt="..."></li>
										<li class="a3"><img src="${pageContext.request.contextPath}/resources/admin/img/character_sample.jpg" class="d-block w-100" alt="..."></li>
									</ul>
								</div>
								<p class="prev">이전</p>
								<p class="next">이후</p>
							</div>
							<script>
								$(document).ready(function() {
								  $('.prev').click(function() {
								    $('.list').stop().animate({
								      'margin-left': '-800px'
								    }, function() {
								      $('.list li:first-child').appendTo('.list');
								      $('.list').css({
								        'margin-left': '-400px'
								      });
								    });
								  });
								  $('.next').click(function() {
								    $('.list').stop().animate({
								      'margin-left': '0px'
								    }, function() {
								      $('.list li:last-child').prependTo('.list');
								      $('.list').css({
								        'margin-left': '-400px'
								      });
								    });
								  });
								});
							</script>
							<%-- <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-interval="true">
								<div class="carousel-indicators">
									<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
									<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
									<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
								</div>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="${pageContext.request.contextPath}/resources/admin/img/adminlogo.png" class="d-block w-100" alt="...">
										<div class="carousel-caption d-none d-md-block">
											<!-- <h5>민트마켓</h5> -->
											<p>관리자 로그인 화면 입니다다당</p>
										</div>
									</div>
									<div class="carousel-item">
										<img src="${pageContext.request.contextPath}/resources/admin/img/four.jpg" class="d-block w-100" alt="...">
										<div class="carousel-caption d-none d-md-block">
											<!-- <h5>Second slide label</h5> -->
											<p>민트마켓 꽃길만 걷자</p>
										</div>
									</div>
									<div class="carousel-item">
										<img src="${pageContext.request.contextPath}/resources/admin/img/character_sample.jpg" class="d-block w-100" alt="...">
										<div class="carousel-caption d-none d-md-block">
											<!-- <h5>Third slide label</h5> -->
											<p>Never mind</p>
										</div>
									</div>
								</div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
								</button>
							</div> --%>
							
							<script>
								
							</script>
														
							<!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">민트마켓 관리자 로그인</h1>
									</div>
									<form class="user" action="login.mdo" method="POST">
										<div class="form-group">
											<input type="text" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" name="id" placeholder="ID">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user" name="password" id="exampleInputPassword" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input" id="customCheck"> <label class="custom-control-label" for="customCheck">로그인 저장하시겠습니까? </label>
											</div>
										</div>
										<input type="submit" class="btn btn-primary btn-user btn-block" value="로그인">
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.mdo">비밀번호 찾기</a>
									</div>
									<div class="text-center">
										<a class="small" href="register.mdo">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>
	</boddy>
</html>
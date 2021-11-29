<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>민트마켓 광고/배너관리</title>
<script defer src="${pageContext.request.contextPath}/resources/admin/js/buttons.js"></script>
<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="sidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<form>
				<%@ include file="header.jsp"%>
				<div class="tab_banner">
					<ul class="tabnav_banner">
						<li><a href="#tab01">쇼핑</a></li>
						<li><a href="#tab02">중고</a></li>
					</ul>
					<div class="tabcontent_banner">
						<div id="tab01">
							<div class="container-fluid">
								<div class="row">
									<div class="col-lg-6">
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">쇼핑몰 광고/배너관리</h6>
											</div>
											<div class="card-body">
												<div class="slide">
													<ul class="slideImg">
														<li class="jsSlide"><a href="javascript:void(0)"><img id="slide_img1" src="${store_banner1 }" alt="민트마켓슬라이드1"></a></li>
														<li class="jsSlide"><a href="javascript:void(0)"><img id="slide_img2" src="${store_banner2 }" alt="민트마켓슬라이드2"></a></li>
														<li class="jsSlide"><a href="javascript:void(0)"><img id="slide_img3" src="${store_banner3 }" alt="민트마켓슬라이드3"></a></li>
														<li class="jsSlide"><a href="javascript:void(0)"><img id="slide_img4" src="${store_banner4 }" alt="민트마켓슬라이드4"></a></li>
													</ul>
													<ul class="circleBtn">
														<li><span class="circle" onclick="dotSlide(0)"><label for="slide1">&nbsp;</label></span></li>
														<li><span class="circle" onclick="dotSlide(1)"><label for="slide2">&nbsp;</label></span></li>
														<li><span class="circle" onclick="dotSlide(2)"><label for="slide3">&nbsp;</label></span></li>
														<li><span class="circle" onclick="dotSlide(3)"><label for="slide4">&nbsp;</label></span></li>
													</ul>
												</div>
												<form action="bannerStore.mdo" method="post" enctype="multipart/form-data">
													<div>
														<div>
															<div class="used_photo">
																<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																	<img class="preview-wrap1" src="${store_banner1 }" alt="등록할 상품 사진을 넣어주세요."
																	onerror="this.style.display='none'">
																</div>
																<div style="display:flex; vertical-align: center; margin-top:60px; margin-bottom:60px">
																	<input id="banner_file" class="form-input1" type="file" name="file" multiple accept=".jpg, .png, .gif">
																	<input type="hidden" value="1" name="no">
																	<input type="submit" value="저장" style="width:50px; height:30px">
																</div>
															</div>
														</div>
													</div>
												</form>
												<form action="bannerStore.mdo" method="post" enctype="multipart/form-data">
													<div>
														<div class="used_photo">
															<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																<img class="preview-wrap2" src="${store_banner2 }" alt="등록할 상품 사진을 넣어주세요."
																onerror="this.style.display='none'">
															</div>
															<div style="display:flex; vertical-align: center; margin-top:60px; margin-bottom:60px">
																<input id="banner_file" class="form-input2" type="file" name="file" multiple accept=".jpg, .png, .gif" style="">
																<input type="hidden" value="2" name="no">
																<input type="submit" value="저장" style="width:50px; height:30px">
															</div>
														</div>
													</div>
												</form>
												<form action="bannerStore.mdo" method="post" enctype="multipart/form-data">
													<div>
														<div class="used_photo">
															<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																<img class="preview-wrap3" src="${store_banner3 }" alt="등록할 상품 사진을 넣어주세요."
																onerror="this.style.display='none'">
															</div>
															<div style="display:flex; vertical-align: center; margin-top:60px; margin-bottom:60px">
																<input id="banner_file" class="form-input3" type="file" name="file" multiple accept=".jpg, .png, .gif">
																<input type="hidden" value="3" name="no">
																<input type="submit" value="저장" style="width:50px; height:30px">
															</div>
														</div>
														
													</div>
												</form>
												<form action="bannerStore.mdo" method="post" enctype="multipart/form-data">
													<div>
														<div class="used_photo">
															<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																<img class="preview-wrap4" src="${store_banner4 }" alt="등록할 상품 사진을 넣어주세요."
																onerror="this.style.display='none'">
															</div>
															<div style="display:flex; vertical-align: center; margin-top:60px; margin-bottom:60px">
																<input id="banner_file" class="form-input4" type="file" name="file" multiple accept=".jpg, .png, .gif">
																<input type="hidden" value="4" name="no">
																<input type="submit" value="저장" style="width:50px; height:30px">
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="tab02">
							<div class="container-fluid">
								<div class="row">
									<div class="col-lg-6">
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">중고마켓 광고/배너관리</h6>
											</div>
											<div class="card-body">
												<div class="slide">
													<ul class="slideImg">
														<li class="jsSlide"><a href="javascript:void(0)"><img id="slide_img1" src="${market_banner1 }" alt="민트마켓슬라이드1"></a></li>
														<li class="jsSlide"><a href="javascript:void(0)"><img id="slide_img2" src="${market_banner2 }" alt="민트마켓슬라이드2"></a></li>
														<li class="jsSlide"><a href="javascript:void(0)"><img id="slide_img3" src="${market_banner3 }" alt="민트마켓슬라이드3"></a></li>
														<li class="jsSlide"><a href="javascript:void(0)"><img id="slide_img4" src="${market_banner4 }" alt="민트마켓슬라이드4"></a></li>
													</ul>
													<ul class="circleBtn">
														<li><span class="circle" onclick="dotSlide1(0)"><label for="slide1">&nbsp;</label></span></li>
														<li><span class="circle" onclick="dotSlide1(1)"><label for="slide2">&nbsp;</label></span></li>
														<li><span class="circle" onclick="dotSlide1(2)"><label for="slide3">&nbsp;</label></span></li>
														<li><span class="circle" onclick="dotSlide1(3)"><label for="slide4">&nbsp;</label></span></li>
													</ul>
												</div>
												<form action="bannerMarket.mdo" method="post" enctype="multipart/form-data">
													<div>
														<div>
															<div class="used_photo">
																<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																	<img class="preview-wrap1" src="${market_banner1 }" alt="등록할 상품 사진을 넣어주세요."
																	onerror="this.style.display='none'">
																</div>
																<div style="display:flex; vertical-align: center; margin-top:60px; margin-bottom:60px">
																	<input id="banner_file" class="form-input1" type="file" name="file" multiple accept=".jpg, .png, .gif">
																	<input type="hidden" value="1" name="no">
																	<input type="submit" value="저장" style="width:50px; height:30px">
																</div>
															</div>
														</div>
													</div>
												</form>
												<form action="bannerMarket.mdo" method="post" enctype="multipart/form-data">
													<div>
														<div class="used_photo">
															<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																<img class="preview-wrap2" src="${market_banner2 }" alt="등록할 상품 사진을 넣어주세요."onerror="this.style.display='none'" style="padding-bottom-top:20px; padding-bottom:20px">
															</div>
															<div style="display:flex; vertical-align: center; margin-top:60px; margin-bottom:60px">
																<input id="banner_file" class="form-input2" type="file" name="file" multiple accept=".jpg, .png, .gif">
																<input type="hidden" value="2" name="no">
																<input type="submit" value="저장" style="width:50px; height:30px">
															</div>
														</div>
													</div>
												</form>
												<form action="bannerMarket.mdo" method="post" enctype="multipart/form-data">
													<div>
														<div class="used_photo">
															<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																<img class="preview-wrap3" src="${market_banner3 }" alt="등록할 상품 사진을 넣어주세요."
																onerror="this.style.display='none'">
															</div>
															<div style="display:flex; vertical-align: center; margin-top:60px; margin-bottom:60px">
																<input id="banner_file" class="form-input3" type="file" name="file" multiple accept=".jpg, .png, .gif">
																<input type="hidden" value="3" name="no">
																<input type="submit" value="저장" style="width:50px; height:30px">
															</div>
														</div>
														
													</div>
												</form>
												<form action="bannerMarket.mdo" method="post" enctype="multipart/form-data">
													<div>
														<div class="used_photo">
															<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																<img class="preview-wrap4" src="${market_banner4 }" alt="등록할 상품 사진을 넣어주세요."
																onerror="this.style.display='none'">
															</div>
															<div style="display:flex; vertical-align: center; margin-top:60px; margin-bottom:60px">
																<input id="banner_file" class="form-input4" type="file" name="file" multiple accept=".jpg, .png, .gif">
																<input type="hidden" value="4" name="no">
																<input type="submit" value="저장" style="width:50px; height:30px">
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
			<!-- End of Main Content -->
		</div>
	</div>
	<%@ include file="footer.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>
	<script>
		$(function() {
			$(".form-input1").on('change', function() {
				readURL1(this);
			});
			
			$(".form-input2").on('change', function() {
				readURL2(this);
			});
			
			$(".form-input3").on('change', function() {
				readURL3(this);
			});
			
			$(".form-input4").on('change', function() {
				readURL4(this);
			});
		});
		
		function readURL1(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
		
				reader.onload = function(e) {
					$('.preview-wrap1').attr('src', e.target.result);
					$('#slide_img1').attr('src', e.target.result);
				}
		
				reader.readAsDataURL(input.files[0]);
			}
			$('.preview-wrap').show();
		}

		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
		
				reader.onload = function(e) {
					$('.preview-wrap2').attr('src', e.target.result);
					$('#slide_img2').attr('src', e.target.result);
				}
		
				reader.readAsDataURL(input.files[0]);
			}
			$('.preview-wrap').show();
		}

		function readURL3(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
		
				reader.onload = function(e) {
					$('.preview-wrap3').attr('src', e.target.result);
					$('#slide_img3').attr('src', e.target.result);
				}
		
				reader.readAsDataURL(input.files[0]);
			}
			$('.preview-wrap').show();
		}

		function readURL4(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
		
				reader.onload = function(e) {
					$('.preview-wrap4').attr('src', e.target.result);
					$('#slide_img4').attr('src', e.target.result);
				}
		
				reader.readAsDataURL(input.files[0]);
			}
			$('.preview-wrap').show();
		}

		$(function() {
			$('.tabcontent_banner > div').hide();
			$('.tabnav_banner a').click(function() {
				$('.tabcontent_banner > div').hide().filter(this.hash).fadeIn();
				$('.tabnav_banner a').removeClass('active');
				$(this).addClass('active');
				return false;
			}).filter(':eq(0)').click();
		});	
	</script>
</body>

</html>
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
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<title>관리자 페이지</title>
<!-- 폰트 설정 -->
<link href="admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- 템플릿 css -->
<link href="admin/css/sb-admin-2.css" rel="stylesheet">
<!-- 달력 -->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

</head>
<body id="page-top">
	<!-- 페이지 전체 -->
	<div id="wrapper">
		<%@ include file="sidebar.jsp"%>
		<!-- 본문 전체 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- 메인 -->
			<div id="content">
				<!------------------------------------------- 최상단 메뉴 ---------------------------------------------->
				<%@ include file="header.jsp"%>
				<!---------------------------- 최상단 메뉴 끝 ---------------------------->
				<!---------------------------- 본문 내용 시작 ---------------------------->
				<div class="container-fluid">
					<!-- 본문 머리 -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">게시판</h1>
						<div>
							<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
								<i class="fas fa-download fa-sm text-white-50"></i>&nbsp;엑셀로 출력하기
							</a>
							<a href="ConvertToPdf.mdo" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
								<i class="fas fa-download fa-sm text-white-50"></i>&nbsp;PDF로 출력하기
							</a>
						</div>
					</div>
					<!-- 1열 -->
					<div class="row" style="display: flex;">
						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">회원</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${userCount }&nbsp;&nbsp;&nbsp;명</div>
										</div>
										<div class="col-auto">
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">상품</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${storeCount }&nbsp;&nbsp;&nbsp;개</div>
										</div>
										<div class="col-auto">
										
										
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">문의</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${qnaCount }&nbsp;&nbsp;&nbsp;건</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
										
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">매출</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${totalPrice }&nbsp;&nbsp;&nbsp;원</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-won-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 2열 -->
					<div class="row" style="display: flex;">
						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">월매출</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a>
											<a class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">상품랭킹</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="js/demo/chart-pie-demo.js" role="button" 
											id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a>
											<a class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="myPieChart"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"><i class="fas fa-circle text-primary"></i>주방</span>
										<span class="mr-2"> <i class="fas fa-circle text-success"></i>욕실</span>
										<span class="mr-2"> <i class="fas fa-circle text-info"></i>생활</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 3열 -->
					<div class="row">
						<!-- Content Column -->
						<!-- <div class="col-lg-6 mb-4">
							Project Card Example
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">간략하게 보기</h6>
								</div>
								<div class="card-body">
									<h4 class="small font-weight-bold">
										김주호 <span class="float-right">30%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-danger" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										박동녘 <span class="float-right">40%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-warning" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										백미라 <span class="float-right">60%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										이정빈 <span class="float-right">80%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										장형준 <span class="float-right">Complete!</span>
									</h4>
									<div class="progress">
										<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
										</div>
									</div>													
								</div>
							</div> -->
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
			<!-- End of Main Content -->

			<%@ include file="footer.jsp"%>

			<!-- Bootstrap core JavaScript-->
			<script src="admin/vendor/jquery/jquery.min.js"></script>
			<script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="admin/js/sb-admin-2.min.js"></script>

			<!-- Page level plugins -->
			<script src="admin/vendor/chart.js/Chart.min.js"></script>

			<!-- Page level custom scripts -->
			<script src="admin/js/demo/chart-area-demo.js"></script>
			<script src="admin/js/demo/chart-pie-demo.js"></script>
</body>
</html>
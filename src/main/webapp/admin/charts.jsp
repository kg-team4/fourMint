<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>차트</title>
<!-- Custom fonts for this template-->
<link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="admin/css/sb-admin-2.css" rel="stylesheet">
</head>
<body id="page-top">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="sidebar.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<%@ include file="header.jsp"%>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">차트</h1>
					<p class="mb-4">
						<a target="_blank" href="https://www.chartjs.org/docs/latest/"></a>
					</p>
					<!-- Content Row -->
					<div class="row">
						<div class="col-xl-8 col-lg-7">
							<!-- Area Chart -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">매출</h6>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart" style="display: block; height: 160px; width: 44px;" width="55" height="200" class="chartjs-render-monitor"></canvas>
										<script src="js/demo/chart-area-demo.js"></script>
									</div>
								</div>
							</div>
							<!-- Bar Chart -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">회원랭킹</h6>
								</div>
								<div class="card-body">
									<div class="chart-bar">
										<canvas id="myBarChart" width="55" height="200" style="display: block; height: 160px; width: 44px;" class="chartjs-render-monitor"></canvas>
										<script src="js/demo/chart-bar-demo.js">
											
										</script>
									</div>
								</div>
							</div>
							<!-- pie Chart -->
							<div class="col-xl-4 col-lg-5">
								<div class="card shadow mb-4">
									<!-- Card Header - Dropdown -->
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상품랭킹</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="chart-pie pt-4">
											<canvas id="myPieChart" width="55" height="200" style="display: block; height: 216px; width: 20px;" class="chartjs-render-monitor"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.container-fluid -->
				</div>
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
				<script src="admin/js/demo/chart-bar-demo.js"></script>
				<script>
					var ctx = document.getElementById("myPieChart");
					var myPieChart = new Chart(ctx, {
						type : 'doughnut',
						data : {
							labels : [ "Direct", "Referral", "Social" ],
							datasets : [ {
								data : [ 100, 50, 10 ],
								backgroundColor : [ '#4e73df', '#1cc88a',
										'#36b9cc' ],
								hoverBackgroundColor : [ '#2e59d9', '#17a673',
										'#2c9faf' ],
								hoverBorderColor : "rgba(234, 236, 244, 1)",
							} ],
						},
						options : {
							maintainAspectRatio : false,
							tooltips : {
								backgroundColor : "rgb(255,255,255)",
								bodyFontColor : "#858796",
								borderColor : '#dddfeb',
								borderWidth : 1,
								xPadding : 15,
								yPadding : 15,
								displayColors : false,
								caretPadding : 10,
							},
							legend : {
								display : false
							},
							cutoutPercentage : 80,
						},
					});
				</script>
</body>
</html>
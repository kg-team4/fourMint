<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<title>관리자 페이지</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<!--  -->
<script src="https://kit.fontawesome.com/d0b304acae.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 폰트 설정 -->
<link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- 템플릿 css -->
<link
	href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.css"
	rel="stylesheet">
<!-- 달력 -->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></link>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="resources/js/join/datepicker.js"></script>
<script type="text/javascript">
// Load the Visualization API and the corechart package.
google.charts.load('current', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {

   // Create the data table.
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Topping');
   data.addColumn('number', 'Slices');
   data.addRows([
      ['10대', ${ageList[0]}],
      ['20대', ${ageList[1]}],
      ['30대', ${ageList[2]}],
      ['40대', ${ageList[3]}],
      ['50대 이상', ${ageList[4]}]
   ]);

   // Set chart options
   var options = {'title':'연령별 회원 차트', 'width':443, 'height':458};
   
   // Instantiate and draw our chart, passing in some options.
   var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
}
</script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<style>
body {
	background-color: #f9f9fa
}

.flex {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto
}

@media () {
	.padding {
		padding: 1.5rem
	}
}

@media () {
	.padding {
		padding: 1rem
	}
}

.padding {
	padding: 5rem
}

.card {
	height: 500px;
	background: #fff;
	border-width: 0;
	border-radius: .25rem;
	box-shadow: 0 1px 3px rgba(0, 0, 0, .05);
	margin-bottom: 1.5rem
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
}
</style>
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
					</div>
					<!-- 1열 -->
					<div class="row" style="display: flex;">
						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">회원 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${userCount }&nbsp;명</div>
										</div>
										<div class="col-auto"></div>
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
											<div class="text-xs font-weight-bold text-success text-uppercase mb-1">스토어 상품</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${storeCount }&nbsp;개</div>
										</div>
										<div class="col-auto"></div>
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
											<div class="text-xs font-weight-bold text-info text-uppercase mb-1">중고 거래 건</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${usedCount }&nbsp;건</div>
												</div>
											</div>
										</div>
										<div class="col-auto"></div>
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
											<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">매출</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice }" />&nbsp;원</div>
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
					<div style="display: flex; justify-content: space-between; align-items: center;">
						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div id="layoutSidenav_content">
								<main>
									<div class="container-fluid px-4">
										<div class="card mb-4" style="width: 100%; height: 20%; float: left;">
											<input type="hidden" id="chartType" value="line">
											<div class="card-header" style="justify-content: space-between; display: flex; align-items: center; padding: 5px;">
												<div>
													<i class="fas fa-chart-area me-1"></i>
													<span id="sales_term">&nbsp;<span id="start_date_span">${start_date }</span> ~ 
													<span id="end_date_span">${end_date }</span></span>
												</div>
												<div>
													&nbsp;&nbsp;&nbsp; 합계 : 
													<span id="totalspan"></span>&#8361;
												</div>
											</div>
											<div class="card-body" style="margin-top: 15px;">
												<canvas id="myChart" width="120%" height="60"></canvas>
											</div>
										</div>
									</div>
									<script type="text/javascript">
										//Set new default font family and font color to mimic Bootstrap's default styling

										Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
										Chart.defaults.global.defaultFontColor = '#292b2c';
										var chartType = $('#chartType').val();
										// Area Chart Example
										var total = 0;
										var max = 0;

										var jsonChart = ${chartIndexList };

										var labels = jsonChart.map(function(e) {
											return e.month_chart;
										})

										var data = jsonChart.map(function(e) {
											total += e.sales_amount;

											if (e.sales_amount > max)
												max = e.sales_amount;

											return e.sales_amount;
										})
										
										$('#totalspan').html(total);
										var options = {
											scales : {
												xAxes : [ {
													time : {
														unit : 'date'
													},
													gridLines : {
														display : false
													},
													ticks : {
														maxTicksLimit : 12
													}
												} ],
												yAxes : [ {
													ticks : {
														min : 0,
														max : (max + 10000),
														maxTicksLimit : 10
													},
													gridLines : {
														color : "rgba(0, 0, 0, .125)",
													}
												} ],
											},
											legend : {
												display : false
											}
										}

										var dataSets = [ {
											label : "sales amount",
											lineTension : 0.3,
											backgroundColor : "rgba(2,117,216,0.2)",
											borderColor : "rgba(2,117,216,1)",
											pointRadius : 5,
											pointBackgroundColor : "rgba(2,117,216,1)",
											pointBorderColor : "rgba(255,255,255,0.8)",
											pointHoverRadius : 5,
											pointHoverBackgroundColor : "rgba(2,117,216,1)",
											pointHitRadius : 50,
											pointBorderWidth : 2,
											data : data
										} ];

										var chartData = {
											labels : labels,
											datasets : dataSets
										}

										var ctx = document.getElementById("myChart").getContext('2d');
										var myLineChart = new Chart(ctx, {
											type : $('#chartType').val(),
											data : chartData,
											options : options
										});

										function newLineChart() {
											myLineChart.destroy();
											
											ctx = document.getElementById("myChart");
											myLineChart = new Chart(ctx, {
												type : $('#chartType').val(),
												data : chartData,
												options : options
											});
										}
									</script>
								</main>
							</div>
						</div>
						
						<!-- Pie Chart -->
						<div class="card shadow mb-4" style="width: 500px; height: auto;">
							<div id="chart_div" style="margin-top:-15px"></div>
						</div>
					</div>
					<!-- 3열 -->
				</div>
			</div>
			<!-- /.container-fluid -->
			<!-- End of Main Content -->
			<%@ include file="footer.jsp"%>
			<!-- Bootstrap core JavaScript-->
			<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- Core plugin JavaScript-->
			<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
			<!-- Custom scripts for all pages-->
			<script src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>
			<!-- Page level plugins -->
			<script src="${pageContext.request.contextPath}/resources/admin/vendor/chart.js/Chart.min.js"></script>
			<!-- Page level custom scripts -->
			<script src="${pageContext.request.contextPath}/resources/admin/js/demo/chart-area-demo.js"></script>
			<script src="${pageContext.request.contextPath}/resources/admin/js/demo/chart-pie-demo.js"></script>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>차트</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<!--  -->
<script src="https://kit.fontawesome.com/d0b304acae.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></link>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="resources/js/join/datepicker.js"></script>
<script>
	$(document).ready(function() {
		var ctx = $("#chart-line");
		var myLineChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ '서울', '경기', '강원', '인천', '충남', '충북', '대전',
						'경북', '대구', '경남', '울산', '부산', '전북', '전남', '광주',
						'제주', '세종' ],
				datasets : [ {
					data : [ '${AddressList[0]}', '${AddressList[1]}',
							'${AddressList[2]}', '${AddressList[3]}',
							'${AddressList[4]}', '${AddressList[5]}',
							'${AddressList[6]}', '${AddressList[7]}',
							'${AddressList[8]}', '${AddressList[9]}',
							'${AddressList[10]}', '${AddressList[11]}',
							'${AddressList[12]}', '${AddressList[13]}',
							'${AddressList[14]}', '${AddressList[15]}',
							'${AddressList[16]}' ],
					label : "전체",
					borderColor : "#458af7",
					backgroundColor : '#26e4ca',
					fill : false
				},
				{
					data : [ '${manList[0]}', '${manList[1]}',
							'${manList[2]}', '${manList[3]}',
							'${manList[4]}', '${manList[5]}',
							'${manList[6]}', '${manList[7]}',
							'${manList[8]}', '${manList[9]}',
							'${manList[10]}', '${manList[11]}',
							'${manList[12]}', '${manList[13]}',
							'${manList[14]}', '${manList[15]}',
							'${manList[16]}' ],
					label : "남성",
					borderColor : "#000FFF",
					backgroundColor : '#000fff',
					fill : false
				},
				{
					data : [ '${womanList[0]}', '${womanList[1]}',
							'${womanList[2]}', '${womanList[3]}',
							'${womanList[4]}', '${womanList[5]}',
							'${womanList[6]}', '${womanList[7]}',
							'${womanList[8]}', '${womanList[9]}',
							'${womanList[10]}', '${womanList[11]}',
							'${womanList[12]}', '${womanList[13]}',
							'${womanList[14]}', '${womanList[15]}',
							'${womanList[16]}' ],
					label : "여성",
					borderColor : "#FFF000",
					backgroundColor : '#FFF000',
					fill : false
				}
				]
			},
			options : {
				title : {
					display : true,
					text : '지역별 회원 현황'
				}
			}
		});
	});

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
		var options = {'title':'연령별 회원 차트', 'width':800, 'height':500};
		
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
	}
</script>
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
<style>
	.chartSex {
		display: inline-flex;
		width: 100%;
		align-items: center;
		justify-content: space-around;
		padding: 50px;
		list-style: none;
		text-align: center;
	}
	
	.chartSex>li {
		flex: 0 1 50%;
	}
	
	.chartSex>li:nth-child(1) {
		padding-left: 50px;
	}
	
	.chartSex>li:nth-child(2) {
		padding-right: 50px;
	}
	
	.chartSex>li dl dt {
		position: absolute;
		width: 0;
		height: 0;
		overflow: hidden;
	}
	
	.chartSex>li dl dd.stat-cs-data1 {
		width: 68px;
		height: 136px;
		margin: 0 auto 20px auto;
		display: flex;
		flex-direction: column;
		justify-content: flex-end;
	}
	
	.chartSex>li dl dd.stat-cs-data1 .data-bar {
		display: block;
		margin-bottom: 0;
		width: 100%;
	}
	
	.chartSex>li dl dd.stat-cs-data1.female {
		background: url(/admin/img/stat_female.png) center bottom no-repeat;
	}
	
	.chartSex>li dl dd.stat-cs-data1.female .data-bar {
		background: url(/admin/img/stat_female_on.png) center bottom no-repeat;
	}
	
	.chartSex>li dl dd.stat-cs-data1.male {
		background: url(/admin/img/stat_male.png) center bottom no-repeat;
	}
	
	.chartSex>li dl dd.stat-cs-data1.male .data-bar {
		background: url(/admin/img/stat_male_on.png) center bottom no-repeat;
	}
	
	.chartSex>li dl dd.stat-cs-percent {
		font-size: 14px;
		font-weight: 500;
		margin-bottom: 5px;
	}
	
	.chartSex>li dl dd.stat-cs-count {
		font-size: 11px;
	}
	
</style>
<!-- Custom fonts for this template-->
<link href="admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="admin/css/sb-admin-2.css" rel="stylesheet">
<link href="admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
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
					<div class="tab_banner">
						<ul class="tabnav_banner">
							<li><a href="#tab01">회원</a></li>
							<li><a href="#tab02">상품</a></li>
							<li><a href="#tab03">문의</a></li>
							<li><a href="#tab04">매출</a></li>
						</ul>
						<div class="tabcontent_banner">
							<div id="tab01">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">민트마켓 회원성비</h6>
									</div>
									<ul class="chartSex">
										<li>
											<dl>
												<dt>남성</dt>
												<dd class="stat-cs-data1 male">
													<div class="data-bar" style="height:${mpercent}%"></div>
												</dd>
												<dd class="stat-cs-percent">${mpercent}%</dd>
												<dd class="stat-cs-count">${man}</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>여성</dt>
												<dd class="stat-cs-data1 female">
													<div class="data-bar" style="height:${wpercent}%"></div>
												</dd>
												<dd class="stat-cs-percent">${wpercent}%</dd>
												<dd class="stat-cs-count">${woman}</dd>
											</dl>
										</li>
									</ul>
								</div>
								<div class="card shadow mb-4" style="height: 600px">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">지역별 회원 현황</h6>
									</div>
									<div class="page-content page-container" id="page-content">
										<div class="row">
											<div class="container-fluid d-flex justify-content-center">
												<div class="chartjs-size-monitor"
													style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
													<div class="chartjs-size-monitor-expand"
														style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
														<div
															style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
													</div>
													<div class="chartjs-size-monitor-shrink"
														style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
														<div
															style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
													</div>
												</div>
												<canvas id="chart-line" width="299" height="200"
													class="chartjs-render-monitor"
													style="display: block; width: 299px; height: 200px;"></canvas>
											</div>
										</div>
									</div>
								</div>
								<div class="card shadow mb-4" style="height: 600px">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">지역별 회원 현황</h6>
									</div>
									<!--Div that will hold the pie chart-->
									<div id="chart_div"></div>
								</div>
							</div>
							<div id="tab02">
								<%-- <div class="container-fluid px-4">
									<div class="card mb-4" style="width: 100%; height: 20%; float: left;">
										<input type="hidden" id="chartType" value="line">
										<div class="card-header">
											<i class="fas fa-chart-area me-1"></i><span id="sales_term">&nbsp;<span
												id="start_date_span">20${start_date }</span> ~ <span
												id="end_date_span">20${end_date }</span> 별 매출
											</span> &nbsp;&nbsp;&nbsp; 합계 : <span id="totalspan"></span> &#8361;
											<button onclick="newLineChart()" class="btn btn-warning"
												id="barOrLine" style="float: right;">bar</button>
										</div>
										<div class="card-body">
											<canvas id="myChart" width="50%" height="30"></canvas>
											<div class="card mb-4" style="width: 100%;">
												<div>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="date_term"
															id="flexRadioDefault1" checked value="daily">
															<label class="form-check-label" for="flexRadioDefault1"> 일 별</label>
													</div>
						
													<div class="form-check">
														<input class="form-check-input" type="radio" name="date_term"
															id="flexRadioDefault2" value="month"> <label
															class="form-check-label" for="flexRadioDefault2"> 월 별</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="date_term"
															id="flexRadioDefault3" value="year"> <label
															class="form-check-label" for="flexRadioDefault3"> 년 별</label>
													</div>
												</div>
												<div>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="type"
															id="flexRadioDefault4" checked value="none"> <label
															class="form-check-label" for="flexRadioDefault4"> 없 음</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="type"
															id="flexRadioDefault5" value="gender"> <label
															class="form-check-label" for="flexRadioDefault5"> 성 별</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="type"
															id="flexRadioDefault6" value="pay_status"> <label
															class="form-check-label" for="flexRadioDefault6"> 결제 유형</label>
													</div>
													<div>
														<br> <input type="text" name="store_code" id="store_code"
															maxlength="10" />
														<div class="form-check">
															<input type="text" name="start_date" id="start_history"
																maxlength="10" readonly="readonly" /> &nbsp; ~ &nbsp; <input
																type="text" name="end_date" id="end_history" maxlength="10"
																readonly="readonly" />
															<button type="button" class="btn btn-warning"
																onclick='getNewChart()'>검색</button>
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
						
														var jsonChart = ${chartList};
						
														var labels = jsonChart.map(function(e) {
															return e.daily_chart;
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
																		maxTicksLimit : 7
																	}
																} ],
																yAxes : [ {
																	ticks : {
																		min : 0,
																		max : (max + 10000),
																		maxTicksLimit : 5
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
															if ($('#chartType').val() == 'line') {
																$('#chartType').val('bar');
																chartType = $('#chartType').val();
																$('#barOrLine').text('line');
															} else {
																$('#chartType').val('line');
																chartType = $('#chartType').val();
																$('#barOrLine').text('bar');
															}
						
															ctx = document.getElementById("myChart");
															myLineChart = new Chart(ctx, {
																type : $('#chartType').val(),
																data : chartData,
																options : options
															});
														}
						
														function getNewChart() {
															var store_code = $('#store_code').val();
															console.log(store_code);
															var start_date = $('input[name="start_date"]').val();
															var end_date = $('input[name="end_date"]').val();
						
															var date_term = $('input[name="date_term"]:checked').val();
															var type = $('input[name="type"]:checked').val();
															var order_status = $('input[name="order_status"]:checked').val();
						
															var man_array = [];
															var woman_array = [];
															var nogend_array = [];
						
															var cash_array = [];
															var card_array = [];
															var elsepay_array = [];
						
															$('#start_date_span').html('<i><font>' + start_date + '</font></i>');
															$('#end_date_span').html('<i><font>' + end_date + '</font></i>');
						
															$.ajax(
																{
																	type : "post",
																	url : "getCharts.mdo",
																	async : false,
																	data : JSON.stringify({
																		"start_date" : start_date,
																		"end_date" : end_date,
																		"date_term" : date_term,
																		"type" : type,
																		"order_status" : order_status,
																		"store_code" : store_code
																	}),
																	contentType : "application/json"
																}).done( function(res) {
																	max = 0;
																	total = 0;
																	for ( var i in res) {
																		if (res[i].sales_amount > max)
																			max = res[i].sales_amount;
																		total += res[i].sales_amount;
																		res[i].sales_amount;
																	}
																	$('#totalspan').html(
																			total);
																	labels = res.map(function(e) {
																		if (date_term == 'daily') {
																			return e.daily_chart;
																		} else if (date_term == 'month') {
																			return e.month_chart;
																		} else if (date_term == 'year') {
																			return e.year_chart;
																		}
																	})//end label_term
		
																	if (type == 'gender') {
																		for ( var i in res) {
																			if (res[i].user_gender == 'man') {
																				man_array
																						.push(res[i].sales_amount);
																			} else if (res[i].user_gender == 'woman') {
																				woman_array
																						.push(res[i].sales_amount);
																			} else {
																				nogend_array
																						.push(res[i].sales_amount);
																			}
																		}
		
																		dataSets = [
																			{
																				label : "sales amount man",
																				backgroundColor : [
																						'rgba(255, 99, 132, 0.2)',
																						'rgba(54, 162, 235, 0.2)',
																						'rgba(255, 206, 86, 0.2)' ],
																				borderColor : [
																						'rgba(255, 99, 132, 1)',
																						'rgba(54, 162, 235, 1)',
																						'rgba(255, 206, 86, 1)' ],
																				data : man_array,
																				borderWidth : 1
																			},
																			{
																				label : "sales amount woman",
																				backgroundColor : [
																						'rgba(75, 192, 192, 0.2)',
																						'rgba(153, 102, 255, 0.2)',
																						'rgba(255, 159, 64, 0.2)' ],
																				borderColor : [
																						'rgba(75, 192, 192, 1)',
																						'rgba(153, 102, 255, 1)',
																						'rgba(255, 159, 64, 1)' ],
																				data : woman_array,
																				borderWidth : 1
																			},
																			{
																				label : "sales amount woman",
																				backgroundColor : [
																						'rgba(75, 192, 192, 0.2)',
																						'rgba(153, 102, 255, 0.2)',
																						'rgba(255, 159, 64, 0.2)' ],
																				borderColor : [
																						'rgba(75, 192, 192, 1)',
																						'rgba(153, 102, 255, 1)',
																						'rgba(255, 159, 64, 1)' ],
																				data : nogend_array,
																				borderWidth : 1
																			} ];
		
																	} else if (type == 'pay_status') {
																		for ( var i in res) {
																			if (res[i].payment_type == 'card') {
																				card_array
																						.push(res[i].sales_amount);
																			} else if (res[i].payment_type == 'cash') {
																				cash_array
																						.push(res[i].sales_amount);
																			} else {
																				elsepay_array
																						.push(res[i].sales_amount);
																			}
																		}
		
																		dataSets = [
																			{
																				label : "pay type cash",
																				backgroundColor : [
																						'rgba(255, 99, 132, 0.2)',
																						'rgba(54, 162, 235, 0.2)',
																						'rgba(255, 206, 86, 0.2)' ],
																				borderColor : [
																						'rgba(255, 99, 132, 1)',
																						'rgba(54, 162, 235, 1)',
																						'rgba(255, 206, 86, 1)' ],
																				data : cash_array,
																				borderWidth : 1
																			},
																			{
																				label : "pay type card",
																				backgroundColor : [
																						'rgba(75, 192, 192, 0.2)',
																						'rgba(153, 102, 255, 0.2)',
																						'rgba(255, 159, 64, 0.2)' ],
																				borderColor : [
																						'rgba(75, 192, 192, 1)',
																						'rgba(153, 102, 255, 1)',
																						'rgba(255, 159, 64, 1)' ],
																				data : card_array,
																				borderWidth : 1
																			},
																			{
																				label : "pay type else",
																				backgroundColor : [
																						'rgba(75, 192, 192, 0.2)',
																						'rgba(153, 102, 255, 0.2)',
																						'rgba(255, 159, 64, 0.2)' ],
																				borderColor : [
																						'rgba(75, 192, 192, 1)',
																						'rgba(153, 102, 255, 1)',
																						'rgba(255, 159, 64, 1)' ],
																				data : elsepay_array,
																				borderWidth : 1
																			} ];
																	} else {
																		data = res.map(function(e) {
																			return e.sales_amount;
																		})
																		dataSets = [ {
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
																	}
																	chartData = {
																		labels : labels,
																		datasets : dataSets
																	};
																	ctx = document.getElementById("myChart").getContext('2d');
																	options = {
																		scales : {
																			xAxes : [ {
																				time : {
																					unit : 'date'
																				},
																				gridLines : {
																					display : false
																				},
																				ticks : {
																					maxTicksLimit : 7
																				}
																			} ],
																			yAxes : [ {
																				ticks : {
																					min : 0,
																					max : (max + 10000),
																					maxTicksLimit : 5
																				},
																				gridLines : {
																					color : "rgba(0, 0, 0, .125)",
																				}
																			} ],
																		},
																		legend : {
																			display : false
																		}
																	};			
		
															myLineChart = new Chart(
																ctx,
																{
																	type : $(
																			'#chartType')
																			.val(),
																	data : chartData,
																	op	tions : options
																});
															})
														}
													</script>
												</div>
												<div class="card-footer small text-muted"></div>
											</div>
										</div>
									</div>
								</div> --%>
							</div>
							<div id="tab03">문의</div>
							<div id="tab04">
								<div class="row">
									<div class="col-xl-8 col-lg-7">
										<!-- Area Chart -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">매출</h6>
											</div>
											<div class="card-body">
												<div class="chart-area">
													<canvas id="myAreaChart"
														style="display: block; height: 160px; width: 44px;"
														width="55" height="200" class="chartjs-render-monitor"></canvas>
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
													<canvas id="myBarChart" width="55" height="200"
														style="display: block; height: 160px; width: 44px;"
														class="chartjs-render-monitor"></canvas>
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
														<canvas id="myPieChart" width="55" height="200"
															style="display: block; height: 216px; width: 20px;"
															class="chartjs-render-monitor"></canvas>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
			
			<!-- Page level plugins -->
			<script src="admin/vendor/datatables/jquery.dataTables.min.js"></script>
			<script src="admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

			<!-- Page level custom scripts -->
			<script src="admin/js/demo/datatables-demo.js"></script>
			<script>
				var ctx = document.getElementById("myPieChart");
				var myPieChart = new Chart(
						ctx,
						{
							type : 'doughnut',
							data : {
								labels : [ "Direct", "Referral", "Social" ],
								datasets : [ {
									data : [ 100, 50, 10 ],
									backgroundColor : [ '#4e73df', '#1cc88a',
											'#36b9cc' ],
									hoverBackgroundColor : [ '#2e59d9',
											'#17a673', '#2c9faf' ],
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

				$(function() {
					$('.tabcontent_banner > div').hide();
					$('.tabnav_banner a').click(
							function() {
								$('.tabcontent_banner > div').hide().filter(
										this.hash).fadeIn();
								$('.tabnav_banner a').removeClass('active');
								$(this).addClass('active');
								return false;
							}).filter(':eq(0)').click();
				});
			</script>
</body>
</html>
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

<title>매출 관리</title>

<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<!--  -->
<script src="https://kit.fontawesome.com/d0b304acae.js"
	crossorigin="anonymous"></script>
<!-- fontawesomeCDN -->

<!-- Bootstrap CSS -->

<!-- Font Awesome -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="admin/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd' //Input Display Format 변경
			,
			showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,
			showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
			,
			changeYear : true //콤보박스에서 년 선택 가능
			,
			changeMonth : true //콤보박스에서 월 선택 가능                
			,
			buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			,
			yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,
			monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'10', '11', '12' ] //달력의 월 부분 텍스트
			,
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
			,
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
			,
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
			,
			minDate : "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			,
			yearRange : "-100:-0",
			maxDate : "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)      
		});

		$("#start_history").datepicker();
		$("#end_history").datepicker();
		$("#start_history").datepicker('setDate', '-7D');
		$("#end_history").datepicker('setDate', 'today');
		$('#aaaa').datepicker();
	});
</script>

<script>
		$(document).ready(function() {
			$('#savePdf').click(function() { // pdf저장 button id
				
			    html2canvas($('#ex2')[0]).then(function(canvas) { //저장 영역 div id
				
			    // 캔버스를 이미지로 변환
			    var imgData = canvas.toDataURL('image/png');
				     
			    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
			    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			    var imgHeight = canvas.height * imgWidth / canvas.width;
			    var heightLeft = imgHeight;
			    var margin = 10; // 출력 페이지 여백설정
			    var doc = new jsPDF('p', 'mm');
			    var position = 0;
			       
			    // 첫 페이지 출력
			    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			    heightLeft -= pageHeight;
			         
			    // 한 페이지 이상일 경우 루프 돌면서 출력
			    while (heightLeft >= 20) {
			        position = heightLeft - imgHeight;
			        doc.addPage();
			        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			        heightLeft -= pageHeight;
			    }
			 
			    // 파일 저장
			    doc.save('file-name.pdf');
		
				  
			});
		
			});
			
			
		})



</script>


</head>


<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="sidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<%@ include file="header.jsp"%>

				<!-- Begin Page Content -->
				<div id="layoutSidenav_content">
					<main >
						<div class="container-fluid px-4" id="contents">
							<div class="card mb-4"
								style="width: 50%; height: 20%; float: left;">
								<input type="hidden" id="chartType" value="line">
								
							<div id="ex2">
								<div class="card-header"
									style="justify-content: space-between; display: flex; align-items: center; padding: 5px;">
									<div>
										<i class="fas fa-chart-area me-1"></i><span id="sales_term">&nbsp;<span
											id="start_date_span">${start_date }</span> ~ <span
											id="end_date_span">${end_date }</span> 별 매출
										</span> &nbsp;&nbsp;&nbsp; 합계 : <span id="totalspan"></span> &#8361;
									</div>
									<button onclick="newLineChart()" class="btn btn-warning"
										id="barOrLine" style="float: right;">bar</button>
									<button type="button" class="btn btn-primary" id="savePdf" >PDF 저장</button>
								</div>
								<div class="card-body">
									<canvas id="myChart" width="50%" height="30"></canvas>
							</div>
				
									<div class="card mb-4"
										style="width: 100%; border: 0px; margin-top: 20px; height: auto; align-items: center; justify-content: center;">
										<div class="form-check" style="display: flex;">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="date_term" id="flexRadioDefault1" checked
													value="daily"> <label class="form-check-label"
													for="flexRadioDefault1">일 별</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="date_term" id="flexRadioDefault2" value="month">
												<label class="form-check-label" for="flexRadioDefault2">월 별</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="date_term" id="flexRadioDefault3" value="year">
												<label class="form-check-label" for="flexRadioDefault3">년 별</label>
											</div>
										</div>
										<div class="form-check"
											style="padding-left: 5px; display: flex; align-items: center; justify-content: center">
											<input type="text" name="start_date" id="start_history"
												class="form-control" maxlength="10" style="width: 120px;"
												readonly="readonly" /> &nbsp; ~ &nbsp; <input type="text"
												name="end_date" id="end_history" class="form-control"
												maxlength="10" style="width: 120px;" readonly="readonly" />
											<button type="button" class="btn btn-primary"
												onclick='getNewChart()'
												style="margin-bottom: 3px; margin-left: 25px; width: 100px;">검색</button>
										</div>
									</div>

								</div>
							</div>
						</div>
						</main>
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

							var ctx = document.getElementById("myChart")
									.getContext('2d');
							var myLineChart = new Chart(ctx, {
								type : $('#chartType').val(),
								data : chartData,
								options : options
							});

							function newLineChart() {
								myLineChart.destroy();
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
								myLineChart.destroy();
								var store_code = $('#store_code').val();
								console.log(store_code);
								var start_date = $('input[name="start_date"]')
										.val();
								var end_date = $('input[name="end_date"]')
										.val();

								var date_term = $(
										'input[name="date_term"]:checked')
										.val();
								var type = $('input[name="type"]:checked')
										.val();
								var status = $('input[name="status"]:checked')
										.val();

								/*    var man_array = [];
								 var woman_array = [];
								 var nogend_array = [];
								
								 var cash_array = [];
								 var card_array = [];
								 var elsepay_array = [];
								 */

								$('#start_date_span').html(
										'<i><font>' + start_date
												+ '</font></i>');
								$('#end_date_span').html(
										'<i><font>' + end_date + '</font></i>');

								$
										.ajax({
											type : "post",
											url : "getNewChart.mdo",
											async : false,
											data : JSON.stringify({
												"start_date" : start_date,
												"end_date" : end_date,
												"date_term" : date_term,
												"status" : status,
											}),
											contentType : "application/json"
										})
										.done(
												function(res) {
													max = 0;
													total = 0;
													for ( var i in res) {
														if (res[i].sales_amount > max)
															max = res[i].sales_amount;
														total += res[i].sales_amount;
														res[i].sales_amount;
													}
													$('#totalspan').html(total);
													labels = res
															.map(function(e) {
																if (date_term == 'daily') {
																	return e.daily_chart;
																} else if (date_term == 'month') {
																	return e.month_chart;
																} else if (date_term == 'year') {
																	return e.year_chart;
																}
															})//end label_term

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

													chartData = {
														labels : labels,
														datasets : dataSets
													};

													ctx = document
															.getElementById(
																	"myChart")
															.getContext('2d');
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
																options : options
															});
												})
							}
						</script>
					</main>
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
			
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
</html>
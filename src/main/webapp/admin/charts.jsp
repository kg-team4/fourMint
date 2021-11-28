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
	          },
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
		var options = {'title':'연령별 회원 차트', 'width':500, 'height':350};
		
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
	}

	// Load the Visualization API and the corechart package.
	google.charts.load('current', {'packages':['corechart']});
	
	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawCategoryBig);
	
	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawCategoryBig() {
	
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([
			['주방', ${categoryBigList[0]}],
			['욕실', ${categoryBigList[1]}],
			['생활', ${categoryBigList[2]}],
			['화장품', ${categoryBigList[3]}]
		]);
	
		// Set chart options
		var options = {'title':'카테고리 종류', 'width':500, 'height':400};
		
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document.getElementById('chart_category'));
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
	width: 120%; align-items : center;
	justify-content: space-around;
	padding: 10px;
	list-style: none;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	align-items: center;
}

.chartSex>li {
	flex: 0 1 50%;
}

.chartSex>li:nth-child(1) {
	padding-left: 50px;
	margin-left: -50px;
}

.chartSex>li:nth-child(2) {
	padding-right: 50px;
	margin-left: -50px;
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
		<div id="content-wrapper">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<%@ include file="header.jsp"%>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid" style="margin-top:-40px; margin-left:-30px;">
					<!-- Page Heading -->
					<p class="mb-4">
						<a target="_blank" href="https://www.chartjs.org/docs/latest/"></a>
					</p>
					<div class="tab_banner" >
						<ul class="tabnav_banner" >
							<li><a href="#tab01">회원</a></li>
							<li><a href="#tab02">상품</a></li>
						</ul>
						<div class="tabcontent_banner">
							<div id="tab01">
								
								<div class="card shadow mb-4" style="height: 900px; overflow-y:hidden; overflow-x:hidden">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">회원 현황</h6>
									</div>
									<div class="page-content page-container" id="page-content">
										<div class="row">
											<div class="container-fluid  justify-content-center">
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
															style="position: absolute; width: 50%; height: 50%; left: 0; top: 0"></div>
													</div>
												</div>
												<canvas id="chart-line" style="padding:20px; padding-left:20px; width:400px; height:200px "
													class="chartjs-render-monitor">
												</canvas>
												

												<div style="width:500px">
												<div style="float:left">
													<ul class="chartSex" style="width:500px" >

														<li>
															<dl>
																<dd style="width:60px; color:black; font-size:12px; "><strong>성별 회원</strong></dd>
																<dt>남성</dt>
																<dd class="stat-cs-data1 male">
																	<div class="data-bar" style="height:${mpercent}%"></div>
																</dd>
																<dd class="stat-cs-percent">${mpercent}%</dd>
																<dd class="stat-cs-count">${man}</dd>
															</dl>
														</li>
														<li>
															<dl style="margin-left:50px">
																<dd style="color:black; font-size:12px; margin-left: -480px"><strong>차트</strong></dd>
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
													
													
												</div>
												<div style="float:left" id="chart_div" style="margin-top:-15px"></div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="tab02">
								<div class="row">
									<div class="col-xl-8 col-lg-7">
										<!-- Area Chart -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">스토어 카테고리</h6>
											</div>
											<div id="chart_category"></div>
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
				$(function() {
					$('.tabcontent_banner > div').hide();
					$('.tabnav_banner a').click( function() {
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
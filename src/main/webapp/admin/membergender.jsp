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
<title>성별로 보는 회원목록</title>
<style>
.chartSex {
	display: inline-flex;
	width: 100%;
	align-items: center;
	justify-content: space-around;
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
				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">성비</h1>
				<p class="mb-4">
					<a target="_blank" href="https://datatables.net">민트마켓 회원성비</a>.
				</p>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">카테고리</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="membergender.mdo">성별</a> <a
							class="dropdown-item" href="memberbirth.mdo">년도</a> <a
							class="dropdown-item" href="memberaddress.mdo">주소</a> <a
							class="dropdown-item" href="tables-member.mdo">회원목록</a>
					</div>
				</div>
				<!-- DataTales  -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">민트마켓 회원성비</h6>
					</div>
					<ul class="chartSex">
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
					</ul>
				</div>
			</div>
			<%@ include file="footer.jsp"%>

			<!-- Bootstrap core JavaScript-->
			<script src="admin/vendor/jquery/jquery.min.js"></script>
			<script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="admin/js/sb-admin-2.min.js"></script>

			<!-- Page level plugins -->
			<script src="admin/vendor/datatables/jquery.dataTables.min.js"></script>
			<script src="admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

			<!-- Page level custom scripts -->
			<script src="admin/js/demo/datatables-demo.js"></script>
</body>
</html>
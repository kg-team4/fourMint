<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>reportblacklist</title>

<!-- Custom fonts for this template -->
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

<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

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
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">신고목록</h1>
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">신고 목록</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="report_list.mdo">신고목록</a> <a
							class="dropdown-item" href="black_list.mdo">블랙리스트 목록</a>
					</div>
				</div>
				<!-- DataTales  -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">신고가 들어오면 블랙리스트
							처리</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>번호</th>
										<th>이유</th>
										<th>글</th>
										<th>게시글 번호</th>
										<th>신고한 사람</th>
										<th>신고 당한 사람</th>
										<th>신고날짜</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="report" items="${list}">
										<tr>
											<td>${report.report_seq }</td>
											<td>${report.reason }</td>
											<td>${report.content }</td>
											<td>${report.market_seq }</td>
											<td>${report.reporter}</td>
											<td>${report.reported}</td>
											<td><fmt:formatDate value="${report.date}"
													pattern="yyyy-MM-dd" /></td>
											<td>
												<form>
													<input type="hidden" value="${report.report_seq }"
														name="report_seq"> <input type="hidden"
														value="${report.reported }" name="nickname">
													<button type="button" onclick="alert('블랙리스트 등록되었습니다.')"
														class="btn btn-success" id="modify_btn">
														<i class="fas fa-edit"></i>
													</button>
													<button type="button" onclick="alert('삭제되었습니다.')"
														class="btn btn-danger" id="delete_btn">
														<i class="far fa-trash-alt"></i>
													</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
	</div>
	<!-- End of Main Content -->

	<script>
		$(".btn-success").click(function() {
			$(this).parent().attr("action", "blacklist_modify.mdo");
			$(this).parent().attr("method", "post");
			$(this).parent().submit();
		});

		$(".btn-danger").click(function() {
			$(this).parent().attr("action", "blacklist_delete.mdo");
			$(this).parent().attr("method", "post");
			$(this).parent().submit();
		});
	</script>


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
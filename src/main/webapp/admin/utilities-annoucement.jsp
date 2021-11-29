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

<title>공지사항</title>

<!-- Custom fonts for this template-->
<link href="admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="admin/css/sb-admin-2.css" rel="stylesheet">

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

				<%@include file="header.jsp"%>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
					<!-- DataTales  -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
						</div>
						<div class="card-body">

							<!-- 글쓰기 모달창 -->
							<button type='button' id="modal_btn"
								style="width: 90px; font-size: 15px; margin-left: 92%; color: black; background: #79d4c8; border-radius: 3px; border: none; font-weight: 700; height: 34.5px">글쓰기</button>
							<div class="black_bg"></div>

							<div class="modal_wrap">
								<div class="modal_close">
									<a href="#">close</a>
								</div>

								<div id="info"
									style="text-align: center; margin-top: 5px; font-size: 23px">
									<strong>공지사항 글쓰기</strong>
								</div>
								<hr>
								<div>

									<form action="announcement.mdo" method="post">
										<table style="margin-left: 20px; vertical-align: middle">
											<tr>
												<td height="42px" style="text-align: left; color: black"><strong>고정여부&emsp;</strong></td>
												<td><select id="static_status" name="static_status">
														<option value="1">고정</option>
														<option value="0">변동가능</option>
												</select></td>
											</tr>
											<tr>
												<td height="42px" style="text-align: left; color: black"><strong>제목&emsp;</strong></td>
												<td><input type="text" name="title"
													style="width: 350px;" required="required"></td>
											</tr>
											<tr>
												<td height="42px" style="text-align: left; color: black"><strong>내용&emsp;</strong></td>
												<td><textarea
														style="resize: none; width: 350px; height: 270px;"
														name="content" required="required"></textarea></td>
											</tr>
										</table>
										<br>
										<button type="submit" id="write_btn" class="write_btn"
											style="width: 90px; height: 30px; font-size: 15px; background: #79d4c8; border-radius: 3px; border: none; margin-left: 220px; margin-top: -25px; font-weight: 700">등록</button>
									</form>
								</div>
							</div>
							<!-- 글쓰기 모달창 -->

							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<!--  <input type="submit" class="btn btn-primary btn-user btn-block" value="제출하기"> -->

									<thead>
										<tr>
											<th>No</th>
											<th width="200px">제목</th>
											<th width="600px">내용</th>
											<th width="130px">작성일</th>
											<th>고정여부</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="notice" items="${list }">
											<tr>
												<td style="vertical-align: middle">${notice.notice_seq }</td>
												<td style="vertical-align: middle">${notice.notice_title }</td>
												<td style="vertical-align: middle">
													<div>${notice.notice_content}</div>
												</td>
												<td style="vertical-align: middle"><fmt:formatDate
														value="${notice.date}" pattern="yyyy-MM-dd" /></td>
												<td style="vertical-align: middle"><c:set
														value="${notice.status}" var="notice_status" /> <c:choose>
														<c:when test="${notice_status eq '0'}">
															<span style="color: gray">변경가능</span>
														</c:when>
														<c:when test="${notice_status eq '1'}">
															<span style="color: gray;"><strong>고정</strong></span>
														</c:when>
													</c:choose></td>
												<td style="text-align: center; vertical-align: middle">
													<form>
														<input type="hidden" value="${notice.notice_seq  }"
															name="notice_seq"> <input type="hidden"
															value="${notice.notice_title }" name="notice_title">
														<input type="hidden" value="${notice.notice_content}"
															name="notice_content">
														<div>
															<button type="button" class="btn_modify"
																style="width: 90px; height: 34.5px; font-size: 15px; background: #79d4c8; border-radius: 3px; border: none; margin-bottom: 4px; color: black;">수정</button>
														</div>
														<div>
															<button type="button" class="btn-danger"
																style="width: 90px; height: 34.5px; font-size: 15px; background: #c5c9c9; border-radius: 3px; border: none; color: black;">삭제</button>
														</div>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								+
								<!-- 수정 모달창 -->
								<div class="modal_cover">
									<div class="modal_shut">
										<a href="#">close</a>
									</div>
									<div>
										<div id="my_info_edit_title"
											style="font-weight: 700; font-size:23px; text-align:center;</div>">상품
											수정</div>
										<hr>
										<form action="update_announcement.mdo" method="post">
											<table
												style="margin-top: -10px; margin-left: 20px; vertical-align: middle">
												<tr>
													<td height="42px" style="text-align: left; color: black"><strong>고정여부&emsp;</strong></td>
													<td><select id="static_status" name="static_status">
															<option value="1">고정</option>
															<option value="0">변동가능</option>
													</select></td>
												</tr>

												<tr>
													<td height="42px" style="text-align: left; color: black"><strong>글
															번호&emsp;</strong></td>
													<td><input id="hi_seq" type="text" value="" name="seq"
														readonly></td>
												</tr>
												<tr>
													<td height="42px" style="text-align: left; color: black"><strong>제목&emsp;</strong></td>
													<td><input id="hi_title" type="text" name="title"
														required="required"></td>
												</tr>
												<tr>
													<td height="42px" style="text-align: left; color: black"><strong>내용&emsp;</strong></td>
													<td><textarea id="hi_content" name="content"
															style="resize: none; width: 350px; height: 270px;"
															name="content" required="required"></textarea></td>
												</tr>
											</table>
											<div style="margin: auto">
												<button type="submit"
													style="width: 90px; font-size: 15px; background: #79d4c8; margin-left: 220px; margin-bottom: 30px; border-radius: 3px; border: none; color: black;">수정</button>
											</div>
										</form>
									</div>
								</div>
								<!-- 수정 모달창 -->

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
	</div>
	<!-- End of Main Content -->

	<script>
		$(".btn-danger").click(function() {
			if (!confirm('삭제하시겠습니까?')) {
				return false;
			}
			$(this).parent().attr("action", "announce_delete.mdo");
			$(this).parent().attr("method", "post");
			$(this).parent().submit();
		});
	</script>

	<script>
		window.onload = function() {

			/* 글쓰기 js */
			function onClick() {
				document.querySelector('.modal_wrap').style.display = 'block';
				document.querySelector('.black_bg').style.display = 'block';
			}
			function offClick() {
				document.querySelector('.modal_wrap').style.display = 'none';
				document.querySelector('.black_bg').style.display = 'none';
			}

			document.getElementById('modal_btn').addEventListener('click',
					onClick);
			document.querySelector('.modal_close').addEventListener('click',
					offClick);
			/* 글쓰기 js */

			/* 수정 js */
			$(".btn_modify").click(function onClick2() {
				$("#hi_seq").val($(this).parent().prev().prev().prev().val());
				$("#hi_title").val($(this).parent().prev().prev().val());
				$("#hi_content").val($(this).parent().prev().val());

				document.querySelector('.modal_cover').style.display = 'block';
				document.querySelector('.black_bg').style.display = 'block';
			});
			function offClick2() {
				document.querySelector('.modal_cover').style.display = 'none';
				document.querySelector('.black_bg').style.display = 'none';
			}

			document.querySelector('.modal_shut').addEventListener('click',
					offClick2);
			/* 수정 js */

		};
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
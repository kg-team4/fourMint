<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>store-status</title>

<!-- Custom fonts for this template -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
					<h1 class="h3 mb-2 text-gray-800">상품 배송 관리</h1>
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton" class="list_status" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">카테고리</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="javascript:goPost('전체 목록')">전체 목록</a>
							<a class="dropdown-item" href="javascript:goPost('상품 준비 중')">상품 준비 중</a>
							<a class="dropdown-item" href="javascript:goPost('상품 배송 중')">상품 배송 중</a>
							<a class="dropdown-item" href="javascript:goPost('상품 배송 완료')">상품 배송 완료</a>
						</div>
					</div>
					<!-- DataTales  -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">스토어 상품 글</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered list_table" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>상품명</th>
											<th>주문자</th>
											<th>총액</th>
											<th>주문일시</th>
											<th>배송현황</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${status }" varStatus="status">
											<tr>
												<td>${list.product_name }</td>
												<td>${list.email_id }</td>
												<td>${list.transaction_price }</td>
												<td><fmt:formatDate value="${list.date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
												<td>${list.status }</td>
												<td>
													<button type="button" id="detail_list" class="detail_list" style="width: 90px; font-size: 15px; background: #79d4c8; border-radius: 3px; border:none; margin-bottom:4px; height:34.5px">상세정보</button>
													<input type="hidden" value="${list.transaction_count }">	
													<input type="hidden" value="${list.product_price }">
													<input type="hidden" value="${list.request }">
													<input type="hidden" value="${list.address2 }">
													<input type="hidden" value="${list.transaction_seq }">
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
			<!-- End of Main Content -->
			<!-- 상세 보기 모달 -->
			<div id="detail_view" style="background: white; display:none">
				<div>
					<div id="info" style="text-align: center; margin-top:5px; font-size:23px">
						<strong>상세 정보</strong>
					</div>
					<hr>
					<div>
						<form action="updateStatus.mdo" method="post">
								<table id="detail_table">
								<!-- 이미지 x -->
								<!-- <tr>
									<td colspan="2">
										<p style="display: flex;">
											<img id="detail_img" style="margin: auto;">
										</p>
									</td>
								</tr> -->
								<tr>
									<td width="200px" height="30px" style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>상품명</strong></td>
									<td width="350px">
										<input type="text" id="detail_product_name" readonly style="border: 0px; width:300px">
									</td>
								</tr>
								<tr>
									<td height="42px" style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>주문자ID</strong></td>
									<td><input type="text" id="detail_email_id" readonly style="border: 0px;"></td>
								</tr>
								<tr>
									<td height="42px" style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>주소</strong></td>
									<td><input type="text" id="detail_address" readonly style="border: 0px;"></td>
								</tr>
								<tr>
									<td height="42px"style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>가격</strong></td>
									<td><input type="text" id="detail_product_price" readonly style="border: 0px;"></td>
								</tr>
								<tr>
									<td height="42px" style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>수량</strong></td>
									<td><input type="text" id="detail_transaction_count" readonly style="border: 0px;"></td>
								</tr>
								<tr>
									<td height="42px" style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>총액</strong></td>
									<td><input type="text" id="detail_transaction_price" readonly style="border: 0px;"></td>
								</tr>
								<tr>
									<td height="42px" style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>주문일시</strong></td>
									<td><input type="text" id="detail_date" readonly style="border: 0px;"></td>
								</tr>
								<tr>
									<td height="42px" style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>요청사항</strong></td>
									<td><textarea id="detail_request" readonly style="border: 0px; resize: none; width:300px; height:42px; margin-top:13px"></textarea></td>
								</tr>
								<tr>
									<td height="60px" style="text-align:left; color:black">&emsp;&emsp;&emsp;&emsp;&emsp;<strong>배송상태</strong></td>
									<td>
										<select id="detail_status" name="status" class="used_cate_style">
											<c:forEach var="strList" items="${strList }">
												<option value="${strList }">${strList }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
							<br>
							<div style="text-align: center;">
									<input type="hidden" id="form_seq" name="transaction_seq">
									<button type="submit" id="edit_btn" class="edit_btn" style="width: 90px; height:30px; font-size: 15px; background: #79d4c8; border-radius: 3px; border:none; margin-bottom:25px; margin-top:-25px;  font-weight: 700">변경</button>
								<button class="modal_cancel_btn" style="width: 90px; height:30px; font-size: 15px; background: #c5c9c9; border-radius: 3px; border:none; margin-bottom:25px; margin-top:-25px;  font-weight: 700" onclick="return false;">취소</button>
							</div>
						</form>
					</div>
				</div>
				<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
			</div>
			<%@ include file="footer.jsp"%>

			<!-- Bootstrap core JavaScript-->
			<script type="text/javascript" src="admin/js/storeTransactionStatusPage.js"></script>
			<script>
				$(".detail_list").click(function() {
					$("#detail_product_name").val($(this).parent().prev().prev().prev().prev().prev().text());
					$("#detail_email_id").val($(this).parent().prev().prev().prev().prev().text());
					$("#detail_address").val($(this).next().next().next().next().val());
					$("#detail_product_price").val($(this).next().next().val());
					$("#detail_transaction_count").val($(this).next().val());
					$("#detail_transaction_price").val($(this).parent().prev().prev().prev().text());
					$("#detail_date").val($(this).parent().prev().prev().text());
					$("#detail_request").val($(this).next().next().next().val());
					$("#detail_status").val($(this).parent().prev().text());
					$("#form_seq").val($(this).next().next().next().next().next().val());
					
					modal('detail_view');
				});
				
				$(".edit_btn").click(function() {
					var check = confirm("변경 하시겠습니까?");
					if (check) {
						document.getElementById("edit_btn").submit();
					} else {
						return false;
					}
				});
				
				function goPost(status){
				    let f = document.createElement('form');

				    let obj;
				    obj = document.createElement('input');
				    obj.setAttribute('type', 'hidden');
				    obj.setAttribute('name', 'status');
				    obj.setAttribute('value', status);
				    
				    f.appendChild(obj);
				    f.setAttribute('method', 'get');
				    f.setAttribute('action', 'storestatus.mdo');
				    document.body.appendChild(f);
				    f.submit();
				}

			</script>
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
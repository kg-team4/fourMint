<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>mechandise</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- Custom fonts for this template -->
<link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="admin/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<!-- <link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->

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
					<h1 class="h3 mb-2 text-gray-800">스토어 상품 글 관리</h1>
					<!-- DataTales  -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">스토어 상품 글</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								
								<div id="add_product">
									<div>
										<div id="my_info_edit_title" style="color:black; font-weight: 700">상품 추가</div>
										<hr>
										<div style="width:700px; height:530px">
											<form action="insertStore.mdo" method="post" enctype="multipart/form-data">
												<table id="table table-bordered my_info_add_area">
													<tr>
														<td width="100px" height="42px" style="font-weight: 600; color:black">카테고리 &emsp;</td>
														<td width="600px">
															<select id="cate_sel" class="used_cate_style" name="category_big">
																<option value="">카테고리 선택</option>
																<c:forEach var="big" items="${ storeCategoryBig }">
																	<option value="${big.name }">${big.name }</option>
																</c:forEach>
															</select>
														</td>
													</tr>
													<tr>
														<td height="42px" style="font-weight: 600; color:black">상품명 &emsp;</td>
														<td><input type="text" name="product_name"></td>
													</tr>
													<tr>
														<td height="140px" style="font-weight: 600; color:black">상품이미지</td>
														<td>
															<div class="used_photo">
																<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																	<img class="preview-wrap1" alt="등록할 상품 사진을 넣어주세요." style="margin:0; width:150px; height:120px; border:1px solid lightgray; margin-right:5px;"
																	onerror="this.style.display='none'">
																</div>
																<div>
																	<input id="banner_file" class="form-input1" type="file" name="file1" multiple accept=".jpg, .png, .gif"  required="required">
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td height="42px" style="font-weight: 600; color:black">가격</td>
														<td><input type="text" name="product_price"></td>
													</tr>
													<tr>
														<td height="230px" style="font-weight: 600; color:black">내용</td>
														<td>
															<div class="used_photo">
																<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
																	<img style="margin:0px; width:150px; height:200px; border:1px solid lightgray; margin-right:5px;" class="preview-wrap2" alt="등록할 상품 사진을 넣어주세요." onerror="this.style.display='none'">
																</div>
																<div>
																	<input id="banner_file" class="form-input2" type="file" name="file2" multiple accept=".jpg, .png, .gif" required="required" >
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td height="42px" style="font-weight: 600; color:black">재고</td>
														<td><input type="text" name="product_stock"></td>
													</tr>
												</table>
												<br>
												<div style="text-align: center; margin-top: 5px; margin-left:180px; width:200px">
													<button class="modal_info_edit_btn"
														style="width: 90px; font-size: 15px; background: #79d4c8; border-radius: 3px; border:none;">추가</button>
													<button class="modal_cancel_btn"
														style="width: 90px; font-size: 15px; background: #c5c9c9; border-radius: 3px; border:none;" onclick="return false;">취소</button>
												</div>
											</form>
										</div>
									</div>
									<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
								</div>
								
								
								<button type="button" class="btn btn--blue-2 btn--radius-2 btn_modify_profile" id="popup_open_btn_add" style="width:90px; font-size: 15px; margin-left:92%; color:black; background: #79d4c8; border-radius: 3px; border:none; font-weight: 700" >
									상품추가
								</button>
								
								<table class="table table-bordered list_table" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>No</th>
											<th>상품이미지</th>
											<th>카테고리</th>
											<th>상품명</th>
											<th>가격</th>
											<th>재고</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="store_List" items="${storeList }" varStatus="status">
											<tr>
												<td><input type="hidden" class="hidden_content" value="${store_List.product_content }">${fn:length(storeList) - status.index }</td >
												<td style="text-align:center; width:130px;"><img src="${store_List.url }" style="width:90px; height:90px; margin-right:20px"></td>
												<td>${store_List.category_big }</td>
												<td>${store_List.product_name }</td>
												<td>${store_List.product_price }</td>
												<td>${store_List.product_stock }<input type="hidden" name="store_seq" id="store_seq" value="${store_List.store_seq }"></td>
												<td style="width:130px; vertical-align: middle; text-align: center">
													<button type="button" style="width: 90px; font-size: 15px; background: #79d4c8; border-radius: 3px; border:none; margin-bottom:4px; color:black;"
														class="btn btn--blue-2 btn--radius-2 btn_modify_profile popup_open_btn_edit" id="popup_open_btn_edit">
														변경
													</button>
													<form action="deleteStore.mdo" method="post">
														<input type="hidden" name="store_seq" id="store_seq" value="${store_List.store_seq }">
														<button type="submit" style="width: 90px; font-size: 15px; background: #c5c9c9; border-radius: 3px; border:none; color:black;"
															class="btn btn--blue-2 btn--radius-2 btn_modify_profile delete_store" id="delete_store">
															삭제
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
			<form action="updateStore.mdo" method="post" enctype="multipart/form-data">
				
				<div id="edit_product">
					<div>
						<div id="my_info_edit_title" style="color:black; font-weight: 700; font-size:23px">상품 수정</div>
						<hr>
						<div style="width:700px; height:530px">
							<table id="my_info_edit_area">
								<tr>
									<td width="100px" height="42px" style="font-weight: 600; color:black; font-size:16px">카테고리<input type="hidden" name="store_seq" id="edit_seq"></td>
									<td width="600px">
										<select id="edit_category" class="used_cate_style" name="category_big">
											<option value="">카테고리 선택</option>
											<c:forEach var="big" items="${ storeCategoryBig }">
												<option value="${big.name }">${big.name }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td height="42px" style="font-weight: 600; color:black; font-size:16px">상품명</td>
									<td><input type="text" name="product_name" id="edit_name"></td>
								</tr>
								<tr>
									<td height="140px" style="font-weight: 600; color:black; font-size:16px">상품이미지</td>
									<td>
										<div class="used_photo">
											<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
												<img  style="margin:0; width:150px; height:120px; border:1px solid lightgray; margin-right:5px;" class="preview-wrap1" alt="등록할 상품 사진을 넣어주세요." name="product_url"
												onerror="this.style.display='none'" id="edit_url" >
											</div>
											<div>
												<input id="banner_file" class="form-input1" type="file" name="file1" multiple accept=".jpg, .png, .gif" required="required">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td height="42px" style="font-weight: 600; color:black; font-size:16px">가격</td>
									<td><input type="text" name="product_price" id="edit_price"></td>
								</tr>
								<tr>
									<td height="230px" style="font-weight: 600; color:black; font-size:16px">내용</td>
									<td>
										<div class="used_photo">
											<div class="used_photo_img"><!--  class="btn btn-primary btn-circle" -->
												<img class="preview-wrap2" alt="등록할 상품 사진을 넣어주세요." name="product_content" style="margin:0px; width:150px; height:200px; border:1px solid lightgray; margin-right:5px;"
												onerror="this.style.display='none'" id="edit_content">
											</div>
											<div>
												<input id="banner_file" class="form-input2" type="file" name="file2" multiple accept=".jpg, .png, .gif" required="required">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td height="42px" style="font-weight: 600; color:black; font-size:16px">재고</td>
									<td><input type="text" name="product_stock" id="edit_stock"></td>
								</tr>
							</table>
							<br>
							<div style="text-align: center; margin-top: 5px; margin-left:180px; width:200px">
								<button class="modal_info_edit_btn" style="width: 90px; font-size: 15px; background: #79d4c8; border-radius: 3px; border:none;">수정</button>
								<button class="modal_cancel_btn" style="width: 90px; font-size: 15px; background: #c5c9c9; border-radius: 3px; border:none;" onclick="return false;">취소</button>
							</div>
						</div>
					</div>
					<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
				</div>
			</form>
			<!-- End of Main Content -->

			<%@ include file="footer.jsp"%>

			<!-- Bootstrap core JavaScript-->
			<script>
				$(".popup_open_btn_edit").click(function() {
					$("#edit_stock").val($(this).parent().prev().text());
					$("#edit_seq").val($(this).parent().prev().children("#store_seq").val());
					$("#edit_price").val($(this).parent().prev().prev().text());
					$("#edit_name").val($(this).parent().prev().prev().prev().text());
					$("#edit_url").attr("src", ($(this).parent().prev().prev().prev().prev().prev().children().attr("src")));
					$("#edit_content").attr("src", $(this).parent().prev().prev().prev().prev().prev().prev().children('.hidden_content').val());
					$("#edit_category").val($(this).parent().prev().prev().prev().prev().text()).attr("selected", "selected");
					
					modal('edit_product');
				});
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
			<script type="text/javascript" src="admin/js/utilities-boardmanage.js"></script>
			<script>
				$(function() {
					$(".form-input1").on('change', function() {
						readURL1(this);
					});
					$(".form-input2").on('change', function() {
						readURL2(this);
					});
				});
				
				function readURL1(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
				
						reader.onload = function(e) {
							$('.preview-wrap1').attr('src', e.target.result);
						}
				
						reader.readAsDataURL(input.files[0]);
					}
					$('.preview-wrap').show();
				}

				function readURL2(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
				
						reader.onload = function(e) {
							$('.preview-wrap2').attr('src', e.target.result);
						}
			
						reader.readAsDataURL(input.files[0]);
					}
					$('.preview-wrap').show();
				}
				
				$(".delete_store").click(function() {
					var check = confirm("삭제 하시겠습니까?");
					if (check) {
						document.getElementById("delete_store").submit();
						console.log(document.getElementById("delete_store"));
					} else {
						return false;
					}
				});
				
			</script>
</body>

</html>
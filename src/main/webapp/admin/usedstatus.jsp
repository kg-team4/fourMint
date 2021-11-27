<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>usedstatus</title>

    <!-- Custom fonts for this template -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <%@ include file="sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               <%@include file="header.jsp" %>
               
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">중고거래 현황 조회 페이지</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="home.mdo">민트마켓 중고거래 현황 조회 </a>.</p>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">중고거래 현황 조회 입니다.</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>분류</th>
                                            <th>상품명</th>
                                            <th>판매자</th>
                                            <th>구매자</th>
                                            <th>거래날짜</th>
                                            <th>비고</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="list" items="${list }" varStatus="status">
	                                        <tr>
	                                            <td>${list.category_big }</td>
	                                            <td>${list.product_name }</td>
	                                            <td>${list.nickname }</td>
	                                            <td>${list.buyer }</td>
	                                            <td>${list.sell_date }</td>
	                                            <td>
	                                            	<button class="modal_info" style="width: 90px; font-size: 15px">상세정보</button>
	                                            	<input type="hidden" value="${list.product_price }">
	                                            	<input type="hidden" value="${list.url }">
	                                            	<input type="hidden" value="${list.date }">
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
			<div id="market_view" style="background: white; display:none">
				<div>
					<div id="info"><input type="text" readonly style="border: none; width:80px;">상세 정보</div>
					<hr>
					<div>
						<table id="my_info_edit_area">
							<tr>
								<td colspan="2">
									<p style="display: flex;">
										<img id="detail_url" style="margin: auto;">
									</p>
									<p style="text-align: center;">
										<input type="text" readonly id="detail_porduct_name" style="text-align: center; border: 0px">
									</p>
								</td>
							</tr>
							<tr>
								<td width="200px" height="30px">분류<input type="hidden"></td>
								<td width="350px">
									<input type="text" id="detail_category_big">
								</td>
							</tr>
							<tr>
								<td height="30px">가격</td>
								<td><input type="text" readonly id="detail_price"></td>
							</tr>
							<tr>
								<td height="30px">판매자</td>
								<td><input type="text" readonly id="detail_nickname"></td>
							</tr>
							<tr>
							<tr>
								<td height="30px">등록날짜</td>
								<td><input type="text" readonly id="detail_date"></td>
							</tr>
							<tr>
								<td height="30px">구매자</td>
								<td><input type="text" readonly id="detail_buyer"></td>
							</tr>
							<tr>
								<td height="30px">거래날짜</td>
								<td><input type="text" readonly id="detail_sell_date"></td>
							</tr>
						</table>
						<br>
						<div style="text-align: center; margin-top: 10px">
							<button class="modal_cancel_btn" style="width: 90px; font-size: 15px" onclick="return false;">확인</button>
						</div>
					</div>
				</div>
				<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
			</div>
      <%@ include file="footer.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <script type="text/javascript" src="admin/js/marketTransactionStatusPage.js"></script>
    <script>
	    $(".modal_info").click(function() {
	    	
	    	$("#detail_url").attr("src", $(this).next().next().val());
			$("#detail_porduct_name").val($(this).parent().prev().prev().prev().prev().text());
			$("#detail_category_big").val($(this).parent().prev().prev().prev().prev().prev().text());
			$("#detail_price").val($(this).next().val());
			$("#detail_nickname").val($(this).parent().prev().prev().prev().text());
			$("#detail_date").val($(this).next().next().next().val());
			$("#detail_buyer").val($(this).parent().prev().prev().text());
			$("#detail_sell_date").val($(this).parent().prev().text());
			
			modal('market_view');
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

</body>

</html>
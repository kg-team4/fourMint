<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>tables-purchasehistory</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <%@ include file="sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
			<%@ include file="header.jsp" %>
              
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="display: inline-flex;align-items: center;justify-content: space-between;">
                            <h5 class="m-0 font-weight-bold text-primary text-gray-800">거래 내역 목록</h5>
                            <form action="excel_purchasehistory.mdo" method="get">
								<button style="width: 90px; font-size: 15px; color: black; background: #c5c9c9; border-radius: 3px; border: none; font-weight: 600; height: 34.5px">엑셀파일</button>	
                    		</form>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>주문번호</th>
                                            <th>주문자ID</th>
                                            <th>주문상품명</th>
                                            <th>주문총액</th>
                                            <th>주문날짜</th>
                                            <th>요청사항</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>
                                        <c:forEach var="transactionhistory" items="${list }">
	                                        <tr>
	                                      		<td style="vertical-align: middle" style="width:120px">${transactionhistory.merchant_uid}</td>
	                                            <td style="vertical-align: middle">${transactionhistory.email_id }</td>
	                                            <td style="vertical-align: middle">${transactionhistory.product_name }</td>	                                            
	                                            <td style="vertical-align: middle">${transactionhistory.transaction_price }</td>
	                                            <td style="vertical-align: middle" style="width:100px"><fmt:formatDate value="${transactionhistory.date}" pattern="yyyy-MM-dd" /></td>	                                            
	                                            <td style="vertical-align: middle">${transactionhistory.request}</td>	                                           	                       
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
	</div>
       <%@ include file="footer.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/demo/datatables-demo.js"></script>

</body>

</html>
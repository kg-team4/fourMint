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

    <title>tables-used</title>

    <!-- Custom fonts for this template -->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
     <!-- 제이쿼리 -->
 	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

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
                    <h1 class="h3 mb-2 text-gray-800">중고 물품목록</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="home.mdo">민트마켓 중고거래 물품목록</a>.</p>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">중고거래 물품 목록입니다.</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>대분류</th>
                                            <th>중분류</th>
                                            <th>상품명</th>
                                            <th>판매자</th>
                                            <th>상품가격</th> 
                                            <th>등록날짜</th>                                           
                                            <th>판매완료날짜</th>                                                                        
                                        </tr>
                                    </thead>                                 
                                    <tbody>
	                                    <c:forEach var="marketboard" items="${list }">
		                                        <tr>
		                                            <td style="width:55px">${marketboard.market_seq }</td>
		                                            <td style="width:100px">${marketboard.category_big }</td>
		                                            <td style="width:100px">${marketboard.category_middle }</td>	                                            
		                                            <td style="width:180px">${marketboard.product_name }</td>
		                                            <td style="width:120px">${marketboard.nickname }</td>
		                                            <td style="width:110px">${marketboard.product_price }</td>	
		                                            <td style="width:120px"><fmt:formatDate value="${marketboard.date }" pattern="yyyy-MM-dd"/></td>
		                                            <td style="width:120px"><fmt:formatDate value="${marketboard.sell_date }" pattern="yyyy-MM-dd"/></td>	                                            
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
            
       <script>           
       $(".btn-danger").click(function(){
    	   $(this).parent().attr("action", "used_delete.mdo");
    	   $(this).parent().attr("method", "post");
    	   $(this).parent().submit();  
       });
      </script>

      <%@ include file="footer.jsp" %>

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
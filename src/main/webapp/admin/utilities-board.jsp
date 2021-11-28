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

    <title>중고거래 글 관리</title>

    <!-- Custom fonts for this template-->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="admin/css/sb-admin-2.css" rel="stylesheet">

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
                    <h1 class="h3 mb-2 text-gray-800">중고거래 글 관리</h1>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">중고거래 글 </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>대분류</th>     
                                            <th>상품명</th>                                                                                    
                                            <th>상품가격</th>
                                            <th>상품설명</th>
                                            <th>등록일</th>
                                            <th>별명</th>
                                            <th>구매자</th>
                                            <th>판매날짜</th>
                                           <!--  <th scope="col">Actions</th>  -->
                                        </tr>
                                    </thead>                                 
                                    <tbody>
                                         <c:forEach var="marketboard" items="${list }">
		                                        <tr>
		                                            <td>${marketboard.market_seq }</td>
		                                            <td>${marketboard.category_big }</td>
		                                            <td>${marketboard.product_name }</td>	                                            
		                                            <td>${marketboard.product_price }</td>
		                                            <td>${marketboard.product_content }</td>
		                                            <td><fmt:formatDate value="${marketboard.date}" pattern="yyyy-MM-dd"/> </td>
		                                            <td>${marketboard.nickname }</td>	
		                                            <td>${marketboard.buyer }</td>	
		                                            <td><fmt:formatDate value="${marketboard.sell_date}" pattern="yyyy-MM-dd"/> </td>			
		                                            <td>		                                            
		                                        	<%-- <form>		                                        		
	                                           			<input type="hidden" value="${marketboard.market_seq }" name="market_seq">		                                                                           
		                                        		<button type="button" onclick="alert('삭제되었습니다.')" class="btn btn-danger" id= "delete_btn"><i class="far fa-trash-alt"></i></button>	
	                                        		</form>	 --%>
		                                       		</td>	                                            
	                                        	</tr>
	                                    </c:forEach>                                                                                                                       
                                  </tbody>                                                                                                                                                                                                                                                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
               </div>
                <!-- /.container-fluid -->
				</div>
            </div>
            <!-- End of Main Content -->
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
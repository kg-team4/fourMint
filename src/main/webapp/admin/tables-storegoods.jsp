<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>tables-storegoods</title>

    <!-- Custom fonts for this template -->
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

              <%@ include file="header.jsp" %>
              
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">스토어 물품</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="home.mdo">민트마켓 스토어 리스트 물품</a>.</p>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">민트마켓 리스트</h6>
                        </div>
                        <form action="excel_storeGoods.mdo" method="get">
                    		<button>액셀</button>
                    	</form>
                        <div class="card-body">
                        <form action="storeSell.do" method="POST" ebctype="multipart/form-data" onsubmint="return checkForm();">
                        	<div class="form-group">
                        	<div align="right" class="form-input">                       
                   			<input type="button" class="btn btn-default" a href="storeSell.do">스토어 판매</div>
                   			</div>
                   		</form>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>대분류</th>
                                            <th>상품명</th>   
                                            <th>상품가격</th>  
                                            <th scope="col">Actions</th>                                        
                                        </tr>
                                    </thead>                                   
                                    <tbody>
                                    	 <c:forEach var="storeboard" items="${list }">
		                                        <tr>
		                                            <td>${storeboard.store_seq}</td>
		                                            <td>${storeboard.category_big }</td>
		                                            <td>${storeboard.product_name }</td>	                                            
		                                            <td>${storeboard.product_price }</td>
		                                            <td>
		                                            <button type="button" onclick="alert('등록되었습니다.')" class="btn btn-success"><i class="fas fa-edit"></i></button>
		                                        	<button type="button" onclick="alert('삭제되었습니다.')" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>	
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
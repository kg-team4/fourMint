<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>반품/교환 페이지</title>

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

               <%@ include file="header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                 <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">반품/교환 페이지</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="https://datatables.net">반품/교환 페이지</a>.</p>
                     <div class="dropdown">
                     	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     	분류
                     	</button>
                     	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                     		<a class="dropdown-item" href="etc.mdo">기타</a>
                     		<a class="dropdown-item" href="exchange.mdo">반품/교환</a>
                     		<a class="dropdown-item" href="cancel.mdo">취소/환불</a>
                     		<a class="dropdown-item" href="delivery.mdo">배송</a>
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo">전체</a>
                     	</div>
                     </div>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">FAQ </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>분류</th>
                                            <th>제목</th>                                              
                                            <th>내용</th>
                                            <th scope="col">Actions</th>                                                                                                                             
                                        </tr>
                                    </thead>                                  
                                    <tbody>
                                    <c:forEach var="faq" items="${list }">
	                                        <tr>	                                        		                                        		                                        		
	                                            <td>${faq.number }</td>
	                                            <td>${faq.category }</td>
	                                            <td>${faq.title}</td>	
	                                            <td>                                          
		                                            <div class="dropdown">
		                 							<btn type="button" class="btn btn-secondary dropdown-toggle" id="dropdownButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                         										                                            	 
	                                            	</btn>
	                                            	<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">${faq.text}	
	                                            	</ul>
	                                            	</div>
	                                            </td> 
	                                            <td>
		                                            <button type="button" class="btn btn-success"><i class="fas fa-edit"></i></button>
		                                        	<button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>	
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
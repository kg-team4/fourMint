<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>증고거래 관련 공지 글 관리</title>

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
                    <h1 class="h3 mb-2 text-gray-800">증고거래 관련 공지 글 관리</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="https://datatables.net">민트마켓 중고거래 공지 글</a>.</p>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">중고거래 공지 글 </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>카테고리 대분류</th>
                                            <th>카테고리 중분류</th>
                                            <th>카테고리 소분류</th>
                                            <th>가격</th>
                                            
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>kimjh</td>
                                            <td>김주면</td>
                                            <td>2021/11/09</td>
                                            <td>거짓가격</td>
                                           
                                        <tr>
                                            <td>2</td>
                                            <td>leejb</td>
                                            <td>jb</td>
                                            <td>2021/11/09</td>
                                            <td>사기죄</td>
                                           
                                        </tr>
                                        <tr>
                                           <td>3</td>
                                            <td>kimjh</td>
                                            <td>김주면</td>
                                            <td>2021/11/09</td>
                                            <td>거짓가격</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>kimjh</td>
                                            <td>김주면</td>
                                            <td>2021/11/09</td>
                                            <td>거짓가격</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>leejb</td>
                                            <td>jb</td>
                                            <td>2021/11/09</td>
                                            <td>사기죄</td>
                                        </tr>
                                        <tr>
                                           <td>6</td>
                                            <td>kangkang</td>
                                            <td>kang</td>
                                            <td>2021/11/09</td>
                                            <td>사기죄</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>kangkang</td>
                                            <td>kang</td>
                                            <td>2021/11/09</td>
                                            <td>사기죄</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td>kangkang</td>
                                            <td>kang</td>
                                            <td>2021/11/09</td>
                                            <td>사기죄</td>
                                        </tr>
                                        <tr>
                                           <td>9</td>
                                            <td>chaechae</td>
                                            <td>rin</td>
                                            <td>2021/11/09</td>
                                            <td>웃는죄</td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td>sm</td>
                                            <td>sm</td>
                                            <td>2021/11/09</td>
                                            <td>할 수 없는 죄</td>
                                        </tr>                                                                                                                                                                                                                               
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
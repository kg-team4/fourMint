<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>store-status</title>

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

               <%@include file="header.jsp" %>
               
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">거래 현황 조회 페이지</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="https://datatables.net">민트마켓 거래 현황 조회</a>.</p>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">거래 현황 조회 입니다.</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>상품명</th>
                                            <th>판매자</th>
                                            <th>등록일</th>
                                            <th>가격</th>
                                            <th>판매날짜</th>
                                            <th>거래장소</th>
                                            <th>구매자</th>
                                        </tr>
                                    </thead>
                                  
                                    <tbody>
                                        <tr>
                                            <td>갤럭시워치</td>
                                            <td>이정빈</td>
                                            <td>2021/11/09</td>
                                            <td>61,000</td>
                                            <td>2021/11/10</td>
                                            <td>부천</td>
                                            <td>강성진</td>
                                        </tr>
                                        <tr>
                                           	<td>스타벅스 쿠폰</td>
                                            <td>김주호</td>
                                            <td>2021/10/05</td>
                                            <td>5,000</td>
                                            <td>2021/11/10</td>
                                            <td>영등포</td>
                                            <td>이승재</td>
                                        </tr>
                                        <tr>
                                            <td>패딩조끼</td>
                                            <td>박동녘</td>
                                            <td>2021/11/11</td>
                                            <td>100,000</td>
                                            <td>2021/11/20</td>
                                            <td>일산</td>
                                            <td>장형준</td>
                                        </tr>
                                        <tr>
                                            <td>나이키신발</td>
                                            <td>백미라</td>
                                            <td>2021/12/01</td>
                                            <td>70,000</td>
                                            <td>2021/12/10</td>
                                            <td>한남동</td>
                                            <td>이채린</td>
                                        </tr>
                                        <tr>
                                            <td>선풍기</td>
                                            <td>김유리</td>
                                            <td>2021/12/02</td>
                                            <td>50,000</td>
                                            <td>2021/12/03</td>
                                            <td>방이동</td>
                                            <td>이승민</td>
                                        </tr>
                                        <tr>
                                            <td>키보드</td>
                                            <td>나일성</td>
                                            <td>2021/12/03</td>
                                            <td>250,000</td>
                                            <td>2021/12/10</td>
                                            <td>혜화동</td>
                                            <td>김규리</td>
                                        </tr>
                                        <tr>
                                            <td>자바의정석 책</td>
                                            <td>김도은</td>
                                            <td>2021/12/04</td>
                                            <td>10,000</td>
                                            <td>2021/12/04</td>
                                            <td>인천</td>
                                            <td>김병관</td>
                                        </tr>
                                        <tr>
                                            <td>에어팟</td>
                                            <td>백미라</td>
                                            <td>2021/12/05</td>
                                            <td>150,000</td>
                                            <td>잠실동</td>
                                            <td>임승범</td>
                                        </tr>
                                        <tr>
                                            <td>Colleen Hurst</td>
                                            <td>Javascript Developer</td>
                                            <td>San Francisco</td>
                                            <td>39</td>
                                            <td>2009/09/15</td>
                                            <td>$205,500</td>
                                        </tr>
                                        <tr>
                                            <td>Sonya Frost</td>
                                            <td>Software Engineer</td>
                                            <td>Edinburgh</td>
                                            <td>23</td>
                                            <td>2008/12/13</td>
                                            <td>$103,600</td>
                                        </tr>
                                        <tr>
                                            <td>Jena Gaines</td>
                                            <td>Office Manager</td>
                                            <td>London</td>
                                            <td>30</td>
                                            <td>2008/12/19</td>
                                            <td>$90,560</td>
                                        </tr>
                                        <tr>
                                            <td>Quinn Flynn</td>
                                            <td>Support Lead</td>
                                            <td>Edinburgh</td>
                                            <td>22</td>
                                            <td>2013/03/03</td>
                                            <td>$342,000</td>
                                        </tr>
                                        <tr>
                                            <td>Charde Marshall</td>
                                            <td>Regional Director</td>
                                            <td>San Francisco</td>
                                            <td>36</td>
                                            <td>2008/10/16</td>
                                            <td>$470,600</td>
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
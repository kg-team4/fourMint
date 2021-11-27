<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Tables-member</title>

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
                    <h1 class="h3 mb-2 text-gray-800">회원목록</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="home.mdo">민트마켓 회원목록</a>.</p>
                            <div class="dropdown">
                     	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     	카테고리
                     	</button>
                     	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                     		<a class="dropdown-item" href="membergender.mdo">성별</a>
                     		<a class="dropdown-item" href="memberbirth.mdo">년도</a>
                     		<a class="dropdown-item" href="memberaddress.mdo">주소</a>          
                     		<a class="dropdown-item" href="tables-member.mdo">회원목록</a>
                     	</div>
                     </div>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">민트마켓 회원</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이메일아이디</th>
                                            <th>이름</th>
                                            <th>별명</th>
                                            <th>주소1</th>
                                            <th>주소2</th>
                                            <th>주소3</th>
                                            <th>휴대폰 번호</th>
                                            <th>생년월일</th>
                                            <th>성별</th>
                                            <th>가입날짜</th>
                                        </tr>
                                    </thead>                                  
                                    <tbody>
                                    	<c:forEach var="member" items="${list }">
	                                        <tr>
	                                            <td>${member.email_id }</td>
	                                            <td>${member.name }</td>
	                                            <td>${member.nickname }</td>	                                            
	                                            <td>${member.address1 }</td>
	                                            <td>${member.address2 }</td>
	                                            <td>${member.address3 }</td>
	                                            <td>${member.phone}</td>
	                                            <td>${member.birth }</td>
	                                            <td>${member.gender}</td>
	                                            <td><fmt:formatDate value="${member.date}" pattern="yyyy-MM-dd"/></td>	                       
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
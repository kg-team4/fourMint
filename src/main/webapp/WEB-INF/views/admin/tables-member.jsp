<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Tables-member</title>

<!-- Custom fonts for this template -->
<link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

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
                   
                       <!-- <div class="dropdown">
                     	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     	카테고리
                     	</button>
	                     	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                     		<a class="dropdown-item" href="membergender.mdo">성별</a>
	                     		<a class="dropdown-item" href="memberbirth.mdo">년도</a>
	                     		<a class="dropdown-item" href="memberaddress.mdo">주소</a>          
	                     		<a class="dropdown-item" href="tables-member.mdo">회원목록</a>
	                     	</div>
                    	</div> -->

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3"
								style="display: inline-flex; align-items: center; justify-content: space-between;">
								<h5 class="m-0 font-weight-bold text-primary text-gray-800">회원 목록</h5>
								<form action="excel_tablemember.mdo" method="get">
									<button style="width: 90px; font-size: 15px; color: black; background: #c5c9c9; border-radius: 3px; border: none; font-weight: 600; height: 34.5px">엑셀파일</button>
								</form>
							</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="120px">이메일아이디</th>
                                            <th width="80px">이름</th>
                                            <th width="115px">닉네임</th>
                                            <th width="350px">주소</th>
                                            <th width="120px">휴대폰 번호</th>
                                            <th width="100px">생년월일</th>
                                            <th width="75px">성별</th>
                                            <th width="120px">가입날짜</th>
                                        </tr>
                                    </thead>                                  
                                    <tbody>
                                    	<c:forEach var="member" items="${list }">
	                                        <tr>
	                                            <td style="vertical-align: middle">${member.email_id }</td>
	                                            <td style="vertical-align: middle">${member.name }</td>
	                                            <td style="vertical-align: middle">${member.nickname }</td>	                                            
	                                            <td style="vertical-align: middle">${member.address1 } &nbsp;|&nbsp;${member.address2 }&nbsp;${member.address3 }</td>
	                                            <td style="vertical-align: middle">${member.phone}</td>
	                                            <td style="vertical-align: middle">${member.birth }</td>
	                                            <td style="vertical-align: middle">${member.gender}</td>
	                                            <td style="vertical-align: middle"><fmt:formatDate value="${member.date}" pattern="yyyy-MM-dd"/></td>	                       
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
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<%@ include file="footer.jsp"%>

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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>memeberpage</title>
    
   <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- Custom fonts for this template -->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <script type ="text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>



	
	<script>
		$(document).ready(function() {
			$('#savePdf').click(function() { // pdf저장 button id
				
			    html2canvas($('#contents')[0]).then(function(canvas) { //저장 영역 div id
				
			    // 캔버스를 이미지로 변환
			    var imgData = canvas.toDataURL('image/png');
				     
			    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
			    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			    var imgHeight = canvas.height * imgWidth / canvas.width;
			    var heightLeft = imgHeight;
			    var margin = 10; // 출력 페이지 여백설정
			    var doc = new jsPDF('p', 'mm');
			    var position = 0;
			       
			    // 첫 페이지 출력
			    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			    heightLeft -= pageHeight;
			         
			    // 한 페이지 이상일 경우 루프 돌면서 출력
			    while (heightLeft >= 20) {
			        position = heightLeft - imgHeight;
			        doc.addPage();
			        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			        heightLeft -= pageHeight;
			    }
			 
			    // 파일 저장
			    doc.save('file-name.pdf');
		
				  
			});
		
			});
			
			
		})



</script>
	
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
                    <h1 class="h3 mb-2 text-gray-800">회원 관리 페이지</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="home.mdo">민트마켓 탈퇴회원 관리 </a>.</p>
                            <button type="button" class="btn btn-primary" id="savePdf" >PDF 저장</button>
                             <div class="dropdown">
                     	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     	카테고리
                     	</button>
                     	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                     		<a class="dropdown-item" href="memberpage.mdo">회원목록</a>
                     		<a class="dropdown-item" href="memberlist.mdo">탈퇴회원목록</a>
                     	</div>
                     </div>
                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">민트마켓 회원</h6>
                        </div>
                        <div class="card-body" id="contents">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>프로필</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>성별</th>
                                            <th>휴대폰</th>
                                            <th>가입날짜</th>                                          
                                            <th>비고</th>                                          
                                        </tr>
                                    </thead>                                  
                                    <tbody>
                                       <c:forEach var="member" items="${list }">
                                           <tr>
                                               <td><img src="${member.profile }"></td>
                                               <td>${member.email_id }</td>
                                               <td>${member.name }</td>
                                               <td>${member.nickname }</td>
                                               <td>${member.gender }</td>
                                               <td>${member.phone }</td>
                                               <td>${member.date }</td>
                                               <td>
                                                  <button class="modal_info" style="width: 90px; font-size: 15px">상세정보</button>
                                                  <input type="hidden" value="${member.address1 }">
                                                  <input type="hidden" value="${member.address2 }">
                                                  <input type="hidden" value="${member.address3 }">
                                                  <input type="hidden" value="${member.birth }">
                                                  <input type="hidden" value="${member.gender }">
                                                  <input type="hidden" value="${member.date }">
                                                  <form action="deleteMember.mdo" method="post">
                                                     <input type="hidden" name="nickname" value="${member.nickname }">
                                          <button type="submit" id="deleteMember" class="deleteMember" style="width: 90px; font-size: 15px">삭제</button>
                                       </form>
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
         <div id="member_view" style="background: white; display:none">
            <div>
               <div id="info"><input type="text" id="detail_name" readonly style="border: none; width:80px;">님의 회원 정보</div>
               <hr>
               <div>
                  <table id="my_info_edit_area">
                     <tr>
                        <td colspan="2">
                           <p style="display: flex;">
                              <img id="detail_img" style="margin: auto;">
                           </p>
                        </td>
                     </tr>
                     <tr>
                        <td width="200px" height="30px">아이디<input type="hidden"></td>
                        <td width="350px">
                           <input type="text" id="detail_id">
                        </td>
                     </tr>
                     <tr>
                        <td height="30px">닉네임</td>
                        <td><input type="text" id="detail_nick"></td>
                     </tr>
                     <tr>
                        <td height="30px">전화번호</td>
                        <td><input type="text" id="detail_phone"></td>
                     </tr>
                     <tr>
                        <td height="30px" rowspan="3" style="vertical-align: top;">주소</td>
                        <td><input type="text"  id="detail_address1"></td>
                     </tr>
                     <tr>
                        <td><input type="text" id="detail_address2"></td>
                     </tr>
                     <tr>
                        <td><input type="text" id="detail_address3"></td>
                     </tr>
                     <tr>
                        <td height="30px">생일</td>
                        <td><input type="text" id="detail_birth"></td>
                     </tr>
                     <tr>
                        <td height="30px">성별</td>
                        <td><input type="text" id="detail_gender"></td>
                     </tr>
                     <tr>
                        <td height="30px">가입날짜</td>
                        <td><input type="text" id="detail_date"></td>
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
    <script src="admin/js/memberpage.js"></script>
    <script>
	    $(".modal_info").click(function() {
	    	$("#detail_address1").val($(this).next().val());
			$("#detail_address2").val($(this).next().next().val());
			$("#detail_address3").val($(this).next().next().next().val());
			$("#detail_birth").val($(this).next().next().next().next().val());
			$("#detail_gender").val($(this).next().next().next().next().next().val());
			$("#detail_date").val($(this).parent().prev().text());
			$("#detail_name").val($(this).parent().prev().prev().prev().prev().prev().text());
			$("#detail_img").attr("src", ($(this).parent().prev().prev().prev().prev().prev().prev().prev().children().attr("src")));
			$("#detail_nick").val($(this).parent().prev().prev().prev().prev().text());
			$("#detail_phone").val($(this).parent().prev().prev().text());
			$("#detail_id").val($(this).parent().prev().prev().prev().prev().prev().prev().text());
			
			modal('member_view');
		});
	    
	    $(".deleteMember").click(function() {
			var check = confirm("삭제 하시겠습니까?");
			if (check) {
				document.getElementById("deleteMember").submit();
			} else {
				return false;
			}
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
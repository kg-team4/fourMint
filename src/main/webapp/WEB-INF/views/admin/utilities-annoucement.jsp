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

    <title>공지사항</title>

    <!-- Custom fonts for this template-->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.css" rel="stylesheet">
    
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
                    <h1 class="h3 mb-2 text-gray-800">공지사항</h1>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                        </div>                        
                        <div class="card-body">
                      
						<!-- 글쓰기 모달창 -->  
                        <button type='button' id="modal_btn">글쓰기</button>
						<div class="black_bg"></div>
						
                        <div class="modal_wrap">
						    <div class="modal_close"><a href="#">close</a></div>
						    <div>
						      <form action="announcement.mdo"  method="post">
						      <table>
						      	<tr>
							      	<td>제목</td>
							      	<td> <input type="text" name="title" required="required"></td>
						      	</tr>
						      	<tr>
						      		<td>내용</td>
						      		<td><textarea name="content" required="required"></textarea></td>
						      	</tr>
						      		<tr>
						      			<td><input type="submit" value="등록" /></td>						      		
						      		</tr>						 
						      	</table>	
						      </form>  
						    </div>
						</div>
						<!-- 글쓰기 모달창 -->					
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <!--  <input type="submit" class="btn btn-primary btn-user btn-block" value="제출하기"> -->                                                                       
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>작성일</th>
                                            <th>고정상태</th>
                                            <th scope="col">Actions</th>                                             
                                        </tr>
                                    </thead>                                  
                                    <tbody>                                   		
                                        <c:forEach var="notice" items="${list }">
	                                        <tr>	                                        		                                        		                                        		
	                                            <td>${notice.notice_seq }</td>
	                                            <td>${notice.notice_title }</td>
	                                            <td>
	                                            <pre style=" white-space:pre-wrap;line-height: 150%;text-align:left;">${notice.notice_content}</pre></td>	
	                                            <td> <fmt:formatDate value="${notice.date}" pattern="yyyy-MM-dd"/></td>	                                                                                   	                                            
	                                            <td><c:set value="${notice.status}" var="notice_status" />
					                                 <c:choose>
					                                    <c:when test="${notice_status eq '0'}"><span style="color: blue">변경</span></c:when>
					                                    <c:when test="${notice_status eq '1'}"><span style="color: red">고정</span></c:when>
					                                 </c:choose></td>	                                          
	                                           <td>
	                                         <form>
		                                            <input type="hidden" value="${notice.notice_seq  }" name="notice_seq">
	                                           		<input type="hidden" value="${notice.notice_title }" name="notice_title">
	                                           		<input type="hidden" value="${notice.notice_content}" name="notice_content">
		                                            <button type="button"  class="btn btn-success" ><i class="fas fa-edit"></i></button>		                                   
		                                        	<button type="button" class="btn btn-danger" ><i class="far fa-trash-alt"></i></button>	
		                                       </form>
		                                       </td>                                         
                                        	</tr>
                                      </c:forEach>        		                                                                                                                                                                                                                                                                                                                                                                         
                                    </tbody>
                                </table>                              
                                <!-- 수정 모달창 -->
		                        <div class="modal_cover">
								    <div class="modal_shut"><a href="#">close</a></div>
								    <div>
								      <form action="update_announcement.mdo"  method="post">
								      <table>
								      <tr>
								      	<td>글 번호</td>
								      	<td><input id="hi_seq" type="text" value="" name="seq" readonly></td>
								      </tr>
								      	<tr>
									      	<td>제목</td>
									      	<td> <input id="hi_title" type="text" name="title" required="required"></td>
								      	</tr>
								      	<tr>
								      		<td>내용</td>
								      		<td><textarea id="hi_content" name="content" required="required"></textarea></td>
								      	</tr>
								      		<tr>
								      			<td>
								      				<input type="submit" value="등록" />
								      			</td>						      		
								      		</tr>							 
								      	</table>	
								      </form>  
								   </div>
								</div>
								<!-- 수정 모달창 -->                               
                            </div>
                        </div>
                    </div>
                </div>
               </div>
                <!-- /.container-fluid -->
			</div>
          </div>
            <!-- End of Main Content -->            
  <script>                     
       $(".btn-danger").click(function(){
    	   if(!confirm('삭제하시겠습니까?')){
    		   return false;
    	   }
    	   $(this).parent().attr("action", "announce_delete.mdo");
    	   $(this).parent().attr("method", "post");
    	   $(this).parent().submit();  
       });
  </script>
      
  <script>
    window.onload = function() {
 
    /* 글쓰기 js */
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
    /* 글쓰기 js */        
    
    /* 수정 js */
    $(".btn-success").click(function onClick2() {
    	$("#hi_seq").val($(this).prev().prev().prev().val());
    	$("#hi_title").val($(this).prev().prev().val());
    	$("#hi_content").val($(this).prev().val());
    	
        document.querySelector('.modal_cover').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    });   
    function offClick2() {
        document.querySelector('.modal_cover').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.querySelector('.modal_shut').addEventListener('click', offClick2);
    /* 수정 js */    
};
</script>

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
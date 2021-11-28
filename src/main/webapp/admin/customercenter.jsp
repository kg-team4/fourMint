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

    <title>customercenter</title>

    <!-- Custom fonts for this template -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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

              <%@ include file="header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">고객센터(Q&A) 페이지</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="home.mdo">민트마켓 고객센터(Q&A) 관리 </a>.</p>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">고객센터(Q&A)</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                     <tr>
                                            <th>질문번호</th>
                                            <th>상품번호</th>
                                            <th>닉네임</th>
                                            <th>내용</th>
                                            <th>날짜</th>
                                            <th>상품명</th>
                                            <th>답변상태</th>
                                            <th scope="col">Actions</th>                                             
                                        </tr>
                                    		</thead>         
                                         <tbody>                                     
                                       <c:forEach var="storeask" items="${list}">
	                                       <tr>	                                   		                                        		                                        		
	                                           <td>${storeask.ask_seq}</td>
	                                           <td>${storeask.store_seq}</td>
	                                           <td>${storeask.nickname }</td>
	                                           <td>${storeask.content}</td>
	                                           <td> <fmt:formatDate value="${storeask.date}" pattern="yyyy-MM-dd"/></td>
	                                           <td>${storeask.product_name}</td>	
	                                           	<td><c:set value="${storeask.status}" var="ask" />
					                                 <c:choose>
					                                    <c:when test="${ask eq '0'}"><span style="color: blue">답변완료</span></c:when>
					                                    <c:when test="${ask eq '1'}"><span style="color: red">답변대기</span></c:when>
					                                 </c:choose></td>
	                                           <td>
	                                           <form>
	                                           		<input type="hidden" value="${storeask.ask_seq }" name="ask_seq">		                                           		
	                                           		<input type="hidden" value="${storeask.content }" name="content">  
	                                           		<input type="hidden" value="${storeask.status }" name="status">  	                                         	                                           		                     		
		                                            <button type="button" class="btn btn-success" ><i class="fas fa-edit"></i></button>		                                   
		                                        	<button type="button" class="btn btn-danger" ><i class="far fa-trash-alt"></i></button>	
	                                        	</form>
	                                        </td> 		                 
	                                      </tr> 
                                      	</c:forEach> 
                                    </tbody>                                                                                                                                                                                                                                                                                                                                                                                   
                                </table>
                                 <!-- 등록 모달창 -->
		                        <div class="modal_cover">
								    <div class="modal_shut"><a href="#">close</a></div>
								    <div>
								      <form action="modify_faq.mdo"  method="post">
								      <table>
								      <tr>
								      	<td>질문번호</td>
								      	<td><input id="hi_ask_seq" type="text" value="" name="ask_seq" readonly></td>
								      </tr>								      								      	
								      	<tr>
								      		<td>내용</td>
								      		<td><textarea id="hi_content"  name="content" required="required"></textarea></td>
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
							<!-- 등록 모달창 -->												
                         </div>
                       </div>
                   	 </div>
					</div>
                </div>
                <!-- /.container-fluid -->
			</div>
           </div>
          
            <!-- End of Main Content-->	
            
		<script>
		$(".btn-danger").click(function() {
			if (!confirm('삭제하시겠습니까?')) {
				return false;
			}
			$(this).parent().attr("action", "qna_delete.mdo");
			$(this).parent().attr("method", "post");
			$(this).parent().submit();
		});
		</script>
		
		<script>
		  window.onload = function() {					    	
					 /* 등록 js */
					    $(".btn-success").click(function onClick2() {
					    	$("#hi_ask_seq").val($(this).prev().prev().prev().val());					    	
					    	
					        document.querySelector('.modal_cover').style.display ='block';
					        document.querySelector('.black_bg').style.display ='block';
					    });
					    function offClick2() {
						     document.querySelector('.modal_cover').style.display ='none';
						     document.querySelector('.black_bg').style.display ='none';
						     
						 document.querySelector('.modal_shut').addEventListener('click', offClick2);  
					    }					          
					   }; 
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
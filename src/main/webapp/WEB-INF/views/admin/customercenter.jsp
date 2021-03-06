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
    <link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
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
                                     		<th width="100px">상품명</th>
                                            <th width="100px">닉네임</th>
                                            <th width="250px">문의내용</th>
                                            <th width="100px">날짜</th>
                                            <th width="100px">상태</th>
                                            <th width="430px">답변내용</th>
                                            <th width="80px"scope="col">비고</th>                                             
                                        </tr>
                                    		</thead>         
                                         <tbody>                                     
                                       <c:forEach var="storeask" items="${list}">
	                                       <tr>	                                   		                                        		                                        		
											  <td style="vertical-align: middle">${storeask.product_name}</td>
	                                           <td style="vertical-align: middle">${storeask.nickname }</td>
	                                           <td style="vertical-align: middle">${storeask.content}</td>
	                                           <td style="vertical-align: middle"> <fmt:formatDate value="${storeask.date}" pattern="yyyy-MM-dd"/></td>	                                           	
	                                           	<td style="vertical-align: middle"><c:set value="${storeask.status}" var="ask" />
					                                 <c:choose>
					                                    <c:when test="${ask eq '0'}"><span style="color: blue">답변완료</span></c:when>
					                                    <c:when test="${ask eq '1'}"><span style="color: red">답변대기</span></c:when>
					                                 </c:choose>
					                            </td>
					                            <td style="vertical-align: middle">${storeask.answer }
	                                        	</td>
	                                           <td style="vertical-align: middle; text-align:center">
	                                           <form>
	                                           		<input type="hidden" value="${storeask.ask_seq }" name="ask_seq">		                                           		
	                                           		<input type="hidden" value="${storeask.content }">  
	                                           		<input type="hidden" value="${storeask.status }">  	                                         	                                           		                     		
		                                            <button type="button" class="btn btn-success" style="width: 90px; color:black; font-size: 15px; background: #79d4c8; border-radius: 3px; border:none; margin-bottom:5px; height:34.5px">답변 등록</button>		                                   
		                                        	<button type="button" class="btn btn-danger" style="width: 90px; color:black; font-size: 15px; background: #c5c9c9; border-radius: 3px; border:none; height:34.5px">답변 삭제</button>	
	                                        	</form>
	                                        	</td> 		                 
	                                      </tr> 
                                      	</c:forEach> 
                                    </tbody>                                                                                                                                                                                                                                                                                                                                                                                   
                                </table>
                                 <!-- 등록 모달창 -->
                                 
                                 
		                        <div class="modal_cover">
								    <div class="modal_shut"><a href="#">close</a></div>
								    <div id="info" style="text-align: center; margin-top: 5px; font-size: 23px">
									<strong>답변 등록하기</strong>
									</div>
									<hr>		    
								    <div>
								      <form action="qnaAnswer.mdo"  method="post">
								      <table style="margin-top: -10px; margin-left: 20px; border-spacing: 10px; border-collapse: separate;">
									      <tr>
									      	<td height="42px" style="text-align: left; color: black"><strong>문의 내용 </strong></td>
									      	<td><input id="hi_ask_content" type="text" readonly style=" border:none;  border:1px solid #c5c9c9; resize: none; width: 320px; height: 175px;"></td>
									      	
									      </tr>								      								      	
									      	<tr>
									      		<td height="42px" style="text-align: left; color: black"><strong>문의 답변 내용</strong></td>
									      		<td><textarea id="ask_answer"  name="content" required="required" style="resize: none; border:1px solid #79d4c8; padding-top:15px; width: 320px; height: 175px;"></textarea></td>
									      	</tr>								      	
								      </table>	
								      <input type="hidden" id="ask_seq2" name="ask_seq" value=""/>
								      <input type="submit" value="등록" style="width: 90px; height:30px; font-size: 15px; background: #79d4c8; margin-left: 220px; margin-bottom: 30px; border-radius: 3px; border: none; color: black;"/>
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
			    	$("#ask_seq2").val($(this).prev().prev().prev().val());
			    	$("#hi_ask_content").val($(this).prev().prev().val());					    	
			    	
			        document.querySelector('.modal_cover').style.display ='block';
			        document.querySelector('.black_bg').style.display ='block';
			    });
			    function offClick2() {
				     document.querySelector('.modal_cover').style.display ='none';
				     document.querySelector('.black_bg').style.display ='none';
			    }    
				document.querySelector('.modal_shut').addEventListener('click', offClick2);  
			    					          
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
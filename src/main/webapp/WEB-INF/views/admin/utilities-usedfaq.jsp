 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FAQ</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.css" rel="stylesheet">
	
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
                    <h1 class="h3 mb-2 text-gray-800">FAQ</h1>
                     <div class="dropdown">
                     	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     	분류
                     	</button>
                     	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo">전체</a>
                     		<a class="dropdown-item" href="etc.mdo">기타</a>
                     		<a class="dropdown-item" href="order.mdo">주문/결제</a>
                     		<a class="dropdown-item" href="exchange.mdo">반품/교환</a>
                     		<a class="dropdown-item" href="cancel.mdo">취소/환불</a>
                     		<a class="dropdown-item" href="delivery.mdo">배송</a>                    		
                     		<a class="dropdown-item" href="mintmarket.mdo">민트마켓</a>
                     	</div>
                     </div>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">FAQ </h6>
                        </div>
                      <div class="card-body">
                        
                        <!-- 글쓰기 모딜창 -->
                        <button type='button' id="modal_btn">글쓰기</button>
						<div class="black_bg"></div>
                        <div class="modal_wrap">
						    <div class="modal_close"><a href="#">close</a></div>
						    <div>
						      <form action="faq.mdo"  method="post">
						      <table>					      
						      	<tr>
							      	<td>제목</td>
							      	<td> <input type="text" name="title" required="required"></td>
						      	</tr>
						      	
						      	<tr>
						      	<td>카테고리</td>
						      	<td>
						      		<select name="category">
						      			<option value="">선택</option>						      									      			
						      			<option value="기타">기타</option>
						      			<option value="주문/결제">주문/결제</option>
						      			<option value="반품/교환">반품/교환</option>
						      			<option value="취소/환불">취소/환불</option>
						      			<option value="배송">배송</option>
						      			<option value="민트마켓">민트마켓</option>
						      		</select>
						      		</td>
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
                                    <c:forEach var="faq" items="${list}">                                  	  
                             			     <tr>	                                        		                                        		                                        		
	                                            <td>${faq.faq_seq }</td>
	                                            <td>${faq.faq_category }</td>
	                                            <td>${faq.faq_title}</td>	
	                                            <td>                                          
		                                            <div class="dropdown">
		                 							<btn type="button" class="btn btn-secondary dropdown-toggle" id="dropdownButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                     										                                            	 
	                                            	</btn>
	                                            	<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1"><%-- <pre style=" white-space:pre-wrap;line-height: 150%;text-align:left;">${faq.faq_content}</pre> --%>	
	                                            	<li>${faq.faq_content}</li>		
	                                            	</ul>
	                                            	</div>
	                                            </td> 
	                                           <td>
	                                            <form id="form${faq.faq_seq }">
		                                            <input type="hidden" value="${faq.faq_seq}" name="faq_seq">
	                                           		<input type="hidden" value="${faq.faq_category}" >
	                                           		<input type="hidden" value="${faq.faq_title }" >
	                                           		<input type="hidden" value="${faq.faq_content}">
		                                            <button type="button"  class="btn btn-success" ><i class="fas fa-edit"></i></button>		                                   
		                                        	<button type="button" onclick="deleteFaq(${faq.faq_seq});" class="btn btn-danger" ><i class="far fa-trash-alt"></i></button>	
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
								      <form action="update_faq.mdo"  method="post">
								      <table>
								      <tr>
								      	<td>글 번호</td>
								      	<td><input id="hi_seq" type="text" value="" name="seq" readonly></td>
								      </tr>
								      <tr>
									      <td>카테고리</td>
									      <td> 
									      	<select name="category"  id="hi_category" type="text" name="title" required="required">
								      			<option value="">선택</option>						      									      			
								      			<option value="기타">기타</option>
								      			<option value="주문/결제">주문/결제</option>
								      			<option value="반품/교환">반품/교환</option>
								      			<option value="취소/환불">취소/환불</option>
								      			<option value="배송">배송</option>
								      			<option value="민트마켓">민트마켓</option>
								      		</select>
								      	</td>
								      </tr>
								     <tr>
									      	<td>제목</td>
									      	<td> <input id="hi_title" type="text" name="title" required="required"></td>
								     </tr>
								     <tr>
								      		<td>내용</td>
								      		<td>
								      		<textarea name="content" required="required" id="hi_content" ></textarea>
								      		</td>
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
		                   		    	$("#hi_seq").val($(this).prev().prev().prev().prev().val());
		                   		    	$("#hi_category").val($(this).prev().prev().prev().val());
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
    		 	function deleteFaq(faq_seq){
    		 		if(!confirm('삭제하시겠습니까?')){
    		    		   return false;
    		    	   }
    		 	 	$("#form"+faq_seq).attr("action", "faq_delete.mdo?faq_seq="+faq_seq);
    		 		$("#form"+faq_seq).attr("method", "post");
    		 		$("#form"+faq_seq).submit();  
    		 	}
			     /*   $(".btn-success").click(function(){
			    	   $(this).parent().attr("action", "");
			    	   $(this).parent().attr("method","");
			    	   $(this).parent().submit();
			       });
			        */
			       /* $(".btn-danger").click(function(){
			    	   $(this).parent().attr("action", "faq_delete.mdo");
			    	   $(this).parent().attr("method", "post");
			    	   $(this).parent().submit();  
				       }); */
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
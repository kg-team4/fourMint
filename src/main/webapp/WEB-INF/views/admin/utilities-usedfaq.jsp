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
                     <div class="dropdown">
                     	<button class="btn btn-secondary dropdown-toggle" type="button"
                     	 style="margin-bottom: 5px; background: #dee1e3; border: none; color:#514c57"
                     	 id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     	분류
                     	</button>
                     	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo?category=all">전체</a>
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo?category=기타">기타</a>
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo?category=주문/결제">주문/결제</a>
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo?category=반품/교환">반품/교환</a>
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo?category=취소/환불">취소/환불</a>
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo?category=배송">배송</a>                    		
                     		<a class="dropdown-item" href="utilities-usedfaq.mdo?category=민트마켓">민트마켓</a>
                     	</div>
                     </div>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h5 class="m-0 font-weight-bold text-primary text-gray-800">FAQ </h5>
                        </div>
                      <div class="card-body">
                        
                        <!-- 글쓰기 모딜창 -->
                        <button type='button' id="modal_btn" style="width: 90px; font-size: 15px; margin-left: 92%; color: black; background: #79d4c8; border-radius: 3px; border: none; font-weight: 700; height: 34.5px">글쓰기</button>
                        
						<div class="black_bg"></div>
                        <div class="modal_wrap">
						    <div class="modal_close"><a href="#">close</a></div>
						    <div id="info"
								style="text-align: center; margin-top: 5px; font-size: 23px">
								<strong>FAQ 글쓰기</strong>
							</div><hr>		    
						    <div>
						      <form action="faq.mdo"  method="post">
						      <table style="margin-left: 20px; vertical-align: middle">								      	
						      	<tr>
						      	<td height="42px" style="text-align: left; color: black"><strong>카테고리&emsp;</strong></td>
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
							      	<td height="42px" style="text-align: left; color: black"><strong>제목&emsp;</strong></td>
							      	<td> <input type="text" name="title" style="width: 350px;" required="required"></td>
						      	</tr>
						      	
						      	<tr>
						      		<td height="42px" style="text-align: left; color: black"><strong>내용&emsp;</strong></td>
						      		<td><textarea name="content" required="required" style="resize: none; width: 350px; height: 270px;"></textarea></td>
						      	</tr>
								</table>
								
						      	<input type="submit" value="등록" style="width: 90px; height: 30px; font-size: 15px; background: #79d4c8; border-radius: 3px; border: none; margin-left: 220px; margin-top: 15px; font-weight: 700"/>			
						      </form>  
						    </div>
						</div>
						<!-- 글쓰기 모달창 -->
						
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th width="120px">분류</th>
                                            <th width="360px">제목</th>                                              
                                            <th width="550px">내용</th>
                                            <th scope="col">비고</th>                                                                                                                             
                                        </tr>
                                    </thead>                                  
                                    <tbody>
                                    <c:forEach var="faq" items="${list}">                                  	  
                             			     <tr>	                                        		                                        		                                        		
	                                            <td style="vertical-align: middle">${faq.faq_seq }</td>
	                                            <td style="vertical-align: middle">${faq.faq_category }</td>
	                                            <td style="vertical-align: middle">${faq.faq_title}</td>	
	                                            <td style="vertical-align: middle">${faq.faq_content}</td> 
	                                            <td style="vertical-align: middle; text-align:center">
	                                            <form id="form${faq.faq_seq }">
		                                            <input type="hidden" value="${faq.faq_seq}" name="faq_seq">
	                                           		<input type="hidden" value="${faq.faq_category}" >
	                                           		<input type="hidden" value="${faq.faq_title }" >
	                                           		<input type="hidden" value="${faq.faq_content}">
		                                            <button type="button"  class="btn btn-success" style="width: 90px; height: 34.5px; font-size: 15px; background: #79d4c8; border-radius: 3px; border: none; margin-bottom: 4px; color: black;">수정</button>	                                   
		                                        	<button type="button" onclick="deleteFaq(${faq.faq_seq});" class="btn btn-danger" style="width: 90px; height: 34.5px; font-size: 15px; background: #c5c9c9; border-radius: 3px; border: none; color: black;">삭제</button>
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
								    <div id="my_info_edit_title"
											style="font-weight: 700; font-size:23px; text-align:center;">FAQ
											수정</div>
										<hr>
								    
								    
								      <form action="update_faq.mdo"  method="post">
								      <table style="margin-top: -10px; margin-left: 20px;">
								       <tr>
									      <td height="42px" style="text-align: left; color: black"><strong>카테고리&emsp;</strong></td>
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
								      	<td height="42px" style="text-align: left; color: black"><strong>글 번호&emsp;</strong></td>
								      	<td><input id="hi_seq" type="text" value="" name="seq" readonly></td>
								      </tr>
								     
								     <tr>
									      	<td height="42px"  style="text-align: left; color: black"><strong>제목&emsp;</strong></td>
									      	<td> <input id="hi_title" type="text" name="title" required="required" style="width: 350px"></td>
								     </tr>
								     <tr>
								      		<td height="42px" style="text-align: left; color: black"><strong>내용&emsp;</strong></td>
								      		<td>
								      		<textarea name="content" required="required" id="hi_content" style="resize: none; width: 350px; height: 250px;"></textarea>
								      		</td>
								      </tr>
								      	</table>	
								      	<button type="submit" style="width: 90px; height:34.5px; font-size: 15px; background: #79d4c8; margin-left: 220px; margin-top: 10px;margin-bottom: 10px; border-radius: 3px; border: none; color: black;">수정</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트마켓 아이디 찾기 결과</title>

<jsp:include page="../template/header.jsp"></jsp:include>

<link href="../css/11.find_id_result.css"rel="stylesheet"
	type="text/css">
<article id="full-article">
<script type="text/javascript">
	var flag
	
	flag = '${flag}';
	
	if(flag == 0){
		
	}else{
		alert('등록된 사용자가 없습니다.')
	}

</script>
	<div class="main-form">
	<div style="height: 150px;">
		<img src="../img/mt_happy_buying.png" alt="logo_icon" id="logo_icon">
    </div>    
       <div id="find-form">
	   	<div class="id-find">
	    	<div class="find-form-title">
	   		   	${id }
	   		   	
	        </div>
		       <c:choose>
		       	<c:when test="${flag == 0 }">
	        		<div class="find-form-body">
				       	<div>
			          		 <form action="login.do" method="get"style="text-align:right;">
			          		<input class="submit" type ="submit"value="로그인" style="margin-right:50px">
			          		
			          		</form>
			          	</div>
			          	<div>
			          		<form action="find.do" method="get"style="text-align:left;">
			          			<input  class="submit"  type="submit"value="비밀번호 찾기"style="margin-left:50px;">
			          		</form>
			          	</div>
			          </div>
		       	</c:when>
		       	<c:otherwise>
	        		<div class="find-form-body">
				       	<div>
			          		 <form action="login.do" method="get"style="text-align:right;">
			          		<input class="submit" type ="submit"value="로그인" style="margin-right:50px">
			          		
			          		</form>
			          	</div>
			          	<div>
			          		<form action="find.do" method="get"style="text-align:left;">
			          			<input  class="submit"  type="submit"value="아이디 찾기"style="margin-left:50px;">
			          		</form>
			          	</div>
			          </div>
		       	</c:otherwise>
		       </c:choose>
         </div>  
     </div>
   </div>
   
</article>
<jsp:include page="../template/footer.jsp"></jsp:include>
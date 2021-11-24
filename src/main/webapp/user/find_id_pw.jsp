<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp"></jsp:include>
<link href="../css/10.find_id_pw.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="../js/password.js"></script>
<article id="login-article">
	<div class="main-form">
	<div style="height: 150px;">
		<img src="../img/logo_icon.png" alt="logo_icon" id="logo_icon">
    </div>    
        <div id="find-form">
	        <div class="id-find">
	            <div class="title">아이디 찾기</div>
	            <form action="find_id.do" method="post">
	            	<div>
	             		<input id="name"type="text" name="name" placeholder="이름 입력"required>
	            	</div>
	            	<div>
	            		<input id="phone" type="text" name="phone"placeholder="전화 번호를 입력"required>
	            	</div>
	            	<div id="id-submit"> 
	            		<input class="submit" type ="submit"value="찾기">
	            	</div>
	            </form>
	            
	        </div>
	        <div class="pw-find">
	            <div class="title">비밀번호 수정</div>
	            
	            <div> <input id="id" type="text" name="email_id" placeholder="이메일 입력"required></div>
	            <div><input id="pwname" type="text" name="name"placeholder="이름  입력"required></div>
	            <div><input id="pwphone" type="text" name="phone"placeholder="전화 번호 입력"required></div>
	           	<div><button type="button" onclick="phoneCheck();">인증</button></div>
				<div><input type="text" placeholder="인증번호" id="pwphone2" required="required"></div>
				<div><button type="button" id="pwphoneCheck2" onclick="numcheck();">확인</button></div>
	            <div><button type="button" id="updatePw" onclick="updatePw();">수정 </button></div>
	            
	        </div>
        </div>
        
    </div>
    
    
							
</article>
<jsp:include page="../template/footer.jsp"></jsp:include>
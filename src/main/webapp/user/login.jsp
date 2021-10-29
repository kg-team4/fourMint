<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- template header-->
<jsp:include page="../template/header.jsp"></jsp:include>

<link href="../css/7.login.css" type="text/css" rel="stylesheet">

<article id="login-article">
	
	<form action="login.do" method="post" id="login-form">
		<div>
			<img src="../img/logo_icon.png" alt="logo_icon">
		</div>
		<div>
			<input type="text" name="email_id" placeholder="이메일" id="id" }required>
		</div>
		<div>
			<input type="password" name="password" placeholder="비밀번호" id="pw" required>
		</div>
		<div>
			<div id="login-tool">
				<input type="checkbox" id="remember-member"><label for="remember-member">자동 로그인</label> 
				<span> 
					<a href="../user/find_id_pw.jsp">이메일 / 비밀번호 찾기</a> 
					<a href="join.do">회원가입</a>
				</span>
			</div>
		</div>
		<div>
			<input type="submit" value="로그인" id="submit">
		</div>
	</form>
	
</article>

<!-- template footer-->
<jsp:include page="../template/footer.jsp"></jsp:include>

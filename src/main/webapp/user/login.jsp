<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트마켓 로그인</title>

<!-- template head-->
<link rel="stylesheet" href="../css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>

<link href="../css/7.login.css" type="text/css" rel="stylesheet">

        <article id="login-article">
            <form action="login.do" method="get" id="login-form">
                <div>
                    <img src="../img/logo_icon.png" alt="logo_icon">
                </div>
                <div>
                    <input type="text" name="member_id" placeholder="이메일" id="id" required>
                </div>
                <div>
                    <input type="password" name="member_pw" placeholder="비밀번호" id="pw" required>
                </div>
                <div>
                    <div id="login-tool">
                        <input type="checkbox" id="remember-member">
                        <label for="remember-member">자동 로그인</label>
                        <span>
                            <a href="../user/find_id_pw.jsp">이메일 / 비밀번호 찾기</a>
                            <a href="../user/join.jsp">회원가입</a>
                        </span>
                    </div>
                </div>
                <div>
                	
                    <input type="submit" value="민트마켓 아이디로 로그인" id="login-submit" /><br>            
                    <button class="btn-naverLogin"><img src="img/naver_logo.PNG" style="height:18px;width:18px;">&nbsp;&nbsp; 네이버 아이디로 로그인</button><br>
        			<button class="btn-kakaoLogin"><img src="img/kakao_logo.PNG" style="height:23px;width:24px;">&nbsp;&nbsp; 카카오 아이디로 로그인</button><br>
					<button class="btn-googleLogin"><img src="img/google_logo.PNG" style="height:23px;width:23px;">&nbsp;&nbsp; 구글 아이디로 로그인</button><br>
					
                </div>
            </form>
        </article>	

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

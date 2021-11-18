<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트마켓 로그인</title>

<!-- template head-->
<link rel="stylesheet" href="../css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>

<link href="../css/7.login.css" rel="stylesheet">

        <article id="login-article">
            <form action="login.do" method="post" id="login-form">
                <div>
                    <img src="../img/logo_icon.png" alt="logo_icon" id="logo_icon">
                </div>
                <div>
                    <input type="text" name="email_id" placeholder="이메일" id="id" required="required">
                </div>
                <div>
                    <input
                     type="password" name="password" placeholder="비밀번호" id="pw" required="required">
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
                    <br><br><br>
					<button id="login-submit"><img src="img/logo_icon.png" style="height:30px;width:30px;">&nbsp;&nbsp;민트 로그인</button><br>
					<a href="${naver_url }"><img src="img/naver.png" style="height:18px;width:18px;">&nbsp;&nbsp; 네이버 아이디로 로그인</a><br>
					<ul><li  onclick="kakaoLogin()"><a href="javascript:void(0)"><span>카카오 로그인</span> </a></li></ul>
                </div>
            </form>
        </article>	


<!-- template footer-->
<jsp:include page="../template/footer.jsp"></jsp:include>

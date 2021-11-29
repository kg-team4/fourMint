<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<title>민트마켓 로그인</title>

<!-- template head-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>

<link href="${pageContext.request.contextPath}/resources/user/css/7.login.css" rel="stylesheet">

        <article id="login-article">
            <form action="login.do" method="post" id="login-form">
                <div>
                    <img src="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" alt="logo_icon" id="logo_icon">
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
                            <a href="find.do">이메일 / 비밀번호 찾기</a>
                            <a href="join.do">회원가입</a>
                        </span>
                    </div>
                </div>
               	<div style="margin-right:120px">
                <div id="login-area">
                <div id="space-area"></div>
                <div>			
					<ul style="margin-top:50px; ">
						<li style="float:left"><span><button id="login-submit" style="margin-left:511px; margin-right:20px"><img src="img/logo_icon.png" style="height:30px;width:30px;">&nbsp;민트 로그인</button></span></li>
						<li style="float:left; margin-right:20px;" id="kakaoLogin"  onclick="kakaoLogin()"><a href="javascript:void(0)"><span><img src="${pageContext.request.contextPath}/resources/user/img/kakao_login.png" style="width:153px;height:44px"></span> </a></li>
						<li style="float:left"><span ><a id="naverLogin"href="${naver_url }"><img src="${pageContext.request.contextPath}/resources/user/img/naver_login.png" style="width:153px;height:44px"></a></span></li>
					</ul>
					<br><br><br>
                </div>
                </div>
                </div>
            </form>
        </article>	
<script>
	console.log(${flag});
	if(${flag} == 1){
		alert("비밀번호가 틀렸습니다.");
	}else if(${flag} == 2){
		alert("존재하지 않는 아이디입니다.");
	}
</script>

<!-- template footer-->
<jsp:include page="../template/footer.jsp"></jsp:include>

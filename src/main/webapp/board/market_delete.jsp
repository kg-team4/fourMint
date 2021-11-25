<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!-- 비밀번호 검사 -->
<!-- 목적지 정보 파라미터 이름 go -->

<jsp:include page="../template/header.jsp"></jsp:include>

<link href="../css/check.css" rel="stylesheet" type="text/css">
<article id="full-article">
	<div class="main-form">
		<div style="height: 150px;">
			<img src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_cry.png" alt="cry_emoticon" id="logo_icon" style="width: 300px;">
		</div>
		<div id="find-form">
			<div class="pw-find">
				<div>
					<form action="deleteMarket.do" method="post" style="margin-top: 165px ">	
						<input type="hidden" name="email_id" value="${userEmail_id }">
						<input type="hidden" name="seq" value="${seq }">
						<input id="pw" type="password" name="password" required placeholder="비밀번호 입력" style="display:block;margin: 0px auto;"> 
						<input class="submit" type="submit" value="확인" style="width: 345px; height: 55px margin-top:100px;">
					</form>
				</div>
			</div>
		</div>
	</div>
</article>

<jsp:include page="../template/footer.jsp"></jsp:include>
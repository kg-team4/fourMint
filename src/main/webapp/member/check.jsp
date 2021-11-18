<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 비밀번호 검사 -->
<!-- 목적지 정보 파라미터 이름 go -->
<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<title>게시글 삭제 비밀번호 확인</title>
<jsp:include page="../template/header.jsp"></jsp:include>

<link href="../css/check.css" rel="stylesheet" type="text/css">
<article id="full-article">
	<div class="main-form">
		<div style="height: 150px;">
			<img src="../img/delete_check_cry.png" alt="logo_icon" id="logo_icon"
				style="width: 280px;">
		</div>
		<div id="find-form">
			<div class="pw-find">
				<div>
					<form action="check.jsp" method="get" style="margin-top: 200px">
						<input type="hidden" name="go" value="asd">
						<input id="pw" type="password" name="member_pw" required
							placeholder="비밀번호 입력" style="display:block;margin: 0px auto;"> 
							<input class="submit" type="submit" value="확인" style="width: 345px; height: 55px margin-top:100px;">
					</form>
				</div>

			</div>
		</div>
	</div>

</article>




<jsp:include page="../template/footer.jsp"></jsp:include>
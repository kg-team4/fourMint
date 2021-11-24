<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="../js/password.js"></script>
<link href="../css/12.find_pw_result.css" rel="stylesheet"
	type="text/css">
<article id="full-article">
	<div class="main-form">
		<div style="height: 150px;">
			<img src="../img/shoping.png" alt="logo_icon" id="logo_icon">
		</div>
		<div id="find-form">
			<div class="id-find">
				<div class="title">
					비밀번호 재설정 (8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요)
				</div>
				<div class="find-form-body">
					<form id="updateForm" action="update_pw.do" method="post"style="text-align:left;">
					<div>
						<input type ="hidden" name="email_id" id="email_id" value="${email_id}">
						<table>
						
							<tr>
								<td>비밀번호</td>
								<td><input id="fPw" name="oassword" type="password" style="height:24px"></td>
							</tr>
							<tr>
								<td>확인용 비밀번호</td>
								<td><input id="sPw" name="password" type="password" style="margin-top:10px;height:24px"></td>
								<td><button style="width:80px; margin-left:10px; margin-top:10px; font-size:15px; border-radius: 3px; border: 1px solid lightgray; background:lightgray;" type="button" onclick='correctPw();'>비밀번호확인</button></td>
							</tr>
						</table>
					</div>
							<button type="button" onclick="pwsubmit();">비밀번호 재설정</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	
</article>
<jsp:include page="../template/footer.jsp"></jsp:include>
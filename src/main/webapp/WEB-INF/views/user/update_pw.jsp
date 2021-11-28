<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<title>민트마켓 비밀번호 재설정</title>

<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="../js/password.js"></script>
<link href="../css/12.find_pw_result.css" rel="stylesheet"
	type="text/css">
<article id="full-article">
	<div class="main-form">
		<div style="height: 150px;">
			<img src="../img/mt_happy_buying.png" alt="logo_icon" id="logo_icon">
		</div>
		<div id="find-form">
			<div class="id-find">
				<div class="title">
					<!-- <div style="color:#7b7b7b; margin-bottom:5px; font-size:28px;">비밀번호 재설정 </div> -->
					<div>👉 8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요 </div>
				<div class="find-form-body">
					<form id="updateForm" action="update_pw.do" method="post"style="text-align:center;">					
						<div style="margin-left:495px">
							<input type ="hidden" name="email_id" id="email_id" value="${email_id}">
							<table>							
								<tr style="text-align:left; height:50px">
									<td style="margin-top:-5px; font-size:18px">변경 비밀번호</td>
									<td><input id="fPw" name="oassword" type="password" style="width:160px; height:24px; border-bottom:2px solid #50b9abd0; border-top:none; border-left:none; border-right:none;"></td>
								</tr>
								<tr style="text-align:left; height:50px">
									<td style="margin-top:-5px; font-size:18px">비밀번호 재확인 &nbsp;</td>
									<td><input id="sPw" name="password" type="password" style="height:24px;width:160px; border-bottom: 2px solid #50b9abd0; border-top:none; border-left:none; border-right:none"></td>
									<td><button style="width:80px; margin-left:10px; font-size:15px; border-radius: 3px; border: 1px solid lightgray; background:lightgray;" type="button" onclick='correctPw();'>비밀번호확인</button></td>
								</tr>
							</table>
							<button class="btn_pw_reset"type="button" onclick="pwsubmit();">비밀번호 재설정</button>
						</div>		
					</form>
				</div>
			</div>
		</div>
		</div>
	</div>
</article>
<jsp:include page="../template/footer.jsp"></jsp:include>
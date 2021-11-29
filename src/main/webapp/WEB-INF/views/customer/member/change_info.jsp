<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp"></jsp:include>

<!-- 주소 JS -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 회원가입 폼과 동일  -->
<script src="${pageContext.request.contextPath}/resources/user/js/join.js" type="text/javascript"></script>
<!-- 회원정보 변경 JS -->
<script src="${pageContext.request.contextPath}/resources/user/js/change_info.js"></script>

<!-- 회원가입 CSS -->
<link href="${pageContext.request.contextPath}/resources/user/css/6.join.css" type="text/css" rel="stylesheet">

<!-- 비밀번호 비교 -->

        <article class="join-article">
            <form action="change_info.do" method="get" class="join-form" id="edit-form" onsubmit="return editSubmit();">
            <input type="hidden" name="member_no" value="1">
                <div>
            		<img src="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" alt="logo_icon" id="logo_icon">
            	</div>
                <div class="email-form">
                    <input type="text" name="member_id" placeholder="이메일" id="email" value="1" readonly style="width: 500px;">
                </div>
                <div>
					<input type="password" name="member_pw" placeholder="현재 비밀번호" maxlength="15" oninput="checkPw();">
				</div>
				<div id="pwInfo"></div>
				 <div>
					<input type="password" name="check_pw" placeholder="비밀번호 수정" maxlength="15" oninput="editcheckPw();" style="color: #ff8900;">
				</div>
				<div id="editpwInfo"></div>
				 <div>
					<input type="password" name="check_member_pw" placeholder="비밀번호 확인" maxlength="15" oninput="doublecheckPw();" style="color: #ff8900;">
				</div>
				<div id="checkpwInfo"></div>
                <div>
                    <input type="text" name="member_nick" placeholder="닉네임" maxlength="10" value="1" oninput="checkNick();" style="color: #ff8900;">
                </div>
                <div id="nickInfo"></div>
                <div id="addr">
                    <input type="text" name="addr_state" placeholder="시 / 도" id="state" value="aaa" style="color: #ff8900;" readonly>
                    <input type="text" name="addr_city" placeholder="구 / 시" id="city" value="sss" style="color: #ff8900;" readonly>
                    <input type="text" name="addr_base" placeholder="동 / 읍 / 면" id="base" value="ddd" style="color: #ff8900;" readonly>
                    <input type="button" onclick="findAddr(); " value="">
                </div>
                <div>
                    <input type="text" name="member_phone" placeholder="휴대전화" maxlength="11" value="1" oninput="checkPhone();" style="color: #ff8900;">
                </div>
                <div id="phoneInfo"></div>
                <div>
                	<input type="submit" value="수정" id="join-submit">
                </div>
            </form>
        </article>

<jsp:include page="../template/footer.jsp"></jsp:include>



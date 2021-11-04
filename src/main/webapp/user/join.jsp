<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<title>민트마켓 회원가입</title>

<link rel="stylesheet" href="../css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<link href="../css/6.join.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="../js/join.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<article class="join-article">
	<form action="joinProc.do" method="post" class="join-form">
		<div>
			<img src="../img/logo_icon.png" alt="logo_icon" id="logo_icon">
		</div>

		<!------------ 이메일 아이디 ------------->
		<div class="email-form" style="border-bottom: 1.5px solid rgba(0, 0, 0, 0.41)">
			<input type="text" name="email_id" placeholder="이메일" id="email"
				required="required"> <span style="color: #50b9abd0;">@</span>
				<input type="text" name="writeEmail" id="writeEmail" 
				disabled value="mintmarket.com">
				<select name="selectEmail" id="selectEmail" required="required">
				<option value="mintmarket.com" selected>mintmarket.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="1">직접 입력</option>
			</select>
		</div>
		<div id="idInfo"></div>

		<!------------ 비밀번호 ------------->
		<div>
			<input type="password" name="password" placeholder="비밀번호"
				required="required" maxlength="15" oninput="checkPw();">
		</div>
		<div id="pwInfo"></div>

		<!------------ 닉네임 ------------->
		<div>
			<input type="text" name="nickname" placeholder="닉네임"
				required="required" maxlength="10" oninput="checkNick();">
		</div>

		 <!------------ 주소 ------------->
	    <div id="addr">
            <input type="text" name="address1" placeholder="주소" id="address1" readonly required="required">
            <input type="button" onclick="findAddr() " value="">
        </div>
        
		<div align="center" id="addr_div">
			<table>
				<tr>
					<td><input type="text" id="text_addr" placeholder="우편번호" readonly></td>
					<td><input type="text" id="post_addr" readonly></td>
				</tr>
				<tr>
					<td><input type="text" id="text_addr" placeholder="기본주소" readonly></td>
					<td><input type="text" id="base_addr" readonly></td>
				</tr>
				<tr>
					<td><input type="text" id="text_addr" placeholder="상세주소" readonly></td>
					<td><input type="text" id="detail_addr" placeholder="직접 입력해주세요 😉"></td>
				</tr>
			</table>
		</div>

		<!-- --------------------------------------------------------- 주소 시작 --------------------------------------------------------- -->
		
		<!-- --------------------------------------------------------- 주소 끝 --------------------------------------------------------- -->

		<!------------ 휴대전화 ------------->
		<div>
			<input type="text" name="phone" placeholder="휴대전화"
				required="required" maxlength="11" oninput="checkPhone();">
		</div>
		<div id="phoneInfo"></div>

		<!------------ 생년월일 ------------->
		<div>
			<input type="text" name="birth" placeholder="ex) 930209" id="birth"/>
		</div>
		<div id="birthInfo"></div>

		<!------------ 성별 ------------->
		<div align="center" id="gender_div">
			<input type="text" name="gender" id="gender" readonly>
			<input type="radio" class="genderRadio" name="group_gender" id="man" checked>&nbsp;
			<label for="man">남성</label>&nbsp;&nbsp;
			<input type="radio" class="genderRadio" name="group_gender" id="woman">&nbsp;
			<label for="woman">여성</label>
		</div>
		<br>

		<!------------ 이용약관 ------------->
		<div id="checkList">
			<div id="allAgree">
				<input type="checkbox" id="all" onchange="allCheck();"> <label
					for="all">전체 선택</label>
			</div>
			<div id="selectAgree">
				<div>
					<input type="checkbox" id="first" class="selectBox"
						required="required"> <label for="first"><a
						style="color: red;">(필수)</a> 당근마켓 이용약관 동의</label> <img
						src="../img/arrow-204-32.png" onclick="termsSwitch(1);">
				</div>
				<div class="terms">
					<textarea readonly>이용 약관1</textarea>
				</div>
				<div>
					<input type="checkbox" id="second" class="selectBox"
						required="required"> <label for="second"><a
						style="color: red;">(필수)</a> 개인정보 처리 방침 동의</label> <img
						src="../img/arrow-204-32.png" onclick="termsSwitch(2);">
				</div>
				<div class="terms">
					<textarea readonly>이용 약관2</textarea>
				</div>
				<div>
					<input type="checkbox" id="third" class="selectBox"> <label
						for="third"><a style="color: gray;">(선택)</a> 이메일, SMS 광고
						수신 동의</label> <img src="../img/arrow-204-32.png" onclick="termsSwitch(3);">
				</div>
				<div class="terms">
					<textarea readonly>이용 약관3</textarea>
				</div>
			</div>
			<div>
				<input type="submit" value="회원 가입" id="join-submit">
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$('#selectEmail').change(function() {
	$("#selectEmail option:selected").each(function() {
		if ($(this).val() == '1') {
			//직접입력일 경우 
			$("#writeEmail").val('');
			//값 초기화
			$("#writeEmail").attr("disabled", false);
			//활성화 
		} else {
			//직접입력이 아닐경우 
			$("#writeEmail").val($(this).text());
			//선택값 입력 
			$("#writeEmail").attr("disabled", true);
			//비활성화 
		}
	});
});
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
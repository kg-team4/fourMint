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
	<form action="joinProc.do" method="post" class="join-form" id="frm">
		<div>
			<img src="../img/logo_icon.png" alt="logo_icon" id="logo_icon">
		</div>

		<!------------ 이메일 아이디 ------------->
		<div class="email-form" style="border-bottom: 1.5px solid rgba(0, 0, 0, 0.41)">
			<input type="text" name="email" placeholder="이메일" id="email"
				 required="required" autofocus="autofocus" oninput="checkId()" style="margin-left: -13px"> <span style="color: #50b9abd0;">@</span>
				<input type="text" name="writeEmail" id="writeEmail" 
				disabled value="선택" oninput="checkEmail()" required="required">
				<select name="selectEmail" id="selectEmail" onclick="changeOption()" onkeyup="changeOption()">
				<option value="선택" selected>선택</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="1">직접 입력</option>
			</select>
		</div>
		<input type="button" value="중복확인" id="idCheck" disabled>
		<div id="idInfo"></div>
		<div id="emailInfo"></div>
		<div class="certEmail">
			<input id="email2" type="text" placeholder="인증번호 입력" oninput="EmailNumberBtnState()" disabled required/>
		</div>
		<input type="button" id="emailCheck" class="emailDoubleCheck" value="인증발송" disabled>
		<div>
			<span class="point successEmailCheck">이메일 입력 후 인증번호 보내기를 해주십시오.</span>
		</div>
		<div>
			<input type="button" class="emailDoubleCheck" id="emailCheck2" value="인증확인" disabled>
		</div>
		<input type="hidden" id="emailIdAll" name="email_id">
		<!------------ 비밀번호 ------------->
		<div>
			<input type="password" name="password" placeholder="비밀번호" 
				id="password" maxlength="15" oninput="pwValidation()" required="required">
		</div>
		<div id="pwInfo"></div>
		
		<!------------ 비밀번호 확인 ------------->
		<div>
			<input type="password" placeholder="비밀번호확인"
				 id="passwordCheck" maxlength="15" oninput="pwCheck()" required="required">
		</div>
		<div id="pwCheckInfo"></div>
		
		<!------------ 이름 ------------->
		<div class="name-form">
			<input type="text" name="name" placeholder="이름" id="name"
				 maxlength="10" oninput="checkName()" required="required">
		</div>
		<div id="nameInfo"></div>

		<!------------ 닉네임 ------------->
		<div class="nickname-form">
			<input type="text" name="nickname" placeholder="닉네임" id="nickname"
				 maxlength="10" oninput="checkNick()" required="required">
		</div>
		<input type="button" value="중복확인" id="nickCheck" disabled>
		<div id="nickInfo"></div>

		 <!------------ 주소 ------------->
	    <div id="addr">
            <input type="text" placeholder="주소" id="address1" readonly >
            <input type="button" onclick="findAddr() " value="">
        </div>
		<div align="center" id="addr_div">
			<table>
				<tr>
					<td><input type="text" id="text_addr" placeholder="우편번호" readonly></td>
					<td><input type="text" id="post_addr" name="address1" readonly required="required"></td>
				</tr>
				<tr>
					<td><input type="text" id="text_addr" placeholder="기본주소" readonly></td>
					<td><input type="text" id="base_addr" name="address2" readonly required="required"></td>
				</tr>
				<tr>
					<td><input type="text" id="text_addr" placeholder="상세주소" readonly></td>
					<td><input type="text" id="detail_addr" name="address3" placeholder="직접 입력해주세요 😉" oninput="checkAddr()" required="required"></td>
				</tr>
			</table>
		</div>
		<div id="addrInfo"></div>

		<!------------ 휴대전화 ------------->
		<div class="phone-form">
			<input type="text" name="phone" placeholder="휴대전화" id="phone"
				 maxlength="11" oninput="checkPhone()" required="required">
		</div>
		<input type="button" value="문자인증" id="phoneCheck" class="doubleCheck" disabled>
		<div id="phoneInfo"></div>
		<div class="certPhone">
			<input id="phone2" type="text" maxlength="4" placeholder="인증번호 입력" disabled oninput="phoneBtnState()" required="required"/>
		</div>
		<input type="button" id="phoneCheck2" class="doubleCheck" value="인증확인" disabled>
		<div>
			<span class="point successPhoneCheck">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
		</div>
		

		<!------------ 생년월일 ------------->
		<div>
			<input type="text" name="birth" maxlength="6" placeholder="ex) 930209" id="birth" oninput="checkBirth()" required="required"/>
		</div>
		<div id="birthInfo"></div>

		<!------------ 성별 ------------->
		<div align="center" id="gender_div">
			<input type="text" id="gender" readonly>
			<input type="radio" class="genderRadio" name="group_gender" onclick="getGender(event)" id="man" value="man" checked>
			<label for="man">남성</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" class="genderRadio" name="group_gender" onclick="getGender(event)" id="woman" value="woman">
			<label for="woman">여성</label>
		</div>
		<input type="hidden" name="gender" id="genderValue">
		<br>

		<!------------ 이용약관 ------------->
		<div id="checkList">
			<div id="allAgree">
				<input type="checkbox" id="all" onchange="allCheck();">
				<label for="all">전체 선택</label>
			</div>
			<div id="selectAgree">
				<div>
					<input type="checkbox" id="first" class="selectBox" required="required"
						> <label for="first"><a
						style="color: red;">(필수)</a> 당근마켓 이용약관 동의</label> <img
						src="../img/arrow-204-32.png" onclick="termsSwitch(1);">
				</div>
				<div class="terms">
					<textarea readonly>이용 약관1</textarea>
				</div>
				<div>
					<input type="checkbox" id="second" class="selectBox" required="required"
						> <label for="second"><a
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
	
	// 이메일 주소 값 변경시 이벤트
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
	
	// 이메일 아이디 중복확인 이벤트
	var idck = 0;
	$(function() {
	    $("#idCheck").click(function() {
	    	var id =  $("#email").val() + "@" + $('#writeEmail').val();
	    	console.log(id);
			$.ajax({
				async : true,
				data : id,
				type : "POST",
				url : "idCheck.do",
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.check > 0) {
						alert("이미 사용중인 아이디 입니다.");
					} else if (data.check == 0) {
						alert("사용 가능한 아이디 입니다.");
						document.getElementById("emailCheck").disabled = false;
						document.getElementById("emailIdAll").value = id;
						idck = 1;
					}
				},
				error : function(error) {
					alert("조건에 맞게 아이디를 입력하세요");
				}
			});
		});
	});
	
	// 닉네임 중복확인 클릭 이벤트
	var nickCheck = 0;
	$(function() {
	    $("#nickCheck").click(function() {
	    	var nick =  $("#nickname").val();
	    	console.log(nick);
			$.ajax({
				async : true,
				data : nick,
				type : "POST",
				url : "nickCheck.do",
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.nickCheck > 0) {
						alert("이미 사용중인 닉네임 입니다.");
					} else if (data.nickCheck == 0) {
						alert("사용 가능한 닉네임 입니다.");
						nickCheck = 1;
					}
				},
				error : function(error) {
					alert("조건에 맞게 닉네임을 입력하세요");
				}
			});
			
		});
	});

	// 회원가입 버튼 클릭 시 아이디, 닉네임 중복확인 안눌렀을때 이벤트
	$(function() {
		$("#join-submit").click(function() {
			if (idck == 0) {
				alert("아이디를 확인하세요.");
			} else {
				if (nickCheck == 0) {
					alert("닉네임을 확인하세요.");
				}
			}
		});
	});
	
	// 문자인증 버튼 클릭 시 이벤트
	var code = "";
	$("#phoneCheck").click(function() {
		$(function() {
	    	var phone =  $("#phone").val();
	    	console.log(phone);
			$.ajax({
				async : true,
				data : phone,
				type : "POST",
				url : "phoneCheck.do",
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.phoneCheck > 0) {
						alert("이미 등록된 번호 입니다.");
					} else if (data.phoneCheck == 0) {
						alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
						var phone = $("#phone").val();
						$.ajax({
							type : "GET",
							url : "phoneCheck.do?phone=" + phone,
							cache : false,
							success : function(data) {
								if (data == "error") {
									alert("휴대폰 번호가 올바르지 않습니다.")
									$(".successPhoneCheck").text("유효한 번호를 입력해주세요.");
									$(".successPhoneCheck").css("color", "red");
									$("#phone").attr("autofocus", true);
								} else {
									$("#phone2").attr("disabled", false);
									$("#phoneCheck2").css("display", "inline-block");
									$(".successPhoneCheck").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
									$(".successPhoneCheck").css("color", "green");
									$("#phone").attr("readonly", true);
									code = data;
								}
							}
						});
					}
				},
				error : function(error) {
					alert("조건에 맞게 닉네임을 입력하세요");
				}
			});
		});
	});

	// 문자 인증확인 버튼 클릭 시 이벤트
	$("#phoneCheck2").click(function(){
		if($("#phone2").val() == code){
			$(".successPhoneCheck").text("인증번호가 일치합니다.");
			$(".successPhoneCheck").css("color","green");
			$("#phoneDoubleCheck").val("true");
			$("#phone2").attr("disabled",true);
		}else{
			$(".successPhoneCheck").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successPhoneCheck").css("color","red");
			$("#phoneDoubleCheck").val("false");
			$(this).attr("autofocus",true);
		}
	});
	
	// 이메일 인증발송 버튼 클릭 시 이벤트
	var code = "";
	$("#emailCheck").click(function(){
		var email_id = $("#email").val() + "@" + $('#writeEmail').val();
		console.log(email_id);
		$.ajax({
	        type:"GET",
	        url:"mailCheck.do?email_id=" + email_id,
	        cache : false,
	        success:function(data){
	        	if(data == "error"){
	        		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
					$("#email").attr("autofocus",true);
					$(".successEmailCheck").text("유효한 이메일 주소를 입력해주세요.");
					$(".successEmailCheck").css("color","red");
	        	}else{	        		
					alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
	        		$("#email2").attr("disabled",false);
	        		$("#emailCheck2").css("display","inline-block");
	        		$(".successEmailCheck").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
	        		$(".successEmailCheck").css("color","green");
	        		code = data;
	        	}
	        }
	    });
	});
	
	// 이메일 인증 확인 버튼 클릭 시 이벤트
	$("#emailCheck2").click(function(){
		console.log(code);
		if($("#email2").val() == code){
			$(".successEmailCheck").text("인증번호가 일치합니다.");
			$(".successEmailCheck").css("color","green");
			$("#emailDoubleCheck").val("true");
			$("#email2").attr("disabled",true);
			$("#emailCheck").attr("disabled",true);
			$("#emailCheck2").attr("disabled",true);			
		}else{
			$(".successEmailCheck").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successEmailCheck").css("color","red");
			$("#emailDoubleCheck").val("false");
			$("#email2").attr("autofocus",true);
		}
	});
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
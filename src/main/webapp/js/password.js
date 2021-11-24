
var pstate = 0;
var pcstate = 0;
var code = 0;
var pwcheck = 0;
/*
	pstate = 핸드폰번호 인증 했나 안했나
	pcstate = 핸드폰번호 인증 받아서 일치 불일치
*/
function updatePw(){
	
	
	var id = $("#id").val();
	var name = $("#pwname").val();
	var phone = $("#pwphone").val();
	var phone2 = $("#pwphone2").val();
	
	console.log(id);
	console.log(name);
	console.log(phone);
	console.log(phone2);
	
	if(id == ""){
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		return;
	}
	if(name == ""){
		alert("이름을 입력해주세요.");
		$("#pwname").focus();
		return;
	}
	
	if(phone == ""){
		alert("핸드폰 번호를 입력해주세요.");
		$("#pwphone").focus();
		return;
	}
	
	if(phone2 == ""){
		alert("인증번호를 입력해주새요.");
		return;
	}
	
	if(pcstate != 0 && pstate != 0){
		
	
		$.ajax({
			type: "POST",
			url: "find_pw.do",
			data: {id: id, name: name, phone: phone},
			success:function(flag){
				console.log(flag);
				if(flag ==  1){
					alert("성공");
					location.href="update_pw.do?email_id="+id;
				}else{
					alert("실패");
					location.reload;
				}
			}
		});
	}else if(pstate == 0){
		alert("인증번호를 요청해주세요.");
	}else if(pcstate == 0){
		alert("인증버튼을 눌러주세요.");
	}else if(pcstate == 2){
		alert("인증번호가 일치하지않습니다.");
	}
	
}
 function phoneCheck(){
		var phone = $("#pwphone").val();
		console.log(phone);
		$.ajax({
				async : true,
				data : phone,
				type : "POST",
				url : "phoneCheck.do",
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8",
				success : function() {
						alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
						var phone = $("#phone").val();
						$.ajax({
							type : "GET",
							url : "phoneCheck.do?phone=" + phone,
							cache : false,
							success : function(data) {
								if (data == "error") {
									alert("휴대폰 번호가 올바르지 않습니다.")
								} else {
									$("#pwphone2").attr("disabled", false);
									$("#pwphoneCheck2").css("display", "inline-block");
									$("#pwphone").attr("readonly", true);
									code = data;
									console.log(code);
									pstate = 1;
								}
							}
						});
					
				},
				error : function(error) {
					alert("핸드폰 번호를 입력하세요.");
				}
			});
}
	function numcheck(){
			
			if($("#pwphone2").val() == code){
				alert("인증번호가 일치합니다.");
				$("#pwphone2").attr("disabled",true);
				pcstate = 1;
			}else{
				alert("인증번호가 일치하지 않습니다.");
				$("#phoneDoubleCheck").val("false");
				pcstate = 2;
			}
	}



function correctPw(){
	var id = $("#email_id").val();
	var fPw = $('#fPw').val();
	var sPw = $('#sPw').val();
	
	var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}$/;
	console.log(fPw);
	console.log(sPw);
	if(fPw == "" || sPw == ""){
		if(fPw == ""){
			alert('비밀번호를 입력해주세요');
			console.log("1"+id);
			return;
		}else if(sPw == ""){
			alert('확인용 비밀번호를 입력해주세요');
			return;
		}
	}else{
		if(fPw == sPw){
			alert("비밀번호가 일치합니다.");
			if(fPw.match(regex)){
				$("#fPw").attr("readonly", true);
				$("#sPw").attr("readonly", true);
				pwcheck = 1;
				return;
			}else{
				alert("8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			}
		}else{
			alert("비밀번호가 일치하지않습니다.");
			return;
		}
	}
}

function pwsubmit(){
	var fPw = $("#fPw").val();
	var sPw = $("#sPw").val();
	
	
	if(pwcheck == 1){
		$("#updateForm").submit();
		
	}else{
		alert("비밀번호 확인버튼을 눌러주세요.");
		
	}
	
}
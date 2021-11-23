       var skip = document.getElementByPw('password');
       skip.addEventListener('input', ssnMask, false);
       var firstThree = "";
       var second = "";
       var last = "";

       function ssnMask(){
           if (skip.value.length <= 3){
        	   skip.type = 'password';
           }
           else{
               detectChanges();
               second = skip.value.substring(3);
               skip.type = 'text';
               skip.value = "•••";
               skip.value += second;
               last = firstFive + second;
           }
       }

       function change() {
           for (var i = 0; i < 5; i++){
               if (skip.value[i] != "•"){
            	   firstThree = firstThree.substring(0, i) + password.value[i] + firstThree.substring(i+1);
               }
           }
       }

 function phoneCheck(){
		var phone = $("#phone").val();
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
								} else {
									$("#phone2").attr("disabled", false);
									$("#phoneCheck2").css("display", "inline-block");
									$("#phone").attr("readonly", true);
									code = data;
									console.log(code);
									pstate = 1;
								}
							}
						});
					}
				},
				error : function(error) {
					alert("핸드폰 번호를 입력하세요.");
				}
			});
}
	function numcheck(){
			
			if($("#phone2").val() == code){
				alert("인증번호가 일치합니다.");
				$("#phone2").attr("disabled",true);
				pcstate = 1;
			}else{
				alert("인증번호가 일치하지 않습니다.");
				$("#phoneDoubleCheck").val("false");
			}
	}
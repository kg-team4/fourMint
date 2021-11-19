
function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 및 취소 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });
	
	modal.querySelector('.modal_cancle_btn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

document.getElementById('popup_open_info').addEventListener('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});

//프로필 사진 수정하기
$(function() {
		$(".form-input").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.preview-wrap').attr('src', e.target.result);				
			}

			reader.readAsDataURL(input.files[0]);
		}
		$('.preview-wrap').show();
	}

/* 상세주소 제외 입력 */
function findAddr() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("post_addr").value = data.zonecode;
			document.getElementById("base_addr").value = addr;
		}
	}).open();
}


/*기본 사용자 주소 수정 */
function updateAddr(){
		var address1 = $("#post_addr").val();
		var address2 = $("#base_addr").val();
		var address3 = $("#detail_addr").val();
		
		if(address1==""){
			alert('주소 검색을 해주세요!');
			return alert;
		}else if(address3==""){
			alert('상세주소를 입력해주세요!');
		}else{
			
			console.log(address1);
			console.log(address2);
			console.log(address3);
			$.ajax({
				type: "POST",
				url: "/updateAddr.do",
				data: { addr1: address1, addr2: address2, addr3: address3},
				success: function(res){
					alert('주소 수정 성공');
					location.replace(res);
				},
				error: function(){
					console.error();
				}
			});
			
		}
}


function pwCheck(){
	var pw = $("#pw").val();
	console.log(pw);
	
	var mymodal = new bootstrap.Modal(document.getElementById('pwCheck'));
	$.ajax({
		type: "POST",
		url: "/pwCheck.do",
		data: {pw: pw},
		success:function(res){
			console.log(res);
			if(res == 1){
				alert("성공");
				openNewPw();
				mymodal.hide();
			}else{
				alert("비밀번호가 틀렸습니다.");
			}
		},
		error:function(){
			console.error();
		}
	});
}
function correctPw(){
	var fPw = $('#fPw').val();
	var sPw = $('#sPw').val();
	
	var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}$/;
	console.log(fPw);
	console.log(sPw);
	if(fPw == "" || sPw == ""){
		if(fPw == ""){
			alert('비밀번호를 입력해주세요');
			return;
		}else if(sPw == ""){
			alert('확인용 비밀번호를 입력해주세요');
			return;
		}
	}else{
		if(fPw == sPw){
			alert("비밀번호가 일치합니다.");
			if(fPw.match(regex)){
				$.ajax({
					type: "POST",
					url: "/pwCheck.do",
					data: {pw: fPw},
					success:function(res){
						console.log(res);
						if(res == 1){
							alert("이전 비밀번호와 동일합니다.");
						}else{
							alert("사용 가능한 비밀번호입니다.");
						}
					},
					error:function(){
						console.error();
					}
				});
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
function updatePw(){
	var fPw = $('#fPw').val();
	var sPw = $('#sPw').val();
	
	var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}$/;
	console.log(fPw);
	console.log(sPw);
	if(fPw == "" || sPw == ""){
		if(fPw == ""){
			alert('비밀번호를 입력해주세요');
			return;
		}else if(sPw == ""){
			alert('확인용 비밀번호를 입력해주세요');
			return;
		}
	}else{
		if(fPw == sPw){
			alert("비밀번호가 일치합니다.");
			if(fPw.match(regex)){
				$.ajax({
					type: "POST",
					url: "/pwCheck.do",
					data: {pw: fPw},
					success:function(res){
						console.log(res);
						if(res == 1){
							alert("이전 비밀번호와 동일합니다.");
						}else{
							 document.getElementById("pwForm").action = "/updatePw.do";
							 document.getElementById("pwForm").submit();
							 alert("변경 성공");
						}
					},
					error:function(){
						console.error();
					}
				});
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
	
function openNewPw(){
	var myModal = new bootstrap.Modal(document.getElementById('newPw'), {
  		keyboard: false
	});
	myModal.show();
}

function pwCheck(){
	var pw = $("#pw").val();
	console.log(pw);
	
	var mymodal = new bootstrap.Modal(document.getElementById('pwCheck'));
	$.ajax({
		type: "POST",
		url: "/pwCheck.do",
		data: {pw: pw},
		success:function(res){
			console.log(res);
			if(res == 1){
				alert("성공");
				openNewPw();
				mymodal.hide();
			}else{
				alert("비밀번호가 틀렸습니다.");
			}
		},
		error:function(){
			console.error();
		}
	});
}

function secession(){
	var pw = $("#cpw").val();
	console.log(pw);
	$.ajax({
		type: "POST",
		url: "/pwCheck.do",
		data: {pw: pw},
		success:function(res){
			console.log(res);
			if(res == 1){
				alert("탈퇴 성공");
				location.href = "/secession.do";
			}else{
				alert("비밀번호가 틀렸습니다.");
			}
		},
		error:function(){
			console.error();
		}
	});

}

function doubleCheck(){
	var nick = $("#nick").val();
	var nickCheck = 0;
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
}
var code = "";

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
			}else{
				alert("인증번호가 일치하지 않습니다.");
				$("#phoneDoubleCheck").val("false");
			}
	}
	
function checkBirth() {
	var birth = $('#birth').val();
	console.log(birth);
	var regex = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;

	if (birth.match(regex) == null) {
		alert("생년월일을 정확히 입력해주세요");
	} else if (birth.match(regex) != null) {
		alert("성공");
		$("#birth").attr("disabled", false);
		$("#birthCheck").css("display", "inline-block");
		$("#birth").attr("readonly", true);
	}
}
function sns_secession(){
	
	  if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
            $.ajax({
            	url: 'secession.do',
            	success: function(res){
					let url = 'home.do';
					location.replace(url);
            	},
            	
            	fail: function(error){
            		console.log(error.message)
            	}
            })
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }else{
		window.location="/secession.do";
	}
}
function updateSns(){

}

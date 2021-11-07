function navSwitch() {
	var navMenu = document.querySelector(".nav-menu");

	if (navMenu.classList.length == 1 || navMenu.classList.item(1) == "off") {
		navMenu.classList.remove("off");
		navMenu.classList.add("on");
	} else {
		navMenu.classList.remove("on");
		navMenu.classList.add("off");
	}
};

/*function changeTextBar() {
	var selectEmail = document.querySelector("#selectEmail");
	var a = document.querySelector(".a");
	var inputEmail = document.querySelector("#inputEmail");

	if (inputEmail == null) {
		if (selectEmail.value == "직접 입력") {
			var input = document.createElement("input");
			input.setAttribute("name", "email_2");
			input.setAttribute("id", "inputEmail");
			input.setAttribute("placeholder", "이메일 주소")
			input.setAttribute("oninput", "checkId();")
			a.appendChild(input);
		}
	} else {
		if (selectEmail.value != "직접 입력") {
			a.removeChild(a.childNodes[0]);
		}
	}
}*/

function allCheck() {
	var all = document.querySelector("#all").checked;
	var selectBox = document.querySelectorAll(".selectBox");

	for (var i in selectBox) {
		selectBox[i].checked = all;
	}

	console.log(selectBox.length);
}

function termsSwitch(num) {
	var terms = document.querySelectorAll(".terms");

	if (num == 1) {

		if (terms[0].classList.length == 1) {
			terms[0].classList.add("active");
		} else {
			terms[0].classList.remove("active");
		}

	} else if (num == 2) {

		if (terms[1].classList.length == 1) {
			terms[1].classList.add("active");
		} else {
			terms[1].classList.remove("active");
		}

	} else if (num == 3) {

		if (terms[2].classList.length == 1) {
			terms[2].classList.add("active");
		} else {
			terms[2].classList.remove("active");
		}
	}
}

/* 아이디 검증 */
function checkId() {
	var inputEmail = document.querySelector("#email").value;
	var writeEmail = document.getElementById("writeEmail").value;

	var regex = /^[A-za-z0-9]{5,15}$/gi;

	var idInfo = document.querySelector("#idInfo");
	var idInfoText = document.querySelector("#idInfoText");

	if (inputEmail != null) {
		if (inputEmail.match(regex) == null && idInfoText == null) {
			var idInfoText = document.createElement("div");
			idInfoText.textContent = "5~15자 영문자, 숫자를 사용하세요.";
			idInfoText.setAttribute("id", "idInfoText");
			idInfoText.setAttribute("style", "color: red; font-size: 12px;");
			idInfo.appendChild(idInfoText);
			document.getElementById("idCheck").disabled = true;
		} else if (inputEmail.match(regex) != null && idInfoText != null) {
			idInfo.removeChild(idInfo.childNodes[0]);
			if (writeEmail == "선택" || writeEmail == "") {
				document.getElementById("idCheck").disabled = true;
			} else {
				document.getElementById("idCheck").disabled = false;
			}
		}
	}
}

/* 이메일 검증 */
function checkEmail() {
	var writeEmail = document.querySelector("#writeEmail").value;

	var regex2 = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	var emailInfo = document.querySelector("#emailInfo");
	var emailInfoText = document.querySelector("#emailInfoText");
	if (writeEmail != null) {
		if (writeEmail.match(regex2) == null && emailInfoText == null) {
			var emailInfoText = document.createElement("div");
			emailInfoText.textContent = "올바른 주소를 입력하세요.";
			emailInfoText.setAttribute("id", "emailInfoText");
			emailInfoText.setAttribute("style", "color: red; font-size: 12px;");
			emailInfo.appendChild(emailInfoText);
			document.getElementById("idCheck").disabled = true;
		} else if (writeEmail.match(regex2) != null && emailInfoText != null) {
			emailInfo.removeChild(emailInfo.childNodes[0]);
		}
	}
}

/* 이메일 인증번호 6자리 입력 후 버튼 상태 변경 */
function EmailNumberBtnState() {
	var email = document.getElementById("email2").value;

	if (email.length != 6) {
		document.getElementById("emailCheck2").disabled = true;
	} else {
		document.getElementById("emailCheck2").disabled = false;
	}
}

/* 이메일 선택 시 버튼 상태변화 */
function changeOption() {
	var btnElement = document.getElementById('writeEmail').value;

	console.log(btnElement);
	if (btnElement == "" || btnElement == "선택") {
		document.getElementById("idCheck").disabled = true;
	} else {
		if (document.getElementById("email").value == "") {
			document.getElementById("idCheck").disabled = true;
		} else {
			document.getElementById("idCheck").disabled = false;
		}
	}
}

/* 비밀번호 검증 */
function pwValidation() {
	var pw = document.querySelector("input[name=password]").value;

	var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}$/;

	var pwInfo = document.querySelector("#pwInfo");
	var pwInfoText = document.querySelector("#pwInfoText");

	if (pw.match(regex) == null && pwInfoText == null) {

		var pwInfoText = document.createElement("div");
		pwInfoText.textContent = "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
		pwInfoText.setAttribute("id", "pwInfoText");
		pwInfoText.setAttribute("style", "color: red; font-size: 12px;");
		pwInfo.appendChild(pwInfoText);

	} else if (pw.match(regex) != null && pwInfoText != null) {

		pwInfo.removeChild(pwInfo.childNodes[0]);

	}
}

/* 비밀번호 확인 */
function pwCheck() {
	var p1 = document.querySelector("input[name=password]").value;
	var p2 = document.querySelector("input[id=passwordCheck]").value;

	var pwInfo = document.querySelector("#pwCheckInfo");
	var pwCheckInfoText = document.querySelector("#pwCheckInfoText");

	if (p1 != p2) {
		var pwCheckInfoText = document.createElement("div");
		pwCheckInfoText.textContent = "비밀번호가 일치하지 않습니다."
		pwCheckInfoText.setAttribute("id", "pwCheckInfoText");
		pwCheckInfoText.setAttribute("style", "color: red; font-size: 12px;");
		pwInfo.appendChild(pwCheckInfoText);
	} else {
		pwInfo.removeChild(pwInfo.childNodes[0]);
	}

	if (pwInfo.childElementCount >= 2) {
		pwInfo.removeChild(pwInfo.childNodes[0]);
	}
}

/* 모르겠음 이거는 비밀번호 변경같은데 회원가입에 왜 필요한지... 슈발 */
function editcheckPw() {
	var pw = document.querySelector("input[name=check_pw]").value;

	var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}/;

	var editpwInfo = document.querySelector("#editpwInfo");
	var editpwInfoText = document.querySelector("#editpwInfoText");

	if (pw.match(regex) == null && editpwInfoText == null) {

		var pwInfoText = document.createElement("div");
		pwInfoText.textContent = "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
		pwInfoText.setAttribute("id", "editpwInfoText");
		pwInfoText.setAttribute("style", "color: red; font-size: 12px;");
		editpwInfo.appendChild(pwInfoText);

	} else if (pw.match(regex) != null && editpwInfoText != null) {

		editpwInfo.removeChild(editpwInfo.childNodes[0]);

	}
}

/* 닉네임 검증, 버튼 토글 상태 포함 */
function checkNick() {
	var nick = document.querySelector("input[name=nickname]").value;

	var regex = /^[가-힣]{3,8}$/;

	var nickInfo = document.querySelector("#nickInfo");
	var nickInfoText = document.querySelector("#nickInfoText");

	if (nick.match(regex) == null && nickInfoText == null) {
		var nickInfoText = document.createElement("div");
		nickInfoText.textContent = "3 ~ 8 자 이내의 한글을 사용하세요.";
		nickInfoText.setAttribute("id", "nickInfoText");
		nickInfoText.setAttribute("style", "color: red; font-size: 12px;");
		nickInfo.appendChild(nickInfoText);
		document.getElementById("nickCheck").disabled = true;
	} else if (nick.match(regex) != null && nickInfoText != null) {
		nickInfo.removeChild(nickInfo.childNodes[0]);
		document.getElementById("nickCheck").disabled = false;
	}
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

/* 상세주소 입력 안했을 때 */
function checkAddr() {
	var addr = document.querySelector("input[id=detail_addr]").value;

	var addrInfo = document.querySelector("#addrInfo");
	var addrInfoText = document.querySelector("#addrInfoText");

	if (addr.length == 0) {
		var addrInfoText = document.createElement("div");
		addrInfoText.textContent = "상세주소를 입력하세요";
		addrInfoText.setAttribute("id", "addrInfoText");
		addrInfoText.setAttribute("style", "color: red; font-size: 12px;");
		addrInfo.appendChild(addrInfoText);
	} else {
		if (addrInfo.hasChildNodes() == true) {
			addrInfo.removeChild(addrInfo.childNodes[0]);
		}
	}
}

/* 핸드폰번호 검증 */
function checkPhone() {
	var phone = document.querySelector("input[name=phone]").value;

	var regex = /^010\d{4}\d{4}$/;

	var phoneInfo = document.querySelector("#phoneInfo");
	var phoneInfoText = document.querySelector("#phoneInfoText");

	if (phone.match(regex) == null && phoneInfoText == null) {
		var phoneInfoText = document.createElement("div");
		phoneInfoText.textContent = "휴대폰 번호를 정확히 입력해주세요.";
		phoneInfoText.setAttribute("id", "phoneInfoText");
		phoneInfoText.setAttribute("style", "color: red; font-size: 12px;");
		phoneInfo.appendChild(phoneInfoText);
		document.getElementById("phoneCheck").disabled = true;
	} else if (phone.match(regex) != null && phoneInfoText != null) {
		phoneInfo.removeChild(phoneInfo.childNodes[0]);
		document.getElementById("phoneCheck").disabled = false;
	}
}

/* 문자 전송 */
function sendSMS(pageName) {
	console.log("문자를 전송합니다.");
	$("#frm").attr("action", pageName + ".do"); //위에 있는 폼태그를 컨트롤러로 전송한다.
	$("#frm").submit();
}

/* 문자 인증번호 4자리 입력 후 버튼 상태 변경 */
function phoneBtnState() {
	var phone = document.getElementById("phone2").value;

	if (phone.length != 4) {
		document.getElementById("phoneCheck2").disabled = true;
	} else {
		document.getElementById("phoneCheck2").disabled = false;
	}
}


/* 생년월일 검증 */
function checkBirth() {
	var birth = document.querySelector("input[name=birth]").value;

	var regex = /([0-9]{2}(0[1,3-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;

	var birthInfo = document.querySelector("#birthInfo");
	var birthInfoText = document.querySelector("#birthInfoText");

	if (birth.match(regex) == null && birthInfoText == null) {
		var birthInfoText = document.createElement("div");
		birthInfoText.textContent = "생년월일을 정확히 입력해주세요.";
		birthInfoText.setAttribute("id", "birthInfoText");
		birthInfoText.setAttribute("style", "color: red; font-size: 12px;");
		birthInfo.appendChild(birthInfoText);
	} else if (birth.match(regex) != null && birthInfoText != null) {
		birthInfo.removeChild(birthInfo.childNodes[0]);
	}
}

/* 성별 체크 시 히든으로 값 전송*/
function getGender(event) {
	document.getElementById("genderValue").value = event.target.value;
}
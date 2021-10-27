<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="./js/join.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="../css/6.join.css" type="text/css" rel="stylesheet">

        <article class="join-article">
            <form action="joinProc.user" method="get" class="join-form">
           		<div>
            		<img src="../img/logo_icon.png" alt="logo_icon" id="logo_icon">
            	</div>
                <div class="email-form">
                    <input type="text" name="email_id" placeholder="이메일" id="email" required="required">
                    <span style="color: #50b9abd0;">@</span>
                    <span class="a"></span>
                    <select name="email" onchange="changeTextBar();" id="selectEmail" required="required">
                        <option value="">선택</option>
                        <option value="@gmail.com">gmail.com</option>
                        <option value="@naver.com">naver.com</option>
                        <option value="직접 입력" id="writeEmail">직접 입력</option>
                    </select>
                </div>
                <div id="idInfo"></div>
                <div>
                    <input type="password" name="password" placeholder="비밀번호" required="required" maxlength="15" oninput="checkPw();">
                </div>
                <div id="pwInfo"></div>
                <div>
                    <input type="text" name="nickname" placeholder="닉네임" required="required" maxlength="10" oninput="checkNick();">
                </div>
                <div id="nickInfo"></div>
                <div id="addr">
                    <input type="text" name="state" placeholder="시 / 도" id="state" readonly required="required">
                    <input type="text" name="city" placeholder="구 / 시" id="city" readonly required="required">
                    <input type="text" name="base" placeholder="동 / 읍 / 면" id="base" readonly required="required">
                    <input type="button" onclick="findAddr(); " value="">
                </div>
                <div>
                    <input type="text" name="phone" placeholder="휴대전화" required="required" maxlength="11" oninput="checkPhone();">
                </div>
                <div id="phoneInfo"></div>
                <div id="checkList">
                    <div id="allAgree">
                        <input type="checkbox" id="all" onchange="allCheck();">
                        <label for="all">전체 선택</label>
                    </div>
                    <div id="selectAgree">
                        <div>
                            <input type="checkbox" id="first" class="selectBox" required="required">
                            <label for="first"><a style="color: red;">(필수)</a> 당근마켓 이용약관 동의</label>
                            <img src="../img/arrow-204-32.png" onclick="termsSwitch(1);">
                        </div>
                        <div class="terms">
                            <textarea readonly>이용 약관1</textarea>
                        </div>
                        <div>
                            <input type="checkbox" id="second" class="selectBox" required="required">
                            <label for="second"><a style="color: red;">(필수)</a> 개인정보 처리 방침 동의</label>
                            <img src="../img/arrow-204-32.png" onclick="termsSwitch(2);">
                        </div>
                        <div class="terms">
                            <textarea readonly>이용 약관2</textarea>
                        </div>
                        <div>
                            <input type="checkbox" id="third" class="selectBox">
                            <label for="third"><a style="color: gray;">(선택)</a> 이메일 , SMS 광고 수신 동의</label>
                            <img src="../img/arrow-204-32.png" onclick="termsSwitch(3);">
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

<jsp:include page="../template/footer.jsp"></jsp:include>
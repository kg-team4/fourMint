<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- css -->
<footer>
	
	<div class="footer-right">

		<h3>CALL CENTER</h3>
		<p>
			1588-8282<br> AM 09:00 ~ 18:00<br> SAT 10:00 ~ 13:00
		</p>
	</div>
	<div class="footer-center">

		<p class="link">
			<a href="">이용약관</a>&nbsp; | &nbsp;
			<a href="">개인정보처리방침</a>&nbsp; | &nbsp;
			<a href="">위치기반서비스</a>&nbsp; | &nbsp;
			<a href="">회사 소개</a>
		</p>
		<p>
			서울 종로구 돈화문로 26 단성사 4층
			<br> 
			사업자 등록번호 : 010-0000-4919  &nbsp; (주)민트마켓 대표 이승재
			<br>
			<span class="copyright">COPYRIGHT Mint Market Inc. ALL RIGHTS RESERVED.</span>
		</p>
	</div>
	<div class="footer-left">
		<p>
			대표이사, 개인정보 책임자 : 이승재 <br> 
			TEL : 02-0000-0000 <br>
			FAX : 02-000-0001 <br>
			E-MAIL : asd4919@daum.net
		</p>
	</div>
</footer>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

	 Kakao.init('3095bed7ad41f197a883fe4fb8b87ee3');
	 console.log(Kakao.isInitialized());

//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
    	console.log('1',response)
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
             console.log(response)
             $.ajax({
					type: "POST",
					url: "kakaoLogin.do",
					data: JSON.stringify(response.kakao_account),
					contentType: "application/json",
					success: function(res) {
						console.log('success');
						
						let url = 'home.do';
						console.log(url);
						
						location.replace(url);
						/*  location.href="http://localhost:8080/home.do"; */ 
					},
				})
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  } 
  
/* id: 1989267508
kakao_account:
birthday: "0827"
birthday_needs_agreement: false
birthday_type: "SOLAR"
email: "gudwns0827@gmail.com"
email_needs_agreement: false
gender: "male"
gender_needs_agreement: false
has_birthday: true
has_email: true
has_gender: true
is_email_valid: true
is_email_verified: true
profile:
nickname: "장형준" */
//카카오로그아웃
function kakaoLogout() {
	
	console.log("!!!!!!!")
	
     if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
            console.log(response)
            
            $.ajax({
            	url: 'kakaoLogout.do',
            	success: function(res){
            		console.log('success')
            		
            		console.log('success');
					
					let url = 'home.do';
					console.log(url);
					
					location.replace(url);
            	},
            	/* location.href = "http:localhost:8080/home.do", */
            	
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
    }
  } 
</script>
</body>
</html>

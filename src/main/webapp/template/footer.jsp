<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- css -->
<footer>
	
	<div class="footer-right">

		<a href="storeServiceCenter.do" style="font-size:20px"><strong>고객센터</strong></a>
		<p>
			1588-8282<br> 09:00 ~ 18:00<br> SAT 10:00 ~ 13:00
		</p>
	</div>
	<div class="footer-center">

		<p class="link">
			<a href="useAgreement.do">이용약관</a>&nbsp; | &nbsp;
			<a href="privacyPolicy.do">개인정보처리방침</a>&nbsp; | &nbsp;
			<a href="locationPolicy.do">위치기반서비스</a>
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
<script>

	 Kakao.init('3095bed7ad41f197a883fe4fb8b87ee3');
	 console.log(Kakao.isInitialized());

//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
             $.ajax({
					type: "POST",
					url: "kakaoLogin.do",
					data: JSON.stringify(response.kakao_account),
					contentType: "application/json",
					success: function(res) {
						let url = 'home.do';
						location.replace(url);
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
  
//카카오로그아웃
function kakaoLogout() {
     if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
            $.ajax({
            	url: 'kakaoLogout.do',
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
    }
  } 
</script>
</body>
</html>

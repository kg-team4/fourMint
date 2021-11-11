package four.mint.web.user;

public interface SnsUrls {
	
	// 네이버 로그인 연동 url 생성
	static final String NAVER_AUTH = "https://nid.naver.com/oauth2.0/authorize";
	/*
	 * 네이버 접근 토큰 발급 
	 * grant_type 인증 과정에 대한 구분값 발급 : authorization_code
	*/
	static final String NAVER_ACCESS_TOKEN = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	
	// 접근 토큰을 이용하여 프로필 api를 호출 
	static final String NAVER_PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
	
	// 카카오 연동 url
	static final String KAKAO_AUTH = "https://kauth.kakao.com/oauth/authorize";
	
	//카카오 접근 토큰 발급
	static final String KAKAO_ACCESS_TOKEN = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code";
	
	//카카오 계정과 함께 로그아웃 rest_api_key + redirect_uri(logout)
	static final String KAKAO_LOGOUT = "https://kauth.kakao.com/ouath/logout";
	
	// 접근 토큰을 이용하여 프로필 api를 호출
	static final String KAKAO_PROFILE_URL = "https://kapi.kakao.com/v2/user/me";

}

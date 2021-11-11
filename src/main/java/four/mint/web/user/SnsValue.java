package four.mint.web.user;



import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SnsValue implements SnsUrls {
	
//	 bean에 있는 정보 저장용
	private String service;
	private String clientId;
	private String redirectUrl;
	private String clientSecret;
	private DefaultApi20 api20Instance;
	private String profileUrl;
	
//	 api 구분용
	private boolean isNaver;
	private boolean isKakao;
	
	
	//네이버
	public SnsValue(String service, String clientId, String clientSecret, String redirectUrl) {		
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		
		this.isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
		this.isKakao = StringUtils.equalsIgnoreCase("kakao", this.service);
		if(isNaver) {
		this.api20Instance = NaverAPI20.instance();
		this.profileUrl = NAVER_PROFILE_URL;
		}else {
			this.api20Instance = KakaoAPI20.instance();
			this.profileUrl = KAKAO_PROFILE_URL;
		}
	}
	//카카오
//	public SnsValue(String service, String clientId, String redirectUrl) {
//		this.service = service;
//		this.clientId = clientId;
//		this.redirectUrl = redirectUrl;
//		this.api20Instance = KakaoAPI20.instance();
//		this.profileUrl = KAKAO_PROFILE_URL;
//	}
	

}

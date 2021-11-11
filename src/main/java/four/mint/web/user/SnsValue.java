package four.mint.web.user;

import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SnsValue implements SnsUrls{
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private String service;
	private String profileUrl;
	private DefaultApi20 api20Instance;
	
	
	private boolean isNaver;
	private boolean isKakao;
	
	public SnsValue(String service, String cid, String cs, String rurl) {
		this.service = service;
		this.clientId = cid;
		this.clientSecret = cs;
		this.redirectUrl = rurl;
		
		
		//sns에 비교 후 맞으면 true 값으로 변환
		this.isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
		this.isKakao = StringUtils.equalsIgnoreCase("kakao", this.service);
		
		//sns 비교 후 맞는 url 전송
		if(StringUtils.equalsIgnoreCase(service, "naver")) {
			this.api20Instance = NaverAPI20.instance();
			this.profileUrl = NAVER_PROFILE_URL;
		}else {
			this.api20Instance = KakaoAPI20.instance();
			this.profileUrl = KAKAO_PROFILE_URL;
		}
	}

	
	
}

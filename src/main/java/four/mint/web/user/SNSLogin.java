package four.mint.web.user;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuth2AccessTokenErrorResponse;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	//callback - - build 사이 .scope("profile_nickname,profile_image,account_email,gender,birthday")
	public SNSLogin(SnsValue sns) {
		System.out.println("1:"+sns);
		if(sns.isKakao()) {
			this.oauthService = new ServiceBuilder(sns.getClientId())
					.callback(sns.getRedirectUrl())
					.scope("profile_nickname,profile_image,account_email,gender,birthday")
					.build(sns.getApi20Instance());
					
			System.out.println("Kakao :" + sns);
			System.out.println("oauth "+this.oauthService);
			this.sns = sns;
		}else {
			this.oauthService =  new ServiceBuilder(sns.getClientId())
							.apiSecret(sns.getClientSecret())
							.callback(sns.getRedirectUrl())
							.scope("profile")
							.build(sns.getApi20Instance());
			this.sns = sns;
			System.out.println("Naver :" + sns);
			System.out.println(this.oauthService);
		}
	}
	
	public String getKakaoAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	//user
	public String getUserProfile(String code)throws Exception, OAuth2AccessTokenErrorResponse{
		
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		System.out.println("accessToken:"+accessToken);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		
		return response.getBody();
//		return parseJson(response.getBody());
		
		
	}
	
	private User parseJson(String body)throws Exception{
		
			User user = new User();
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode rootNode = mapper.readTree(body);
			
			if(sns.isKakao()) {
				JsonNode resNode = rootNode.path("kakao_account");
				String email = resNode.path("email").asText();
				user.setEmail(email);
			}else {
				JsonNode resNode = rootNode.get("response");
				user.setNaverid(resNode.get("id").asText());
				user.setNickname(resNode.get("nickname").asText());
				user.setGender(resNode.get("gender").asText());
				user.setEmail(resNode.get("email").asText());
				user.setMobile(resNode.get("mobile").asText());
				user.setName(resNode.get("name").asText());
				user.setBirthday(resNode.get("birthyear").asText() + resNode.get("birthday").asText());
			}
			
			return user;

	}
}

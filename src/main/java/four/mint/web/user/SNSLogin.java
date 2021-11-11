package four.mint.web.user;





import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.httpclient.HttpClient;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin {
	
	private OAuth20Service oauthService;
	private SnsValue sns;
	private HttpClient client;
	
	public SNSLogin(SnsValue sns) {
		System.out.println(sns.getService()+"======="+sns.getClientId()+"========"+sns.getClientSecret()+"======"+sns.getRedirectUrl());
		if(sns.getService().equals("naver")) {
			this.oauthService = new ServiceBuilder(sns.getClientId())
					.apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl())
					.defaultScope("profile")
					.build(sns.getApi20Instance());
			this.sns = sns;
		}else {
			this.oauthService = new ServiceBuilder(sns.getClientId())
					.apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl())
					.defaultScope("profile_nickname,account_email,birthday,gender")
					.httpClient(client)
					.build(sns.getApi20Instance());
			this.sns = sns;
			
			
			System.out.println(this.oauthService);
		}
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	public String getKakaoAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public NaverVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		
		
//		return response.getBody();
		return parseJson(response.getBody());
	}

	private NaverVO parseJson(String body)throws Exception {
		
		NaverVO user = new NaverVO();
			
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if(this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			user.setSocial_login("naver");
			user.setNaverid(resNode.get("id").asText());
			user.setEmail_id(resNode.get("email").asText());
			if(resNode.get("gender").asText().equals("M")) {
				user.setGender("man");
			}else {
				user.setGender("woman");
			}
			user.setPhone(resNode.get("mobile").asText().replaceAll("[^0-9]", ""));
			user.setBirth(resNode.get("birthyear").asText().substring(2) + resNode.get("birthday").asText().substring(0, 2) + resNode.get("birthday").asText().substring(3, 5));
		}else {
			
		}
		
		return user;
	}
}

package four.mint.web.user;





import java.net.URI;

import org.apache.commons.collections.map.MultiValueMap;
import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.httpclient.HttpClient;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonObject;

public class SNSLogin {
	
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	
	
	public SNSLogin(SnsValue sns) {
		System.out.println(sns.getService()+"======="+sns.getClientId()+"========"+sns.getClientSecret()+"======"+sns.getRedirectUrl());
		if(sns.getService().equals("naver")) {
		System.out.println(sns.getService()+"@@@@@@@@@");
		this.oauthService = new ServiceBuilder(sns.getClientId())
					.apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl())
					.defaultScope("profile")
					.build(sns.getApi20Instance());
			this.sns = sns;
		}else {
//			System.out.println(sns.getService());
//			System.out.println(key);
//			this.oauthService = new ServiceBuilder(sns.getClientId())
//					.apiSecret(sns.getClientSecret())
//					.callback(sns.getRedirectUrl())
//					.defaultScope("profile_nickname,account_email,gender,birthday")
//					.build(sns.getApi20Instance());
//			this.sns = sns;
			
		}
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
//	public String getKakaoAuthURL() {
//		return this.oauthService.getAuthorizationUrl();
//	
//	}

	public NaverVO getNaverProfile(String code) throws Exception {
		System.out.println("navercode " + code);
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		
		
		//return response.getBody();
		return parseJson(response.getBody());
	}
	
//	public String getKakaoProfile(String code)throws Exception{
//		System.out.println("kakaocode " + code);
//		
//		String accessToken = "";
//		RestTemplate restTemplate = new RestTemplate();
//		URI uri = URI.create("https://kauth.kakao.com/oauth/token");
//		HttpHeaders headers = new HttpHeaders();
//		
//		
//		LinkedMultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
//		parameters.set("grant_type", "authorization_code");
//		parameters.set("client_id", sns.getClientId());
//		parameters.set("redirect_uri", sns.getRedirectUrl());
//		parameters.set("code", code);
//		
//		HttpEntity<LinkedMultiValueMap<String, Object>>restRequest = new HttpEntity<>(parameters, headers);
//		ResponseEntity<JsonObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JsonObject.class);
//		JsonObject responseBody = apiResponse.getBody();
//		
////		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
////		System.out.println("access" +accessToken);
////		
////		OAuthRequest request = new OAuthRequest(Verb.GET,  this.sns.getProfileUrl());
////		System.out.println("request" + request);
////		oauthService.signRequest(accessToken, request);
//		
//		Response response = oauthService.execute(request);
//				accessToken = responseBody.get("access_token").toString();
//		
//		return response.getBody();
//	}

	private NaverVO parseJson(String body)throws Exception {
		
		NaverVO user = new NaverVO();
			
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		 
			JsonNode resNode = rootNode.get("response");
			user.setSocial_login("naver");
			user.setNaverid(resNode.get("id").asText());
			user.setEmail(resNode.get("email").asText());
			if(resNode.get("gender").asText().equals("M")) {
				user.setGender("man");
			}else {
				user.setGender("woman");
			}
			user.setPhone(resNode.get("mobile").asText().replaceAll("[^0-9]", ""));
			user.setBirth(resNode.get("birthyear").asText().substring(2) + resNode.get("birthday").asText().substring(0, 2) + resNode.get("birthday").asText().substring(3, 5));
		
		
		return user;
	}
	 
	
}

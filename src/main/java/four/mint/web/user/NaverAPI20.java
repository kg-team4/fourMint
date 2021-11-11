package four.mint.web.user;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SnsUrls{

	private NaverAPI20() {
		
	}
	private static class InstanceHolder{
		private static final NaverAPI20 INSTANCE = new NaverAPI20();
	}

	public static NaverAPI20 instance() {
	
		return InstanceHolder.INSTANCE;
	}
	
	//endpoint
	@Override
	public String getAccessTokenEndpoint() {
		
		return NAVER_ACCESS_TOKEN;
	}
	
	
	//권한
	@Override
	protected String getAuthorizationBaseUrl() {
		
		return NAVER_AUTH;
	}

}
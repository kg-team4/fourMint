package four.mint.web.common;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API
 *        PHP
 */
public class ExampleSend {
	public static void main(String[] args) {
		String api_key = "NCSMEG7NYL08FKOG";
		String api_secret = "UKHGPXJ79GPNX9NC25JR8TKE4WBHY8RJ";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01033176327");
		params.put("from", "01020884919"); // 무조건 자기번호 (인증)
		params.put("type", "SMS");
		params.put("text", "하이");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			// send() 는 메시지를 보내는 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}
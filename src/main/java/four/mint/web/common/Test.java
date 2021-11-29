package four.mint.web.common;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

public class Test {

	public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		
		AES256Util aes = new AES256Util();
		
		String encoding = aes.encrypt("mira");
		
		System.out.println(encoding);
		
		String decoding = aes.decrypt("FP08PJpLcpyGw22TuwkUgQ==");
		
		System.out.println(decoding);
		
		
		
	}
}


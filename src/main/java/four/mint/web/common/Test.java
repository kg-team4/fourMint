package four.mint.web.common;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

public class Test {

	public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		
		AES256Util aes = new AES256Util();
		
		String encoding = aes.encrypt("Don1233!");
		
		System.out.println(encoding);
		
		String decoding = aes.decrypt("ilzkd1wJ/H8TYKP7QdYlhg==");
		
		System.out.println(decoding);
		
		
		
	}
}


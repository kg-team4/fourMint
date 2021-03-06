package four.mint.web.admin.banner.store;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;

@Controller
public class AdminBannerStoreController {
	
	@Autowired
	private AdminBannerStoreService bannerStoreService;
	
	@RequestMapping(value = "/bannerStore.mdo", method = RequestMethod.POST)
	public String bannerUsed(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response, AdminBannerStoreVO vo, HttpSession session) throws NoSuchAlgorithmException, GeneralSecurityException {
		try {
			AES256Util.setKey(bannerStoreService.getKey().getKey());
			AES256Util aes = new AES256Util();
			AwsS3.setAccessKey(aes.decrypt(bannerStoreService.getSkey().getAckey()));
			AwsS3.setSecretKey(aes.decrypt(bannerStoreService.getSkey().getSekey()));
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
			String key = "banner/" + file.getOriginalFilename();
			InputStream is = file.getInputStream();
			String contentType = file.getContentType();
			String strNum = request.getParameter("no");
			int num = Integer.parseInt(strNum);
			long contentLength = file.getSize();
			awsS3.upload(is, key, contentType, contentLength);
				vo.setImage(uploadFolder + key);
				vo.setNo(num);
			bannerStoreService.updateBannerStore(vo);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return "redirect:/buttons.mdo";
	}
}

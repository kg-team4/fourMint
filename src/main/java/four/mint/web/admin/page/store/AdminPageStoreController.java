package four.mint.web.admin.page.store;

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
public class AdminPageStoreController {
	
	@Autowired
	private AdminPageStoreService adminPageStoreService;
	
	@RequestMapping(value = "/insertStore.mdo", method = RequestMethod.POST)
	public String insertStore(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2, HttpServletRequest request, HttpServletResponse response, AdminPageStoreVO vo, HttpSession session) throws NoSuchAlgorithmException, GeneralSecurityException {
		try {
			AES256Util.setKey(adminPageStoreService.getKey().getKey());
			AES256Util aes = new AES256Util();
			AwsS3.setAccessKey(aes.decrypt(adminPageStoreService.getSkey().getAckey()));
			AwsS3.setSecretKey(aes.decrypt(adminPageStoreService.getSkey().getSekey()));
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
			
			String key1 = "store/" + file1.getOriginalFilename();
			InputStream is1 = file1.getInputStream();
			String contentType1 = file1.getContentType();
			long contentLength1 = file1.getSize();
			
			String key2 = "store/" + file2.getOriginalFilename();
			InputStream is2 = file2.getInputStream();
			String contentType2 = file2.getContentType();
			long contentLength2 = file2.getSize();
			
			awsS3.upload(is1, key1, contentType1, contentLength1);
			awsS3.upload(is2, key2, contentType2, contentLength2);
				vo.setUrl(uploadFolder + key1);
				vo.setCategory_big(request.getParameter("category_big"));
				vo.setProduct_name(request.getParameter("product_name"));
				vo.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
				vo.setProduct_content(uploadFolder + key2);
				vo.setProduct_stock(Integer.parseInt(request.getParameter("product_stock")));
			adminPageStoreService.insertStore(vo);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return "redirect:/merchandise.mdo";
	}
	
	@RequestMapping(value = "/updateStore.mdo", method = RequestMethod.POST)
	public String updateStore(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2, HttpServletRequest request, HttpServletResponse response, AdminPageStoreVO vo, HttpSession session) throws NoSuchAlgorithmException, GeneralSecurityException {
		try {
			AES256Util.setKey(adminPageStoreService.getKey().getKey());
			AES256Util aes = new AES256Util();
			AwsS3.setAccessKey(aes.decrypt(adminPageStoreService.getSkey().getAckey()));
			AwsS3.setSecretKey(aes.decrypt(adminPageStoreService.getSkey().getSekey()));
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
			
			String key1 = "store/" + file1.getOriginalFilename();
			InputStream is1 = file1.getInputStream();
			String contentType1 = file1.getContentType();
			long contentLength1 = file1.getSize();
			
			String key2 = "store/" + file2.getOriginalFilename();
			InputStream is2 = file2.getInputStream();
			String contentType2 = file2.getContentType();
			long contentLength2 = file2.getSize();
			
			awsS3.upload(is1, key1, contentType1, contentLength1);
			awsS3.upload(is2, key2, contentType2, contentLength2);
				vo.setStore_seq(Integer.parseInt(request.getParameter("store_seq")));
				vo.setUrl(uploadFolder + key1);
				vo.setCategory_big(request.getParameter("category_big"));
				vo.setProduct_name(request.getParameter("product_name"));
				vo.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
				vo.setProduct_content(uploadFolder + key2);
				vo.setProduct_stock(Integer.parseInt(request.getParameter("product_stock")));
			adminPageStoreService.updateStore(vo);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return "redirect:/merchandise.mdo";
	}
	
	@RequestMapping(value = "/deleteStore.mdo", method = RequestMethod.POST)
	public String updateStore(AdminPageStoreVO vo, HttpServletRequest request) {
		adminPageStoreService.deleteStore(Integer.parseInt(request.getParameter("store_seq")));
		return "redirect:/merchandise.mdo";
	}
}

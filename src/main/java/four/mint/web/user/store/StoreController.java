package four.mint.web.user.store;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.user.board.common.PageVO;
import four.mint.web.user.market.MarketCategoryBigVO;
import four.mint.web.user.market.MarketService;
import four.mint.web.user.market.MarketVO;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MarketService marketService;

	@RequestMapping(value = "/storeBoardList.do", method = RequestMethod.GET)
	public String storeBoardList() {
		
		return "/board/store_all_post_list";
	}
	
	@RequestMapping(value = "/storeBoard.do", method = RequestMethod.GET)
	public String storeBoard() {
		
		return "/board/store_post_content";
	}
	
	@RequestMapping(value = "/storeDetailList.do", method = RequestMethod.GET)
	public String storeList(HttpServletRequest request, HttpServletResponse response) {
		List<StoreCategoryBigVO> storeCategoryBig = storeService.getStoreCategoryBig();
		request.setAttribute("storeCategoryBig", storeCategoryBig);
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)
			pageNum = "1";
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = storeService.getStoreCount();
		int number = 0;
		List<StoreVO> storeList = null;
		PageVO vo = new PageVO();
		if(count > 0) { 
			vo.setStartRow(startRow);
			vo.setEndRow(endRow);
			storeList = storeService.getStoreList(request, vo);
		}
		else
			storeList = Collections.emptyList();
		number = count - (currentPage - 1) * pageSize;
		request.setAttribute("currentPage", Integer.valueOf(currentPage));
		request.setAttribute("count",  Integer.valueOf(count));
		request.setAttribute("pageSize", Integer.valueOf(pageSize));
		request.setAttribute("number", Integer.valueOf(number));
		request.setAttribute("storeList", storeList);
		
		return "/board/store_post_list";
	}
	
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String payment() {
		
		return "/pay/order";
	}
	

	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String order() {
		
		return "/pay/payment";
	}
	
	@RequestMapping(value = "/storeSell.do", method = RequestMethod.GET)
	public String marketSell(Model model, HttpSession session) {
		if(session.getAttribute("userEmail_id") == null) {
			return "/user/login";
		}
		List<StoreCategoryBigVO> storeCategoryBig = storeService.getStoreCategoryBig();
		model.addAttribute("storeCategoryBig", storeCategoryBig);
		
		return "/board/store_write";
	}
	
	@RequestMapping(value = "/storeSell.do", method = RequestMethod.POST)
	public String marketUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response, StoreVO vo) throws NoSuchAlgorithmException, GeneralSecurityException {
		try {
			AES256Util.setKey(marketService.getKey().getKey());
			AES256Util aes = new AES256Util();
			AwsS3.setAccessKey(aes.decrypt(marketService.getSkey().getAckey()));
			AwsS3.setSecretKey(aes.decrypt(marketService.getSkey().getSekey()));
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintmarket.s3.ap-northeast-2.amazonaws.com/";
			String key = "store/" + file.getOriginalFilename();
			InputStream is = file.getInputStream();
			String contentType = file.getContentType();
			long contentLength = file.getSize();
			awsS3.upload(is, key, contentType, contentLength);
			System.out.println("main 업로드 완료");
				vo.setImg_name(file.getOriginalFilename());
				vo.setUrl(uploadFolder + key);
			storeService.insertStore(vo);
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		return "/board/market_all_post_list";
	}
}

package four.mint.web.user.store;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.admin.banner.store.AdminBannerStoreService;
import four.mint.web.common.AES256Util;
import four.mint.web.common.AwsS3;
import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
import four.mint.web.user.board.common.SearchVO;
import four.mint.web.user.market.MarketService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private MarketService marketService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminBannerStoreService adminBannerStoreService;
	
	@RequestMapping(value = "/storeBoardList.do", method = RequestMethod.GET)
	public String storeBoardList(HttpServletRequest request) {
		
		String store_image1 = adminBannerStoreService.getBanner(1);
		String store_image2 = adminBannerStoreService.getBanner(2);
		String store_image3 = adminBannerStoreService.getBanner(3);
		String store_image4 = adminBannerStoreService.getBanner(4);
		request.setAttribute("store_banner1", store_image1);
		request.setAttribute("store_banner2", store_image2);
		request.setAttribute("store_banner3", store_image3);
		request.setAttribute("store_banner4", store_image4);
		
		List<StoreVO> lsVO = storeService.getStoreListSix();
		request.setAttribute("list", lsVO);
		
		List<StoreVO> bestVO = storeService.getBest();
		request.setAttribute("best", bestVO);
		
		return "/board/store_all_post_list";
	}

	@RequestMapping(value = "/storeBoard.do", method = RequestMethod.GET)
	public String storeBoard(HttpServletRequest request, StoreVO svo, Model model) {
		svo = storeService.getStoreOne(Integer.valueOf(request.getParameter("seq")));

		model.addAttribute("content", svo);

		return "/board/store_post_content";
	}

	@RequestMapping(value = "/storeDetailList.do", method = RequestMethod.GET)
	public String storeList(HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
		List<StoreCategoryBigVO> storeCategoryBig = storeService.getStoreCategoryBig();
		request.setAttribute("storeCategoryBig", storeCategoryBig);

		String kind = request.getParameter("kind");

		/* 페이징 처리 */
		int page = 1;
		int limit = 9;

		svo.setKind(kind);
		svo.setPage(page);

		int listCount = storeService.getKindCount(svo);
		svo.setRnum(listCount);
		int maxPage = (listCount + limit - 1) / limit;
		int startPage = ((page - 1) / 5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		if (endPage < page)
			page = endPage;
		/* 페이징 처리 끝 */

		List<StoreVO> sVo;
		sVo = storeService.getKindList(svo); // 카테고리에 해당하는 부분만 불러오기

		request.setAttribute("kind", kind);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);
		request.setAttribute("storeList", sVo);
		request.setAttribute("pageNum", page);

		return "/board/store_post_list";
	}

	@RequestMapping(value = "/storeDetailList.do", method = RequestMethod.POST)
	public String storeListKind(HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
		List<StoreCategoryBigVO> storeCategoryBig = storeService.getStoreCategoryBig();
		request.setAttribute("storeCategoryBig", storeCategoryBig);

		String kind = request.getParameter("kind");
		String arrow = request.getParameter("arrow");
		/* 페이징 처리 시작 */
		String currentPage = request.getParameter("pageNum");
		int page;

		if (currentPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(currentPage);
		}

		if (arrow != null) {
			if (arrow.equals("prev")) {
				page = (page - 1) / 5 + ((page - 1) / 5) * 4;
				if (page < 1) {
					page = 1;
				}
			} else if (arrow.equals("next")) {
				page = (page + 6) / 6 + (5 * ((page + 6) / 6)) - ((page - 1) / 5);
			}
		}

		svo.setKind(kind);

		if (page > Math.round((double) storeService.getKindCount(svo) / 9)) {
			page = (int) Math.round((double) storeService.getKindCount(svo) / 9) + 1;
		}

		request.setAttribute("pageNum", page);

		int limit = 9;

		svo.setPage(page);
		int listCount = storeService.getKindCount(svo);
		svo.setRnum(listCount);
		int maxPage = (listCount + limit - 1) / limit;
		int startPage = ((page - 1) / 5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		if (endPage < page)
			page = endPage;
		/* 페이징 처리 끝 */

		List<StoreVO> sVo;
		sVo = storeService.getKindList(svo); // 카테고리에 해당하는 부분만 불러오기

		request.setAttribute("kind", kind);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);
		request.setAttribute("storeList", sVo);

		return "/board/store_post_list";
	}

	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String oneOrder(HttpServletRequest request, HttpSession session, int one) {
		CartVO vo = storeService.getCart(one);
		
		request.setAttribute("cart", vo.getCart_id());
		
		int price = vo.getAmount() * vo.getProduct_price();
		int delivery = 0;
		
		if(price < 50000) {
			delivery = 2500;
		}
		
		request.setAttribute("price", price);
		request.setAttribute("delivery", delivery);
		
		return "/pay/order";
	}
	
	@RequestMapping(value = "/orderSoon.do", method = RequestMethod.GET)
	public String orderSoon(HttpServletRequest request, HttpSession session, int seq, int amount) {
		StoreVO sVO = storeService.getStoreOne(seq);
		
		String nickname = String.valueOf(session.getAttribute("nickname"));

		int product_price = sVO.getProduct_price();
		String url = sVO.getUrl();
		String name = sVO.getProduct_name();

		CartVO cVO = new CartVO();
		
		cVO.setAmount(amount);
		cVO.setNickname(nickname);
		cVO.setProduct_price(product_price);
		cVO.setStore_seq(seq);
		cVO.setUrl(url);
		cVO.setProduct_name(name);

		storeService.insertCart(cVO);
		
		int price = cVO.getAmount() * cVO.getProduct_price();
		int delivery = 0;
		
		if(price < 50000) {
			delivery = 2500;
		}
		
		request.setAttribute("price", price);
		request.setAttribute("delivery", delivery);
		request.setAttribute("cart", cVO.getCart_id());
		
		return "/pay/order";
	}
	
	@RequestMapping(value = "/order.do", method = RequestMethod.POST)
	public String payment(HttpServletRequest request, HttpSession session) {

		String temp = request.getParameter("arrayParam");
		request.setAttribute("cart", temp);
		
		String[] tempArr = temp.split(",");
		
		CartVO vo = new CartVO();
		
		int price = 0;
		int delivery = 0;
		
		for(int i=0; i<tempArr.length; i++) {
			vo = storeService.getCart(Integer.valueOf(tempArr[i]));
			price += vo.getAmount() * vo.getProduct_price();
		}
		
		if(price < 50000) {
			delivery = 2500;
		}
		
		request.setAttribute("price", price);
		request.setAttribute("delivery", delivery);
		
		UserVO uVO = userService.getUserFromNickname(String.valueOf(session.getAttribute("nickname")));

		request.setAttribute("user", uVO);
		
		String phone1 = uVO.getPhone().substring(0, 3);
		String phone2 = uVO.getPhone().substring(3, 7);
		String phone3 = uVO.getPhone().substring(7);
		
		request.setAttribute("phone1", phone1);
		request.setAttribute("phone2", phone2);
		request.setAttribute("phone3", phone3);
		
		return "/pay/order";
	}
	
	// 카트 갱신 및 주문 
	@ResponseBody
	@RequestMapping(value = "/buy.do", method = RequestMethod.POST)
	public int updateCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {

		int result = 0;
		int cartNum = 0;

		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			cart = storeService.getCart(cartNum);
			storeService.updateCart(cart);
		}
		
		return result;
	}
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String order(HttpServletRequest request, 	HttpSession session) {
		String nickname = String.valueOf(session.getAttribute("nickname"));
		List<CartVO> cartList = storeService.getCartList(nickname);

		request.setAttribute("cart", cartList);
			
		return "/pay/payment";
	}

	@RequestMapping(value = "/storeSell.do", method = RequestMethod.GET)
	public String marketSell(Model model, HttpSession session) {
		if (session.getAttribute("userEmail_id") == null) {
			return "/user/login";
		}
		List<StoreCategoryBigVO> storeCategoryBig = storeService.getStoreCategoryBig();
		model.addAttribute("storeCategoryBig", storeCategoryBig);

		return "/board/store_write";
	}

	@RequestMapping(value = "/storeSell.do", method = RequestMethod.POST)
	public String marketUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response, StoreVO vo) throws NoSuchAlgorithmException, GeneralSecurityException {
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

	@RequestMapping(value = "/cartGo.do", method = RequestMethod.POST)
	public void cartGo(HttpServletRequest request, HttpServletResponse response, CartVO vo) {
		int id = Integer.valueOf(request.getParameter("seq"));
		int amount = Integer.valueOf(request.getParameter("amount"));
		String nickname = request.getParameter("nickname");

		StoreVO tempVO = storeService.getStoreOne(id);
		int price = tempVO.getProduct_price();
		String url = tempVO.getUrl();
		String name = tempVO.getProduct_name();

		vo.setAmount(amount);
		vo.setNickname(nickname);
		vo.setProduct_price(price);
		vo.setStore_seq(id);
		vo.setUrl(url);
		vo.setProduct_name(name);

		storeService.insertCart(vo);
	}

	@ResponseBody
	@RequestMapping(value = "/countUp.do", method = RequestMethod.POST)
	public int countUp(HttpServletRequest request, UpVO vo) {
		int id = Integer.valueOf(request.getParameter("id"));
		int amount = Integer.valueOf(request.getParameter("amount"));
		
		if (amount < 10) {
			amount += 1;
			vo.setAmount(amount);
			vo.setId(id);
			storeService.updateCart(vo);
		}
		
		return amount;
	}

	@ResponseBody
	@RequestMapping(value = "/countDown.do", method = RequestMethod.POST)
	public int countDown(HttpServletRequest request, UpVO vo) {
		int id = Integer.valueOf(request.getParameter("id"));
		int amount = Integer.valueOf(request.getParameter("amount"));

		if (amount > 1) {
			amount -= 1;
			vo.setAmount(amount);
			vo.setId(id);
			storeService.updateCart(vo);
		}

		return amount;
	}

	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {

		int result = 0;
		int cartNum = 0;

		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			cart.setCart_id(cartNum);
			storeService.deleteCart(cart.getCart_id());
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/calculate.do", method = RequestMethod.POST)
	public int calculate(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {

		int cartNum = 0;
		int sum = 0;
		
		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			cart.setCart_id(cartNum);
			sum += storeService.getPrice(cart.getCart_id());
		}
		
		return sum;
	}

	@ResponseBody
	@PostMapping("/payHistory.do")
	public int payHistory(HttpServletRequest request) {
		int result = 0;
		
		String email = request.getParameter("email");
		String cart = request.getParameter("cart");
		String code = request.getParameter("code");
		String req = request.getParameter("request");
		
		UserVO uVO = userService.getUserFromEmail(email);
		
		TransactionHistoryVO thVO = new TransactionHistoryVO();
		
		String[] cartArr = cart.split(",");
		CartVO cVO;
		
		for(int i=0; i<cartArr.length; i++) {
			thVO.setEmail_id(uVO.getEmail_id());
			thVO.setMerchant_uid(code);
			cVO = storeService.getCart(Integer.valueOf(cartArr[i]));
			thVO.setProduct_name(cVO.getProduct_name());
			thVO.setProduct_price(cVO.getProduct_price());
			thVO.setTransaction_count(cVO.getAmount());
			thVO.setTransaction_price(cVO.getAmount() * cVO.getProduct_price());
			thVO.setRequest(req);
			
			storeService.insertHistory(thVO);
			
			storeService.minusStock(thVO);
			
			storeService.deleteCart(Integer.valueOf(cartArr[i]));
		}
		
		return result;
	}
}































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
import four.mint.web.user.board.common.LikeVO;
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
	public String storeBoard(HttpServletRequest request, StoreVO svo, HttpSession session) {
		if(session.getAttribute("userEmail_id") == null) {
			return "redirect:/login.do";
		} else if(session.getAttribute("nickname") == null) {
			return "redirect:/profile.do";
		}
		svo = storeService.getStoreOne(Integer.valueOf(request.getParameter("seq")));
		request.setAttribute("content", svo);
		
		int seq = Integer.valueOf(request.getParameter("seq"));
		/* ????????? ???????????? ?????? */
		LikeVO tempLVO = new LikeVO();
			tempLVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			tempLVO.setSeq(seq);
		LikeVO lVO = storeService.getLike(tempLVO);
		if(lVO == null) {
			int result = 0;
			request.setAttribute("like", result);
		} else {
			int result = 1;
			request.setAttribute("like", result);
		}
		
		/* ????????? ?????? ?????? */
		int sum = storeService.searchLikes(Integer.valueOf(request.getParameter("seq")));
		request.setAttribute("likes", sum);
		
		TransactionHistoryVO tVO = new TransactionHistoryVO();
			tVO.setEmail_id((String)session.getAttribute("userEmail_id"));
			tVO.setTransaction_seq(seq);
			
		TransactionHistoryVO tempVO = storeService.getTransaction(tVO);	
		
		if(tempVO == null) {
			request.setAttribute("buyOrNot", 0);
		} else {
			request.setAttribute("buyOrNot", 1);
		}
		
		List<StoreRateVO> srList = storeService.getRateList(seq);
		request.setAttribute("rate", srList);
		
		StoreAskVO askVO = new StoreAskVO();
			askVO.setStore_seq(seq);
			askVO.setNickname((String)session.getAttribute("nickname"));
		List<StoreAskVO> askList = storeService.getAskList(askVO);
		request.setAttribute("ask", askList);
		
		float avg = storeService.getAvg(seq);
		request.setAttribute("avg", avg);

		return "/board/store_post_content";
	}

	@RequestMapping(value = "/storeDetailList.do", method = RequestMethod.GET)
	public String storeList(HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
		List<StoreCategoryBigVO> storeCategoryBig = storeService.getStoreCategoryBig();
		request.setAttribute("storeCategoryBig", storeCategoryBig);

		request.setAttribute("keyword", "");
		svo.setKeyword("%%");
		request.setAttribute("option", "title");
		svo.setOption("title");
		String kind = request.getParameter("kind");

		/* ????????? ?????? */
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
		/* ????????? ?????? ??? */

		List<StoreVO> sVo;
		sVo = storeService.getKindList(svo); // ??????????????? ???????????? ????????? ????????????

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
	public String storeListKind(@RequestParam(required = false) String keyword, HttpServletRequest request, HttpServletResponse response, SearchVO svo) {
		List<StoreCategoryBigVO> storeCategoryBig = storeService.getStoreCategoryBig();
		request.setAttribute("storeCategoryBig", storeCategoryBig);

		if(keyword != null) {
			request.setAttribute("keyword", keyword);
			svo.setKeyword("%" + keyword + "%");
		} else {
			request.setAttribute("keyword", "");
			svo.setKeyword("%%");
		}
		svo.setOption("title");
		request.setAttribute("option", svo.getOption());
		
		String kind = request.getParameter("kind");
		
		/* ????????? ?????? ?????? */
		String currentPage = request.getParameter("pageNum");
		int page;
		
		int limit = 9;
		svo.setPage(1);
		int listCount = storeService.getKindCount(svo);
		int maxPage = (listCount + limit - 1) / limit;
		
		if (currentPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(currentPage);
		}

		String arrow = request.getParameter("arrow");
		if (arrow != null) {
			if (arrow.equals("prev")) {
				page = (page - 1) / 5 + ((page - 1) / 5) * 4;
				if (page < 1) {
					page = 1;
				}
			} else if (arrow.equals("next")) {
				page = (page + 6) / 6 + (5 * ((page + 6) / 6)) - ((page - 1) / 5);
				if(page > maxPage) {
					page = maxPage;
				}
			}
		}

		svo.setKind(kind);

		request.setAttribute("pageNum", page);

		int startPage = ((page - 1) / 5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		if (endPage < page)
			page = endPage;
		/* ????????? ?????? ??? */

		svo.setPage(page);
		List<StoreVO> sVo = storeService.getKindList(svo); // ??????????????? ???????????? ????????? ????????????

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
	
	// ?????? ?????? ??? ?????? 
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
		if(session.getAttribute("userEmail_id") == null) {
			return "redirect:/login.do";
		} else if(session.getAttribute("nickname") == null) {
			return "redirect:/profile.do";
		}
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
			System.out.println("main ????????? ??????");
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
		
		CartVO temp = storeService.getCart(vo);
		if(temp != null) {
			temp.setAmount(temp.getAmount() + vo.getAmount());
			if(temp.getAmount() > 10) {
				temp.setAmount(10);
			}
			storeService.updateCart(temp);
		} else {
			storeService.insertCart(vo);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/countUp.do", method = RequestMethod.POST)
	public int countUp(HttpServletRequest request, UpVO vo) {
		int id = Integer.valueOf(request.getParameter("id"));
		int amount = Integer.valueOf(request.getParameter("amount"));
		
		StoreVO tempVO = storeService.getStoreCart(id);
		System.out.println("stcok: "+tempVO.getProduct_stock());
		System.out.println("amount: "+amount);
		if (amount < 10) {
			if(amount < tempVO.getProduct_stock()) {
				amount += 1;
			}
			vo.setAmount(amount);
			vo.setId(id);
			storeService.updateCart(vo);
		}
		
		return tempVO.getProduct_stock();
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

	// ?????? ??????
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
		String address = request.getParameter("address");
		
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
			thVO.setAddress2(address);
			
			storeService.insertHistory(thVO);
			storeService.minusStock(thVO);
			storeService.deleteCart(Integer.valueOf(cartArr[i]));
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/storeLike.do", method = RequestMethod.POST)
	public int marketLike(HttpSession session, int seq) throws Exception {
		LikeVO lVO = new LikeVO();
		lVO.setNickname(String.valueOf(session.getAttribute("nickname")));
		lVO.setSeq(seq);
		storeService.insertLike(lVO);		
		
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value = "/storeHate.do", method = RequestMethod.POST)
	public int marketHate(HttpSession session, int seq) throws Exception {
		LikeVO lVO = new LikeVO();
		lVO.setNickname(String.valueOf(session.getAttribute("nickname")));
		lVO.setSeq(seq);
		storeService.deleteLike(lVO);		
		
		return 0;
	}
	
	@PostMapping("/payCancel.do")
	public String payCancel(String cancel_reason, String content, int cancelSeq, String pay_cancel) {
		TransactionHistoryVO thVO = new TransactionHistoryVO();
			thVO.setCancel_reason(content);
			thVO.setCancel_status(cancel_reason);
			thVO.setTransaction_seq(cancelSeq);
			thVO.setPay_cancel(pay_cancel);
		storeService.updateCancel(thVO);
		
		return "redirect:profile.do";
	}
	
	@PostMapping("/storeRate.do")
	public String storeRate(HttpSession session, int store_seq, float star, String content) {
		StoreRateVO srVO = new StoreRateVO();
			srVO.setStore_seq(store_seq);
			srVO.setRating(star);
			srVO.setContent(content);
			srVO.setNickname((String)session.getAttribute("nickname"));
			
		storeService.insertRate(srVO);	
		
		return "redirect:storeBoard.do?seq="+store_seq;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteRate.do", method = RequestMethod.POST)
	public int deleteRate(int seq) throws Exception {
		storeService.deleteRate(seq);
		
		return 0;
	}
	
	@ResponseBody
	@PostMapping("storeQNA.do")
	public int insertAsk(int seq, String content, HttpSession session, String product_name) {
		StoreAskVO qVO = new StoreAskVO();
			qVO.setStore_seq(seq);
			qVO.setNickname((String)session.getAttribute("nickname"));
			qVO.setContent(content);
			qVO.setProduct_name(product_name);
		storeService.insertAsk(qVO);	
		
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteAsk.do", method = RequestMethod.POST)
	public int deleteAsk(int seq) throws Exception {
		storeService.deleteAsk(seq);
		
		return 0;
	}
}































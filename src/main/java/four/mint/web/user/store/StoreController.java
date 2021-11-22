package four.mint.web.user.store;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String storeBoardList(Model model) {
		
		String store_image1 = adminBannerStoreService.getBanner(1);
		String store_image2 = adminBannerStoreService.getBanner(2);
		String store_image3 = adminBannerStoreService.getBanner(3);
		String store_image4 = adminBannerStoreService.getBanner(4);
		
		model.addAttribute("store_banner1", store_image1);
		model.addAttribute("store_banner2", store_image2);
		model.addAttribute("store_banner3", store_image3);
		model.addAttribute("store_banner4", store_image4);
		
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
		int maxPage = (listCount+limit-1)/limit;
		int startPage = ((page-1)/5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if(endPage > maxPage) 
			endPage = maxPage;
		if(endPage < page) 
			page = endPage;
		/*페이징 처리 끝*/
		
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
		/*페이징 처리 시작*/
		String currentPage = request.getParameter("pageNum");
		int page;

		if(currentPage == null) {
			page = 1; 
		} else {
			page = Integer.parseInt(currentPage);
		}
		
		if(arrow != null) {
			if(arrow.equals("prev")) {
				page = (page - 1) / 5 + ((page - 1) / 5) * 4;
				if(page < 1) {
					page = 1;
				}
			} else if(arrow.equals("next")) {
				page = (page + 6) / 6 + (5 * ((page + 6) / 6)) - ((page - 1) / 5);
			}
		}
		
		svo.setKind(kind);

		if(page > Math.round((double)storeService.getKindCount(svo) / 9)) {
			page = (int)Math.round((double)storeService.getKindCount(svo) / 9) + 1;
		}

		request.setAttribute("pageNum", page);
		
		int limit = 9;   
		
		svo.setPage(page);
		int listCount = storeService.getKindCount(svo);
		svo.setRnum(listCount);
		int maxPage = (listCount+limit-1)/limit;
		int startPage = ((page-1)/5) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if(endPage > maxPage) 
			endPage = maxPage;
		if(endPage < page) 
			page = endPage;
		/*페이징 처리 끝*/	
		
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
	public String payment(HttpServletRequest request, UserVO vo, HttpSession session) {
		request.setAttribute("price", request.getParameter("price"));
		if(request.getParameter("amount") == null || Integer.valueOf(request.getParameter("amount")) <= 0) {
			request.setAttribute("amount", 1);
		} else {
			request.setAttribute("amount", request.getParameter("amount"));
		}
		
		String nickname = String.valueOf(session.getAttribute("nickname"));
		vo = userService.getUserFromNickname(nickname);
		
		String phone1 = vo.getPhone().substring(0,3);
		String phone2 = vo.getPhone().substring(3,7);
		String phone3 = vo.getPhone().substring(7);

		request.setAttribute("user", vo);
		request.setAttribute("phone1", phone1);
		request.setAttribute("phone2", phone2);
		request.setAttribute("phone3", phone3);
		
		request.setAttribute("priceAll", request.getParameter("priceAll"));
		request.setAttribute("delivery", request.getParameter("delivery"));
		
		return "/pay/order";
	}
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String order(@RequestParam(value="chk", required=false) String chk, HttpServletRequest request, HttpSession session) {
		String nickname = String.valueOf(session.getAttribute("nickname"));
		List<CartVO> cart = storeService.getCartList(nickname);
		
		request.setAttribute("cart", cart);
		if(!chk.equals("first")) {
			ArrayList<Integer> list = new ArrayList<Integer>();
			if(!chk.equals("0")) {
				int size = (chk.length()-1) / 3 + 1;
				int j = 0; 
				for(int i=1; i<=size; i++) {
					if(i<11) {
						list.add(Integer.valueOf(chk.charAt(1+j))-48);
					} else {
						String temp = "";
						for(int z=0; z<2; z++) {
							temp += (chk.charAt(1+j))-48;
							j += 1;
						}
						list.add(Integer.valueOf(temp));
					}
					j += 3;
				}
			}
			request.setAttribute("chk", list);
		} request.setAttribute("first", "first");
			
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
	
	@RequestMapping(value = "/cartGo.do", method = RequestMethod.POST)
	public void cartGo(HttpServletRequest request, HttpServletResponse response, CartVO vo) {
		int id = Integer.valueOf(request.getParameter("seq"));
		int amount = Integer.valueOf(request.getParameter("amount"));
		String nickname = request.getParameter("nickname");
		
		StoreVO tempVO = storeService.getStoreOne(id);
		String price = tempVO.getProduct_price();
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
	
	@RequestMapping(value = "/countUp.do", method = RequestMethod.POST)
	public String countUp(@RequestParam(value="checkboxValues[]") List<String> arrayParams, HttpServletRequest request, UpVO vo) {
		int id = Integer.valueOf(request.getParameter("id"));
		int amount = Integer.valueOf(request.getParameter("amount"));
		
		if(amount < 99) {
			amount += 1;
			vo.setAmount(amount);
			vo.setId(id);
			storeService.updateCart(vo);
		}
		
		request.setAttribute("chk", arrayParams);
		
		return "/pay/pass";
	}
	
	@RequestMapping(value = "/countDown.do", method = RequestMethod.POST)
	public String countDown(@RequestParam(value="checkboxValues[]") List<String> arrayParams, HttpServletRequest request, UpVO vo) {
		int id = Integer.valueOf(request.getParameter("id"));
		int amount = Integer.valueOf(request.getParameter("amount"));
		
		if(amount > 1) {
			amount -= 1;
			vo.setAmount(amount);
			vo.setId(id);
			storeService.updateCart(vo);
		}
			
		request.setAttribute("chk", arrayParams);
		
		return "/pay/pass";
	}
	
	@PostMapping("/delete.do")
	public String cartDel(HttpServletRequest request) {
		int id = Integer.valueOf(request.getParameter("id"));
		
		storeService.deleteCart(id);
		
		return "/pay/deleteProc";
	}
}




















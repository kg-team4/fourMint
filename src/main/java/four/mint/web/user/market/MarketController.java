package four.mint.web.user.market;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import four.mint.web.common.AwsS3;
import four.mint.web.user.UserService;
import four.mint.web.user.UserVO;
import four.mint.web.user.board.common.PageVO;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService marketService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/marketBoardList.do", method = RequestMethod.GET)
	public String marketBoardList() {
		
		return "/board/market_all_post_list";
	}
	
	@RequestMapping(value = "/marketBoard.do", method = RequestMethod.GET)
    public String mintBoard(UserVO vo, Model model) {
		model.addAttribute("result1", userService.getAddress1(vo));
        model.addAttribute("result2", userService.getAddress2(vo));
        model.addAttribute("result3", userService.getAddress3(vo));
		
		return "/board/market_post_content";
	}
	
	@RequestMapping(value = "/marketDetailList.do", method = RequestMethod.GET)
	public String mintDetailList(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)
			pageNum = "1";
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = marketService.getMarketCount();
		int number = 0;
		List<MarketVO> marketList = null;
		PageVO vo = new PageVO();
		if(count > 0) { 
			vo.setStartRow(startRow);
			vo.setEndRow(endRow);
			marketList = marketService.getMarketList(request, vo);
		}
		else
			marketList = Collections.emptyList();
		number = count - (currentPage - 1) * pageSize;
		request.setAttribute("currentPage", Integer.valueOf(currentPage));
		request.setAttribute("startRow", Integer.valueOf(startRow));
		request.setAttribute("endRow", Integer.valueOf(endRow));
		request.setAttribute("count",  Integer.valueOf(count));
		request.setAttribute("pageSize", Integer.valueOf(pageSize));
		request.setAttribute("number", Integer.valueOf(number));
		request.setAttribute("marketList", marketList);
		
		model.addAttribute("marketList", marketList);
		
		return "/board/market_post_list";
	}
	
	@RequestMapping(value = "/marketSell.do", method = RequestMethod.POST)
	public String marketUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response, MarketSellVO vo) {
		try {
			AwsS3 awsS3 = AwsS3.getInstance();
			String uploadFolder = "https://mintbuc.s3.ap-northeast-2.amazonaws.com/";
			String key = "market/" + file.getOriginalFilename();
			InputStream is = file.getInputStream();
			String contentType = file.getContentType();
			long contentLength = file.getSize();
			awsS3.upload(is, key, contentType, contentLength);
			System.out.println("main 업로드 완료");
			
				vo.setImg_name(file.getOriginalFilename());
				vo.setUrl(uploadFolder + key);
			marketService.insertMarket(vo);
		} catch(IOException ex) {
			ex.printStackTrace();
		}
		
		return "/board/market_all_post_list";
	}
	
}






























package four.mint.web.admin.qna;



import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class AdminQnaController {
	
	@Autowired
	private AdminQnaService adminQnaService;
	
	@RequestMapping(value ="/customercenter.mdo" , method = RequestMethod.GET)
	public String customercenter(HttpServletRequest request) {
		List<AdminQnaVO> adminqnalist = adminQnaService.getAdminQnaList();
		
		request.setAttribute("list", adminqnalist);
		return "/customercenter";
	}
	
	@RequestMapping(value="/qna_delete.mdo",method=RequestMethod.POST)
	public String qna_delete(HttpServletRequest request) {
		
		  adminQnaService.qna_delete(Integer.valueOf(request.getParameter("notice_seq")));
		 		
		
		return "redirect:customercenter.mdo";
	}
	
	@RequestMapping(value="/mofify_qna.mdo",method=RequestMethod.POST)
	public String mofify_qna(HttpServletRequest request) {
		
		AdminQnaVO qnaVO = new AdminQnaVO();
			qnaVO.setAsk_seq(Integer.valueOf(request.getParameter("seq")));
			
			
			adminQnaService.modify_qna(qnaVO);
		
		return "redirect:customercenter.mdo";
		
	}
	

	
	

}

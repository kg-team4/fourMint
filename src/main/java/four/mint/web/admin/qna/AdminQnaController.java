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
		
		  adminQnaService.qna_delete(Integer.valueOf(request.getParameter("ask_seq")));
		 		
		
		return "redirect:customercenter.mdo";
	}
	
	@RequestMapping(value="/modify_faq.mdo",method=RequestMethod.POST)
	public String modify_qna(HttpServletRequest request) {
		
		AdminAnswerVO answerVO = new AdminAnswerVO();
			answerVO.setAsk_seq(Integer.valueOf(request.getParameter("ask_seq")));
			answerVO.setContent(request.getParameter("content"));
			
			
			adminQnaService.modify_qna(answerVO);
			adminQnaService.update_status(Integer.valueOf(request.getParameter("ask_seq")));
		
		
		return "redirect:customercenter.mdo";
		
	}
	
	
	

	
	

}
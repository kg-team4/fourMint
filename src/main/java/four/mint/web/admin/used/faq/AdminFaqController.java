package four.mint.web.admin.used.faq;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class AdminFaqController {
	
	@Autowired
	private AdminFaqService adminFaqService;
	
	@RequestMapping(value="/utilities-usedfaq.mdo",method= RequestMethod.GET)
	public String faq(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminFaqVO> adminfaqlist = adminFaqService.getAdminFaqList();
		request.setAttribute("list", adminfaqlist);
		
		return "/utilities-usedfaq";
	}
	
	@RequestMapping(value="/faq.mdo",method=RequestMethod.POST)
	public String marketfaq(HttpServletRequest request) {
		
		AdminFaqVO faqVO = new AdminFaqVO();
			faqVO.setFaq_title(request.getParameter("title"));
			faqVO.setFaq_content(request.getParameter("content"));
			faqVO.setFaq_category(request.getParameter("category"));
		
		adminFaqService.insertfaq(faqVO);
		
		return "redirect:utilities-usedfaq.mdo";
		
	}

	@RequestMapping(value ="/etc.mdo" , method = RequestMethod.GET)
	public String etc(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminFaqVO> adminfaqlist = adminFaqService.getAdminFaqList();
		request.setAttribute("list", adminfaqlist);
		
		return "/etc";
	}
	
	@RequestMapping(value ="/exchange.mdo" , method = RequestMethod.GET)
	public String exchange(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminFaqVO> adminfaqlist = adminFaqService.getAdminFaqList();
		request.setAttribute("list", adminfaqlist);
		
		return "/exchange";
	}
	
	@RequestMapping(value ="/cancel.mdo" , method = RequestMethod.GET)
	public String cancel(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminFaqVO> adminfaqlist = adminFaqService.getAdminFaqList();
		request.setAttribute("list", adminfaqlist);
		
		return "/cancel";
	}
	
	@RequestMapping(value ="/delivery.mdo" , method = RequestMethod.GET)
	public String delivery(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminFaqVO> adminfaqlist = adminFaqService.getAdminFaqList();
		request.setAttribute("list", adminfaqlist);
		
		return "/delivery";
	}
	
	@RequestMapping(value ="/order.mdo" , method = RequestMethod.GET)
	public String order(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminFaqVO> adminfaqlist = adminFaqService.getAdminFaqList();
		request.setAttribute("list", adminfaqlist);
		
		return "/order";
	}
	
	@RequestMapping(value ="/mintmarket.mdo" , method = RequestMethod.GET)
	public String mintmarket(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("admin_id") == null) {
			return "redirect:login.mdo";
		}
		
		List<AdminFaqVO> adminfaqlist = adminFaqService.getAdminFaqList();
		request.setAttribute("list", adminfaqlist);
		
		return "/mintmarket";
	}
	
	@RequestMapping(value="/faq_delete.mdo", method = RequestMethod.POST)
	public String faq_delete(HttpServletRequest request, @RequestParam("faq_seq") int faq_seq) {
		
		  adminFaqService.faq_delete(faq_seq);
		
		return "redirect:utilities-usedfaq.mdo";
	}
	
	@RequestMapping(value="/update_faq.mdo",method=RequestMethod.POST)
	public String update_faq(HttpServletRequest request) {
		
		AdminFaqVO faqVO = new AdminFaqVO();
			faqVO.setFaq_seq(Integer.valueOf(request.getParameter("seq")));
			faqVO.setFaq_title(request.getParameter("title"));
			faqVO.setFaq_content(request.getParameter("content"));
			faqVO.setFaq_category(request.getParameter("category"));
			
			adminFaqService.update_faq(faqVO);
		
		return "redirect:utilities-usedfaq.mdo";
		
	}
	
}

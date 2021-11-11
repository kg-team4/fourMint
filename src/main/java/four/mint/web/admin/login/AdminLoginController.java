package four.mint.web.admin.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminLoginController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/login.mdo", method = RequestMethod.GET)
	public String login() {
		
		return "/login";
	}
	
	@RequestMapping(value ="/login.mdo", method = RequestMethod.POST)
	public String login(AdminVO vo, HttpSession session) {
		AdminVO admin = adminService.getAdmin(vo);
		if(admin != null) {
			session.setAttribute("admin_id", admin.getId());
			System.out.println("로그인 성공: " + admin.getId());
			
			return "/index";
		} else {
			System.out.println("로그인 실패");
			
			return "/login";
		}
	}
}
	
	

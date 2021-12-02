package four.mint.web.admin.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import four.mint.web.common.AES256Util;
import four.mint.web.user.market.MarketService;

@Controller
public class AdminLoginController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping(value="/login.mdo", method = RequestMethod.GET)
	public String login() {
		
		return "/login";
	}
	
	@RequestMapping(value ="/login.mdo", method = RequestMethod.POST)
	public String login(AdminVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, GeneralSecurityException, IOException {
		vo.setId(request.getParameter("id"));
		AES256Util.setKey(marketService.getKey().getKey());
		AES256Util aes = new AES256Util();
		String encoding = aes.encrypt(request.getParameter("password"));
		vo.setPassword(encoding);
		AdminVO admin = adminService.getAdmin(vo);
		
		if(admin != null) {
			session.setAttribute("admin_id", admin.getId());
			session.setAttribute("admin_password", admin.getPassword());
			
			return "redirect:home.mdo";
		} 
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요'); </script>");
		out.flush();

		return "/login";
	}
}
	
	

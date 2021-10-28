package four.mint.web.admin;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@RequestMapping(value = "/home.mdo", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/index";
	}
	
}

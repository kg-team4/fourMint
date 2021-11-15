package four.mint.web.user.servicecenter;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceCenterController {
	/*
	 * @Autowired private ServiceCenterService serviceCenterService;
	 */
	
	@RequestMapping(value = "/storeServiceCenter.do", method = RequestMethod.GET)
	public String storeServiceCenter() {
		
		return "/footer_contents/store_service_center";
	}
	
	@RequestMapping(value = "/locationPolicy.do", method = RequestMethod.GET)
	public String locationPolicy() {
		
		return "/footer_contents/location_policy";
	}
	
	@RequestMapping(value = "/privacyPolicy.do", method = RequestMethod.GET)
	public String privacyPolicy() {
		
		return "/footer_contents/privacy_policy";
	}
	
	@RequestMapping(value = "/useAgreement.do", method = RequestMethod.GET)
	public String useAgreement() {
		
		return "/footer_contents/use_agreement";
	}
	@RequestMapping(value = "/storeServiceCenterFAQ.do", method = RequestMethod.GET)
	public String storeServiceCenterFAQ() {
		
		return "/footer_contents/store_service_center_faq";
	}
}


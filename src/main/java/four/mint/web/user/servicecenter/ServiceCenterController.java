package four.mint.web.user.servicecenter;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceCenterController {
	/*
	 * @Autowired private ServiceCenterService serviceCenterService;
	 */
	@Autowired
	private ServiceCenterService serviceCenterService;
	
	@RequestMapping(value = "/storeServiceCenter.do", method = RequestMethod.GET)
	public String ServiceCenter(HttpServletRequest request, HttpServletResponse response) {
		List<ServiceCenterVO> staticNoticeList = serviceCenterService.getServiceCenterStaticNoticeList();
		request.setAttribute("staticNoticeList", staticNoticeList);

		List<ServiceCenterVO> normalNoticeList = serviceCenterService.getServiceCenterNormalNoticeList();
		request.setAttribute("normalNoticeList", normalNoticeList);
						
		return "/footer_contents/store_service_center";
	}
	
	@RequestMapping(value = "/storeServiceCenterFAQ.do", method = RequestMethod.GET)
	public String ServiceCenterFAQ(HttpServletRequest request, HttpServletResponse response) {		
		String kind = request.getParameter("kind");
		request.setAttribute("kind", kind);
		
		List<ServiceCenterFaqVO> faqCategoryList = serviceCenterService.getKindList(kind);
		request.setAttribute("faqCategoryList", faqCategoryList);
		
		List<ServiceCenterFaqVO> faqAllList = serviceCenterService.getServiceCenterFaqAllList(); 
		request.setAttribute("faqAllList", faqAllList);		
		
		return "/footer_contents/store_service_center_faq";
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
	
}


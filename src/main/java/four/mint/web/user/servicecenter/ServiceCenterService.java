package four.mint.web.user.servicecenter;

import java.util.List;

public interface ServiceCenterService {

	List<ServiceCenterVO> getServiceCenterStaticNoticeList();
	
	List<ServiceCenterVO> getServiceCenterNormalNoticeList();
	
	List<ServiceCenterFaqVO> getKindList(String kind);
	
	List<ServiceCenterFaqVO> getServiceCenterFaqAllList();
	
}

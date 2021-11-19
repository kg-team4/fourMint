package four.mint.web.user.servicecenter;

import java.util.List;

public interface ServiceCenterService {

	List<ServiceCenterVO> getServiceCenterStaticNoticeList();
	
	List<ServiceCenterVO> getServiceCenterNormalNoticeList();
	
}

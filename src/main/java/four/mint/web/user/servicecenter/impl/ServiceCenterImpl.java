package four.mint.web.user.servicecenter.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.user.servicecenter.ServiceCenterService;
import four.mint.web.user.servicecenter.ServiceCenterVO;

@Service("serviceCenterService")
public class ServiceCenterImpl implements ServiceCenterService {

	@Autowired
	private ServiceCenterDAO serviceCenterDao;
	
	@Override
	public List<ServiceCenterVO> getServiceCenterStaticNoticeList() {
		List<ServiceCenterVO> staticNoticeVo = serviceCenterDao.getServiceCenterStaticNoticeList();
		return staticNoticeVo;
	}
	@Override
	public List<ServiceCenterVO> getServiceCenterNormalNoticeList() {
		List<ServiceCenterVO> normalNoticeVo= serviceCenterDao.getServiceCenterNormalNoticeList();
		return normalNoticeVo;
	}
}

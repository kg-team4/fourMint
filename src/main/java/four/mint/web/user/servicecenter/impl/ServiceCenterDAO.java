package four.mint.web.user.servicecenter.impl;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.user.servicecenter.ServiceCenterVO;

@Repository
public class ServiceCenterDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ServiceCenterVO> getServiceCenterStaticNoticeList() {
		System.out.println("====> serviceCenterStaticNoticeList SELECT");

		return sqlSessionTemplate.selectList("ServiceCenterDAO.getServiceCenterStaticNoticeList");
	}
	
	public List<ServiceCenterVO> getServiceCenterNormalNoticeList() {
		System.out.println("====> getServiceCenterNormalNoticeList SELECT");

		return sqlSessionTemplate.selectList("ServiceCenterDAO.getServiceCenterNormalNoticeList");
	}
}

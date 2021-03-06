package four.mint.web.admin.announce.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.announce.AdminAnnounceVO;
import four.mint.web.admin.used.faq.AdminFaqVO;

@Repository
public class AdminAnnounceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminAnnounce(AdminAnnounceVO vo) {
		sqlSessionTemplate.insert("AdminAnnounceDAO.insertAdmin",vo);
	}
	
	public AdminAnnounceVO getAdminAnnounce(AdminAnnounceVO vo) {
		return(AdminAnnounceVO)sqlSessionTemplate.selectOne("AdminAnnounceDAO.getAdminAnnounce",vo);							
	}
	
	public List<AdminAnnounceVO >getAdminAnnounceList(){
		
		return sqlSessionTemplate.selectList("AdminAnnounceDAO.getAdminAnnounceList");
	}

	public void announce_delete(int parameter) {
		sqlSessionTemplate.delete("AdminAnnounceDAO.announce_delete", parameter);
	}

	public void update_announcement(AdminAnnounceVO announcementVO) {
		sqlSessionTemplate.update("AdminAnnounceDAO.update_announcement", announcementVO);
	}
}

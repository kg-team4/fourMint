package four.mint.web.admin.page;

import java.util.List;

import four.mint.web.admin.login.AdminVO;

public interface AdminPageService {
	void insertDeletemember(AdminPageVO vo);
	AdminPageVO getAdmin(AdminPageVO vo);

	List<AdminPageVO> getAdminPageList();
	
	List<AdminMemberListVO>getAdminMemberList();
	
	
}

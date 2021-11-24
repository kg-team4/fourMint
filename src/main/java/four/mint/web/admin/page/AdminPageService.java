package four.mint.web.admin.page;

import java.util.List;

import four.mint.web.admin.login.AdminVO;

public interface AdminPageService {
	void insertAdminmember(AdminPageVO vo);
	AdminPageVO getAdmin(AdminPageVO vo);
	String getname(AdminPageVO vo);

	List<AdminPageVO> getAdminPageList();
	
	void deleteMember(String nickname);
}

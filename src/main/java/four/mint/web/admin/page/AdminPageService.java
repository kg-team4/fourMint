package four.mint.web.admin.page;

import java.util.List;

import four.mint.web.admin.login.AdminVO;

public interface AdminPageService {

	List<AdminPageVO> getAdminPageList();
	
	void deleteMember(String nickname);
	
	AdminPageVO getMemberOne(String nickname);
}

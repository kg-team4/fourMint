package four.mint.web.admin.announce;

import java.util.List;

public interface AdminAnnounceService {
	void insertannounce(AdminAnnounceVO vo);
	AdminAnnounceVO getAdmin(AdminAnnounceVO vo);
	
	List<AdminAnnounceVO>getAdminAnnounceList();

}

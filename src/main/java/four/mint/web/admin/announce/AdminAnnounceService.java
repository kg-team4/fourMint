package four.mint.web.admin.announce;

import java.util.List;

public interface AdminAnnounceService {
	void insertAdminAnnounce(AdminAnnounceVO vo);
	AdminAnnounceVO getAdmin(AdminAnnounceVO vo);
	
	List<AdminAnnounceVO>getAdminAnnounceList();
	void announce_delete(int parameter);
	void update_announcement(AdminAnnounceVO announcementVO);

}

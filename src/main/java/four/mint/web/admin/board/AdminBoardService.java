package four.mint.web.admin.board;

import java.util.List;

public interface AdminBoardService {
	void insertmarketboard(AdminBoardVO vo);
	AdminBoardVO getAdmin(AdminBoardVO vo);
	
	List<AdminBoardVO>getAdminBoardList();
	
}

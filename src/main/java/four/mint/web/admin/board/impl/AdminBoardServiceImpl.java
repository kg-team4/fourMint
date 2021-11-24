package four.mint.web.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.admin.board.AdminBoardService;
import four.mint.web.admin.board.AdminBoardVO;

@Service("adminBoardService")
public class AdminBoardServiceImpl implements AdminBoardService{
	
	@Autowired
	private AdminBoardDAO adminBoardDAO;

	@Override
	public void insertmarketboard(AdminBoardVO vo) {
		adminBoardDAO.insertAdminBoard(vo);
	}

	@Override
	public AdminBoardVO getAdmin(AdminBoardVO vo) {
		AdminBoardVO newVo = adminBoardDAO.getAdminBoard(vo);
		return null;
	}

	@Override
	public List<AdminBoardVO> getAdminBoardList() {		
		return adminBoardDAO.getAdminBoardList();
	}
}

package four.mint.web.admin.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import four.mint.web.admin.board.AdminBoardVO;


@Repository
public class AdminBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminBoard(AdminBoardVO vo) {
		System.out.println("중고상품 글 관리");
		sqlSessionTemplate.insert("AdminBoardDAO.insertAdmin",vo);
	}
	
	public AdminBoardVO getAdminBoard(AdminBoardVO vo) {
		return (AdminBoardVO)sqlSessionTemplate.selectOne("AdminBoardDAO.getAdminBoard");
	}
	
	public List<AdminBoardVO>getAdminBoardList(){
		return sqlSessionTemplate.selectList("AdminBoardDAO.getAdminBoardList");
		
	}
}

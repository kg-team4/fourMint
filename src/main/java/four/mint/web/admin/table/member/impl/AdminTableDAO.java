package four.mint.web.admin.table.member.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.table.member.AdminTableVO;
import four.mint.web.user.UserVO;


@Repository
public class AdminTableDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminTable(AdminTableVO vo) {
		System.out.println("회원목록");
		sqlSessionTemplate.insert("AdminTableDAO.insertAdmin",vo);
	}
	
	public AdminTableVO getAdminTable(AdminTableVO vo) {
		return(AdminTableVO)sqlSessionTemplate.selectOne("AdminTableDAO.getAdminTable",vo);	
	}
	
	public List<AdminTableVO> getAdminTableList(){		
		return sqlSessionTemplate.selectList("AdminTableDAO.getAdminTableList");
	}
	
	public int  getAdminTableWoman() {
		return sqlSessionTemplate.selectOne("AdminTableDAO.getAdminTableWoman");
	}
	
	public int  getAdminTableMan() {
		return sqlSessionTemplate.selectOne("AdminTableDAO.getAdminTableMan");
	}

	public ArrayList<UserVO> getAddress2() {
		
		return (ArrayList)sqlSessionTemplate.selectList("UserDAO.getAddressList");
	}
	
	public List<String> getBirth() {
			
		return sqlSessionTemplate.selectList("UserDAO.getAdminBirth");
	}
	
	public ArrayList<AdminTableVO> getAddressMan() {
		
		return (ArrayList)sqlSessionTemplate.selectList("AdminTableDAO.getAddressMan");
	}
	
	public ArrayList<AdminTableVO> getAddressWoman() {
		
		return (ArrayList)sqlSessionTemplate.selectList("AdminTableDAO.getAddressWoman");
	}
	
}

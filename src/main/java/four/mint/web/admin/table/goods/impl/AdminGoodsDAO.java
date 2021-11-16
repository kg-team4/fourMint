package four.mint.web.admin.table.goods.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.admin.table.goods.AdminGoodsVO;

@Repository
public class AdminGoodsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdminGoods(AdminGoodsVO vo) {
		System.out.println("스토어 물품 목록");
		sqlSessionTemplate.insert("AdminGoodsDAO.insertAdmin",vo);		
	}
	public AdminGoodsVO getAdminGoods(AdminGoodsVO vo) {
		return (AdminGoodsVO)sqlSessionTemplate.selectOne("AdminGoodsDAO.getAdminGoods",vo);
	}
	
	public List<AdminGoodsVO> getAdminGoodsList(){
		return sqlSessionTemplate.selectList("AdminGoodsDAO.getAdminGoodsList");
	}
}

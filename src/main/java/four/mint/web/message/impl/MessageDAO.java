package four.mint.web.message.impl;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import four.mint.web.message.MessageVO;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; //
	
	// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 nick
	public ArrayList<MessageVO> getMessageList(MessageVO messageVO) {
		System.out.println("====> message list load");
		return (ArrayList)sqlSessionTemplate.selectList("MessageDAO.getMessageList", messageVO);
	}
	
	// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
	public int getCountUnread(MessageVO messageVO) {
		return sqlSessionTemplate.selectOne("MessageDAO.getCountUnread", messageVO);
	}
	
	// 현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
	public String getOtherProfile(MessageVO messageVO) {
		return sqlSessionTemplate.selectOne("MessageDAO.getOtherProfile", messageVO);
	}

	// 메세지 내역을 가져온다
	public ArrayList<MessageVO> getRoomContentList(MessageVO messageVO) {
		return (ArrayList)sqlSessionTemplate.selectList("MessageDAO.getRoomContentList", messageVO);
	}

	// 해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다.
	public void getMessageReadCheck(MessageVO messageVO) {
		sqlSessionTemplate.update("MessageDAO.getMessageReadCheck", messageVO);
	}
	
	// 프로필에서 보낸거다
	public int getExistChat(MessageVO messageVO) {
		return sqlSessionTemplate.selectOne("MessageDAO.getExistChat", messageVO);
	}
	
	// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함
	//  message 테이블의 room 최댓값을 구해서 to에 set 한다.
	public int getMaxRoom(MessageVO messageVO) {
		return sqlSessionTemplate.selectOne("MessageDAO.getMaxRoom", messageVO);
	}
	
	// 메세지 내역이 있다면 해당 room 번호를 가져온다.
	public int getSelectRoom(MessageVO messageVO) {
		return sqlSessionTemplate.selectOne("MessageDAO.getSelectRoom", messageVO);
	}
	
	public int getMessageSendInlist(MessageVO messageVO) {
		return sqlSessionTemplate.insert("MessageDAO.getMessageSendInlist", messageVO);
	}
}

package four.mint.web.message.impl;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import four.mint.web.message.MessageService;
import four.mint.web.message.MessageVO;

@Service("messageService")	//
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;
	
	// 메세지 리스트
	@Override
	public ArrayList<MessageVO> getMessageList(MessageVO messageVO) {

		String nickname = messageVO.getNickname();
//		System.out.println("닉네임 : " + nickname);
		// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 nick
		ArrayList<MessageVO> list = messageDAO.getMessageList(messageVO);
//		System.out.println(list.toString());
		for (MessageVO vo : list) {
			vo.setNickname(nickname);
			// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
			int unread = messageDAO.getCountUnread(messageVO);
			// 현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
			String profile = messageDAO.getOtherProfile(messageVO);
			// 안읽은 메세지 갯수를 vo에 set한다.
			vo.setUnread(unread);
			// 메세지 상대의 프로필사진을 vo에 set한다.
			vo.setProfile(profile);
			// 메세지 상대 nickname을 세팅한다. other_nick
			if (nickname.equals(vo.getSend_nick())) {
				vo.setOther_nick(vo.getRecv_nick());
			} else {
				vo.setOther_nick(vo.getSend_nick());
			}
		}

		return list;
	}


	// room 별 메세지 내용을 가져온다.
	@Override
	public ArrayList<MessageVO> getRoomContentList(MessageVO messageVO) {

//		System.out.println("room : " + messageVO.getRoom());
//		System.out.println("recv_nick : " + messageVO.getRecv_nick());
//		System.out.println("nick : " + messageVO.getNickname());
		// 메세지 내역을 가져온다
		ArrayList<MessageVO> clist = messageDAO.getRoomContentList(messageVO);

		// 해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
		messageDAO.getMessageReadCheck(messageVO);

		return clist;
	}
		
	// 메세지 list에서 메세지를 보낸다.
	@Override
	public int getMessageSendInlist(MessageVO messageVO) {

		// 메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
		if (messageVO.getRoom() == 0) { // room이 0이라면 프로필에서 보낸거다
			int exist_chat = messageDAO.getExistChat(messageVO);
			// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함
			if (exist_chat == 0) { // 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
				int max_room = messageDAO.getMaxRoom(messageVO);
				messageVO.setRoom(max_room + 1);
			} else { // 메세지 내역이 있다면 해당 room 번호를 가져온다.
				int room = messageDAO.getSelectRoom(messageVO);
				messageVO.setRoom(room);
			}
		}

		int flag = messageDAO.getMessageSendInlist(messageVO);
		
		return flag;
	}
}

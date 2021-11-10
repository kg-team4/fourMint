package four.mint.web.message;

import java.util.ArrayList;

public interface MessageService {
	ArrayList<MessageVO> getMessageList(MessageVO messageVO);
	ArrayList<MessageVO> getRoomContentList(MessageVO messageVO);
	int getMessageSendInlist(MessageVO messageVO);
}

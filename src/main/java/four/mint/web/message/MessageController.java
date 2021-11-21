package four.mint.web.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService; //

	// 메세지 목록
	@RequestMapping(value = "/message_list.do", method = RequestMethod.GET)
	public String MessageList(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

		String nickname = (String) session.getAttribute("nickname");

		MessageVO messageVO = new MessageVO();
		messageVO.setNickname(nickname);
		// 메세지 리스트
		ArrayList<MessageVO> list = messageService.getMessageList(messageVO);

		request.setAttribute("list", list);

		return "message/message_list";
	}

	// 메세지 목록
	@RequestMapping(value = "/message_ajax_list.do", method = RequestMethod.GET)
	public String MessageAjaxList(HttpServletRequest request, HttpSession session) {

		String nickname = (String) session.getAttribute("nickname");

		MessageVO messageVO = new MessageVO();
		messageVO.setNickname(nickname);

		// 메세지 리스트
		ArrayList<MessageVO> list = messageService.getMessageList(messageVO);

		request.setAttribute("list", list);

		return "message/message_ajax_list";
		
	}

	@RequestMapping(value = "/message_content_list.do", method = RequestMethod.GET)
	public String MessageContentList(HttpServletRequest request, HttpSession session) {

		int room = Integer.parseInt(request.getParameter("room"));

		MessageVO messageVO = new MessageVO();
		messageVO.setRoom(room);
		messageVO.setNickname((String) session.getAttribute("nickname"));

		// 메세지 내용을 가져온다.
		ArrayList<MessageVO> list = messageService.getRoomContentList(messageVO);

		request.setAttribute("list", list);

		return "message/message_content_list";
	}
	
	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do", method = RequestMethod.GET)
	public int MessageSendInlist(@RequestParam int room, @RequestParam String other_nick, @RequestParam String content,
			HttpSession session) {
		
		MessageVO messageVO = new MessageVO();
		messageVO.setRoom(room);
		messageVO.setSend_nick((String) session.getAttribute("nickname"));
		messageVO.setNickname((String) session.getAttribute("nickname"));
		messageVO.setRecv_nick(other_nick);
		messageVO.setOther_nick(other_nick);
		messageVO.setContent(content);
		
		int flag = messageService.getMessageSendInlist(messageVO);
		
		return flag;
	}

	// 메세지 리스트에서 이모티콘 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_image.do", method = RequestMethod.GET)
	public int ImageSendInlist(@RequestParam int room, @RequestParam String other_nick, @RequestParam String image,
			HttpSession session) {

		MessageVO messageVO = new MessageVO();
		messageVO.setRoom(room);
		messageVO.setSend_nick((String) session.getAttribute("nickname"));
		messageVO.setNickname((String) session.getAttribute("nickname"));
		messageVO.setRecv_nick(other_nick);
		messageVO.setOther_nick(other_nick);
		messageVO.setImage(image);

		int flag = messageService.getMessageSendInlist(messageVO);

		return flag;
	}

	// 메세지 목록 가져오기
	@RequestMapping(value = "/message_content_list_inprofile.do", method = RequestMethod.GET)
	public String message_content_list_inprofile(HttpServletRequest request, HttpSession session) {

		System.out.println("other profile 메세지 리스트 가져오기");

		String other_nick = request.getParameter("other_nick");

		MessageVO messageVO = new MessageVO();
		messageVO.setRecv_nick(other_nick);
		messageVO.setNickname((String) session.getAttribute("nickname"));

		// 메세지 내용을 가져온다.
		ArrayList<MessageVO> list = messageService.getRoomContentList(messageVO);

		request.setAttribute("list", list);

//		System.out.println(list);

		return "message/message_content_list";
	}
	
	// 중고 마켓에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist_inprofile.do", method = RequestMethod.GET)
	public int message_send_inlist_inprofile(@RequestParam String other_nick, @RequestParam String content,
			HttpSession session) {
//		System.out.println("컨트롤러 들어옴");
//		System.out.println("other_nick: " + other_nick);
//		System.out.println("content: " + content);

		MessageVO messageVO = new MessageVO();
		messageVO.setSend_nick(String.valueOf(session.getAttribute("nickname")));
		messageVO.setNickname(String.valueOf(session.getAttribute("nickname")));
		messageVO.setRecv_nick(other_nick);
		messageVO.setOther_nick(other_nick);
		messageVO.setContent(content);

		int flag = messageService.getMessageSendInlist(messageVO);

		return flag;
	}
	
	// 중고 마켓에서 이미지 보내기
		@ResponseBody
		@RequestMapping(value = "/message_send_inlist_image.do", method = RequestMethod.GET)
		public int message_send_inlist_image(@RequestParam String other_nick, @RequestParam String image,
				HttpSession session) {
//			System.out.println("컨트롤러 들어옴");
//			System.out.println("other_nick: " + other_nick);
//			System.out.println("image: " + image);

			MessageVO messageVO = new MessageVO();
			messageVO.setSend_nick(String.valueOf(session.getAttribute("nickname")));
			messageVO.setNickname(String.valueOf(session.getAttribute("nickname")));
			messageVO.setRecv_nick(other_nick);
			messageVO.setOther_nick(other_nick);
			messageVO.setImage(image);

			int flag = messageService.getMessageSendInlist(messageVO);

			return flag;
		}
}

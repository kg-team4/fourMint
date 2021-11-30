<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<title>어서오세요! 민트마켓!</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- CSS File -->
<link href="${pageContext.request.contextPath}/resources/user/css/message/message.css" rel="stylesheet">
<div class="msg-container">
	<div class="messaging">
		<div class="inbox_msg">
			<!-- 메세지 목록 영역 -->
			<div class="inbox_people">
				<div class="headind_srch">
					<div class="recent_heading">
						<h4>채팅목록</h4>
					</div>
					<!-- 메세지 검색 -->
					<div class="srch_bar">
						<div class="stylish-input-group">
							<input type="text" class="search-bar" style="padding-left: 10px" placeholder="Search"> <input type="button" class="chat-search-icon" onclick="aaa()">
						</div>
					</div>
				</div>
				<!-- 메세지 리스트 -->
				<div class="inbox_chat"></div>
			</div>
			<!-- 메세지 내용 영역 -->
			<div class="mesgs" style="width: 50%; margin-left: 10%">
				<!-- 메세지 내용 목록 -->
				<div class="msg_history" name="contentList" style="height: 490px;">
					<!-- 메세지 내용이 올 자리 -->
				</div>
				<div class="send_message"></div>
				<!-- 메세지 입력란이 올자리 -->
			</div>
		</div>
	</div>
</div>
<script>
	// 메세지 리스트를 다시 가져온다.
	const FirstMessageList = function() {
		$
				.ajax({
					url : "message_ajax_list.do",
					method : "get",
					data : {},
					success : function(data) {
						console.log("메세지 리스트 리로드 성공");

						$('.inbox_chat').html(data);

						// 메세지 리스트중 하나를 클릭했을 때
						$('.chat_list')
								.on(
										'click',
										function() {
											//alert('room : '+ $(this).attr('room'));
											let room = $(this).attr('room');
											let other_nick = $(this).attr(
													'other_nick');

											// 선택한 메세지빼고 나머지는 active 효과 해제하기
											$('.chat_list_box').not(
													'.chat_list_box.chat_list_box'
															+ room)
													.removeClass('active_chat');
											// 선택한 메세지만 active 효과 주기
											$('.chat_list_box' + room)
													.addClass('active_chat');

											let send_msg = "";
											send_msg += "<div class='type_msg'>";
											send_msg += "   <div class='input_msg_write row'>";
											send_msg += "      <div class='emo_div' style='width: auto; height: 120px; background: white; display:none; overflow:scroll; overflow-x:hidden;'>";
											// -------------------------------- 동녘아 여기다가 이모티콘 넣어 --------------------------------
											send_msg += "         <button id='click_emo_img1' type='button' onclick='javascript:SendImo1('${content.nickname}')'>";
											send_msg += "            <img id='message_image1' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_buying.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img2' type='button' onclick='javascript:SendImo2('${content.nickname}')'>";
											send_msg += "            <img id='message_image2' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_cry.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img3' type='button' onclick='javascript:SendImo3('${content.nickname}')'>";
											send_msg += "            <img id='message_image3' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_discount.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img4' type='button' onclick='javascript:SendImo4('${content.nickname}')'>";
											send_msg += "            <img id='message_image4' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_flex.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img5' type='button' onclick='javascript:SendImo5('${content.nickname}')'>";
											send_msg += "            <img id='message_image5' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_going.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img6' type='button' onclick='javascript:SendImo6('${content.nickname}')'>";
											send_msg += "            <img id='message_image6' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_heart.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img7' type='button' onclick='javascript:SendImo7('${content.nickname}')'>";
											send_msg += "            <img id='message_image7' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_late.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img8' type='button' onclick='javascript:SendImo8('${content.nickname}')'>";
											send_msg += "            <img id='message_image8' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_laugh.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img9' type='button' onclick='javascript:SendImo9('${content.nickname}')'>";
											send_msg += "            <img id='message_image9' class='img_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_like.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img10' type='button' onclick='javascript:SendImo10('${content.nickname}')'>";
											send_msg += "            <img id='message_image10' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_mine.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img11' type='button' onclick='javascript:SendImo11('${content.nickname}')'>";
											send_msg += "            <img id='message_image11' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_no.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img12' type='button' onclick='javascript:SendImo12('${content.nickname}')'>";
											send_msg += "            <img id='message_image12' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_ok.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img13' type='button' onclick='javascript:SendImo13('${content.nickname}')'>";
											send_msg += "            <img id='message_image13' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_thank.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img14' type='button' onclick='javascript:SendImo14('${content.nickname}')'>";
											send_msg += "            <img id='message_image14' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_tired.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img15' type='button' onclick='javascript:SendImo15('${content.nickname}')'>";
											send_msg += "            <img id='message_image15' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_hung.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img16' type='button' onclick='javascript:SendImo16('${content.nickname}')'>";
											send_msg += "            <img id='message_image16' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_wish.png'>";
											send_msg += "         </button>";
											send_msg += "         <button id='click_emo_img1' type='button' onclick='javascript:SendImo1('${content.nickname}')'>";
											send_msg += "            <img id='message_image1' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_cry.png'>";
											send_msg += "         </button>";

											// -------------------------------- 여기까지야 화이팅 ^^ 하핫 ----------------------------------
											send_msg += "      </div>";
											send_msg += "      <div class='col-11' style='text-align: left;'>";
											send_msg += "         <textarea class='write_msg form-control' placeholder='메세지를 입력...' style='width: 584px; height: 60px; resize: none;'></textarea>";
											send_msg += "         <div class='button_area' style='text-align: right;'>";
											send_msg += "            <button class='button_emo' type='button'>🙂</button>";
											send_msg += "            <button class='msg_send_btn' type='button' style='position: inherit;'>전송</button>";
											send_msg += "         </div>";
											send_msg += "      </div>";
											send_msg += "   </div>";
											send_msg += "</div>";

											$(".msg_history").css({
												"background" : "#f0f5f4"
											});

											// 메세지 입력, 전송 칸을 보인다.
											$('.send_message').html(send_msg);

											// 메세지 전송버튼을 눌렀을 때
											$('.msg_send_btn').on(
													'click',
													function() {
														// 메세지 전송 함수 호출
														SendMessage(room,
																other_nick);

														// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
														// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
														//$('.chat_list_box:first').addClass('active_chat');
													});

											$('#click_emo_img1').on(
													'click',
													function() {
														SendImage1(room,
																other_nick);
													});

											$('#click_emo_img2').on(
													'click',
													function() {
														SendImage2(room,
																other_nick);
													});

											$('#click_emo_img3').on(
													'click',
													function() {
														SendImage3(room,
																other_nick);
													});

											$('#click_emo_img4').on(
													'click',
													function() {
														SendImage4(room,
																other_nick);
													});

											$('#click_emo_img5').on(
													'click',
													function() {
														SendImage5(room,
																other_nick);
													});

											$('#click_emo_img6').on(
													'click',
													function() {
														SendImage6(room,
																other_nick);
													});

											$('#click_emo_img7').on(
													'click',
													function() {
														SendImage7(room,
																other_nick);
													});

											$('#click_emo_img8').on(
													'click',
													function() {
														SendImage8(room,
																other_nick);
													});

											$('#click_emo_img9').on(
													'click',
													function() {
														SendImage9(room,
																other_nick);
													});

											$('#click_emo_img10').on(
													'click',
													function() {
														SendImage10(room,
																other_nick);
													});

											$('#click_emo_img11').on(
													'click',
													function() {
														SendImage11(room,
																other_nick);
													});

											$('#click_emo_img12').on(
													'click',
													function() {
														SendImage12(room,
																other_nick);
													});

											$('#click_emo_img13').on(
													'click',
													function() {
														SendImage13(room,
																other_nick);
													});

											$('#click_emo_img14').on(
													'click',
													function() {
														SendImage14(room,
																other_nick);
													});

											$('#click_emo_img15').on(
													'click',
													function() {
														SendImage15(room,
																other_nick);
													});

											$('#click_emo_img16').on(
													'click',
													function() {
														SendImage16(room,
																other_nick);
													});

											$(".write_msg")
													.keyup(
															function(e) {
																e
																		.preventDefault();
																var code = e.keyCode ? e.keyCode
																		: e.which;

																if (code == 13) { // EnterKey 
																	if (e.shiftKey === true) {

																	} else {
																		SendMessage(
																				room,
																				other_nick);
																	}
																	return false;
																}
															});

											$('.button_emo').on(
													'click',
													function() {
														if ($(".emo_div").is(
																":hidden")) {
															$(".emo_div")
																	.show();
														} else {
															$(".emo_div")
																	.hide();
														}
													});

											// 메세지 내용을 불러오는 함수 호출
											MessageContentList(room);
										});
					}
				})
	};

	// 메세지 리스트를 다시 가져온다.
	const MessageList = function() {
		$
				.ajax({
					url : "message_ajax_list.do",
					method : "get",
					data : {},
					success : function(data) {
						console.log("메세지 리스트 리로드 성공");

						$('.inbox_chat').html(data);

						// 메세지 리스트중 하나를 클릭했을 때
						$('.chat_list')
								.on(
										'click',
										function() {
											//alert('room : '+ $(this).attr('room'));

											let room = $(this).attr('room');
											let other_nick = $(this).attr(
													'other_nick');
											console.log(other_nick);
											// 선택한 메세지빼고 나머지는 active 효과 해제하기
											$('.chat_list_box').not(
													'.chat_list_box.chat_list_box'
															+ room)
													.removeClass('active_chat');
											// 선택한 메세지만 active 효과 주기
											$('.chat_list_box' + room)
													.addClass('active_chat');

											let send_msg = "";
											send_msg += "<div class='type_msg'>";
											send_msg += "   <div class='input_msg_write row'>";
											send_msg += "     <div class='emo_div' style='width: auto; height: 100px; background: white; display:none; overflow:scroll; overflow-x:hidden;'>";
											// -------------------------------- 동녘아 여기다가 이모티콘 넣어 --------------------------------
											send_msg += "         <button id='click_emo_img1' type='button' onclick='javascript:SendImo1('${content.nickname}')'>";
											send_msg += "            <img id='message_image1' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_buying.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img2' type='button' onclick='javascript:SendImo2('${content.nickname}')'>";
											send_msg += "            <img id='message_image2' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_cry.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img3' type='button' onclick='javascript:SendImo3('${content.nickname}')'>";
											send_msg += "            <img id='message_image3' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_discount.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img4' type='button' onclick='javascript:SendImo4('${content.nickname}')'>";
											send_msg += "            <img id='message_image4' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_flex.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img5' type='button' onclick='javascript:SendImo5('${content.nickname}')'>";
											send_msg += "            <img id='message_image5' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_going.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img6' type='button' onclick='javascript:SendImo6('${content.nickname}')'>";
											send_msg += "            <img id='message_image6' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_heart.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img7' type='button' onclick='javascript:SendImo7('${content.nickname}')'>";
											send_msg += "            <img id='message_image7' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_late.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img8' type='button' onclick='javascript:SendImo8('${content.nickname}')'>";
											send_msg += "            <img id='message_image8' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_laugh.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img9' type='button' onclick='javascript:SendImo9('${content.nickname}')'>";
											send_msg += "            <img id='message_image9' class='img_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_like.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img10' type='button' onclick='javascript:SendImo10('${content.nickname}')'>";
											send_msg += "            <img id='message_image10' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_mine.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img11' type='button' onclick='javascript:SendImo11('${content.nickname}')'>";
											send_msg += "            <img id='message_image11' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_no.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img12' type='button' onclick='javascript:SendImo12('${content.nickname}')'>";
											send_msg += "            <img id='message_image12' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_ok.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img13' type='button' onclick='javascript:SendImo13('${content.nickname}')'>";
											send_msg += "            <img id='message_image13' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_thank.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img14' type='button' onclick='javascript:SendImo14('${content.nickname}')'>";
											send_msg += "            <img id='message_image14' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_tired.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img15' type='button' onclick='javascript:SendImo15('${content.nickname}')'>";
											send_msg += "            <img id='message_image15' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_hung.png'>";
											send_msg += "         </button>";

											send_msg += "         <button id='click_emo_img16' type='button' onclick='javascript:SendImo16('${content.nickname}')'>";
											send_msg += "            <img id='message_image16' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_wish.png'>";
											send_msg += "         </button>";

											// -------------------------------- 여기까지야 화이팅 ^^ 하핫 ----------------------------------
											send_msg += "      </div>";
											send_msg += "      <div class='col-11' style='text-align: left;'>";
											send_msg += "         <textarea class='write_msg form-control' placeholder='메세지를 입력...' style='width: 584px; height: 60px; resize: none;'></textarea>";
											send_msg += "         <button class='button_emo' type='button'>🙂</button>";
											send_msg += "         <button class='msg_send_btn' type='button' style='position: inherit;'>전송</button>";
											send_msg += "      </div>";
											send_msg += "   </div>";
											send_msg += "</div>";

											// 메세지 입력, 전송 칸을 보인다.
											$('.send_message').html(send_msg);

											// 메세지 전송버튼을 눌렀을 때
											$('.msg_send_btn').on(
													'click',
													function() {

														// 메세지 전송 함수 호출
														SendMessage(room,
																other_nick);

														// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
														// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
														//$('.chat_list_box:first').addClass('active_chat');
													});

											$('#click_emo_img1').on(
													'click',
													function() {
														SendImage1(room,
																other_nick);
													});

											$('#click_emo_img2').on(
													'click',
													function() {
														SendImage2(room,
																other_nick);
													});

											$('#click_emo_img3').on(
													'click',
													function() {
														SendImage3(room,
																other_nick);
													});

											$('#click_emo_img4').on(
													'click',
													function() {
														SendImage4(room,
																other_nick);
													});

											$('#click_emo_img5').on(
													'click',
													function() {
														SendImage5(room,
																other_nick);
													});

											$('#click_emo_img6').on(
													'click',
													function() {
														SendImage6(room,
																other_nick);
													});

											$('#click_emo_img7').on(
													'click',
													function() {
														SendImage7(room,
																other_nick);
													});

											$('#click_emo_img8').on(
													'click',
													function() {
														SendImage8(room,
																other_nick);
													});

											$('#click_emo_img9').on(
													'click',
													function() {
														SendImage9(room,
																other_nick);
													});

											$('#click_emo_img10').on(
													'click',
													function() {
														SendImage10(room,
																other_nick);
													});

											$('#click_emo_img11').on(
													'click',
													function() {
														SendImage11(room,
																other_nick);
													});

											$('#click_emo_img12').on(
													'click',
													function() {
														SendImage12(room,
																other_nick);
													});

											$('#click_emo_img13').on(
													'click',
													function() {
														SendImage13(room,
																other_nick);
													});

											$('#click_emo_img14').on(
													'click',
													function() {
														SendImage14(room,
																other_nick);
													});

											$('#click_emo_img15').on(
													'click',
													function() {
														SendImage15(room,
																other_nick);
													});

											$('#click_emo_img16').on(
													'click',
													function() {
														SendImage16(room,
																other_nick);
													});

											$('#click_emo_img1').on(
													'click',
													function() {
														SendImage1(room,
																other_nick);
													});

											$(".write_msg")
													.keyup(
															function(e) {
																e
																		.preventDefault();
																var code = e.keyCode ? e.keyCode
																		: e.which;

																if (code == 13) { // EnterKey 
																	if (e.shiftKey === true) {

																	} else {
																		SendMessage(
																				room,
																				other_nick);
																	}
																	return false;
																}
															});

											$('.button_emo').on(
													'click',
													function() {
														if ($(".emo_div").is(
																":hidden")) {
															$(".emo_div")
																	.show();
														} else {
															$(".emo_div")
																	.hide();
														}
													});

											// 메세지 내용을 불러오는 함수 호출
											MessageContentList(room);

										});

						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
						$('.chat_list_box:first').addClass('active_chat');
					}
				})
	};

	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const MessageContentList = function(room) {

		$.ajax({
			url : "message_content_list.do",
			method : "GET",
			data : {
				room : room
			},
			success : function(data) {
				console.log("메세지 내용 가져오기 성공");

				// 메세지 내용을 html에 넣는다
				$('.msg_history').html(data);

				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

			},
			error : function() {
				alert('서버 에러');
			}
		});

		$('.unread' + room).empty();

	};

	// 메세지를 전송하는 함수
	const SendMessage = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let content = $('.write_msg').val();
		//alert("content: " + content);

		content = content.trim();

		if (content == "") {
			alert("메세지를 입력하세요!");
			$('.write_msg').val("");
		} else {
			$.ajax({
				url : "message_send_inlist.do",
				method : "GET",
				data : {
					room : room,
					other_nick : other_nick,
					content : content
				},
				success : function(data) {
					console.log("메세지 전송 성공");

					// 메세지 입력칸 비우기
					$('.write_msg').val("");

					// 메세지 내용  리로드
					MessageContentList(room);

					// 메세지 리스트 리로드
					MessageList();
				},
				error : function() {
					alert('서버 에러');
				}
			});
		}
	};

	// 이미지를 전송하는 함수
	const SendImage1 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image1').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage2 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image2').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage3 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_imag3').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage4 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image4').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage5 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image5').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage6 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image6').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage7 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image7').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage8 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image8').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage9 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image9').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage10 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image10').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage11 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image11').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage12 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image12').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage13 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image13').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage14 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image14').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage15 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image15').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	const SendImage16 = function(room, other_nick) {
		console.log(room);
		console.log(other_nick);
		let image = $('#message_image16').attr("src");

		$.ajax({
			url : "message_send_image.do",
			method : "GET",
			data : {
				room : room,
				other_nick : other_nick,
				image : image
			},
			success : function(data) {
				console.log("메세지 전송 성공");

				// 메세지 내용  리로드
				MessageContentList(room);

				// 메세지 리스트 리로드
				MessageList();
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};

	$(document).ready(function() {
		// 메세지 리스트 리로드
		FirstMessageList();
	});

	function aaa() {
		alert("aaa");
	}
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
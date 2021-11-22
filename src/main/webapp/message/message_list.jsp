<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="shortcut icon" type="image/x-icon"
   href="../img/logo_icon.png" />
<title>어서오세요! 민트마켓!</title>

<link rel="stylesheet" href="../css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>

<!-- CSS File -->
<link href="../css/message/message.css" rel="stylesheet">

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
                     <input type="text" class="search-bar" style="padding-left: 10px" placeholder="Search">
                     <input type="button" class="chat-search-icon" onclick="aaa()">
                  </div>
               </div>
            </div>

            <!-- 메세지 리스트 -->
            <div class="inbox_chat"></div>
         </div>

         <!-- 메세지 내용 영역 -->
         <div class="mesgs" style="width:50%; margin-left: 10%">
            <!-- 메세지 내용 목록 -->
            <div class="msg_history" name="contentList" style="height:370px;">
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
      $.ajax({
         url : "message_ajax_list.do",
         method : "get",
         data : {},
         success : function(data) {
            console.log("메세지 리스트 리로드 성공");

            $('.inbox_chat').html(data);
            
            // 메세지 리스트중 하나를 클릭했을 때
            $('.chat_list').on('click', function() {
               //alert('room : '+ $(this).attr('room'));
               let room = $(this).attr('room');
               let other_nick = $(this).attr('other_nick');
            
               // 선택한 메세지빼고 나머지는 active 효과 해제하기
               $('.chat_list_box').not('.chat_list_box.chat_list_box' + room).removeClass('active_chat');
               // 선택한 메세지만 active 효과 주기
               $('.chat_list_box' + room).addClass('active_chat');
               
               let send_msg = "";
               send_msg += "<div class='type_msg'>";
               send_msg += "   <div class='input_msg_write row'>";
               send_msg += "      <div class='emo_div' style='width: auto; height: 80px; background: white; display:none;'>";
               // -------------------------------- 동녘아 여기다가 이모티콘 넣어 --------------------------------
               send_msg += "         <button id='click_emo_img' type='button' onclick='javascript:SendImo('${content.nickname}')'>";
               send_msg += "            <img id='message_image' class='image_size' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_bad.png'>";
               send_msg += "         </button>";
               
               
               // -------------------------------- 여기까지야 화이팅 ^^ 하핫 ----------------------------------
               send_msg += "      </div>";
               send_msg += "      <div class='col-11' style='text-align: left;'>";
               send_msg += "         <textarea class='write_msg form-control' placeholder='메세지를 입력...' style='max-width: 520px; height: 60px; resize: none;'></textarea>";
               send_msg += "     	 <div class='button_area' style='text-align: right;'>";
               send_msg += "         	<button class='button_emo' type='button'>🙂</button>";
               send_msg += "         	<button class='msg_send_btn' type='button' style='position: inherit;'>전송</button>";
               send_msg += "      	</div>";
               send_msg += "      </div>";
               send_msg += "   </div>";
               send_msg += "</div>";
               
               $(".msg_history").css({"background": "#f0f5f4"});
            
               // 메세지 입력, 전송 칸을 보인다.
               $('.send_message').html(send_msg);
               
               // 메세지 전송버튼을 눌렀을 때
               $('.msg_send_btn').on('click', function() {
                  // 메세지 전송 함수 호출
                  SendMessage(room, other_nick);

                  // 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
                  // 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
                  //$('.chat_list_box:first').addClass('active_chat');
               });
               
               $('#click_emo_img').on('click', function() {
                  SendImage(room, other_nick);
               });
               
               $(".write_msg").keyup(function(e) {
                  e.preventDefault();
                  var code = e.keyCode ? e.keyCode : e.which;
               
                  if (code == 13) {   // EnterKey 
                     if (e.shiftKey === true) { 
                        
                     } else { 
                        SendMessage(room, other_nick);
                     }
                     return false;
                  }
               });

               $('.button_emo').on('click', function() {
                  if($(".emo_div").is(":hidden")) {
                     $(".emo_div").show();
                  } else {
                     $(".emo_div").hide();
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
      $.ajax({
         url : "message_ajax_list.do",
         method : "get",
         data : {},
         success : function(data) {
            console.log("메세지 리스트 리로드 성공");

            $('.inbox_chat').html(data);

            // 메세지 리스트중 하나를 클릭했을 때
            $('.chat_list').on('click', function() {
               //alert('room : '+ $(this).attr('room'));

               let room = $(this).attr('room');
               let other_nick = $(this).attr('other_nick');
               console.log(other_nick);
               // 선택한 메세지빼고 나머지는 active 효과 해제하기
               $('.chat_list_box').not('.chat_list_box.chat_list_box' + room).removeClass('active_chat');
               // 선택한 메세지만 active 효과 주기
               $('.chat_list_box' + room).addClass('active_chat');

               let send_msg = "";
               send_msg += "<div class='type_msg'>";
               send_msg += "   <div class='input_msg_write row'>";
               send_msg += "      <div class='emo_div' style='width: auto; height: 80px; background: yellow; display:none;'>";
               // -------------------------------- 동녘아 여기다가 이모티콘 넣어 --------------------------------
               send_msg += "         <button id='click_emo_img' type='button' onclick='javascript:SendImo('${content.nickname}')'>";
               send_msg += "            <img id='message_image' src='https://mintmarket.s3.ap-northeast-2.amazonaws.com/img/like.png'>";
               send_msg += "         </button>";
               // -------------------------------- 여기까지야 화이팅 ^^ 하핫 ----------------------------------
               send_msg += "      </div>";
               send_msg += "      <div class='col-11' style='text-align: left;'>";
               send_msg += "         <textarea class='write_msg form-control' placeholder='메세지를 입력...' style='max-width: 520px; height: 60px; resize: none;'></textarea>";
               send_msg += "         <button class='button_emo' type='button'>🙂</button>";
               send_msg += "         <button class='msg_send_btn' type='button' style='position: inherit;'>전송</button>";
               send_msg += "      </div>";
               send_msg += "   </div>";
               send_msg += "</div>";

               // 메세지 입력, 전송 칸을 보인다.
               $('.send_message').html(send_msg);

               // 메세지 전송버튼을 눌렀을 때
               $('.msg_send_btn').on('click', function() {

                  // 메세지 전송 함수 호출
                  SendMessage(room, other_nick);

                  // 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
                  // 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
                  //$('.chat_list_box:first').addClass('active_chat');
               });
               
               $('#click_emo_img').on('click', function() {
                  SendImage(room, other_nick);
               });
               
               $(".write_msg").keyup(function(e) {
                  e.preventDefault();
                  var code = e.keyCode ? e.keyCode : e.which;
               
                  if (code == 13) {   // EnterKey 
                     if (e.shiftKey === true) { 
                        
                     } else { 
                        SendMessage(room, other_nick);
                     }
                     return false;
                  }
               });
               
               $('.button_emo').on('click', function() {
                  if($(".emo_div").is(":hidden")) {
                     $(".emo_div").show();
                  } else {
                     $(".emo_div").hide();
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
   const SendImage = function(room, other_nick) {
      console.log(room);
      console.log(other_nick);
      let image = $('#message_image').attr("src");

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
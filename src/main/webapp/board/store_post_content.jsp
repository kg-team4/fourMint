<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.NumberFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트 스토어 상품 상세</title>
<link href="../css/reset.css" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="../js/reply.js"></script>
<link href="../css/8.board_content.css" rel="stylesheet">
<link href="../css/swiper.min.css" rel="stylesheet">
<script src="../js/swiper.min.js"></script>
<script src="../js/post_content.js"></script>

<style>
	#my_modal {
	    display: none;
	    width: 300px;
	    padding: 20px 60px;
	    background-color: #fefefe;
	    border: 1px solid #888;
	    border-radius: 3px;
	}
	
	#my_modal .modal_close_btn {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	}
</style>

<article style="padding-top: 220px" id="post-content-form">
	<div class="padding50">
		<div class="float-box float-left">

			<div class="left-item40" style="height: fit-content;">
				<!-- 이미지 슬라이더 영역 -->
				<div class="swiper-container">
					<!-- 필수 영역 -->
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<!-- 이미지 미리보기 -->
							<img class="mainimg" src="${content.url }">
						</div>
					</div>
					<!-- 이전/다음 버튼(선택) -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>

			<div class="right-item60 left-font padding-left35">
				<!-- 글제목, 상품 금액 -->
				<div class="item padding25" >
					<span class="font30">${content.product_name }</span> 
					<div style="display:flex; justify-content: flex-end">
						<div class="font27" style="padding-left:360px;padding-top:5px">
							${content.product_price}						
						</div>
						<span class=font20 style="padding-left:5px; padding-top:10px">원</span>
					</div>					
				</div>
				<div class="item padding25">
					<hr>
				</div>
				<div class="item font17 gray-font padding25">
					<span class="lightgray-font">♥</span>
					<span class="font15 padding-right05">&nbsp;1</span> 
					<span class="short-border">
					<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC"
					width="20" height="13" alt="조회수 아이콘">&nbsp;1
					</span> 
				</div>
				<div class="item font15 padding15">
					<div class="padding15">
						<span class="gray-font">&middot; 카테고리</span><span>&emsp;${content.category_big}</span>
					</div>
					<div class="padding15">
						<span class="gray-font">&middot; 배송비</span><span class="green-font">&emsp;2,500원&nbsp;(30,000원 이상 무료배송)</span>
					</div>
					<div class="padding15">
						<span class="gray-font">&middot; 수량 &emsp;</span>
						<span class="green-font">
							<input form="form1" class="amount" name="amount" type="number" value="1" autocomplete="off" maxlength="2" style="width: 50px; text-align: right;" min="1" max="10"/>
						</span>
					</div>
				</div>
				<div>
					<div class="float-box float-left">
						<div class="left-item33">
							<form action="../member/post_like.do" method="post">
								<input type="submit" class="like-button cursor" value="♥ 찜 좋아요">
							</form>
						</div>
						<!-- 수정 삭제 버튼은 "내글" -->
						
						<!-- 장바구니 모달 -->
						<div id="my_modal">
							<h3>장바구니에 담겼습니다.</h3>
							<br>
							<a href="payment.do" style="color: blue;">장바구니로 이동</a>
							&emsp;<a class="modal_close_btn">나가기</a>
						</div>
						<!-- 장바구니 모달 끝 -->
						<div class="left-item33">
							<button class="edit-button cursor" id="popup_open_btn">장바구니</button>
						</div>
						<div class="left-item33">
							<form id="form1" action="orderSoon.do">
								<input type="hidden" name="priceAll" value="${content.product_price }" />
								<c:if test="${content.product_price < 50000 }">
									<input type="hidden" name="delivery" value="1" />
								</c:if>
								<input type="hidden" name="seq" value="${content.store_seq }" />
								<input type="submit" class="delete-button cursor" value="바로구매" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="padding-top30">
		<div class="float-box float-left">
			<div class="left-item100 left-font ">
				<div class="padding15">
					<p class="font27">상품정보</p>
				</div>
				<hr>
				<div class="padding-top40 padding40 product-info-border ">
					<p class="font18">스토어 상품 정보 내용 불러오기</p>
				</div>
				
				
				<div class="padding-top70">
					<span class="font27">상품후기</span>					
				</div>
				<hr>
				<span>
					<button class="right-float btn_write_review">상품후기 작성</button>
				</span>				
				
				<input type="hidden" value="1" id="review-member1">
					<div class="float-box float-left reply-margin20 padding-top30">
						<div class="left-item10">
							<!-- 프로필 이미지 영역 -->
							<img class="reply-pic-circle" src="../img/must_go_restaurant02.jpg" alt="상품후기남긴회원이미지">
						</div>
						<div class="right-item90">
							<!-- 프로필 닉네임 / 댓글 내용 영역 -->
							<div class="reply-nick-font">
								<span style="margin-left:50px">탈퇴한 회원</span> <label id="reply-member-form" for="11">
								<input type="checkbox" id="11" value="1" onchange="">우쭈쭈동동</label>
								<span>
								&emsp;
								<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
								<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
								<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
								<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
								<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
								</span>
								<div class="info11 reply-tab-design">
									<div>
										<a href="../member/info.jsp?no=1">회원 페이지</a>
									</div>
									<form action="../member/manner.do" method="post">
										<input type="hidden" name="this_member_no" value="1">
										좋아요 누를 회원
										<input type="hidden" name="push_member_no" value="이름">
										좋아요를 누른 회원
										<input type="hidden" name="path" value="asd?asd"> <input type="hidden" name="good" value=""> <input type="submit" value="좋아요" class="submit-button">
									</form>
									<form action="../member/manner.do" method="post">
										<input type="hidden" name="this_member_no" value="1">
										좋아요 누를 회원
										<input type="hidden" name="push_member_no" value="이름">
										좋아요를 누른 회원
										<input type="hidden" name="path" value="asd?asd"> <input type="hidden" name="bad" value=""> <input type="submit" value="싫어요" class="submit-button">
									</form>
								</div>
								<span class="right-float font15 gray-font"> 2021.11.09 </span>
							</div>
							<div class="font15 reply-content-form">
								<div class="reply-content">
									<form action="edit_reply.do" method="post" id="edit-reply-form">
										<input type="hidden" name="reply_no" value="1"> <input type="hidden" name="reply_table_name" value="이름"> <input type="hidden" name="post_path" value="asd?board_no=1&used_cate_num=1&post_no=1">
										<pre class="font15 review_grid" style="margin-left:50px; line-height:150%">
										오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요! 오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요! 오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요!																		
										
										오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요! 오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요! 오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요!
										
										오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요! 오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요! 오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요!
										오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요! 오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요! 오 아주 유용한 상품이에요.. 추천합니다 유용하게 잘 쓰고 다 쓰면 다음에 또 주문할게요!
										</pre>										
									</form>
								</div>								
							</div>
							<div class="right-float reply-control">
								<div>									
									<form action="delete_reply.do" method="post" id="delete-reply-form">
										<input type="hidden" name="reply_table_name" value="이름"> 
										<input type="hidden" name="reply_no" value="1"> 
										<input type="hidden" name="post_path" value="asd?asd"> 
										<input type="submit" class="font15" value="수정">&nbsp;
										<input type="submit" class="font15" value="삭제">
									</form>
								</div>
							</div>
						</div>
					</div>
				
				<div class="padding-top70">
					<p class="font27">상품문의</p>					
					<form action="write_reply.do" method="post">
						<input type="hidden" name="no" value="1"> <input type="hidden" name="post_no" value="1"> <input type="hidden" name="reply_table_name" value="이름"> <input type="hidden" name="reply_seq_name" value="이름"> <input type="hidden" name="post_path" value="asd?asd">
						<div class="reply-div-padding">
							<div class="reply-border">
								<textarea class="text-padding font15" name="reply_content" placeholder="문의 내용 입력" cols="116" rows="5"></textarea>
							</div>
						</div>
						<div class="reply-num-border">
							<div class="float-box float-left">
								<div class="left-item50">
									<p class="font12 gray-font text-padding10">
									<p></p>
								</div>
								<div class="left-item50 text-padding10">
									<input type="submit" class="right-float reply-button" value="등록">
								</div>
							</div>
						</div>
					</form>
				</div>

				<div class="padding-top25 ">

					<input type="hidden" value="1" id="reply-member1">
					<div class="float-box float-left reply-margin20 padding-top30">
						<div class="left-item10">
							<!-- 프로필 이미지 영역 -->
							<img class="reply-pic-circle" src="../img/must_go_restaurant02.jpg" alt="상품후기남긴회원이미지">
						</div>
						<div class="right-item90">
							<!-- 프로필 닉네임 / 댓글 내용 영역 -->
							<div class="reply-nick-font">
								<span style="margin-left:50px">탈퇴한 회원</span> 
								<span id="reply-member-form" for="11">
								<input type="checkbox" id="11" value="1" onchange="">우쭈쭈동동</span>
								
								<span class="right-float font15 gray-font"> 2021.11.09 </span>
							</div>
							<div class="font15 reply-content-form">
								<div class="reply-content">
									<form action="edit_reply.do" method="post" id="edit-reply-form">
										<input type="hidden" name="reply_no" value="1"> <input type="hidden" name="reply_table_name" value="이름"> <input type="hidden" name="post_path" value="asd?board_no=1&used_cate_num=1&post_no=1">
										<pre class="review_grid font15 right-float" style="margin-left:50px; line-height:150%">
										이 제품은 언제 사용가능한건가요???? 배송은 언제 와요??
										</pre>										
									</form>
								</div>								
							</div>
							<div class="right-float reply-control">
								<div>									
									<form action="delete_reply.do" method="post" id="delete-reply-form">
										<input type="hidden" name="reply_table_name" value="이름"> 
										<input type="hidden" name="reply_no" value="1"> 
										<input type="hidden" name="post_path" value="asd?asd"> 
										<span id="re_reply_click_style">
											<label for="re-reply1"> 
											<input type="checkbox" id="re-reply1" style="display: none" value="1" onchange="reReply(this);"> 답글
											</label>
										</span>&nbsp;
										<input type="submit" class="font15" value="수정">&nbsp;
										<input type="submit" class="font15" value="삭제">
									</form>
								</div>
							</div>
						</div>
					</div><br>
															
					<div class="padding-top20 rereply-off padding-bottom30" id="rereply-form1">
						<p class="font20">답글</p>
						<form action="write_reply.do" method="post">
							<input type="hidden" name="no" value="1"> 
							<input type="hidden" name="reply_no" value="1"> 
							<input type="hidden" name="post_no" value="1"> 
							<input type="hidden" name="reply_table_name" value="이름"> 
							<input type="hidden" name="reply_seq_name" value="이름"> 
							<input
								type="hidden" name="post_path" value="asd?asd">
							<div class="reply-div-padding">
								<div class="reply-border">
									<textarea class="text-padding font15" name="reply_content" placeholder="문의답변글 또는 댓글내용" cols="116" rows="5"></textarea>
								</div>
							</div>
							<div class="reply-num-border">
								<div class="float-box float-left">
									<div class="left-item50">
										<p class="font12 gray-font text-padding10">
										<p></p>
									</div>
									<div class="left-item50 text-padding10">
										<input type="submit" class="right-float reply-button" value="등록">
									</div>
								</div>
							</div>
						</form>
					</div><br>
				</div>
			</div>
			
		</div>
	</div>
<script>
	function modal(id) {
	    var zIndex = 9999;
	    var modal = document.getElementById(id);
	
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = document.createElement('div');
	    bg.setStyle({
	        position: 'fixed',
	        zIndex: zIndex,
	        left: '0px',
	        top: '0px',
	        width: '100%',
	        height: '100%',
	        overflow: 'auto',
	        // 레이어 색갈은 여기서 바꾸면 됨
	        backgroundColor: 'rgba(0,0,0,0.4)'
	    });
	    document.body.append(bg);
	
	    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	    });
	
	    modal.setStyle({
	        position: 'fixed',
	        display: 'block',
	        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
	        // 시꺼먼 레이어 보다 한칸 위에 보이기
	        zIndex: zIndex + 1,
	
	        // div center 정렬
	        top: '50%',
	        left: '50%',
	        transform: 'translate(-50%, -50%)',
	        msTransform: 'translate(-50%, -50%)',
	        webkitTransform: 'translate(-50%, -50%)'
	    });
	}
	
	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};
	
	document.getElementById('popup_open_btn').addEventListener('click', function() {
		var seq = "${content.store_seq}";  
		var amount = $(".amount").val();
		var nickname = "${nickname}";
		$.ajax({
			url : 'cartGo.do', // 이 주소로 
			type : "post", // 포스트 방식으로 보내는데
			cache: false,
			headers: {"cache-control":"no-cache", "pragma": "no-cache"},
			data : {"seq" : seq, "amount" : amount, "nickname" : nickname} // kind를 kind로 명명하여 보내겠다
		})//ajax
		
		// 모달창 띄우기
	    modal('my_modal');
	    
	});
</script>

</article>
<jsp:include page="../template/footer.jsp"></jsp:include>
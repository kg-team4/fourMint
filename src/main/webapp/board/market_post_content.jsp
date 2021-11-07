<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.NumberFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="../css/reset.css" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="../js/reply.js"></script>
<link href="../css/8.board_content.css" rel="stylesheet">
<link href="../css/swiper.min.css" rel="stylesheet">
<script src="../js/swiper.min.js"></script>
<script type="text/javascript" src="./js/post_content.js"></script>


<article style="padding-top: 220px" id="post-content-form">
	<input type="hidden" value="회원" id="login-member"> <input type="hidden" value="1" id="post-member">
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
				<!-- 글 제목 -->
				<div class="font30 padding25">
					<span>${content.product_name }</span>
				</div>
				<!-- 상품 금액 -->
				<div class="item padding25">
					<span class="font50">${content.product_price }</span> <span class=font20>원</span>
				</div>
				<div class="item padding25">
					<hr>
				</div>
				<div class="item font17 gray-font padding25">
					<span class="lightgray-font">♥</span><span class="font15 padding-right05">&nbsp;1</span> <span class="short-border"><img
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC"
						width="20" height="13" alt="조회수 아이콘">&nbsp;1</span> <span class="padding-left05">${content.date }</span> <span class="right-float">☎&nbsp;신고하기</span>
				</div>
				<div class="item font15 padding15">
					<div class="padding15">
						<span class="gray-font">&middot; 카테고리</span><span>&emsp;${content.category_big}&nbsp;>&nbsp;${content.category_middle }</span>
					</div>
					<div class="padding15">
						<span class="gray-font">&middot; 거래지역</span><span class="green-font">&emsp;${result1}&nbsp;${result2}&nbsp;${result3}</span>
					</div>
				</div>
				<div>
					<div class="float-box float-left">
						<div class="left-item33">
							<form action="../member/post_like.do" method="post">
								<input type="hidden" name="member_no" value="1"> <input type="hidden" name="board_no" value="1"> <input type="hidden" name="post_no" value="1"> <input type="hidden" name="post_table" value="테이블"> <input type="hidden" name="post_path" value="asd?asd"> <input
									type="submit" class="like-button cursor" value="♥ 찜 좋아요">
							</form>
						</div>
						<!-- 수정 삭제 버튼은 "내글" 또는 "관리자"인 경우만 표시 -->
						<div class="left-item33">
							<a href="used_post_content_edit.jsp?post_no=1"><button class="edit-button cursor">수정</button></a>
						</div>
						<div class="left-item33">
							<a href="../member/check.jsp?go=myweb/board/usedpostdelete.do?post_no=1"><button class="delete-button cursor">삭제</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="padding-top100">
		<div class="float-box float-left">
			<div class="left-item66 padding-right30 info-border left-font">
				<div class="padding15">
					<p class="font27">상품정보</p>
				</div>
				<hr>
				<div class="padding-top40 padding40 product-info-border ">
					<p class="font18">${content.product_content }</p>
				</div>
				<hr>
				<div>
					<p class="font18">판매자 위치</p>
				</div>
				<div id="map" style="width: 100%; height: 350px;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39eac24bb00d05b4ee1a721a64dde25c&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 6
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					var address = "${result1}" + " " + "${result2}" + " "
							+ "${result3}";

					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(address, function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							var circle = new kakao.maps.Circle({
								center : coords, // 원의 중심좌표 입니다 
								radius : 1000, // 미터 단위의 원의 반지름입니다 
								strokeWeight : 1, // 선의 두께입니다 
								strokeColor : '#00a0e9', // 선의 색깔입니다
								strokeOpacity : 0.1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
								strokeStyle : 'solid', // 선의 스타일 입니다
								fillColor : '#00a0e9', // 채우기 색깔입니다
								fillOpacity : 0.2
							// 채우기 불투명도 입니다
							});

							// 지도에 원을 표시합니다 
							circle.setMap(map);

							map.setCenter(coords);
						}
					});
				</script>
				<div>
					<p class="font18">판매자 위치로부터 반경 1km</p>
				</div>
				<div class="padding-top100">
					<p class="font27">댓글</p>
					<form action="write_reply.do" method="post">
						<input type="hidden" name="no" value="1"> <input type="hidden" name="post_no" value="1"> <input type="hidden" name="reply_table_name" value="이름"> <input type="hidden" name="reply_seq_name" value="이름"> <input type="hidden" name="post_path" value="asd?asd">
						<div class="reply-div-padding">
							<div class="reply-border">
								<textarea class="text-padding font15" name="reply_content" placeholder="댓글 입력" cols="116" rows="5"></textarea>
							</div>
						</div>
						<div class="reply-num-border">
							<div class="float-box float-left">
								<div class="left-item50">
									<p class="font12 gray-font text-padding10">
									<p></p>
								</div>
								<div class="left-item50 text-padding10">
									<input type="submit" class="right-float reply-button" value="☜등록">
								</div>
							</div>
						</div>
					</form>
				</div>

				<div class="padding-top25 ">

					<input type="hidden" value="1" id="reply-member1">
					<div class="float-box float-left reply-margin20">
						<div class="left-item10">
							<!-- 프로필 이미지 영역 -->
							<img class="reply-pic-circle" src="./member/profile_img_down.do?member_img_no=1">
						</div>
						<div class="right-item90">
							<!-- 프로필 닉네임 / 댓글 내용 영역 -->
							<div class="reply-nick-font">
								<span>탈퇴한 회원</span> <label id="reply-member-form" for="11"><input type="checkbox" id="11" value="1" onchange="viewReplyMemberInfo(this);">aa</label>
								<div class="info11 reply-tab-design">
									<div>
										<a href="../member/info.jsp?no=1">회원 페이지</a>
									</div>
									<form action="../member/manner.do" method="post">
										<input type="hidden" name="this_member_no" value="1">
										<!-- 좋아요 누를 회원 -->
										<input type="hidden" name="push_member_no" value="이름">
										<!-- 좋아요를 누른 회원 -->
										<input type="hidden" name="path" value="asd?asd"> <input type="hidden" name="good" value=""> <input type="submit" value="좋아요" class="submit-button">
									</form>
									<form action="../member/manner.do" method="post">
										<input type="hidden" name="this_member_no" value="1">
										<!-- 좋아요 누를 회원 -->
										<input type="hidden" name="push_member_no" value="이름">
										<!-- 좋아요를 누른 회원 -->
										<input type="hidden" name="path" value="asd?asd"> <input type="hidden" name="bad" value=""> <input type="submit" value="싫어요" class="submit-button">
									</form>
									<div>
										<a href="">신고하기</a>
									</div>
								</div>
								<span class="right-float gray-font"> 몇분전 </span>
							</div>
							<div class="font17 padding-top10 reply-content-form">
								<div class="reply-content">
									<form action="edit_reply.do" method="post" id="edit-reply-form">
										<input type="hidden" name="reply_no" value="1"> <input type="hidden" name="reply_table_name" value="이름"> <input type="hidden" name="post_path" value="asd?board_no=1&used_cate_num=1&post_no=1">
										<textarea class="font15" name="reply_content" placeholder="내용">내용</textarea>
										<input type="submit" class="right-float reply-button" value="☜수정">
									</form>
								</div>
								<div class="reply-control">
									<div>
										<label for="re-reply1"> <input type="checkbox" id="re-reply1" style="display: none;" value="1" onchange="reReply(this);"> 답글
										</label>
									</div>
									<div>
										<a href="asd?asd&1=1">수정</a>
									</div>
									<div>
										<form action="delete_reply.do" method="post" id="delete-reply-form">
											<input type="hidden" name="reply_table_name" value="이름"> <input type="hidden" name="reply_no" value="1"> <input type="hidden" name="post_path" value="asd?asd"> <input type="submit" value="삭제" class="font15">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="padding-top20 rereply-off" id="rereply-form1">
						<p class="font20">대댓글</p>
						<form action="write_reply.do" method="post">
							<input type="hidden" name="no" value="1"> <input type="hidden" name="reply_no" value="1"> <input type="hidden" name="post_no" value="1"> <input type="hidden" name="reply_table_name" value="이름"> <input type="hidden" name="reply_seq_name" value="이름"> <input
								type="hidden" name="post_path" value="asd?asd">
							<div class="reply-div-padding">
								<div class="reply-border">
									<textarea class="text-padding font15" name="reply_content" placeholder="대댓글 입력" cols="116" rows="5"></textarea>
								</div>
							</div>
							<div class="reply-num-border">
								<div class="float-box float-left">
									<div class="left-item50">
										<p class="font12 gray-font text-padding10">
										<p></p>
									</div>
									<div class="left-item50 text-padding10">
										<input type="submit" class="right-float reply-button" value="☜등록">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="right-item34  padding-right30 padding-left30 ">
				<div class="padding15 left-font">
					<p class=" font27">상점정보</p>
				</div>
				<hr>
				<div class="padding-top30">
					<div class="float-box float-left">
						<div class="left-item25  pic-align left-font">
							<img class="reply-pic-circle" src="./member/profile_img_down.do?member_img_no=1">
						</div>
						<div class="right-item75">
							<div class="top-margin10 left-font seller">
								<!-- 작성자 -->
								<div id="member-form">
									<label class="font20" for="member-nick"> <input type="checkbox" id="member-nick" onchange="viewMemberInfo(this);">1
									</label>
									<div class="info-member-nick">
										<div>
											<a href="../member/info.jsp?no=1">회원 페이지</a>
										</div>
										<form action="../member/manner.do" method="post">
											<input type="hidden" name="this_member_no" value="1">
											<!-- 좋아요 누를 회원 -->
											<input type="hidden" name="push_member_no" value="이름">
											<!-- 좋아요를 누른 회원 -->
											<input type="hidden" name="path" value="asd?asd"> <input type="hidden" name="good" value=""> <input type="submit" value="좋아요" class="submit-button">
										</form>
										<div>
											<a href="">신고하기</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="left-font manner-margin ">
						<p class="manner-color">매너지수</p>
						<input type="range" value="1" style="width: 100%; position: relative; z-index: -1;">
					</div>

				</div>
			</div>
		</div>
	</div>
</article>
<jsp:include page="../template/footer.jsp"></jsp:include>
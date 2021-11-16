<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.NumberFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<title>민트마켓 중거거래상품 상세</title>
<link href="../css/reset.css" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<script type="text/javascript" src="../js/reply.js"></script>
<link href="../css/8.board_content.css" rel="stylesheet">
<link href="../css/swiper.min.css" rel="stylesheet">
<script src="../js/swiper.min.js"></script>
<script src="../js/post_content.js"></script>


<article style="padding-top:220px; padding-bottom:100px" id="post-content-form">
	<input type="hidden" value="회원" id="login-member"> <input type="hidden" value="1" id="post-member">
	<div class="container bootstrap snippet padding50">
		<div class="float-box float-left row">

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

			<div class="right-item60 left-font padding-left35 col-sm-3">
				<!-- 글 제목 -->
				<%-- <div class="font30 padding25">
					<span>${content.product_name }</span>
				</div> --%>
				<!-- 상품 금액 -->
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
					<span class="padding-left05">
						<img src="../img/time.png"
						width="15" height="13" alt="시간 아이콘">
						&nbsp;${date }
					</span> 
					<span class="right-float"><a href="#"><img src="../img/police.png" width="20" height="20">&nbsp;신고하기</a></span>
				</div>
				<div class="item font15 padding15">
					<div class="padding15">
						<span class="gray-font">&middot; 카테고리</span><span>&emsp;${content.category_big}&nbsp;
						<c:if test="${!empty content.category_middle}">
						>
						</c:if>
						&nbsp;${content.category_middle }</span>
					</div>
					<div class="padding15">
						<span class="gray-font">&middot; 거래지역</span><span class="green-font">&emsp;${content.address2}</span>
					</div>
				</div>
				<div class="text-center center row">
					<div class="float-box float-left col-10">
						<c:choose>
							<c:when test="${nickname eq content.nickname }">
								<div class="left-item33">
									<a href="../member/check.jsp?go=myweb/bo1ard/usedpostdelete.do?post_no=1"><button
											class="delete-button cursor">삭제</button></a>
								</div>
							</c:when>
							<c:when test="${nickname ne content.nickname and nickname ne null}">
								<div class="left-item33">
									<form action="../member/post_like.do" method="post">
										<input type="hidden" name="member_no" value="1"> <input
											type="hidden" name="board_no" value="1"> <input
											type="hidden" name="post_no" value="1"> <input
											type="hidden" name="post_table" value="테이블"> <input
											type="hidden" name="post_path" value="asd?asd"> <input
											type="submit" class="like-button cursor" value="♥ 찜 좋아요">
									</form>
								</div>
								<!-- 수정 삭제 버튼은 "내글" 또는 "관리자"인 경우만 표시 -->
								<div class="left-item33 messagesend-btn">
									<!-- 민트채팅 버튼 -->
									<button type="button"
										class="edit-button cursor msg_send_btn_profile"
										data-bs-toggle="modal" data-bs-target="#exampleModal"
										onclick="javascript:MessageContentList('${content.nickname}')">
										민트채팅</button>
								</div>
								<!-- 메세지 보내기 모달창 -->
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-scrollable">
										<div class="modal-content" style="max-height: 650px">
											<div class="modal-header">
												<span id="m_writer_profile">
													<div class="message-box">
														<!-- 프로필 이미지 -->
														<%-- <img id="messageProfileImage"
													src='./upload/profile/${to.profile }' /> --%>
													</div>
												</span>
												<h5 class="modal-title" id="exampleModalLabel">${content.nickname}</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"
													style="box-shadow: none;"></button>
											</div>
											<div class="modal-body" style="overflow-y: hidden;">
												<!-- 메세지 내용 영역 -->
												<div class="mesgs">
													<!-- 메세지 내용 목록 -->
													<div class="msg_history" name="contentList">
														<!-- 메세지 내용이 올 자리 -->
													</div>
													<div class="send_message"></div>
													<!-- 메세지 입력란이 올자리 -->
													<div class='type_msg' style="height: 45px">
														<div class='input_msg_write row'>
															<div class='col-11'>
																<textarea class='write_msg form-control'
																	placeholder='메세지를 입력...'
																	style="width: 95%; margin-top: 5px; height: 40px; box-shadow: none;"></textarea>
															</div>
															<div class='col-1'>
																<button class='msg_send_btn' type='button'
																	onclick="javascript:SendMessage('${content.nickname}')">
																	<i class='fa fa-paper-plane-o' aria-hidden='true'></i>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="padding-top50">
		<div class="float-box float-left">
			<div class="left-item66 padding-right30 info-border left-font">
				<div class="padding15">
					<p class="font27">상품정보</p>
				</div>
				<hr>
				<div class="padding-top40 padding40 product-info-border ">
					<pre style="white-space: pre-wrap;" class="font18" >${content.product_content }</pre>
				</div>
				<br><hr><br>
				<div>
					<p class="font18">판매자 위치</p>
				</div><br>
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
					
					var address = "${content.address2}";
						
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
					<p id="map_info" class="font15" >판매자 위치로부터 반경 1km</p>
				</div>
			</div>

			<div class="right-item34  padding-right30 padding-left30 ">
				<div class="padding15 left-font">
					<p class=" font27">상점정보</p>
				</div>
				<hr>
				<div class="padding-top30">
					<div class="float-box float-left" >
						<div class="left-item25  pic-align left-font">
							<a href="#">
								<img class="reply-pic-circle" src="${user.profile }">									
							</a>					
						</div>
						<div class="right-item75">
							<div class="top-margin10 left-font seller">
								<!-- 작성자 -->
								<div id="member-form">
									<div><a id="seller_nick" href="#">${user.nickname }</a></div>
									<div class="seller_grade">
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                      </div>
                                      <div id="proudct_num_follower">
                                      	상품 &nbsp;<span>${boardCount }</span> &emsp; 
                                      	팔로워 &nbsp;<span>${follow.follower }</span>
                                      </div>
                                      <c:if test="${user.nickname ne nickname }">
										<button id="btn_follow" style="width:100px"><img height="13px" width="13px" src="../img/following_icon.png">&nbsp;팔로우</button>				
                                      </c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<br><br><br><br><br><br>
			<div class="right-item34  padding-right30 padding-left30 ">
				<div class="padding15 left-font">
					<p class=" font27">상점후기</p>
				</div>
				<hr>
				<div class="padding-top30">
					<div class="float-box float-left">
						<div class="left-item25  pic-align left-font">
							<a href="#">
								<img class="reply-pic-circle" src="../img/character_sample2.jpg">									
							</a>					
						</div>
						<div class="right-item75">
							<div class="top-margin10 left-font seller">
								<!-- 작성자 -->
								<div id="member-form">
									<div><a id="seller_nick" href="#">제가샀어요</a></div>
									<div class="seller_grade" style="height:18px; width:100px">
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지">
                                      </div>
                                      <div id="buyer_review">
                                      	너무 친절하셔서 좋았어여!! 다음에 또 거래하고 싶어요!! 좋은하루되세요~!! 뭐지뭐지뭐지뭐뭐지
                                      </div>
                                      <button id="btn_follow" style="width:100px">상품후기 더보기</button>									
								</div>
							</div>
						</div>
					</div>
					
					<div class="float-box float-left">
						<div class="left-item25  pic-align left-font">
							<a href="#">
								<img class="reply-pic-circle" src="../img/badminton.png">								
							</a>					
						</div>
						<div class="right-item75">
							<div class="top-margin10 left-font seller">
								<!-- 작성자 -->
								<div id="member-form">
									<div><a id="seller_nick" href="#">reviewer</a></div>
									<div class="seller_grade" style="height:18px; width:100px">
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지"> 
                                             <img src="../img/star_rank.png" width="13" height="12" alt="별점이미지">
                                      </div>
                                      <div id="buyer_review">
                                      	직거래 바로 해주셔서 감사합니다. 룰룰루 잘 사용할게요 항상 좋은 하루 보내세용~!!!!
                                      </div>
                                      <button id="btn_follow" style="width:100px">상품후기 더보기</button>									
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</article>

<script>
	//메세지 내역을 가져온다.
	const MessageContentList = function(other_nick) {
		
		$.ajax({
			url : "message_content_list_inprofile.do",
			method : "GET",
			data : {
 				other_nick : other_nick
			},
			success : function(data) {
				// 메세지 내용을 html에 넣는다
				$(".msg_history").html(data);
				
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
	
			},
			error : function() {
				alert('서버 에러');
			}
		})
	};
	
	$(".form-control").keyup(function(e) {
		e.preventDefault();
		var code = e.keyCode ? e.keyCode : e.which;
	
		if (code == 13) {	// EnterKey 
			if (e.shiftKey === true) { 
				
			} else { 
				SendMessage('${content.nickname}');
			}
			return false;
		}
	});
	
	// 메세지를 전송하는 함수
	const SendMessage = function(other_nick) {
		console.log(other_nick);
		let content = $('.write_msg').val();
		console.log(content);
	
		content = content.trim();
	
		if (content == "") {
			alert("메세지를 입력하세요!");
		} else {
			$.ajax({
				url : "message_send_inlist_inprofile.do",
				method : "GET",
				data : {
					other_nick : other_nick,
	                content : content,	              
				},
				success : function(data) {
					console.log("메세지 전송 성공");
	
					// 메세지 입력칸 비우기
	                $('.write_msg').val("");
	
	                // 메세지 내용  리로드
	                MessageContentList(other_nick);
	
				},
				error : function() {
					alert('서버 에러');
				}
			});
		}
	};
	
	function timeForToday(value) {
	    const today = new Date();
	    const timeValue = new Date(value);
	
	    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	    if (betweenTime < 1) return '방금전';
	    if (betweenTime < 60) {
	        return `${betweenTime}분전`;
	    }
	
	    const betweenTimeHour = Math.floor(betweenTime / 60);
	    if (betweenTimeHour < 24) {
	        return `${betweenTimeHour}시간전`;
	    }
	
	    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	    if (betweenTimeDay < 365) {
	        return `${betweenTimeDay}일전`;
	    }
	
	    return `${Math.floor(betweenTimeDay / 365)}년전`;
	}
</script>

<jsp:include page="../template/footer.jsp"></jsp:include>
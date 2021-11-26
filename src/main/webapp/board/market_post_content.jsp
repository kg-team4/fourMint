<%@	page import="java.text.SimpleDateFormat"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.util.List"%>
<%@	page import="java.util.HashSet"%>
<%@	page import="java.util.Set"%>
<%@	page import="java.text.NumberFormat"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트마켓 중거거래상품 상세</title>
<link href="../css/reset.css" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/reply.js"></script>
<link href="../css/8.board_content.css" rel="stylesheet">
<link href="../css/message/message.css" rel="stylesheet">
<link href="../css/swiper.min.css" rel="stylesheet">
<script src="../js/swiper.min.js"></script>
<script src="../js/post_content.js"></script>
<article style="padding-top: 220px; padding-bottom: 100px" id="post-content-form">
	<div class="container bootstrap snippet padding50">
		<div class="float-box float-left row">
			<div class="left-item40" style="height: fit-content;">
				<!-- 이미지 슬라이더 영역 -->
				<div class="swiper-container">
					<!-- 필수 영역 -->
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<!-- 이미지 미리보기 -->
							<c:choose>
							<c:when test="${content.status eq 0 }">
								<img class="mainimg" src="${content.url }" style="filter: brightness(40%);">
							</c:when>
							<c:otherwise>
								<img class="mainimg" src="${content.url }">
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- 이전/다음 버튼(선택) -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>
			<div class="right-item60 left-font padding-left35 col-sm-3">
				<!-- 글 제목 -->
				<!-- 상품 금액 -->
				<div class="item padding25">
					<span class="font30">${content.product_name }</span>
					<div style="display: flex; justify-content: flex-end">
						<c:choose>
						<c:when test="${content.status eq 0 }">
							<div class="font27" style="padding-left: 340px; padding-top: 5px; color: red;">[ 판매 완료 ]</div>
						</c:when>
						<c:otherwise>
							<div class="font27" style="padding-left: 360px; padding-top: 5px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${content.product_price}" /></div>
							<span class=font20 style="padding-left: 5px; padding-top: 10px">원</span>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="item padding25">
					<hr>
				</div>
				<div class="item font17 gray-font padding25">
					<c:choose>
					<c:when test="${like eq 0 }">
						<span id="heart" class="lightgray-font">♥&nbsp;</span> 
					</c:when>
					<c:otherwise>
						<span id="heart" class="lightgray-font" style="color: red;">♥&nbsp;</span>
					</c:otherwise>
					</c:choose>
					<span id="likes" class="font15 padding-right05">${likes }</span> 
					<span class="short-border"> 
						<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC" width="20" height="13" alt="조회수 아이콘">&nbsp;${content.views }
					</span> 
					<span class="padding-left05"> 
						<img src="../img/time.png" width="15" height="13" alt="시간 아이콘"> &nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${content.date }" />
					</span> 
					<span style="float: right; cursor: pointer"> 
						<a class="police_click"> 
							<img src="../img/police.png" width="20" height="20">&nbsp;신고하기
						</a>
					</span>
				</div>
				<div id="police_modal">
					<div>
						<div style="font-size: 20px">🚨&nbsp;신고하기&nbsp;🚨</div>
						<hr>
						<div>
							<form action="report.do" method="post">
								<div class="police_category">
									<span style="padding-right: 10px">신고사유</span>
									<select id="police_reason" name="reason">
										<option value="">신고 사유 선택</option>
										<option value="광고">광고 (상점 및 타사이트 홍보, 상품도배)</option>
										<option value="상품정보부정확">상품 정보 부정확 (상품명, 이미지, 가격, 태그 등)</option>
										<option value="거래금지품목">거래 금지 품목</option>
										<option value="사기의심">사기의심(외부채널 유도)</option>
										<option value="기타">기타(사유)</option>
									</select>
								</div>
								<div class="write_police_reason">
									<textarea name="content" style="border: 1px solid lightgray" rows="5" cols="5"></textarea>
								</div>
								<br>
								<div style="text-align: center">
									<input type="hidden" name="market_seq" value="${content.market_seq }"/>
									<input type="hidden" name="reporter" value="${nickname }"/>
									<input type="hidden" name="reported" value="${content.nickname }"/>
									<button disabled id="modal_police_btn" style="width: 90px; font-size: 15px">신고</button>
									<button type="button" class="modal_close_btn" style="background: none; border: none;">X</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<script>
				 // 모달 만들기
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
					
					document.querySelector('.police_click').addEventListener('click', function() {
					    // 모달창 띄우기
					    modal('police_modal');
					});
					
					//신고하기 select box 선택 사유가 없을 경우 버튼 비활성화
				 	$("#police_reason").change(function(){
						if($("#police_reason").val() == ''){
							$("#modal_police_btn").attr("disabled",true);
										
						}else{
							$("#modal_police_btn").attr("disabled",false);
						}
					});
				</script>
				
				<div class="item font15 padding15">
					<div class="padding15">
						<span class="gray-font">&middot; 카테고리</span><span>&emsp;${content.category_big}&nbsp; 
						<c:if test="${!empty content.category_middle}">
							>
						</c:if> &nbsp;${content.category_middle }
						</span>
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
									<a href="updateMarket.do?seq=${content.market_seq }"><button class="edit-button cursor">수정</button></a>
								</div>
								<div class="left-item33">
									<a href="deleteMarket.do?seq=${content.market_seq }"><button class="delete-button cursor">삭제</button></a>
								</div>
							</c:when>
							<c:when test="${nickname ne content.nickname and nickname ne null}">
								<div class="left-item33">
									<input id="likeVal" type="hidden" value="${content.market_seq }"/>
									<c:choose>
										<c:when test="${like eq 0 }">
											<input type="button" class="like-button cursor" id="likeBtn" value="♥ 찜 좋아요" style="">
											<input type="hidden" class="like-button cursor" id="hateBtn" value="싫어졌어용" style="">
										</c:when>
										<c:otherwise>
											<input type="hidden" class="like-button cursor" id="likeBtn" value="♥ 찜 좋아요" style="">
											<input type="button" class="like-button cursor" id="hateBtn" value="싫어졌어용" style="">
										</c:otherwise>
									</c:choose>
									<script>
									$("#likeBtn").click(function() {
										var seq = $("#likeVal").val();
										$.ajax({
											url : "/marketLike.do",
											type : "post",
											data : {
												seq : seq
											},
											success : function(data) {
												$("#likeBtn").attr('type', "hidden");
												$("#hateBtn").attr('type', "button");
												$("#heart").attr('style', "color: red");
												$("#likes").text(Number($("#likes").text())+1);
											}
										});
									});
									
									$("#hateBtn").click(function() {
										var seq = $("#likeVal").val();
										$.ajax({
											url : "/marketHate.do",
											type : "post",
											data : {
												seq : seq
											},
											success : function(data) {
												$("#hateBtn").attr('type', "hidden");
												$("#likeBtn").attr('type', "button");
												$("#heart").attr('style', "color: lightgray");
												$("#likes").text(Number($("#likes").text())-1);
											}
										});
									});
									</script>
								</div>
								<!-- 수정 삭제 버튼은 "내글" 또는 "관리자"인 경우만 표시 -->
								<div class="left-item33 messagesend-btn">
									<!-- 민트채팅 버튼 -->
									<button type="button" class="edit-button cursor msg_send_btn_profile" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="javascript:MessageContentList('${content.nickname}')">민트채팅</button>
								</div>
								<!-- 메세지 보내기 모달창 -->
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-scrollable">
										<div class="modal-content" style="max-height: 650px">
											<div class="modal-header">
												<span id="m_writer_profile">
													<div class="message-box">
														<!-- 프로필 이미지 -->
														<img id="messageProfileImage" src="${user.profile }" style="width: 35px; height: 35px; margin-right: 10px;" />
													</div>
												</span>
												<h5 class="modal-title" id="exampleModalLabel">${content.nickname}</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="box-shadow: none;"></button>
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
													<div id="emo_div">
														<!-- 이모티콘 자리 -->
														<button type="button" onclick="javascript:SendImo1('${content.nickname}')">
															<img id="message_image1" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_buying.png" alt="buying_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo2('${content.nickname}')">
															<img id="message_image2" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_cry.png" alt="cry_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo3('${content.nickname}')">
															<img id="message_image3" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_discount.png" alt="discount_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo4('${content.nickname}')">
															<img id="message_image4" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_flex.png" alt="flex_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo5('${content.nickname}')">
															<img id="message_image5" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_going.png" alt="going_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo6('${content.nickname}')">
															<img id="message_image6" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_heart.png" alt="heart_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo7('${content.nickname}')">
															<img id="message_image7" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_late.png" alt="late_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo8('${content.nickname}')">
															<img id="message_image8" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_laugh.png" alt="laugh_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo9('${content.nickname}')">
															<img id="message_image9" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_like.png" alt="like_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo10('${content.nickname}')">
															<img id="message_image10" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_mine.png" alt="mine_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo11('${content.nickname}')">
															<img id="message_image11" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_no.png" alt="no_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo12('${content.nickname}')">
															<img id="message_image12" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_ok.png" alt="ok_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo13('${content.nickname}')">
															<img id="message_image13" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_thank.png" alt="thank_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo14('${content.nickname}')">
															<img id="message_image14" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_tired.png" alt="tired_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo15('${content.nickname}')">
															<img id="message_image15" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_hung.png" alt="hung_emoticon">
														</button>
														<button type="button" onclick="javascript:SendImo16('${content.nickname}')">
															<img id="message_image16" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/emoticon/mt_wish.png" alt="wish_emoticon">
														</button>
													</div>
													<div class="type_msg" style="height: 45px">
														<div class='input_msg_write row'>
															<div class='col-11'>
																<textarea class="write_msg form-control" placeholder="메세지를 입력..." style="width: 153%; margin-top: 5px; height: 40px; box-shadow: none;"></textarea>
															</div>
															<div class='col-1'>
																<input type="button" class="msg_send_imo" value="🙂" onclick="emo()">
																<button class="msg_send_btn2" type="button" onclick="javascript:SendMessage('${content.nickname}')">
																	전송
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
	<div class="padding-top50">
		<div class="float-box float-left">
			<div class="left-item66 padding-right30 info-border left-font">
				<div class="padding15">
					<p class="font27">상품정보</p>
				</div>
				<hr>
				<div class="padding-top40 padding40 product-info-border ">
					<pre style="white-space: pre-wrap;" class="font18">${content.product_content }</pre>
				</div>
				<br>
				<hr>
				<br>
				<div>
					<p class="font18">판매자 위치</p>
				</div>
				<br>
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
					<p id="map_info" class="font15">판매자 위치로부터 반경 1km</p>
				</div>
			</div>
			
			<!-- 이름클릭 시 프로필 모달창 -->
			<div id="my_modal">
				<div>
					<div id="my_info_edit_title">
						<div class="padding-top30">
							<div class="float-box float-left">
								<div class="left-item25  pic-align left-font">
									<a href="#"> <img class="reply-pic-circle" src="${user.profile }">
									</a>
								</div>
								<div class="right-item75">
									<div class="top-margin10 left-font seller">
										<!-- 작성자 -->
										<div id="member-form">
											<div style="font-size: 22px">${content.nickname}</div>
											<div class="seller_grade">
												<c:set var="star" value="${user.rating }"/>
												<c:forEach var="i" begin="1" end="${star }">
													<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
												</c:forEach>
												<c:if test="${star % 1 > 0 }">
													<img src="../img/star_rank_half.png" width="15" height="14" alt="별점이미지">
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="tab">
						<ul class="tabnav">
							<li><a href="#tab01">판매 상품</a></li>
							<li><a href="#tab02">작성한 커뮤니티 글</a></li>
							<li><a href="#tab03">받은 거래 후기</a></li>
						</ul>
						<div class="tabcontent">
							<div id="tab01">
								<div class="sell_list_grid">
									<c:forEach var="market" items="${market }">
										<div class="sell_list">
											<table width="100%" height="120" style="padding-top: 20px">
													<tr height="30">
														<td align="left" style="font-size: 15px">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${market.date }" /></td>
														<td width="70%"></td>
													</tr>
													<tr>
														<td rowspan="3"><a id="store_review_img_area" href="#">
																<div id="product_img_box">
																	<img id="sell_product_img" src="${market.url}" alt="판매상품이미지">
																</div>
														</a></td>
														<td style="font-size: 18px"><a href="#" style="color: #26e4ca">${market.product_name }</a></td>
													</tr>
													<tr>
														<td style="font-size: 15px">${market.product_price } &nbsp;원</td>
													</tr>
													<tr>
														<td>
															<c:choose>
																<c:when test="${market.status eq 1}">
																	<button id="btn_sell_product_state">판매중</button>
																</c:when>
																<c:otherwise>
																	<button id="btn_sell_product_state">판매 완료</button>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
											</table>
											<br>
											<hr>
											<br>
										</div>
									<br>
									</c:forEach>
								</div>
							</div>
							<c:choose>
								<c:when test="${community ne null }">
									<c:forEach var="community" items="${community }">
										<div id="tab02">
											<div class="community_post_record">
												<table>
													<tr>
														<td style="text-align: center; padding: 8px;"><div class="community_category">${community.category }</div>&nbsp;</td>
														<td style="text-align: center; padding: 8px;"><div class="community_title">${community.title }</div>&nbsp;</td>
														<td style="text-align: center; padding: 8px;"><div class="community_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${community.date }" /></div>&nbsp;</td>
													</tr>
												</table>
											</div>
											<hr>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="community_no_post">작성한 커뮤니티 글이 없습니다.</div>
								</c:otherwise>
							</c:choose>
							
							<div id="tab03">
								<div class="store_review_grid">
									<c:forEach var="rate" items="${rating }">
									<div class="store_review">
										<table width="100%" height="140">
											<tr>
												<td width="20%" rowspan="2" style="padding: 10px">
													<div id="img_box">
														<a id="market_review_img_area" href="#"> 
														<img id="store_review_img" src="${rate.profile }" width="100" height="100" alt="상점이미지">
														</a>
													</div>
												</td>
												<td style="font-size: 20px" width="30%" height="40px">
													<a href="#" style="color: #26e4ca">${rate.writer }</a><br>
													<a class="" href="#"> 
														<c:set var="star" value="${rate.rating }"/>
														<c:forEach var="i" begin="1" end="${star}">
															<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
														</c:forEach>
														<c:if test="${star % 1 > 0 }">
															<img src="../img/star_rank_half.png" width="15" height="14" alt="별점이미지">
														</c:if>
														</a>
												</td>
												<td width="30%">
													<div class="">
													</div>
												</td>
												<td style="font-size: 15px" width="30%">
													<div id="date" style="text-align: right"><fmt:formatDate pattern="yyyy-MM-dd" value="${rate.date }" /></div>
												</td>
											</tr>
											<tr>
												<td align="left" colspan="4" style="font-size: 15px">
													<button id="btn_sold_product_name">
														&nbsp;${rate.product_name } <img src="../img/arrow_icon.png" width="6" height="10" alt="화살표 아이콘">&nbsp;
													</button>
													<div id="sold_product_review">${rate.content }</div>
												</td>
											</tr>
										</table>
										<br> <hr>
									</div>
									<br>
									</c:forEach>
									<c:if test="${rating eq null }">
										<div class="transmit_no_post">받은 거래 후기가 없습니다.</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!--End tab-->
				</div>
				<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
			</div>
			
			
			<div class="right-item34  padding-right30 padding-left30 ">
				<div class="padding15 left-font">
					<p class=" font27">상점정보</p>
				</div>
				<hr>
				<div class="padding-top30">
					<div class="float-box float-left">
						<div class="left-item25  pic-align left-font">
							<a href="#"> <img class="reply-pic-circle" src="${user.profile }">
							</a>
						</div>
						<div class="right-item75">
							<div class="top-margin10 left-font seller">
								<!-- 작성자 -->
								<div id="member-form">
									<div>
										<a class="seller_nick" style="cursor: pointer">${content.nickname }</a>
									</div>
									<div class="seller_grade">
										<c:set var="star" value="${user.rating }"/>
										<c:forEach var="i" begin="1" end="${star }">
											<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
										</c:forEach>
										<c:if test="${star % 1 > 0 }">
											<img src="../img/star_rank_half.png" width="15" height="14" alt="별점이미지">
										</c:if>
									</div>
									<div id="proudct_num_follower">
										상품 &nbsp;<span>${boardCount }</span> &emsp; 팔로워 &nbsp;<span id="tempFol">${follow.follower }</span>
									</div>
									<c:if test="${user.nickname ne nickname }">
										<input type="hidden" id="seller" value="${content.nickname }"/>
										<c:choose>
											<c:when test="${fol eq 0 }">
												<button id="btn_follow" style="width: 100px; display: block">
													<img height="13px" width="13px" src="../img/following_icon.png">&nbsp;팔로우
												</button>
												<button id="btn_unfollow" style="width: 100px; display: none">
													<img height="13px" width="13px" src="../img/following_icon.png">&nbsp;언팔로우
												</button>
											</c:when>
											<c:otherwise>
												<button id="btn_follow" style="width: 100px; display: none">
													<img height="13px" width="13px" src="../img/following_icon.png">&nbsp;팔로우
												</button>
												<button id="btn_unfollow" style="width: 100px; display: block">
													<img height="13px" width="13px" src="../img/following_icon.png">&nbsp;언팔로우
												</button>
											</c:otherwise>
										</c:choose>
										<script>
											$("#btn_follow").click(function(){
												var seller = $("#seller").val();
												$("#tempFol").text(Number($("#tempFol").text())+1);
												$.ajax({
													url : "/follow.do",
													type : "post",
													data : {
														seller : seller
													},
													success : function(data) {
														$("#btn_follow").attr('style', "display: none");
														$("#btn_unfollow").attr('style', "display: block");
														$("#btn_unfollow").css('width', '100px');
													}
												});
											});
											
											$("#btn_unfollow").click(function(){
												var seller = $("#seller").val();
												$("#tempFol").text(Number($("#tempFol").text())-1);
												$.ajax({
													url : "/unfollow.do",
													type : "post",
													data : {
														seller : seller
													},
													success : function(data) {
														$("#btn_unfollow").attr('style', "display: none");
														$("#btn_follow").attr('style', "display: block");
														$("#btn_follow").css('width', '100px');
													}
												});
											});
										</script>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br> <br> <br> <br> <br> <br>
			<div class="right-item34  padding-right30 padding-left30 ">
				<br><br>
				<div class="padding15 left-font">
					<p class=" font27">상점후기</p>
				</div>
				<hr>
				<div class="padding-top30">
					<c:forEach var="rate" items="${rating }" begin="0" end="1">
					<div class="float-box float-left">
						<div class="left-item25  pic-align left-font">
							<a href="#"> <img class="reply-pic-circle" src="${rate.profile }">
							</a>
						</div>
						<div class="right-item75">
							<div class="top-margin10 left-font seller" style="margin-top: 0;">
								<!-- 작성자 -->
								<div id="member-form">
									<div>
										<a class="buyer_nick1">${rate.writer }</a>
									</div>
									<div class="seller_grade" style="height: 18px; width: 100px">
										<c:set var="star" value="${rate.rating }"/>
										<c:forEach var="i" begin="1" end="${star}">
											<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
										</c:forEach>
										<c:if test="${star % 1 > 0 }">
											<img src="../img/star_rank_half.png" width="15" height="14" alt="별점이미지">
										</c:if>
									</div>
									<br>
									<div id="buyer_review">${rate.content }</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
</article>
<script>
	//메세지 내역을 가져온다.
	const MessageContentList = function(other_nick) {
		console.log(other_nick);
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
	
	// 이미지 보내기
	const SendImo1 = function(other_nick) {
			
		let image = $('#message_image1').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo2 = function(other_nick) {
			
		let image = $('#message_image2').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	
	const SendImo3 = function(other_nick) {
		
		let image = $('#message_image3').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo4 = function(other_nick) {
		
		let image = $('#message_image4').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
		
	const SendImo5 = function(other_nick) {
		
		let image = $('#message_image5').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo6 = function(other_nick) {
		
		let image = $('#message_image6').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo7 = function(other_nick) {
		
		let image = $('#message_image7').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};	
	const SendImo8 = function(other_nick) {
		
		let image = $('#message_image8').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo9 = function(other_nick) {
		
		let image = $('#message_image9').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo10 = function(other_nick) {
		
		let image = $('#message_image10').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo11 = function(other_nick) {
		
		let image = $('#message_image11').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo12 = function(other_nick) {
		
		let image = $('#message_image12').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo13 = function(other_nick) {
		
		let image = $('#message_image13').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo14 = function(other_nick) {
		
		let image = $('#message_image14').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo15 = function(other_nick) {
		
		let image = $('#message_image15').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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
	};
	const SendImo16 = function(other_nick) {
		
		let image = $('#message_image16').attr("src");
		
		console.log(image);
		$.ajax({
			url : "message_send_inlist_image.do",
			method : "GET",
			data : {
				other_nick : other_nick,
                image : image,	              
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

	// 모달1 (프로필 보기)만들기
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

	document.querySelector('.seller_nick').addEventListener('click', function() {
	    // 모달창 띄우기
	    modal('my_modal');
	});
	
	//tab 만들기 
	$(function(){
		  $('.tabcontent > div').hide();
		  $('.tabnav a').click(function () {
		    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
		    $('.tabnav a').removeClass('active');
		    $(this).addClass('active');
		    return false;
		  }).filter(':eq(0)').click();
		  });
	
	

 	function emo() {
		if($("#emo_div").is(":visible")) {
			$("#emo_div").hide();
		} else {
			$("#emo_div").show();
		}
	};
	
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.NumberFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<div class="font25" style="padding-left:360px;padding-top:5px">
							${content.product_price}						
						</div>
						<span class=font20 style="padding-left:5px; padding-top:10px">원</span>
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
							<input id="likeVal" type="hidden" value="${content.store_seq }"/>
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
									url : "/storeLike.do",
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
									url : "/storeHate.do",
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
					<p class="font25">상품정보</p>
				</div>
				<hr>
				<div class="padding-top40 padding40 product-info-border " style="text-align: center">
					<img class="store_product_info_img" width="800px" height="5000px" src="${content.product_content}" alt="상품상세설명이미지" >
				</div>
				
				
				<div class="padding-top100">
					<div class="font25">배송 안내</div>	
					<hr>
					<div style="line-height: 130%; color:gray;">
						<div style="margin-top:10px">- 모든 제품의 배송은 환경을 위해 종이재질로 발송됩니다. (종이박스, 종이완충재, 종이테이프)</div>
						<div>- 수령하신 택배박스는 운송장을 제거한 후 종이로 분리배출 해주세요.</div>
						<div>- 결제완료 후 제품을 수령하시까지 약 2~5일 소요됩니다.</div>
						<div>- 배송이 늦어지거나 일부 제품이 품절인 경우에 개별 연락드릴 예정이오니 기다려주시길 바랍니다.</div>
						<div>- 30,000원 이상 주문 건의 경우 무료배송됩니다.</div>
					</div>
								
				</div>
				
				<div class="padding-top100">
					<div class="font25">교환 / 환불 / AS안내</div>	
					<hr>
					<div style="line-height: 130%; color:gray;">
						<div style="margin-top:10px">- 구매자의 단순 변심에 의한 반품 및 교환 요청은 제품 수령 후 7일 이내에 가능합니다. (이 때 발생하는 왕복배송비는 구매자 부담입니다.)</div>
						<div>- 마이페이지에서 교환 또는 반품 과정 진행이 가능합니다.</div>
						<div>- 제품을 개봉하였거나 사용하셨을 경우 교환 및 반품이 불가합니다.</div>
						<div>- 제품 하자에 의한 교환 및 환불은 가능합니다.</div>
					</div>
								
				</div>
				
				
				<div class="padding-top100">
					<span class="font25">상품후기</span>					
				</div>
				<hr>
				<c:if test="${buyOrNot eq 1 }">
					<span>
						<button class="right-float" id="btn_write_store_review">상품후기 작성</button>
					</span>
				</c:if>
				
				<!-- 상품후기 작성 모달 -->

								<div id="police_modal1">
									<div>
										<form action="storeRate.do" method="post">
										<div style="font-size: 20px">✍&nbsp;상품후기 작성하기&nbsp;✍</div>
										<br><hr><br>
										<div>
											<div class="police_category">
												<div style="font-size:18px">
													<span style="color: #26e4ca">구매한 상품명</span>에 대한 평점 남기기
												</div>
											</div>
											<div class="rating">
													<div class="startRadio">
														<label class="startRadio__box"> 
															<input type="radio" name="star" id="" value="0.5"> 
															<span class="startRadio__img">
																<span class="blind">0.5</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input type="radio" name="star" id="" value="1.0"> 
															<span class="startRadio__img">
																<span class="blind">1.0</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input type="radio" name="star" id="" value="1.5"> 
															<span class="startRadio__img">
																<span class="blind">1.5</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input type="radio" name="star" id="" value="2.0"> 
															<span class="startRadio__img">
																<span class="blind">2.0</span>
															</span>																											
														</label> 
														
														<label class="startRadio__box"> 
															<input type="radio" name="star" id="" value="2.5"> 
															<span class="startRadio__img">
																<span class="blind">2.5</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input type="radio" name="star" id="" value="3.0"> 
															<span class="startRadio__img">
																<span class="blind">3.0</span>
															</span>
														</label> 
														
														<label class="startRadio__box">
															<input type="radio" name="star" id="" value="3.5"> 
															<span class="startRadio__img">
																<span class="blind">3.5</span>
															</span>
														</label> 
														
														
														<label class="startRadio__box"> 
															<input type="radio" name="star" id="" value="4.0"> 
															<span class="startRadio__img">
																<span class="blind">4.0</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input type="radio" name="star" id="" value="4.5"> 
															<span class="startRadio__img">
																<span class="blind">4.5</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
														<input type="radio" name="star" id=""  value="5.0"checked> 
															<span class="startRadio__img">
																<span class="blind">5.0</span>
															</span>
														</label>
													</div>
												</div>
											<br><hr><br>
											<div class="write_police_reason">
												<textarea name="content" style="border: 1px solid lightgray" rows="5" cols="63"></textarea>
											</div>
											<br>
											<div style="text-align: center">
												<input type="hidden" name="store_seq" value="${content.store_seq }"/>
												<button id="modal_police_btn" style="width: 90px; font-size: 15px">후기 작성</button>
											</div>
										</div>
										</form>
									</div>
									<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
								</div>
								<script type="text/javascript">
									// 모달 만들기
									function modal(id) {
										var zIndex = 9999;
										var modal = document.getElementById(id);

										// 모달 div 뒤에 희끄무레한 레이어
										var bg = document.createElement('div');
										bg.setStyle({
											position : 'fixed',
											zIndex : zIndex,
											left : '0px',
											top : '0px',
											width : '100%',
											height : '100%',
											overflow : 'auto',
											// 레이어 색갈은 여기서 바꾸면 됨
											backgroundColor : 'rgba(0,0,0,0.4)'
										});
										document.body.append(bg);

										// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
										modal
												.querySelector(
														'.modal_close_btn')
												.addEventListener(
														'click',
														function() {
															bg.remove();
															modal.style.display = 'none';
														});

										modal
												.setStyle({
													position : 'fixed',
													display : 'block',
													boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

													// 시꺼먼 레이어 보다 한칸 위에 보이기
													zIndex : zIndex + 1,

													// div center 정렬
													top : '50%',
													left : '50%',
													transform : 'translate(-50%, -50%)',
													msTransform : 'translate(-50%, -50%)',
													webkitTransform : 'translate(-50%, -50%)'
												});
									}
									// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
									Element.prototype.setStyle = function(
											styles) {
										for ( var k in styles)
											this.style[k] = styles[k];
										return this;
									};

									document.querySelector('#btn_write_store_review')
											.addEventListener('click',
													function() {
														// 모달창 띄우기
														modal('police_modal1');
													});
									//평가점수버튼을 줘서 점수를 줬으면 버튼 활성화
									$(".rating").change(
											function() {
												$("#modal_police_btn").attr(
														"disabled", false);

											});
								</script>
				
								
					
					<div class="float-box float-left reply-margin20 padding-top30" id="rateDiv">
						<c:forEach var="rate" items="${rate }">
						<div class="left-item10">
							<!-- 프로필 이미지 영역 -->
							<img class="reply-pic-circle" src="${rate.profile }" alt="상품후기남긴회원이미지">
						</div>
						<div class="right-item90">
							<!-- 프로필 닉네임 / 댓글 내용 영역 -->
							<div class="reply-nick-font">
								<label id="reply-member-form" for="11">
									<input type="checkbox" id="11" value="1" onchange="">&emsp;&emsp;${rate.nickname }
								</label>
								<span>
								&emsp;
								<c:set var="star" value="${rate.rating }"/>
								<c:forEach var="i" begin="1" end="${star }">
									<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> 
								</c:forEach>
								<c:if test="${star % 1 > 0 }">
									<img src="../img/star_rank_half.png" width="15" height="14" alt="별점이미지">
								</c:if>
								</span>
								<div class="info11 reply-tab-design">
									<div>
										<a href="../member/info.jsp?no=1">회원 페이지</a>
									</div>
								</div>
								<span class="right-float font15 gray-font"> <fmt:formatDate pattern="yyyy-MM-dd" value="${rate.date }" /></span>
							</div>
							<div class="font15 reply-content-form">
								<div class="reply-content">
									<pre class="font15 review_grid" style="margin-left:35px; line-height:150%">
									${rate.content }
									</pre>										
								</div>								
							</div>
							<div class="right-float reply-control">
								<div>									
									<input type="hidden" value="${rate.rate_seq }" name="seq"/>
									<input type="button" class="font15 delete_rate" value="삭제">
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					
					<script>
						$(".delete_rate").click(function(){
							var seq = $(this).prev().val();
							$.ajax({
								url : "/deleteRate.do",
								type : "post",
								data : {
									seq : seq
								},
								success : function(data) {
									$("#rateDiv").load(window.location.href + " #rateDiv");
								}
							});
						});
					</script>
				
				
				
				
				
				<div class="padding-top70">
					<p class="font27">상품문의</p>					
					<div class="reply-div-padding">
						<div class="reply-border">
							<textarea id="qnacontent" class="text-padding font15" name="content" placeholder="문의 내용 입력" cols="116" rows="5"></textarea>
						</div>
					</div>
					<div class="reply-num-border">
						<div class="float-box float-left">
							<div class="left-item50">
								<p class="font12 gray-font text-padding10">
							</div>
							<div class="left-item50 text-padding10">
								<input type="hidden" name="product_name" value="${content.product_name }"/>
								<input type="hidden" name="seq" value="${content.store_seq }"> 
								<input type="button" class="right-float reply-button" value="등록">
								<script>
									$(".reply-button").click(function(){
										var seq = $(this).prev().val();
										var content = $(this).parent().parent().parent().prev().find("#qnacontent").val();
										var product_name = $(this).prev().prev().val();
										console.log(content);
										$.ajax({
											url : "/storeQNA.do",
											type : "post",
											data : {
												seq : seq,
												content : content,
												product_name : product_name
											},
											success : function(data) {
												$("#askDiv").load(window.location.href + " #askDiv");
											}
										});
									});
								</script>
							</div>
						</div>
					</div>
				</div>
				
				

				<div class="padding-top25 ">

					<div class="float-box float-left reply-margin20 padding-top30" id="askDiv" >
						<c:forEach var="ask" items="${ask }">
						<div class="left-item10">
							<!-- 프로필 이미지 영역 -->
							<img class="reply-pic-circle" src="${ask.profile }" alt="상품후기남긴회원이미지">
						</div>
						<div class="right-item90">
							<!-- 프로필 닉네임 / 댓글 내용 영역 -->
							<div class="reply-nick-font">
								<span id="reply-member-form" for="11">
								<input type="checkbox" id="11" value="1" onchange="">&emsp;&emsp;${ask.nickname }
								</span>
								
								<span class="right-float font15 gray-font"> <fmt:formatDate pattern="yyyy-MM-dd" value="${ask.date }" /> </span>
							</div>
							<div class="font15 reply-content-form">
								<div class="reply-content">
									<form action="edit_reply.do" method="post" id="edit-reply-form">
										<pre class="review_grid font15 right-float" style="margin-left:35px; line-height:150%">
										${ask.content }
										</pre>										
									</form>
								</div>								
							</div>
							<div class="right-float reply-control">
								<div>								
									<input type="hidden" value="${ask.ask_seq }"/>	
									<input type="button" class="font15 delete_ask" value="삭제">
								</div>
							</div>
						</div>
						</c:forEach>
						
						<script>
						$(".delete_ask").click(function(){
							var seq = $(this).prev().val();
							$.ajax({
								url : "/deleteAsk.do",
								type : "post",
								data : {
									seq : seq
								},
								success : function(data) {
									$("#askDiv").load(window.location.href + " #askDiv");
								}
							});
						});
						</script>
						
						
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
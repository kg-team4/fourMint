<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.NumberFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<title>민트 스토어 상품 상세</title>
<link href="${pageContext.request.contextPath}/resources/user/css/reset.css" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/user/js/reply.js"></script>
<link href="${pageContext.request.contextPath}/resources/user/css/8.board_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/user/css/swiper.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/user/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/user/js/post_content.js"></script>

<style>
	#my_modal {
	    display: none;
	    width: 400px;
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
					<c:choose>
						<c:when test="${content.product_stock < 1 }">
						<div style="vertical-align: middle">
							<div style="height:32px; margin-left: 340px; margin-top: 5px; text-align:center; width:110px; color: gray; border-radius:3px;font-size:22px">판매 완료</div>
						</div>
						</c:when>

						<c:otherwise>
						<div class="font25" style="padding-left:360px;padding-top:5px">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${content.product_price}" />						
						</div>
						<span class=font20 style="padding-left:5px; padding-top:10px">원</span>
						</c:otherwise>
					</c:choose>
					</div>					
				</div>
				<div class="item padding25">
					<hr>
				</div>
				<div class="item font17 gray-font padding15" style="margin-left:458px;" >
					<c:choose>
					<c:when test="${like eq 0 }">
						<span id="heart" class="lightgray-font" style="">♥&nbsp;</span>
					</c:when>
					<c:otherwise>
						<span id="heart" class="lightgray-font" style="color: red;">♥&nbsp;</span>
					</c:otherwise>
					</c:choose>
					<span id="likes" class="font15 ">${likes }</span>  	
				</div>
				<div class="item font15 padding15" style="margin-top:20px; margin-bottom:20px; font-size:17px">
					<div class="padding15">
						<span class="gray-font">&middot; 카테고리</span><span>&emsp;${content.category_big}</span>
					</div>
					<div class="padding15">
						<span class="gray-font">&middot; 배송비</span><span class="green-font">&emsp;2,500원&nbsp;(30,000원 이상 무료배송)</span>
					</div>
					<div class="padding15">
						<span class="gray-font">&middot; 수량 &emsp;</span><c:if test="${content.product_stock < 11 }"><span style="color: #ff8080;">남은 재고: ${content.product_stock }</span></c:if>
						<span class="green-font">
							<input form="form1" class="amount" name="amount" type="number" value="1" autocomplete="off" maxlength="2" style="width: 50px; text-align: right;" min="1" max="${content.product_stock }"/>
						</span>
					</div>
				</div>
				<div>
					<div class="float-box float-left" style="margin-top:60px">
						<div class="left-item33" >
							<input id="likeVal" type="hidden" value="${content.store_seq }"/>
							<c:choose>
								<c:when test="${like eq 0 }">
									<input type="button" class="like-button cursor" id="likeBtn" value="찜 좋아요 ♥" style="">
									<input type="hidden" class="like-button cursor" id="hateBtn" value="찜 취소 X" style="">
								</c:when>
								<c:otherwise>
									<input type="hidden" class="like-button cursor" id="likeBtn" value="찜 좋아요 ♥"style="">
									<input type="button" class="like-button cursor" id="hateBtn" value="찜 취소 X" style="">
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
						<div id="my_modal" style="text-align: center">
							<h3> 🛒&nbsp;장바구니에 담겼습니다.&nbsp;🛒</h3>
							<br>
							<a href="payment.do" style="color: #26e4ca; font-size: 20px">장바구니로 이동</a>
							&emsp;<a class="modal_close_btn" style="cursor:pointer;">X</a>
						</div>
						<!-- 장바구니 모달 끝 -->
						
						<c:choose>
							<c:when test="${content.product_stock < 1 }">
								<div class="left-item33">
										<button disabled class="delete-button cursor" style="height:40.8px; background:#c7c7c7;">품절</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="left-item33">
									<button class="edit-button cursor" id="popup_open_btn">장바구니</button>
								</div>
								<div class="left-item33">
									<form id="form1" action="orderSoon.do">
										<input type="hidden" name="seq" value="${content.store_seq }" />
										<input type="submit" class="delete-button cursor" value="바로구매" />
									</form>
								</div>
							</c:otherwise>						
						</c:choose>					
						
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
					<span class="font25" id="wirte_product_review">상품후기</span>&emsp;
					<c:set var="star" value="${avg }"/>
					<c:forEach var="i" begin="1" end="${star }">
						<img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> 
					</c:forEach>
					<c:if test="${star % 1 > 0 }">
						<img src="${pageContext.request.contextPath}/resources/user/img/star_rank_half.png" width="15" height="14" alt="별점이미지">
					</c:if>	
					(${fn:length(rate)})
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
													<span style="color: #26e4ca">${content.product_name }</span>에 대한 평점 남기기
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
									<img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> 
								</c:forEach>
								<c:if test="${star % 1 > 0 }">
									<img src="${pageContext.request.contextPath}/resources/user/img/star_rank_half.png" width="15" height="14" alt="별점이미지">
								</c:if>
								</span>
								<div class="info11 reply-tab-design">
									<div>
										<a href="${pageContext.request.contextPath}/resources/user/member/info.jsp?no=1">회원 페이지</a>
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
					<p class="font27" id="ask_about_product">상품문의</p>					
					<div class="reply-div-padding">
						<div class="reply-border" >
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

					<div class="float-box float-left reply-margin20 padding-top30" id="askDiv" style="margin-top: 0;">
						<c:forEach var="ask" items="${ask }">
						<div class="left-item10">
							<!-- 프로필 이미지 영역 -->
							<img class="reply-pic-circle" src="${ask.profile }" alt="상품후기남긴회원이미지">
						</div>
						<div class="right-item90">
							<!-- 프로필 닉네임 / 댓글 내용 영역 -->
							<div class="reply-nick-font">
								<span id="reply-member-form" for="11" style="color:#26e4ca;>
								<input type="checkbox" id="11" value="1" onchange="" ">&emsp;&emsp;&nbsp;${ask.nickname }
								</span>
								
								<span class="right-float font15 gray-font"> <fmt:formatDate pattern="yyyy-MM-dd" value="${ask.date }" /> </span>
							</div>
							<div class="font15 reply-content-form">
								<div class="reply-content">
									<form action="edit_reply.do" method="post" id="edit-reply-form">
										<pre class="review_grid font15 right-float" style="margin-left:45px; line-height:150%">
										${ask.content }
										</pre>										
									</form>
								</div>								
							</div>
							<div class="right-float reply-control" style="margin-right:10px; margin-top:5px">
								<div>								
									<input type="hidden" value="${ask.ask_seq }"/>	
									<input style="background:none; border:none; color:gray; cursor:pointer" type="button" class="font15 delete_ask" value="삭제하기">
								</div>
							</div>
						</div>
						
						<!-- 운영자 답변 -->
						<c:if test="${ask.answer ne null }">
						<div class="left-item10" style="margin-top: 30px; display:flex">
							<img class="right_arrow" style="width:50px; height:35px; margin-top: 30px; margin-left:30px; margin-right:10px" src="${pageContext.request.contextPath}/resources/user/img/right-arrow-gray.png">
							<img class="reply-pic-circle" src="https://mintmarket.s3.ap-northeast-2.amazonaws.com/profile/character_sample.png">
						</div>
						<div class="right-item90" style="margin-top: 30px;">
							<div class="reply-nick-font">
								<span id="reply-member-form" for="11" style="margin-left:73px; color:gray">
									<input type="checkbox" id="11" value="1" onchange="">&emsp;&emsp;[판매자 답변] 민트마켓
								</span>
								
								<span class="right-float font15 gray-font"> <fmt:formatDate pattern="yyyy-MM-dd" value="${ask.answer_date }" /> </span>
							</div>
							<div class="font15 reply-content-form">
								<div class="reply-content">
									<form action="edit_reply.do" method="post" id="edit-reply-form">
										<pre class="review_grid font15 right-float" style="margin-left:110px; margin-right:5px; line-height:150%">
										${ask.answer }
										</pre>										
									</form>
								</div>								
							</div>
						</div>
						</c:if>
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
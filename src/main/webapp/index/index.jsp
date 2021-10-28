<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="../template/header.jsp" %>

<!-- css -->
<link href="../css/swiper.min.css" type="text/css" rel="stylesheet">
<link href="../css/3.promotion.css" type="text/css" rel="stylesheet">
<link href="../css/4.article.css" type="text/css" rel="stylesheet">
<!-- Java Script -->
<script src="../js/swiper.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fda16046fdbb798b0eb5ce18ac2adeb0&libraries=services"></script>
<script type="text/javascript" src="../js/index.js"></script>

<!-- 회원 주소 데이터 자바스크립트로 보내기 -->
<input type="hidden" value="주소" id="member_address">
<input type="hidden" value="베이스" id="member_base">

<aside>
	<!-- 이미지 슬라이더 영역 -->
	<div class="promotion">

		<div class="swiper-container" id="promotion">
			<!-- 필수 영역 -->
			<div class="swiper-wrapper">
				<!-- 배치되는 이미지 혹은 화면 (슬라이더) -->
				<div class="swiper-slide">
					<img src="../img/banner_1903x300.png">
				</div>
				<div class="swiper-slide">
					<img src="../img/banner_1903x300_2.png">
				</div>
				<div class="swiper-slide">
					<img src="../img/banner_1903x300_3.png">
				</div>
			</div>
			<!-- pagination 이 필요하다면 (선택) -->
			<div class="swiper-pagination"></div>
		</div>
	</div>
</aside>

<article>
	<div class="hot-title">우리 동네 둘러보기!</div>
	<div class="dongnae">
		<div id="map-area">
			<div id="map"></div>
		</div>
		<div class="swiper-container" id="product">-
			<!-- 필수 영역 -->
			<div class="swiper-wrapper">
				<!-- 배치되는 이미지 혹은 화면 (슬라이더) -->
				<div class="swiper-slide" id="slide-1">
					<div id="banner-1">
						<div id="banner-1-right">
							<div id="banner-1-right-top">
								<span>우리 동네 인기 물건을 만나보세요!</span>
							</div>
							<div id="banner-1-right-bottom">
								<div class="layer">
									<%-- <div class="hot-product">
										<div id="img">
											<a href="<%=path %>/board/used_post_content.jsp?board_no=<%=newpost.getBoard_no()%>&used_cate_num=<%=newpost.getUsed_cate_num()%>&post_no=<%=uidto.getPost_no()%>"><img src="./board/showImg.do?post_img_no=<%=uidto.getPost_img_no()%>"></a>
										</div>
										<div id="title"><%=newpost.getPost_title()%>
											
										</div>
										<div id="like"><%=newpost.getPost_like()%></div>
									</div> --%>
								</div>
								<div class="layer">
									<div class="hot-product">
										<div id="img">
											<a href="mintBoard.do?board_no=1&used_cate_num=1&post_no=1"><img src="board/showImg.do?post_img_no=1"></a>
										</div>
										<div id="title">제목
											
										</div>
										<div id="like">좋아요</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide" id="slide-2">
					<div id="banner-2">
						<div id="banner-2-top">
							<span>우리 동네의 멋진 가게들!</span>
						</div>
							<div id="banner-1-right-bottom">
								<div class="layer">
									<%-- <div class="hot-product">
										<div id="img">
											<a href="<%=path %>/board/promotion_post_content.jsp?board_no=<%=ppdto.getBoard_no()%>&promotion_cate_num=<%=ppdto.getPromotion_cate_num()%>&post_no=<%=pidto.getPost_no()%>"><img src="./board/showImg2.do?post_img_no=<%=pidto.getPost_img_no()%>"></a>
										</div>
										<div id="title"><%=ppdto.getPost_title()%>
											
										</div>
										<div id="like"><%=ppdto.getPost_like()%></div>
									</div> --%>
								</div>
								<div class="layer">
									<%-- <div class="hot-product">
										<div id="img">
											<a href="<%=path %>/board/promotion_post_content.jsp?board_no=<%=ppdto.getBoard_no()%>&promotion_cate_num=<%=ppdto.getPromotion_cate_num()%>&post_no=<%=pidto.getPost_no()%>"><img src="./board/showImg2.do?post_img_no=<%=pidto.getPost_img_no()%>"></a>
										</div>
										<div id="title"><%=ppdto.getPost_title()%>
											
										</div>
										<div id="like"><%=ppdto.getPost_like()%></div>
									</div> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="swiper-pagination"></div> -->
		</div>
	</div>
</article>
<%@include file="../template/footer.jsp" %>
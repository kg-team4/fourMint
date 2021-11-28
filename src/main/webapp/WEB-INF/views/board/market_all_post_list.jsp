<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>민트 마켓</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_market.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<script defer src="../js/mint_store.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <script type="text/javascript" src="../js/mint_store.js"></script> -->
<article>
	<div class="slide">
		<ul class="slideImg">
			<li class="jsSlide"><a href=""><img src="${market_banner1 }" alt="민트마켓슬라이드1"></a></li>
			<li class="jsSlide"><a href=""><img src="${market_banner2 }" alt="민트마켓슬라이드2"></a></li>
			<li class="jsSlide"><a href=""><img src="${market_banner3 }" alt="민트마켓슬라이드3"></a></li>
			<li class="jsSlide"><a href=""><img src="${market_banner4 }" alt="민트마켓슬라이드4"></a></li>
		</ul>
		<ul class="circleBtn">
			<li><span class="circle" onclick="dotSlide(0)"><label for="slide1">&nbsp;</label></span></li>
			<li><span class="circle" onclick="dotSlide(1)"><label for="slide2">&nbsp;</label></span></li>
			<li><span class="circle" onclick="dotSlide(2)"><label for="slide3">&nbsp;</label></span></li>
			<li><span class="circle" onclick="dotSlide(3)"><label for="slide4">&nbsp;</label></span></li>
		</ul>
	</div>
	<c:if test="${address2 ne null }">
		<div class="best">
			<br> <br> <br>
			<h1 style="margin-bottom:8px">주변상품<br>[${addressSub}]</h1>
			<ul class="bestBox">
				<c:forEach var="address" items="${address }">
					<c:if test="${address.nickname ne nickname }">
						<li>
							<a href="marketBoard.do?seq=${address.market_seq }">
								<img src="${address.url }" alt="주변상품" style="width:293px; height:320px">
							</a>
							<p>
								<c:choose>
									<c:when test="${address.category_middle eq '' }">
										<span class="red" style="margin-top:8px">[${address.category_big }]</span>
									</c:when>
									<c:otherwise>
										<span class="red" style="margin-top:8px">[${address.category_middle }]</span>	
									</c:otherwise>
								</c:choose>
							</p>
							<p>
								<span>${address.product_name }</span> <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${address.product_price }" />원</span>
							</p>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<div class="best">
		<br> <br> <br>
		<h1 style="margin-bottom:8px">추천상품</h1>
		<ul class="bestBox">
			<c:forEach var="recent" items="${recent }">
				<li>
					<a href="marketBoard.do?seq=${recent.market_seq }"> 
						<img src="${recent.url }" alt="추천상품" style="width:293px; height:320px">
					</a>
					<p>
						<c:choose>
							<c:when test="${recent.category_middle eq '' }">
								<span class="red" style="margin-top:8px">[${recent.category_big }]</span>
							</c:when>
							<c:otherwise>
								<span class="red" style="margin-top:8px">[${recent.category_middle }]</span>	
							</c:otherwise>
						</c:choose>
					</p>
					<p>
						<span>${recent.product_name }</span> <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${recent.product_price }" />원</span>
					</p>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="best">
		<br> <br> <br>
		<h1 style="margin-bottom:8px">인기상품</h1>
		<ul class="bestBox">
			<c:forEach var="best" items="${best }">
				<li>
					<a href="marketBoard.do?seq=${best.market_seq }"> 
						<img src="${best.url }" alt="인기상품" style="width:293px; height:320px">
					</a>
					<p>	
						<c:choose>
							<c:when test="${best.category_middle eq '' }">
								<span class="red" style="margin-top:8px">[${best.category_big }]</span>
							</c:when>
							<c:otherwise>
								<span class="red" style="margin-top:8px">[${best.category_middle }]</span>	
							</c:otherwise>
						</c:choose>
					</p>
					<p>
						<span>${best.product_name }</span> <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${best.product_price }" />원</span>
					</p>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="review">
		<div class="top" onclick="handleTop()">TOP</div>
	</div>
</article>
<jsp:include page="../template/footer.jsp"></jsp:include>
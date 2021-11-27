<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트 스토어</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_store.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<script defer src="../js/mint_store.js"></script>
<article>
	<div class="slide">
		<ul class="slideImg">
			<li class="jsSlide"><a href=""><img src="${store_banner1 }" alt="chickenBreast"></a></li>
			<li class="jsSlide"><a href=""><img src="${store_banner2 }" alt="dietLunchBox"></a></li>
			<li class="jsSlide"><a href=""><img src="${store_banner3 }" alt="konjacNoodles"></a></li>
			<li class="jsSlide"><a href=""><img src="${store_banner4 }" alt="freeShipping"></a></li>
			<!-- <li class="jsSlide"><a href=""><img src="../img/slide5.png" alt="tea"></a></li> -->
		</ul>
		<ul class="circleBtn">
			<li><span class="circle" onclick="dotSlide(0)"></span></li>
			<li><span class="circle" onclick="dotSlide(1)"></span></li>
			<li><span class="circle" onclick="dotSlide(2)"></span></li>
			<li><span class="circle" onclick="dotSlide(3)"></span></li>
			<!-- <li>
                    <span class="circle" onclick="dotSlide(4)"></span>
                </li> -->
		</ul>
	</div>
	<div class="best">
		<br> <br> <br>
		<h1 style="margin-bottom:8px">추천 상품</h1>
		<ul class="bestBox">
			<c:forEach var="store" items="${list }">
				<li>
					<a href="storeBoard.do?seq=${store.store_seq }">
						<img class=product_img src="${store.url }" alt="추천상품" style="width:293px; height:320px" >
					</a>
					<p>
						<span class="red" style="margin-top:8px">[${store.category_big }]</span>
					</p>
					<p>
						<span>${store.product_name }</span> <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${store.product_price }" />원</span>
					</p>
				</li>
			</c:forEach>
		</ul>
		<br><br><br>
		<h1 style="margin-bottom:8px">인기 상품</h1>
		<ul class="bestBox">
			<c:forEach var="best" items="${best }">
				<li>
					<a href="storeBoard.do?seq=${best.store_seq }">
						<img class=product_img src="${best.url }" alt="인기상품" style="width:293px; height:320px">
					</a>
					<p>
						<span class="red" style="margin-top:8px">[${best.category_big }]</span>
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
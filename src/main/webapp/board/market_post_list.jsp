<%@	page import="java.text.SimpleDateFormat"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.text.NumberFormat"%>
<%@	page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@ 등록시간 추가 + 사진 추가하기 @@@@@@@@@ -->

<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<title>민트마켓 카테고리별 중고거래상품</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_market_content.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<script defer src="../js/mint_store.js"></script>
<link href="../css/10.promotion&used_post_list.css" rel="stylesheet">

<article style="padding-top: 200px; margin: 0px 20%">
	<div style="display: flex; justify-content: space-evenly;">
		
		<jsp:include page="../template/category.jsp"></jsp:include>
		
		<!-- 멍충멍충 -->
		<c:if test="${ count == 0 }">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${ count > 0 }">
			<div class="best" style="width: 800px;">
				<br> <br> <br>
				<c:forEach var="big" items="${ marketCategoryBig }">
					<c:set var="no" value="${param.big_no}"  />
					<c:if test="${no eq big.name }">
						<h1 style="padding: 0 5%;">${big.name }</h1>
					</c:if>
				</c:forEach>
				<br>
				<ul class="bestBox">
					<!-- 마켓 글 목록 -->
					<c:set var="big_no" value="${param.big_no }" />
					<c:set var="middle_no" value="${param.middle_no }" />
					<c:set var="heart_count" value="0" />
					<c:forEach var="market" items="${marketList }">
						<c:choose>
							<c:when test="${middle_no ne null }">
								<c:set var="market_category_big" value="${market.category_big }" />
								<c:set var="market_category_middle" value="${market.category_middle }" />
								<c:if test="${ big_no eq market_category_big && middle_no eq market_category_middle }">
									<li>
										<a href="marketBoard.do?seq=${market.market_seq }"> 
											<img src="${market.url }" alt="중고상품사진">
										</a>
										<p>
											<span class="red">${market.category_middle }</span> <span> <i class="fas fa-heart" onclick="handleModal(${heart_count})"></i></span>
										</p>
										<p>
											<span>${market.product_name }</span> <span>${market.product_price }원</span>
										</p>
									</li>
									<c:set var="heart_count" value="${ heart_count + 1 }" />
								</c:if>
							</c:when>
							<c:otherwise>
								<c:set var="market_category_big" value="${market.category_big }" />
								<c:if test="${ big_no eq market_category_big }">
									<li>
										<a href="marketBoard.do?seq=${market.market_seq }"> <img src="${market.url }" alt="추천상품1"></a>
										<p>
											<span class="red">${market.category_middle }</span> <span> <i class="fas fa-heart" onclick="handleModal(${heart_count})"></i></span>
										</p>
										<p>
											<span>${market.product_name }</span> <span>${market.product_price }원</span>
										</p>
									</li>
									<c:set var="heart_count" value="${ heart_count + 1 }" />
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</c:if>
	</div>
		<c:if test="${ count > 0 }">
			<c:set var="imsi" value="${ count % pageSize == 0 ? 0 : 1 }" />
			<c:set var="pageCount" value="${ count / pageSize + imsi }" />
			<c:set var="pageBlock" value="${ 3 }" />
			<fmt:parseNumber var="result" value="${ (currentPage - 1) / pageBlock }" integerOnly="true" />
			<c:set var="startPage" value="${ result * pageBlock + 1 }" />
			<c:set var="endPage" value="${ startPage + pageBlock - 1 }" />
			<c:if test="${ endPage > pageCount }">
				<c:set var="endPage" value="${ pageCount }" />
			</c:if>
			<c:if test="${ startPage > pageBlock }">
				<a href="marketDetailList.do?big_no=${big_no}&pageNum=${ startPage - pageBlock }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<a href="marketDetailList.do?big_no=${big_no}&pageNum=${ i }">[${ i }]</a>
			</c:forEach>
			<c:if test="${ endPage < pageCount }">
				<a href="marketDetailList.do?big_no=${big_no}&pageNum=${ startPage + pageBlock }">[다음]</a>
			</c:if>
		</c:if>
</article>

<script>
	
</script>

<jsp:include page="../template/footer.jsp"></jsp:include>

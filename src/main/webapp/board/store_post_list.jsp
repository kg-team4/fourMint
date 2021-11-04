<%@	page import="java.text.SimpleDateFormat"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.text.NumberFormat"%>
<%@	page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- @@@@@@@@@@@@@@@@@@@@@@@@ 등록시간 추가 + 사진 추가하기 @@@@@@@@@ -->

<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_store_content.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<script defer src="../js/mint_store.js"></script>
<link href="../css/10.promotion&used_post_list.css" rel="stylesheet">


<article style="padding-top: 200px; margin: 0px 20%">
	<div style="display: flex; align-items: center; justify-content: space-evenly;">
		<div class="best categoroy" style="align-self: flex-start; width: 300px; margin-top: 50px;">
			<section class="category_list">
				<h2 class="category_list_title" style="margin-bottom: 10px;">
					<a href="marketDetailList.do?big_no=1">주방</a>
				</h2>
				
				<ul class="category_list_middle">
					<li>
						<a href="marketDetailList.do?big_no=1&middle_no=1">냄비</a>
					</li>
					<li>
						<a href="marketDetailList.do?big_no=1&middle_no=2">프라이팬</a>
					</li>
				</ul>
			</section>
		</div>
		
		<!-- 멍충멍충 -->
		<c:if test="${ count == 0 }">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${ count > 0 }">
			<div class="best">
				<br> <br> <br>
				<h1>주방</h1>
				<ul class="bestBox">
					<!-- 마켓 글 목록 -->
					<c:forEach var="store" items="${storeList }">
						<li>
							<a href="storeBoard.do"> <img src="${store.img_url }" alt="추천상품1"></a>
							<p>
								<span class="red">${store.category_middle }</span> <span> <i class="fas fa-heart" onclick="handleModal(0)"></i></span>
							</p>
							<p>
								<span>${store.product_name }</span> <span>${store.product_price }원</span>
							</p>
						</li>
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
				<a href="storeDetailList.do?pageNum=${ startPage - pageBlock }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<a href="storeDetailList.do?pageNum=${ i }">[${ i }]</a>
			</c:forEach>
			<c:if test="${ endPage < pageCount }">
				<a href="storeDetailList.do?pageNum=${ startPage + pageBlock }">[다음]</a>
			</c:if>
		</c:if>
</article>


<jsp:include page="../template/footer.jsp"></jsp:include>

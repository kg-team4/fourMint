<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="best categoroy" style="align-self: flex-start; widdth: 100px; margin-top: 50px;">
	<section class="category_list" style="width: 135px;">
		<!-- 멍충멍충 -->
		<c:if test="${ count > 0 }">
			<div class="best">
				<h1 style="padding: 0 5%;"></h1>
				<c:forEach var="big" items="${ storeCategoryBig }">
				<div class="bestBox" style="display: block;">
					<c:set var="no" value="${param.big_no }" />
					<c:set var="name" value="${big.name }" />
					<!-- 스토어 글 목록 -->
					<c:choose>
						<c:when test="${no eq name}">
							<h2 class="category_list_title" style="margin: 0 5px 3px 0;">
								<a href="storeDetailList.do?big_no=${big.name }">${big.name }</a>
							</h2>
						</c:when>
						<c:otherwise>
							<h2 class="category_list_title" style="margin: 0 5px 3px 0;">
								<a href="storeDetailList.do?big_no=${big.name }">${big.name }</a>
							</h2>
						</c:otherwise>
					</c:choose>
				</div>
				<br>
				</c:forEach>
			</div>
		</c:if>
	</section>
</div>
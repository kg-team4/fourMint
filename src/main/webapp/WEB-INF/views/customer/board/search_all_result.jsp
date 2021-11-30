<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<title>민트마켓 검색하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/search_result.css">

<jsp:include page="../template/header.jsp"></jsp:include>
</head>

<body>
<article>
	<div class="contents_all">
		<c:choose>
		<c:when test="${market[0] eq null }">
			<div class="search_used_all">
				<div class="search_cate">중고거래</div>
				<hr>
				<div class="no_result">
					<img alt="검색결과없음" src="${pageContext.request.contextPath}/resources/user/img/no_search.png" style="width:30px; height:20px" >
					<span class="search_word">"${keyword}"</span>&nbsp;에 대한 검색결과가 없습니다.				
				</div>
			</div>	
		</c:when>
		<c:otherwise>
			<div class="search_used_all">
				<div class="search_cate">중고거래</div>
				<hr>
				<c:forEach var="mar" items="${market }" begin="0" end="2">
					<div class="search_contents">
						<div style="margin-bottom:5px;"><a class="search_link" href="marketBoard.do?seq=${mar.market_seq }">${mar.product_name }&nbsp;</a><span style="color: #506EA5;">[${mar.address2 }]</span></div>
						<div class="search_content">
							${mar.product_content }
						</div>				
					</div>
				</c:forEach>
				<c:if test="${fn:length(market) > 3}">
				<div style="text-align: right">
					<a href="searchMarketMoreResult.do?keyword=${keyword }" class="result_more"> 더보기 > </a>
				</div>				
				</c:if>
			</div>
		</c:otherwise>
		</c:choose>
		
		<c:choose>
		<c:when test="${nickname eq null}">
			<div class="search_community_all">
				<div class="search_cate">커뮤니티</div>
				<hr>
				<div class="no_result">
					<img alt="검색결과없음" src="${pageContext.request.contextPath}/resources/user/img/no_search.png" style="width:30px; height:20px" >
					<span class="search_word">커뮤니티 글을 확인하기 위해서는 "로그인"이 필요합니다.</span>			
				</div>
			</div>
		</c:when>
		<c:when test="${community[0] eq null }">
			<div class="search_community_all">
				<div class="search_cate">커뮤니티</div>
				<hr>
				<div class="no_result">
					<img alt="검색결과없음" src="${pageContext.request.contextPath}/resources/user/img/no_search.png" style="width:30px; height:20px" >
					<span class="search_word">"${keyword}"</span>&nbsp;에 대한 검색결과가 없습니다.			
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="search_community_all">
				<div class="search_cate">커뮤니티</div>
				<hr>
				<c:forEach var="com" items="${community }" begin="0" end="2">
				<div class="search_contents">
					<div style="margin-bottom:5px;"><a class="search_link" href="communityBoard.do?seq=${com.community_seq }">${com.title }</a></div>
					<div class="search_content">
						${com.content }
					</div>				
				</div>
				</c:forEach>
				<c:if test="${fn:length(community) > 3}">
				<div style="text-align: right">
						<a href="searchCommunityMoreResult.do?keyword=${keyword }" class="result_more"> 더보기 > </a>
				</div>
				</c:if>
			</div>	
		</c:otherwise>
		</c:choose>
	</div><!-- end contents_all -->
</article>


<jsp:include page="../template/footer.jsp"></jsp:include>


</body>
</html>
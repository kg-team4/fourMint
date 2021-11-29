<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
		<div class="search_community_all">
			<div class="search_cate">커뮤니티</div>
			<hr>
			
			<c:forEach var="com" items="${community }">
				<div class="search_contents">
					<div style="margin-bottom:5px;"><a class="search_link" href="communityBoard.do?seq=${com.community_seq }">${com.title }</a></div>
					<div class="search_content">
						${com.content }
					</div>				
				</div>
			</c:forEach>
			
		</div>				
	</div><!-- end contents_all -->
</article>

<jsp:include page="../template/footer.jsp"></jsp:include>


</body>
</html>
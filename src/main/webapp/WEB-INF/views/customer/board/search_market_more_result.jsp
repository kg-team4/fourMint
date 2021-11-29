<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		<div class="search_used_all">
			<div class="search_cate">동네거래</div>
			<hr>
				<c:forEach var="mar" items="${market }">
				<div class="search_contents">
						<div style="margin-bottom:5px;"><a class="search_link" href="marketBoard.do?seq=${mar.market_seq }">${mar.product_name }&nbsp;</a><span style="color: #506EA5;">[${mar.address2 }]</span></div>
						<div class="search_content">
							${mar.product_content }
						</div>				
					</div>
				</c:forEach>
				
		</div>			
						
	</div><!-- end contents_all -->
</article>


<jsp:include page="../template/footer.jsp"></jsp:include>


</body>
</html>
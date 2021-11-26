<%@	page import="java.text.SimpleDateFormat"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.text.NumberFormat"%>
<%@	page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트스토어 서비스센터</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/store_service_center.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>

<jsp:include page="../template/header.jsp"></jsp:include>

</head>
<body>
<article>
	<!-- 카테고리 -->
	<div class="contents_all">
		<div class="category_list">
			<div>
				<a class="category_title" href="storeServiceCenter.do">NOTICE</a>
			</div>
			<div>
				<a class="category_title" href="storeServiceCenterFAQ.do">FAQ</a>
			</div>
		</div>
	</div>
	<!-- 공지사항 -->
		<div class="store_review_all">
			<div class="store_review">
				<table>
					<c:forEach var="staticNotice" items="${staticNoticeList }">
					<tr>
						
							<td id="news_num">
								<img src="../img/megaphone.png" width=23px; height=23px>
							</td>
							<td id="news_title">
								<div id="news_title_content">
									 <a class="news_title_detail" >${staticNotice.notice_title }</a>
								</div>
							</td>
							<td id="down_arrow" style="color:gray">
								<input type="button" class="slider" value="▼" style="background: none; border:0px; color:gray; cursor:pointer;">
							</td>
						
					</tr>
									
	
					<tr  id="contents_all" style=" display: none">
						<td></td>
						
						<td>
							<div style="text-align: right">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${staticNotice.date }" />
							</div>
							
							<pre><br>${staticNotice.notice_content }<br></pre>
						</td>
						
						<td></td>
					</tr>
					</c:forEach>
					
					
					<c:forEach var="normalNotice" items="${normalNoticeList }" varStatus="status">
					<tr>
						<td id="news_num">
							${fn:length(normalNoticeList) - status.index }
						</td>
						<td id="news_title">
							<div id="news_title_content">
								 <a class="news_title_detail">${normalNotice.notice_title}</a>
							</div>
						</td>
						<td style="color:gray">					
							<input type="button" class="slider" value="▼" style="background: none; border:0px; color:gray; cursor:pointer">
						</td>
					</tr>										
										
					<tr  id="contents_all" style=" display: none">
						<td></td>
						
						<td>
							<div style="text-align: right">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${normalNotice.date}" />								
							</div>
							
							<pre><br>${normalNotice.notice_content}<br></pre>
						</td>
						
						<td></td>
					</tr>
					</c:forEach>
				</table>
			</div>	
				
	</div><!-- end contents_all -->
</article>
<script>
$( document ).ready( function() {	
	$(".slider").click(function(){
		if($(this).parent().parent().next().is(":visible")){
			$(this).parent().parent().next().slideUp(400);
	      	$(this).val("▼");
	    } else{
	    	$(this).parent().parent().next().slideDown(400);
	    	$(this).val("▲");
	   	}
	});
 });

</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/resources/user/css/10.promotion&used_post_list.css" type="text/css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<title>민트 커뮤니티</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/mint_community.css">
<jsp:include page="../template/header.jsp"></jsp:include>

<article style="padding-top: 200px; margin: 0px 20%">

	<div id="user_address" style="color:#26e4ca; text-align: center; font-size:24px;">
		<span style="color:#7b7b7b;">나의 동네 </span> <strong>[${addressSub}]</strong>
	</div>

	<!-- 소식 -->
	<div class="community_news_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject" style="color: #26e4ca"><strong>소식 &nbsp;&nbsp;</strong></span>
		</p>
		<div class="community_news">
			<div align="right" id="more_link">
				<a href="communityDetailList.do?count=3&kind=소식">더보기 ></a>
			</div>
			<table>
				<c:forEach var="list" items="${list }">
				<c:if test="${list.category eq '소식' }">
				<tr>
					<td id="news_title">
						<div id="news_title_content">
							<img src="${pageContext.request.contextPath}/resources/user/img/megaphone.png" width=25px; height=25px> <a href="communityBoard.do?seq=${list.community_seq }">${list.title }</a>
						</div>
					</td>
					<td>
						<div id="news_useful">
							<img src="${pageContext.request.contextPath}/resources/user/img/thumbs-up.png" width=15px; height=15px> <span>${list.likes }</span>
						</div>
					</td>
					<td>
						<div id="news_views">
							<img src="${pageContext.request.contextPath}/resources/user/img/eye.png" width=15px; height=15px> <span>${list.views }</span>
						</div>
					</td>
					<td>
						<div id="news_comment">
							<img src="${pageContext.request.contextPath}/resources/user/img/comment.png" width=15px; height=15px> <span>${list.comments }</span>
						</div>
					</td>
					<td>
						<div>${list.nickname }</div>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	
	
	<!-- 질문 -->
	<div class="question_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject" style="color: #26e4ca"><strong>질문 &nbsp;&nbsp;</strong></span>
		</p>
		<div class="community_news_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="communityDetailList.do?count=3&kind=질문">더보기 ></a>
				</div>
				<table>
					<c:forEach var="list" items="${list }">
					<c:if test="${list.category eq '질문' }">
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="${pageContext.request.contextPath}/resources/user/img/question_mark.png" width=20px; height=20px> <a href="communityBoard.do?seq=${list.community_seq}">${list.title }</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="${pageContext.request.contextPath}/resources/user/img/raise-your-hand-to-ask.png" width=18px; height=18px> <span>${list.likes }</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="${pageContext.request.contextPath}/resources/user/img/eye.png" width=15px; height=15px> <span>${list.views }</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="${pageContext.request.contextPath}/resources/user/img/comment.png" width=15px; height=15px> <span>${list.comments }</span>
							</div>
						</td>
						<td nowrap>
							<div>${list.nickname }</div>
						</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
				<br>
			</div>
		</div>
	</div>
	
	
	<!-- 모임 -->
	<div class="group_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject" style="color: #26e4ca"><strong>모임 &nbsp;&nbsp;</strong></span>
		</p>
		<div class="group_grid">
			<div class="group_list">
				<div align="right" id="more_link">
					<a href="communityDetailList.do?count=3&kind=모임">더보기 ></a>
				</div>
				<table style="border: 0">
					<tr>
						<c:forEach var="list" items="${list }">
						<c:if test="${list.category eq '모임' }">
						<td id="td_group">
							<a id="store_review_img_area" href="communityBoard.do?seq=${list.community_seq}">
								<div id="group_img_box">
									<img id="group_img" src="${list.url }" alt="모임이미지">
								</div>
								<div id="group_name">${list.title }</div>
							</a>
						</td>
						</c:if>
						</c:forEach>
					</tr>
				</table>
				<br> <br>
			</div>
		</div>
	</div>
	
	
	<!-- 맛집 -->
	<div class="must_go_restaurant_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject" style="color: #26e4ca"><strong>맛집 &nbsp;&nbsp;</strong></span>
		</p>
		<div class="group_grid">
			<div class="group_list">
				<div align="right" id="more_link">
					<a href="communityDetailList.do?count=3&kind=맛집">더보기 ></a>
				</div>
				<table style="border: 0">
					<tr>
						<c:forEach var="list" items="${list }">
						<c:if test="${list.category eq '맛집' }">
						<td id="td_group">
							<a id="store_review_img_area" href="communityBoard.do?seq=${list.community_seq}">
								<div id="group_img_box">
									<img id="group_img" src="${list.url }" alt="맛집이미지">
								</div>
								<div id="group_name">${list.title }</div>
							</a>
						</td>
						</c:if>
						</c:forEach>
					</tr>
				</table>
				<br> <br>
			</div>
		</div>
	</div>
	
	
	<!-- 분실센터 -->
	<div class="lost_find_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject" style="color: #26e4ca"><strong>분실센터 &nbsp;&nbsp;</strong></span>
		</p>
		<div class="community_news_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="communityDetailList.do?count=3&kind=분실센터">더보기 ></a>
				</div>
				<table>
					<c:forEach var="list" items="${list }">
					<c:if test="${list.category eq '분실센터' }">
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="${pageContext.request.contextPath}/resources/user/img/find.png" width=20px; height=20px> <a href="communityBoard.do?seq=${list.community_seq}">${list.title }</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="${pageContext.request.contextPath}/resources/user/img/sad_icon.png" width=18px; height=18px> <span>${list.likes }</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="${pageContext.request.contextPath}/resources/user/img/eye.png" width=15px; height=15px> <span>${list.views }</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="${pageContext.request.contextPath}/resources/user/img/comment.png" width=15px; height=15px> <span>${list.comments }</span>
							</div>
						</td>
						<td nowrap>
							<div>${list.nickname }</div>
						</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
				<br>
			</div>
		</div>
	</div>
	
	
	<!-- 사진전 -->
	<div class="picture_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject" style="color: #26e4ca"><strong>사진전 &nbsp;&nbsp;</strong></span> 
		</p>
		<div class="group_grid">
			<div class="group_list">
				<div align="right" id="more_link">
					<a href="communityDetailList.do?count=3&kind=사진전">더보기 ></a>
				</div>
				<table style="border: 0">
					<tr>
						<c:forEach var="list" items="${list }">
						<c:if test="${list.category eq '사진전' }">
						<td id="td_group">
							<a id="store_review_img_area" href="communityBoard.do?seq=${list.community_seq}">
								<div id="group_img_box">
									<img id="group_img" src="${list.url }" alt="사진전이미지">
								</div>
								<div id="group_name">${list.title }</div>
							</a>
						</td>
						</c:if>
						</c:forEach>
					</tr>
				</table>
				<br>
				<br>
			</div>
		</div>
		<br>
		<br>
		<br>
	</div>
	
</article>
<jsp:include page="../template/footer.jsp"></jsp:include>

<%@	page import="java.text.SimpleDateFormat"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.text.NumberFormat"%>
<%@	page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<title>민트스토어 서비스센터 FAQ</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/store_service_center_faq.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<jsp:include page="../template/header.jsp"></jsp:include>
</head>
<body>
	<article>
		<div class="contents_all">
			<div class="category_list">
				<% String scKind = (String)request.getParameter("cate"); %>
				<div>
					<a class="category_title" href="storeServiceCenter.do?cate=notice"<% if ("notice".equals(scKind)) { %>style="color: #26e4ca; cursor:pointer;"<% } %>>NOTICE</a>
				</div>
				<div>
					<a class="category_title" href="storeServiceCenterFAQ.do?cate=faq"<% if ("faq".equals(scKind)) { %>style="color: #26e4ca; cursor:pointer;"<% } %>>FAQ</a>
				</div>
			</div>


			<div class="tab">
				<ul class="tabnav">
					<li><a href="#tab01">전체</a></li>
					<li>
						<a href="#tab02">주문/결제</a>
						<a href="/storeServiceCenterFAQ.do?kind=주문/결제"></a>
						
						
					</li>
					<li><a href="#tab03">배송</a></li>
					<li><a href="#tab04">취소/환불</a></li>
					<li><a href="#tab05">반품/교환</a></li>
					<li><a href="#tab06">기타</a></li>
					<li><a href="#tab07">민트마켓</a></li>
				</ul>
				<div class="tabcontent">
				<c:forEach var="faqAllLists" items="${faqAllList }"  varStatus="status">
					<div id="tab01">
						<div class="store_review_all">
							<div class="store_review">
								<table>
									<tr>
										<td id="news_num">
											${fn:length(faqAllList) - status.index } 
										</td>
										<td id="faq_category" style="width: 120px;">${faqAllLists.faq_category}</td>
										<td id="news_title">
											<div id="news_title_content">
												<a id="news_title_detail" href="#">${faqAllLists.faq_title }</a>
											</div>
										</td>
										<td id="down_arrow" style="color: gray"><input
											type="button" class="slider" value="▼"
											style="background: none; border: 0px; color: gray; cursor: pointer;">
										</td>
									</tr>


									<tr id="contents" style="display: none">
										<td></td>
										<td colspan="3">
												<pre><br>${faqAllLists.faq_content }<br>
											</pre>
										</td>

									</tr>

								</table>
							</div>

						</div>

					</div> <!-- end tab01 -->
				</c:forEach>
				
					
				<c:forEach var="faqCategoryList" items="${faqAllList }"  varStatus="status">
				<c:choose>
				<c:when test="${faqCategoryList.faq_category eq '주문/결제' }">
					<div id="tab02">
					<div class="store_review_all">
							<div class="store_review">
								<table>
									<tr>
										<td id="news_num">${fn:length(faqAllList) - status.index }</td>
										<td id="faq_category" style="width: 120px;">${faqCategoryList.faq_category }</td>
										<td id="news_title">
											<div id="news_title_content">
												<a id="news_title_detail" href="#">${faqCategoryList.faq_title }</a>
											</div>
										</td>
										<td id="down_arrow" style="color: gray"><input
											type="button" class="slider" value="▼"
											style="background: none; border: 0px; color: gray; cursor: pointer;">
										</td>
									</tr>


									<tr id="contents" style="display: none">
										<td></td>
										<td colspan="3">
										<pre><br>${faqCategoryList.faq_content }<br></pre>
										</td>

									</tr>

								</table>
							</div>

						</div>				
					</div><!-- tab02 -->
					</c:when>
					</c:choose>
				</c:forEach>
				
					
				<c:forEach var="faqCategoryList" items="${faqAllList }"  varStatus="status">
				<c:choose>
				<c:when test="${faqCategoryList.faq_category eq '배송' }">					
					<div id="tab03">
					<div class="store_review_all">
							<div class="store_review">
								<table>
									<tr>
										<td id="news_num">${fn:length(faqAllList) - status.index }</td>
										<td id="faq_category" style="width: 120px;">${faqCategoryList.faq_category }</td>
										<td id="news_title">
											<div id="news_title_content">
												<a id="news_title_detail" href="#">${faqCategoryList.faq_title }</a>
											</div>
										</td>
										<td id="down_arrow" style="color: gray"><input
											type="button" class="slider" value="▼"
											style="background: none; border: 0px; color: gray; cursor: pointer;">
										</td>
									</tr>


									<tr id="contents" style="display: none">
										<td></td>
										<td colspan="3">
											<pre>
												<br>${faqCategoryList.faq_content }<br>
											</pre>
										</td>

									</tr>									
								</table>
							</div>

						</div>
					
					</div><!-- end tab03 -->
					</c:when>
					</c:choose>
				</c:forEach>
				
					
				<c:forEach var="faqCategoryList" items="${faqAllList }"  varStatus="status">
				<c:choose>
				<c:when test="${faqCategoryList.faq_category eq '취소/환불' }">	
					<div id="tab04">
					<div class="store_review_all">
							<div class="store_review">
								<table>
									<tr>
										<td id="news_num">${fn:length(faqAllList) - status.index }</td>
										<td id="faq_category" style="width: 120px;">${faqCategoryList.faq_category }</td>
										<td id="news_title">
											<div id="news_title_content">
												<a id="news_title_detail" href="#">${faqCategoryList.faq_title }</a>
											</div>
										</td>
										<td id="down_arrow" style="color: gray"><input
											type="button" class="slider" value="▼"
											style="background: none; border: 0px; color: gray; cursor: pointer;">
										</td>
									</tr>


									<tr id="contents" style="display: none">
										<td></td>
										<td colspan="3">
										<pre><br>${faqCategoryList.faq_content }<br></pre>
										</td>

									</tr>
								</table>
							</div>

						</div>
					</div><!-- end tab04 -->
					</c:when>
					</c:choose>
				</c:forEach>
			
			<c:forEach var="faqCategoryList" items="${faqAllList }"  varStatus="status">
				<c:choose>
				<c:when test="${faqCategoryList.faq_category eq '반품/교환' }">		
					<div id="tab05">
					<div class="store_review_all">
							<div class="store_review">
								<table>
									<tr>
										<td id="news_num">${fn:length(faqAllList) - status.index }</td>
										<td id="faq_category" style="width: 120px;">${faqCategoryList.faq_category }</td>
										<td id="news_title">
											<div id="news_title_content">
												<a id="news_title_detail" href="#">${faqCategoryList.faq_title }</a>
											</div>
										</td>
										<td id="down_arrow" style="color: gray"><input
											type="button" class="slider" value="▼"
											style="background: none; border: 0px; color: gray; cursor: pointer;">
										</td>
									</tr>


									<tr id="contents" style="display: none">
										<td></td>
										<td colspan="3">
												<br><pre>${faqCategoryList.faq_content }<br></pre>
										</td>

									</tr>
								</table>
							</div>

						</div>
					</div><!-- end tab05 -->					
					</c:when>
					</c:choose>
				</c:forEach>
				
				<c:forEach var="faqCategoryList" items="${faqAllList }"  varStatus="status">
				<c:choose>
				<c:when test="${faqCategoryList.faq_category eq '기타' }">	
					<div id="tab06">
					<div class="store_review_all">
							<div class="store_review">
								<table>
									<tr>
										<td id="news_num">${fn:length(faqAllList) - status.index }</td>
										<td id="faq_category" style="width: 120px;">${faqCategoryList.faq_category }</td>
										<td id="news_title">
											<div id="news_title_content">
												<a id="news_title_detail" href="#">${faqCategoryList.faq_title }</a>
											</div>
										</td>
										<td id="down_arrow" style="color: gray"><input
											type="button" class="slider" value="▼"
											style="background: none; border: 0px; color: gray; cursor: pointer;">
										</td>
									</tr>


									<tr id="contents" style="display: none">
										<td></td>
										<td colspan="3">
											<pre><br>${faqCategoryList.faq_content }<br></pre>
										</td>

									</tr>

								</table>
							</div>

						</div>
					</div><!-- end tab06 -->
					</c:when>
					</c:choose>
				</c:forEach>
				
				<c:forEach var="faqCategoryList" items="${faqCategoryList }"  varStatus="status">
				<c:choose>
				<c:when test="${kind eq '민트마켓' }">		
					<div id="tab07">
					<div class="store_review_all">
							<div class="store_review">
								<table>
									<tr>
										<td id="news_num">${fn:length(faqAllList) - status.index }</td>
										<td id="faq_category" style="width: 120px;">${faqCategoryList.faq_category }</td>
										<td id="news_title">
											<div id="news_title_content">
												<a id="news_title_detail" href="#">${faqCategoryList.faq_title }</a>
											</div>
										</td>
										<td id="down_arrow" style="color: gray"><input
											type="button" class="slider" value="▼"
											style="background: none; border: 0px; color: gray; cursor: pointer;">
										</td>
									</tr>


									<tr id="contents" style="display: none">
										<td></td>
										<td colspan="3">
											<pre><br>${faqCategoryList.faq_content }<br></pre>
										</td>

									</tr>

								</table>
							</div>

						</div>
					</div><!-- end tab07 -->
					</c:when>
					</c:choose>
				</c:forEach>
					
				</div>
			</div>
		</div>
		<!-- end contents_all -->


		<script>
			$(function() {
				$('.tabcontent > div').hide();
				$('.tabnav a').click(function() {
					$('.tabcontent > div').hide().filter(this.hash).fadeIn();
					$('.tabnav a').removeClass('active');
					$(this).addClass('active');
					return false;
				}).filter(':eq(0)').click();
			});

			$(document).ready(function() {
				$(".slider").click(function() {
					if ($(this).parent().parent().next().is(":visible")) {
						$(this).parent().parent().next().slideUp(400);
						$(this).val("▼");
					} else {
						$(this).parent().parent().next().slideDown(400);
						$(this).val("▲");
					}
				});
			});
		</script>

	</article>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>

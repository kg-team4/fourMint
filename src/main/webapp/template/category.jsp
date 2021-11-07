<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="best categoroy" style="align-self: flex-start; widdth: 100px; margin-top: 50px;">
	<section class="category_list" style="width: 135px;">
		<!-- 멍충멍충 -->
		<c:if test="${ count > 0 }">
			<div class="best">
				<h1 style="padding: 0 5%;"></h1>
				<c:forEach var="big" items="${ marketCategoryBig }">
				<div class="bestBox" style="display: block;">
					<c:set var="no" value="${param.big_no }" />
					<c:set var="name" value="${big.name }" />
					<!-- 마켓 글 목록 -->
					<c:choose>
						<c:when test="${no eq name}">
							<h2 class="category_list_title" style="margin: 0 5px 3px 0;">
								<a href="marketDetailList.do?big_no=${big.name }">${big.name }</a>&nbsp;<input type="button" class="slider" value="▲" style="background: none; border: 0px;">
							</h2>
							<ul class="category_list_middle" style="margin: 0 5px 8px 0;">
								<c:forEach var="middle" items="${ big.middle }">
									<li><a href="marketDetailList.do?big_no=${big.name }&middle_no=${middle.value}">${ middle.value}</a></li>
								</c:forEach>
							</ul>
						</c:when>
						<c:otherwise>
							<h2 class="category_list_title" style="margin: 0 5px 3px 0;">
								<a href="marketDetailList.do?big_no=${big.name }">${big.name }</a>&nbsp;<input type="button" class="slider" value="▼" style="background: none; border: 0px;">
							</h2>
							<ul class="category_list_middle" style="margin: 0 5px 8px 0; display: none;">
								<c:forEach var="middle" items="${ big.middle }">
									<li><a href="marketDetailList.do?big_no=${big.name }&middle_no=${middle.key}">${ middle.value}</a></li>
								</c:forEach>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<br>
				</c:forEach>
			</div>
		</c:if>
		<script>
			$(".slider").click(function(){
                if($(this).parent().next().is(":visible")){
                	$(this).parent().next().slideUp();
                	$(this).val("▼");
                }
                else{
                	$(this).parent().next().slideDown();
                	$(this).val("▲");
                }
            })
        </script>
	</section>
</div>
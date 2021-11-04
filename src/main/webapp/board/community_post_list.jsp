<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="../css/reset.css">

<style>
	.container {
		margin-right: 3px;
		margin-left: 3px;
		margin-bottom: 12px;
	}
	
	.top {
		width: auto;
		height: 150px;
		border: 1px solid lightgray;
		padding: 20px;
		padding-left: 50px;
		padding-right: 50px;
	}
	
	.bottom {
		width: 1200px;
		height: 40px;
		border: 1px solid lightgray;
		padding: 10px;
		padding-left: 50px;
		font-family: '돋움';
	}
	
	.last {
		font-size: 18px;
	}
	
	.popular {
		float: right;
		margin-left: 10px;
		font-size: 18px;
	}
	
	.sort_list {
		margin-right: 5px;
	}
	
	.hr_style1 {
		margin-bottom: 30px;
		margin-top: 30px;
		color: lightgray;
	}
	
	.userImg2 {
		width: 60px;
		height: 60px;
		border-radius: 30px;
	}
	
	.userName {
		color: orange;
	}
	
	.userAddr {
		color: gray;
	}
	
	.userName, .userImg {
		list-style: none;
	}
	
	.float-box:after {
		content: "";
		display: block;
		clear: both;
	}
	
	.float-box.float-left>.userImg {
		float: left;
	}
	
	.float-box.float-left>.like {
		float: left;
	}
	
	.userImg {
		width: 9%;
	}
	
	.date {
		
	}
	
	.list {
		padding: 10px;
	}
	
	.content {
		padding-top: 20px;
	}
	
	.like {
		font-size: 19px;
		font-weight: normal;
	}
	
	.reply {
		margin-left: 70px;
	}
	
	.date {
		float: right;
		color: gray;
	}
</style>

<jsp:include page="../template/header.jsp"></jsp:include>

<article style="padding-top: 200px; margin: 0px 20%">
	<div align="left">
		<h2 style="font-size: 30px; margin: 15px;">
			<span style="color: orange">우리동네</span> 커뮤니티
		</h2>

		<hr class="hr_style1">

		<!-- 멍충멍충 -->
		<c:if test="${ count == 0 }">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${ count > 0 }">
			<!-- 커뮤니티 글 목록 -->
			<c:forEach var="board" items="${articleList }">
				<div class="container">
					<div class="top">
						<div class="float-box float-left">
							<div class="userImg">
								<img class="userImg2" src="${board.userImg }">
							</div>
							<div class="list">
								<div class="date">${board.date }</div>
								<div class="userAddr">${board.userAddress }</div>
								<div class="userName">${board.userName }</div>
							</div>
						</div>
					<div class="content">${board.content }</div>
				</div>
				</div>
			</c:forEach>
		</c:if>
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
				<a href="communityDetailList.do?pageNum=${ startPage - pageBlock }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<a href="communityDetailList.do?pageNum=${ i }">[${ i }]</a>
			</c:forEach>
			<c:if test="${ endPage < pageCount }">
				<a href="communityDetailList.do?pageNum=${ startPage + pageBlock }">[다음]</a>
			</c:if>
		</c:if>
	</div>
</article>

<jsp:include page="../template/footer.jsp"></jsp:include>
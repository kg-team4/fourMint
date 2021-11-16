<%@	page import="java.text.SimpleDateFormat"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.text.NumberFormat"%>
<%@	page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_store_content.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<link href="../css/10.promotion&used_post_list.css" rel="stylesheet">

<article style="padding-top: 200px; margin: 0px 20%">
	<div style="display: flex; align-items: center; justify-content: space-evenly;">
		<!-- 카테고리 -->
		<div class="best categoroy" style="align-self: flex-start; widdth: 100px; margin-top: 50px;">
			<section class="category_list" style="width: 135px;">
				<div class="best">
					<h1 style="padding: 0 5%;"></h1>
					<c:forEach var="big" items="${ storeCategoryBig }">
					<div class="bestBox" style="display: block;">
						<c:set var="name" value="${big.name }" />
						<!-- 카테고리 목록 -->
						<h2 class="category_list_title" style="margin: 0 5px 3px 0;">
							<label class="category_big_name">${ name }</label>
						</h2>
					</div>
					<br>
					</c:forEach>
				</div>
			</section>
		</div>
	
		<!-- 게시글 목록 -->
		<c:if test="${ listCount == 0 }">
			<table style="width: 700px; border: 1px" >
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<!-- 게시글이 존재할 때 -->
		<c:if test="${ listCount > 0 }"> 
			<div class="best" style="width: 800px;">
				<br> <br> <br>
				<h1 style="padding: 0 5%;">${kind }</h1>
				<br>
				<ul class="bestBox">
					<!-- 스토어 글 목록 -->
					<c:set var="big_no" value="${kind }" />
					<c:forEach var="store" items="${storeList }">
						<c:if test="${ big_no eq store.category_big}">
							<li>
								<a href="storeBoard.do?seq=${store.store_seq }"> <img src="${store.url }"></a>
								<p>
									<span>${store.product_name }</span> <span>${store.product_price }원</span>
								</p>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:if>
	</div>
	<div style="text-align: center;">
	<c:set var="startPage" value="${ startPage }" />
	<c:set var="endPage" value="${ endPage }" />
	<c:set var="pageCount" value="${ maxPage }" />
		<label class="pagingNumPrev">◀</label>
	<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
		<label class="pagingNum">${i}</label>
	</c:forEach>
		<label class="pagingNumNext">▶</label>
	</div>
</article>

<script>
	$(function(){
		$(".category_big_name").on('click',function(){
			var kind = $(this).text();  //버튼이 클릭 되었을 때 그 버튼의 value를 var kind로 가져와서	
			$.ajax({
				url : 'storeDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind}, // kind를 kind로 명명하여 보내겠다
				success : function(data){ 
				   console.log(data);
				   $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
				},
				error : function(data){
					alert('error');
				}//error
			})//ajax
		});//click
		
		$(".pagingNum").on('click',function(){
			var pageNum = $(this).text();  //버튼이 클릭 되었을 때 그 버튼의 value를 var kind로 가져와서	
			var kind = "${kind}";
			$.ajax({
				url : 'storeDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "pageNum" : pageNum}, // kind를 kind로 명명하여 보내겠다
				success : function(data){ 
				   console.log(data);
				   $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
				   $(document).scrollTop(0);
				},
				error : function(data){
					alert('error');
				}//error
			})//ajax
		});//click
		
		$(".pagingNumPrev").on('click',function(){
			var pageNum = "${pageNum}";  //버튼이 클릭 되었을 때 그 버튼의 value를 var kind로 가져와서	
			var kind = "${kind}";
			var arrow = "prev";
			$.ajax({
				url : 'storeDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "pageNum" : pageNum, "arrow" : arrow}, // kind를 kind로 명명하여 보내겠다
				success : function(data){ 
				   console.log(data);
				   $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
				   $(document).scrollTop(0);
				},
				error : function(data){
					alert('error');
				}//error
			})//ajax
		});//click
		
		$(".pagingNumNext").on('click',function(){
			var pageNum = "${pageNum}";  //버튼이 클릭 되었을 때 그 버튼의 value를 var kind로 가져와서	
			var kind = "${kind}";
			var arrow = "next";
			$.ajax({
				url : 'storeDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "pageNum" : pageNum, "arrow" : arrow}, // kind를 kind로 명명하여 보내겠다
				success : function(data){ 
				   console.log(data);
				   $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
				   $(document).scrollTop(0);
				},
				error : function(data){
					alert('error');
				}//error
			})//ajax
		});//click
	});//ready
</script>

<jsp:include page="../template/footer.jsp"></jsp:include>

<%@	page import="java.text.SimpleDateFormat"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.text.NumberFormat"%>
<%@	page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<title>민트스토어 상품</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/mint_store_content.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/user/css/10.promotion&used_post_list.css" rel="stylesheet">

<article style="padding-top: 200px;">
	<div style="display: flex;">
		<!-- 카테고리 -->
		<div class="best categoroy" style="align-self: flex-start; width: 100px; margin-left:200px; margin-top: 50px;">
			<section class="category_list" style="width: 135px;">
				<div class="best" style="width:160px; margin-top: 60px;">
					<h3 style="padding: 0 50%; margin-top: -20px;"></h3>
					<c:forEach var="big" items="${ storeCategoryBig }">
					<div class="bestBox" style="display: block;">
						<c:set var="name" value="${big.name }" />
						<!-- 카테고리 목록 -->
						<h2 class="category_list_title" style="color:#7b7b7b; font-size:20px; margin: 0 10px 6px 0; font-weight:400;">
							<label class="category_big_name" style="color:#7b7b7b; font-size:20px; cursor:pointer">${ name }</label>
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
			<div class="best" style="width: 1020px;">
				<br> <br> <br>
				<h2  style="margin-left:49%; font-size:22px;">${kind }</h2>
				<br>
				<ul class="bestBox" style="margin-left: 65px;">
					<!-- 스토어 글 목록 -->
					<c:set var="big_no" value="${kind }" />
					<c:forEach var="store" items="${storeList }">
						<c:if test="${ big_no eq store.category_big}">
							<li>
							<c:choose>
							<c:when test="${ store.product_stock < 1}">
							<a href="storeBoard.do?seq=${store.store_seq }"> <img src="${store.url }" style="opacity: 50%;"></a>
							<div style="display:flex; padding-top:20px;">
								<div id="product_name"
									style="width: 180px; text-align: left; word-wrap: break-word; white-space: nowrap; text-overflow: ellipsis; display: inline-block; overflow: hidden;">${store.product_name }</div>
								<div id="product_price"
									style="text-align:center; width:60px; background: #50b9abd0; border-radius:3px;color:white">sold out</div>
								</div>
							</c:when>
							<c:otherwise>
							<a href="storeBoard.do?seq=${store.store_seq }"> <img src="${store.url }"></a>
							<div style="display:flex; padding-top:20px;">
								<div id="product_name"
									style="width: 180px; text-align: left; word-wrap: break-word; white-space: nowrap; text-overflow: ellipsis; display: inline-block; overflow: hidden;">${store.product_name }</div>
								<div id="product_price"
									style="width: 100px; text-align: right; word-wrap: break-word; white-space: nowrap; display: inline-block; overflow: hidden; text-overflow: ellipsis; margin-left: 10px; font-size: 15px; color: #50b9abd0; ">${store.product_price }원</div>
							</div>
							</c:otherwise>
							</c:choose>
								
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:if>
	</div>
	<div style="text-align: right; width:955px; padding-top:12px; margin:auto">
		<div id="search_write_area"> 
				<input type="text" id="search" style="width:160px" name="searchVal" value="${keyword }" placeholder="상품명을 입력하세요.">
				<input id="btn_search" type="button" value="검색"> 
		</div>
	</div>	
	
		<div style="text-align: center; width:1350px; padding-top:12px; padding-bottom:40px; margin:auto;" >
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
			var search = "${keyword}";
			var option = "${option}";
			$.ajax({
				url : 'storeDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "pageNum" : pageNum, "keyword" : search, "option" : option}, // kind를 kind로 명명하여 보내겠다
				success : function(data){ 
				   console.log(data);
				   $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
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
			var search = "${keyword}";
			var option = "${option}";
			$.ajax({
				url : 'storeDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "pageNum" : pageNum, "arrow" : arrow, "keyword" : search, "option" : option}, // kind를 kind로 명명하여 보내겠다
				success : function(data){ 
				   console.log(data);
				   $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
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
			var search = "${keyword}";
			var option = "${option}";
			$.ajax({
				url : 'storeDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "pageNum" : pageNum, "arrow" : arrow, "keyword" : search, "option" : option}, // kind를 kind로 명명하여 보내겠다
				success : function(data){ 
				   console.log(data);
				   $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
				},
				error : function(data){
					alert('error');
				}//error
			})//ajax
		});//click
		
		$("#btn_search").on('click', function(){
			var kind = "${kind}";
			var search = $("#search").val();
			var option = $("#option").val();
			$.ajax({
				url : 'storeDetailList.do',
				type : "post",
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {
					"kind" : kind,
					"keyword" : search,
					"option" : option
				},
				success : function(data) {
					console.log(data);
					$('body').html(data);
				}
			})
		});
	});//ready
</script>

<jsp:include page="../template/footer.jsp"></jsp:include>

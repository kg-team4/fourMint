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
				<h2  style="margin-left:49%; font-size:18px;">${kind }</h2>
				<br>
				<ul class="bestBox" style="margin-left: 65px;">
					<!-- 스토어 글 목록 -->
					<c:set var="big_no" value="${kind }" />
					<c:forEach var="store" items="${storeList }">
						<c:if test="${ big_no eq store.category_big}">
							<li>
								<a href="storeBoard.do?seq=${store.store_seq }"> <img src="${store.url }"></a>
								<div style="display:flex; padding-top:20px;">
									<div id="product_name"
										style="width: 180px; text-align: left; word-wrap: break-word; white-space: nowrap; text-overflow: ellipsis; display: inline-block; overflow: hidden;">${store.product_name }</div>
									<div id="product_price"
										style="width: 100px; text-align: right; word-wrap: break-word; white-space: nowrap; display: inline-block; overflow: hidden; text-overflow: ellipsis; margin-left: 10px; font-size: 15px; color: #50b9abd0; ">${store.product_price }원</div>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:if>
	</div>
	<div style="display:flex; margin-bottom:40px ">
		
			<div style="text-align: center; margin-left:780px; padding-top:12px">
				<c:set var="startPage" value="${ startPage }" />
				<c:set var="endPage" value="${ endPage }" />
				<c:set var="pageCount" value="${ maxPage }" />
					<label class="pagingNumPrev">◀</label>
				<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
					<label class="pagingNum">${i}</label>
				</c:forEach>
					<label class="pagingNumNext">▶</label>
			</div>
			

			<div id="search_write_area" style="margin-left:170px; margin-top:10px">
				<select name="search" style="height: 20px">
					<option value="content">제목</option>
					<option value="title">내용</option>
					<option value="writer">작성자</option>
				</select> 
				<input type="text" name="" value="" placeholder="검색어를 입력하세요.">
				<input id="btn_search" type="submit" value="검색"> 
			</div>
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

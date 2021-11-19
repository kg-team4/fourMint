<%@	page import="java.text.SimpleDateFormat"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.text.NumberFormat"%>
<%@	page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트마켓 카테고리별 상품</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_market_content.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<link href="../css/10.promotion&used_post_list.css" rel="stylesheet">

<article style="padding-top: 200px;">
	<div style="display: flex;">
		<!-- 카테고리 -->
		<div class="best categoroy" style="align-self: flex-start; widdth: 100px; margin-left:200px; margin-top: 50px;">
			<section class="category_list" style="width: 135px;">
				<div class="best" style="width:160px; margin-top: 60px;">
					<h3 style="padding: 0 49%; margin-top: -20px;"></h3>
					<c:forEach var="big" items="${ marketCategoryBig }"> <!-- 카테고리 대분류 리스트 -->
						<div class="bestBox" style="display: block;">
							<c:set var="no" value="${kind }" />
							<c:set var="name" value="${big.name }" />
							<c:set var="etc" value="기타" />
							<c:set var="buy" value="삽니다" />
							<!-- 카테고리 목록 -->
							<c:choose>
								<c:when test="${no eq name}">
									<div class="category_list_title" style="color:#7b7b7b; font-size:20px; margin: 0 10px 6px 0;">
											<label class="category_big_name" style="color:#7b7b7b; hover:color:#26e4ca">${big.name}</label>									
										<c:if test="${big.name ne etc && big.name ne buy}">
											<input type="button" class="slider" value="▲" style="background: none; border: 0px; color:#26e4ca;">
										</c:if>
									</div>
									<ul class="category_list_middle" style="color:#7b7b7b; font-size:18px; margin: 0 10px 8px 0;">
										<c:forEach var="middle" items="${ big.middle }">
											<li style="margin-bottom:3px">
												<label class="category_middle_name">${ middle.value}</label>
											</li>
										</c:forEach>
									</ul>
								</c:when>
								<c:otherwise>
									<div class="category_list_title" style="color:#7b7b7b; font-size:20px; margin: 0 10px 6px 0;">
										<label class="category_big_name" style="color:#7b7b7b; hover:color:#26e4ca;">${big.name}</label>
										<c:if test="${big.name ne etc && big.name ne buy}">
											<input type="button" class="slider" value="▼" style="background: none; border: 0px;color:#26e4ca;">
										</c:if>
									</div>
									<ul class="category_list_middle" style="color:#7b7b7b; font-size:18px; margin: 0 10px 8px 0; display: none;">
										<c:forEach var="middle" items="${ big.middle }">
											<li style="margin-bottom:3px">
												<label class="category_middle_name">${ middle.value}</label>
											</li>
										</c:forEach>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
					<br>
					</c:forEach>
				</div>
			</section>
		</div>
		
		<!-- 게시글 목록 -->
		<c:if test="${ listCount == 0 }">
			<table style="width: 700px; border: 1px;">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${ listCount > 0 }">
			<div class="best" style="width: 1000px;">
				<br> <br> <br>
				<h2 style="padding: 0 49%;">${kind }</h2>
				<br>
				<ul class="bestBox" style="margin-left: 100px;">
					<!-- 마켓 글 목록 -->
					<c:set var="big_no" value="${kind }" />
					<c:set var="middle_no" value="${kindTwo }" />
					<c:forEach var="market" items="${marketList }">
						<c:choose>
							<c:when test="${middle_no ne null }">
								<c:set var="market_category_big" value="${market.category_big }" />
								<c:set var="market_category_middle" value="${market.category_middle }" />
								<c:if test="${ big_no eq market_category_big && middle_no eq market_category_middle }">
									<li>
										<a href="marketBoard.do?seq=${market.market_seq }"><img src="${market.url }"></a>
										<p>
											<span class="red">${market.category_middle }</span> 
										</p>
										<div style="display:flex;">
											<div id="product_name">${market.product_name }</div>
											<div id="product_price">${market.product_price }원</div>
										</div>
									</li>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:set var="market_category_big" value="${market.category_big }" />
								<c:if test="${ big_no eq market_category_big }">
									<li>
										<a href="marketBoard.do?seq=${market.market_seq }"> <img src="${market.url }"></a>
										<p>
											<span class="red">${market.category_middle }</span> 
										</p>
										<div style="display:flex;">
											<div id="product_name">${market.product_name }</div>
											<div id="product_price">${market.product_price }원</div>
										</div>
									</li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</c:if>
	</div>
	
	<div style="text-align: center; padding-left: 30px; margin-left:218px; margin-bottom:30px">
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
	$(".slider").click(function(){
		if($(this).parent().next().is(":visible")){
          	$(this).parent().next().slideUp();
          	$(this).val("▼");
        } else{
          	$(this).parent().next().slideDown();
          	$(this).val("▲");
       	}
	})
	      
	$(function(){
		$(".category_big_name").on('click',function(){
			var kind = $(this).text();  //버튼이 클릭 되었을 때 그 버튼의 value를 var kind로 가져와서	
			$.ajax({
				url : 'marketDetailList.do', // 이 주소로 
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
		
		$(".category_middle_name").on('click',function(){
			var kind = $(this).parent().parent().prev(".category_list_title").find(".category_big_name").text();  //버튼이 클릭 되었을 때 그 버튼의 value를 var kind로 가져와서	
			var kindTwo = $(this).text();
			$.ajax({
				url : 'marketDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "kindTwo" : kindTwo}, // kind를 kind로 명명하여 보내겠다
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
			var kindTwo = "${kindTwo}";
			$.ajax({
				url : 'marketDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "kindTwo" : kindTwo, "pageNum" : pageNum}, // kind를 kind로 명명하여 보내겠다
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
			var kindTwo = "${kindTwo}";
			var arrow = "prev";
			$.ajax({
				url : 'marketDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "kindTwo" : kindTwo, "pageNum" : pageNum, "arrow" : arrow}, // kind를 kind로 명명하여 보내겠다
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
			var kindTwo = "${kindTwo}";
			var arrow = "next";
			$.ajax({
				url : 'marketDetailList.do', // 이 주소로 
				type : "post", // 포스트 방식으로 보내는데
				cache: false,
				headers: {"cache-control":"no-cache", "pragma": "no-cache"},
				data : {"kind" : kind, "kindTwo" : kindTwo, "pageNum" : pageNum, "arrow" : arrow}, // kind를 kind로 명명하여 보내겠다
				success : function(data){ 
				   console.log(data);
				   $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
				},
				error : function(data){
					alert('error');
				}//error
			})//ajax
		});//click
	});//ready
	
	// 카테고리(label) 클릭 시 색상 변화 
	/* $(function(){
		$(".category_middle_name").click(function(){
			$(this).css("color","#26e4ca");
		});
	}); */
	
	
	
/* 	const cateWrap = document.querySelector('.category_list_middle');
	
	function select(ulEl, liEl){
		Array.from(ulEl.children).forEach(
			v => v.classList.remove('selected')		
		)
		if(liEl) liEl.classList.add('selected');
	}
	cateWrap.addEventListener('click',e => {
		const selected = e.target;
		select(cateWrap, selected);
	})
	 */
	//https://ddorang-d.tistory.com/122 참고
	
</script>


<jsp:include page="../template/footer.jsp"></jsp:include>

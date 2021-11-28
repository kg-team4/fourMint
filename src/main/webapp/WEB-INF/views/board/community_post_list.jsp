<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>커뮤니티 카테고리별 페이지</title>
<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/community_post_list.css">
<jsp:include page="../template/header.jsp"></jsp:include>

<article>
	<!-- 카테RH리 -->
	<div class="contents_all">
		<div class="category_list">
			<div><label class="category_title">소식</label></div>
			<div><label class="category_title">질문</label></div>
			<div><label class="category_title">모임</label></div>
			<div><label class="category_title">맛집</label></div>
			<div><label class="category_title">분실센터</label></div>
			<div><label class="category_title">사진전</label></div>
		</div>
		<!-- 소식 -->
		
		<div class="store_review_all">
			<div class="store_review">
				<table>
					<c:forEach var="list" items="${list }">
					<c:if test="${kind eq '소식' }">
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/megaphone.png" width=25px; height=25px> 
								<a id="news_title_detail" href="/communityBoard.do?seq=${list.community_seq }">${list.title }</a>
							</div>
						</td>
						<td id="news_useful">
							<div>
								<img src="../img/thumbs-up.png" width=15px; height=15px> <span>${list.likes }</span>
							</div>
						</td>
						<td id="news_views">
							<div>
								<img src="../img/eye.png" width=15px; height=15px> <span>${list.views }</span>
							</div>
						</td>
						<td id="news_comment">
							<div>
								<img src="../img/comment.png" width=15px; height=15px> <span>${list.comments }</span>
							</div>
						</td>
						<td id="writer">
							<div>${list.nickname }</div>
						</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
			</div>
				
			<!-- 질문 -->
			<div class="store_review">
				<table>
					<c:forEach var="list" items="${list }">
					<c:if test="${kind eq '질문' }">
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px;>
								<a id="news_title_detail" href="/communityBoard.do?seq=${list.community_seq }">${list.title }</a>
							</div>
						</td>
						<td id="news_useful">
							<div>
								<img src="../img/raise-your-hand-to-ask.png" width=18px;
									height=18px> <span>${list.likes }</span>
							</div>
						</td>
						<td id="news_views">
							<div>
								<img src="../img/eye.png" width=15px; height=15px> <span>${list.views }</span>
							</div>
						</td>
						<td id="news_comment">
							<div>
								<img src="../img/comment.png" width=15px; height=15px> <span>${list.comments }</span>
							</div>
						</td>
						<td id="writer">
							<div>작성자명작성자명</div>
						</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
			</div>
			<!-- end 질문 -->
		
			<!-- 분실센터 -->
			<div class="store_review">
				<table>
					<c:forEach var="list" items="${list }">
					<c:if test="${kind eq '분실센터' }">
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px;>
								<a id="news_title_detail" href="/communityBoard.do?seq=${list.community_seq }">${list.title }</a>
							</div>
						</td>
						<td id="news_useful">
							<div>
								<img src="../img/sad_icon.png" width=18px;
									height=18px> <span>${list.likes }</span>
							</div>
						</td>
						<td id="news_views">
							<div>
								<img src="../img/eye.png" width=15px; height=15px> <span>${list.views }</span>
							</div>
						</td>
						<td id="news_comment">
							<div>
								<img src="../img/comment.png" width=15px; height=15px> <span>${list.comments }</span>
							</div>
						</td>
						<td id="writer">
							<div>${list.nickname }</div>
						</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
			</div>
			<!-- end 분실센터 -->
			
			<!-- 모임 / 맛집 / 사진전 -->
			<div style="margin: 8px 0 30px 0">
				<div id="border_grid">
					<c:forEach var="list" items="${list }">
					<c:if test="${kind eq '모임' || kind eq '맛집' || kind eq '사진전' }">
					<div style="margin-left: 14px">
						<div class="group_all">
							<a id="group_img_area" href="/communityBoard.do?seq=${list.community_seq }">
								<div id="group_img_box">
									<img id="group_img" src="${list.url }" alt="모임이미지">
								</div>
								<div id="group_name">${list.title }</div>
							</a>
						</div>
					</div>		
					</c:if>
					</c:forEach>			
				</div>
				<div id="grid_below_search_write_area" style="display: inline-block;">
					<select id="option" name="search" style="height: 20px">
						<c:choose>
						<c:when test="${option eq 'title' }">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
						</c:when>
						<c:otherwise>
							<option value="title">제목</option>
							<option value="content" selected>내용</option>
						</c:otherwise>
						</c:choose>
					</select> 
					<input id="search" type="text" name="" value="${keyword }" placeholder="검색어를 입력하세요.">
					<input class="btn_search" id="btn_grid_below_search" type="button" value="검색"> 
					<input id="btn_grid_below_write" type="button" value="글쓰기" onclick="location.href='/communityBoardWrite.do'">
				</div>
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
			</div>
		</div>
		<!-- end .store_review_all-->		
	</div>
	<!-- end .content_all-->
</article>

<script>
$(function(){
	$(".category_title").on('click',function(){
		var kind = $(this).text(); 
		$.ajax({
			url : 'communityDetailList.do', 
			type : "get", 
			cache: false,
			headers: {"cache-control":"no-cache", "pragma": "no-cache"},
			data : {"kind" : kind}, 
			success : function(data){ 
			   console.log(data);
			   $('body').html(data);
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
			url : 'communityDetailList.do', // 이 주소로 
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
			url : 'communityDetailList.do', // 이 주소로 
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
			url : 'communityDetailList.do', // 이 주소로 
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
	
	$(".btn_search").on('click', function(){
		var kind = "${kind}";
		var search = $("#search").val();
		var option = $("#option").val();
		$.ajax({
			url : 'communityDetailList.do',
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
});
</script>

<jsp:include page="../template/footer.jsp"></jsp:include>
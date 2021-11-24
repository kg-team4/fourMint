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
		<c:forEach var="list" items="${list }">
			<c:choose>
				<c:when test="${kind eq '소식' }">
					<div class="store_review">
						<table>
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
						</table>
						<div id="search_write_area">
							<select name="search" style="height: 20px">
								<option value="content">제목</option>
								<option value="title">내용</option>
								<option value="writer">작성자</option>
							</select> <input type="text" name="" value="" placeholder="검색어를 입력하세요.">
							<input id="btn_search" type="submit" value="검색"> <input
								id="btn_write" type="button" value="글쓰기" onclick="location.href='/communityBoardWrite.do'">
						</div>
					</div>
				</c:when>
				<c:when test="${kind eq '질문' }">
					<!-- 질문 -->
					<div class="store_review">
						<table>
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
						</table>
						<div id="search_write_area">
							<select name="search" style="height: 20px">
								<option value="content">제목</option>
								<option value="title">내용</option>
								<option value="writer">작성자</option>
							</select> <input type="text" name="" value="" placeholder="검색어를 입력하세요.">
							<input id="btn_search" type="submit" value="검색"> 
							<input id="btn_write" type="button" value="글쓰기" onclick="location.href='/communityBoardWrite.do'">
						</div>
					</div>
					<!-- end 질문 -->
				</c:when>
				<c:when test="${kind eq '분실센터' }">
					<!-- 분실센터 -->
					<div class="store_review">
						<table>
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
						</table>
						<div id="search_write_area">
							<select name="search" style="height: 20px">
								<option value="content">제목</option>
								<option value="title">내용</option>
								<option value="writer">작성자</option>
							</select> <input type="text" name="" value="" placeholder="검색어를 입력하세요.">
							<input id="btn_search" type="submit" value="검색"> 
							<input id="btn_write" type="button" value="글쓰기" onclick="location.href='/communityBoardWrite.do'">
						</div>
					</div>
					<!-- end 분실센터 -->
				</c:when>
				<c:otherwise>
					<!-- 모임 / 맛집 / 사진전 -->
					<div style="margin: 8px 0 30px 0">
						<div id="border_grid">
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
						</div>
						<div id="grid_below_search_write_area">
							<select name="search" style="height: 20px">
								<option value="content">제목</option>
								<option value="title">내용</option>
								<option value="writer">작성자</option>
							</select> 
							<input type="text" name="" value="" placeholder="검색어를 입력하세요.">
							<input id="btn_grid_below_search" type="submit" value="검색"> 
							<input id="btn_grid_below_write" type="button" value="글쓰기" onclick="location.href='/communityBoardWrite.do'">
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
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
});
</script>

<jsp:include page="../template/footer.jsp"></jsp:include>
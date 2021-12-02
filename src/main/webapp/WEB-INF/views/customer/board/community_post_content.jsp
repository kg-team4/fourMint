<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>커뮤니티 상세 페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/community_post_content.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/reply.js"></script>

<article>
	<!-- 카테고리 -->
	<div class="contents_all">
		<div class="category_list">
			<div><label class="category_title">소식</label></div>
			<div><label class="category_title">질문</label></div>
			<div><label class="category_title">모임</label></div>
			<div><label class="category_title">맛집</label></div>
			<div><label class="category_title">분실센터</label></div>
			<div><label class="category_title">사진전</label></div>
		</div>

		<div id="border_grid">
			<div class="content">
				<div class=category_and_title>
					<div class="category_detail">${content.category }</div>
					<div class="title">${content.title }</div>
				</div>

				<div class="writer_content_all">

					<div class="img_box">
						<img class="writer_img" alt="작성자프로필사진"
							src="${content.profile }">
					</div>
					<div class="writer_infomation">
						<table class="writer_info">
							<tr>
								<td width=340px style="color:#26e4ca; font-size: 18">${content.nickname }</td>
								<td width=330px  style="font-size: 16; text-align:right;"><fmt:formatDate pattern="yyyy-MM-dd" value="${content.date }" /></td>
							</tr>
							<tr>
								<td colspan="2" width=525px>${content.address2 }</td>								
							</tr>
						</table>
					</div>
				</div>
				<hr style="margin-right: 20px">
				<br>
				<br>
				<div class="write_content">
					<pre>${content.content }
					</pre>

					<div class="img_contents">
						<img class="content_img1" alt="글작성이미지" src="${content.url }" onerror="this.style.display='none'"> 
					</div>
				</div>
				<div class=comments_section>
					<div>
						<span id="comment_click_style"> <label for="comment1">
								<input type="checkbox" id="comment1" style="display: none"
								value="1" onchange="comment(this);"> 댓글달기
						</label>
						</span>&nbsp;
					</div>
					<div class="good_comments_police">
						<div style="margin-left: 10px">
							<button type="button" class="btn_good">
								<img class="img_good" src="${pageContext.request.contextPath}/resources/user/img/thumbs-up.png" alt="유용해요버튼">
							</button>
							<input type="hidden" value="${content.community_seq }"/>
							<span id="likes">${content.likes }</span>
						</div>
						<script>
							$(".btn_good").click(function(){
								var seq = $(this).next().val();
								$.ajax({
									url : 'communityLikes.do',    
									type : "post", 
									cache: false,
									headers: {"cache-control":"no-cache", "pragma": "no-cache"},
									data : {seq : seq}, 
									success : function(data){ 
										if(data == 1){
											var temp = $("#likes").text();
											$("#likes").text(Number(temp) + 1);
										} else if(data == 0) {
											var temp = $("#likes").text();
											$("#likes").text(Number(temp) - 1);
										}
									},
									error : function(data){
										alert('error');
									}//error
								})//ajax
							});
						</script>

						<div style="margin-left: 10px">
							<img class="img_comment" src="${pageContext.request.contextPath}/resources/user/img/comment.png"><span>${fn:length(comment) }</span>
						</div>
						<c:if test="${nickname ne content.nickname }">
						<div style="margin-left: 10px">
							<button type="button" class="btn_police">
								<img class="img_police" src="${pageContext.request.contextPath}/resources/user/img/police.png" alt="신고버튼">글 신고
							</button>
						</div>
						</c:if>
					</div>
				</div>
			</div>
			
			<div id="police_modal">
				<div>

					<div style="font-size:20px">🚨&nbsp;신고하기&nbsp;🚨</div>
					<hr>
					
					<div>
					<form action="report.do" method="post">
						<div class="police_category">
							<span style="padding-right:10px">신고사유</span> 
							<select id="police_reason" name="reason">
								<option value="" >신고 사유 선택</option>
								<option value="채팅앱유도">다른 채팅앱으로 유도하는 글</option>
								<option value="광고">광고/홍보 글</option>
								<option value="중고거래">중고거래 관련 글</option>
								<option value="반려동물">반려동물 분양/교배 글</option>
								<option value="부적절">부적절한 글(개인정보 포함·분쟁댓글·금전 요구·음란성 등)</option>
								<option value="비방">이웃 배제 및 비방 글</option>
								<option value="중복">중복/도배성 글</option>
								<option value="신고항목개선">신고항목 개선 제안 글</option>
								<option value="etc">기타(사유)</option>
							</select>
						</div>
						<div class="write_police_reason">
							<textarea name="content" style="border:1px solid lightgray" rows="10" cols="15"></textarea>
						</div>
						<br>
						<div style="text-align: center">
							<input type="hidden" name="market_seq" value="${content.community_seq }"/>
							<input type="hidden" name="reporter" value="${nickname }"/>
							<input type="hidden" name="reported" value="${content.nickname }"/>
							<input type="hidden" name='url' value="communityBoard.do?seq=${content.community_seq }">
							<button disabled id="modal_police_btn" style="width: 90px; font-size: 15px">신고</button>
							<button type="button" class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
						</div>
					</form>
					</div>
				</div>
				<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
			</div>
			<script>
				//신고하기 select box 선택 사유가 없을 경우 버튼 비활성화
			 	$("#police_reason").change(function(){
					if($("#police_reason").val() == ''){
						$("#modal_police_btn").attr("disabled",true);
									
					}else{
						$("#modal_police_btn").attr("disabled",false);
				}
			</script>
			
			<hr style="margin-right: 20px">
			<br>

			<c:forEach var="comment" items="${comment }">
				<div class="commenter_contents_all">
					<div class="commenter_infomation_all">
						<div class="img_box" style="margin-top:20px">
							<img class="commenter_img" alt="작성자프로필사진" src="${comment.profile }">
						</div>
						<div class="commenter_infomation" style="margin-top:30px; margin-left:20px">
							<table class="commenter_info">
								<tr style="font-size: 18"> 
									<td width=120px style="color:#26e4ca">${comment.nickname }</td>
								
								<td>
								<div>
									<div class="reply_police2">
										<div style="margin-left: 10px">
											<span id="re_reply_click_style"> 
												<label style="cursor: pointer; margin-left:15px; margin-right:5px" for="re-reply1"> 
													<c:if test="${nickname eq comment.nickname }">
													<input type="button" class="btn_delete_comment" value="삭제"/>
													<input type="hidden" value="${comment.comment_seq }"/>
													</c:if>
											</label>
											</span>&nbsp;
										</div>

									</div>
								</div>
								</td>
								<td>
									<c:if test="${nickname ne comment.nickname }">
									<div class="reply_police2">
										<div style="margin-left: 10px">
											<button type="button" class="btn_police_comment">
												<img class="img_police" src="${pageContext.request.contextPath}/resources/user/img/police.png" alt="신고버튼">
											</button>
										</div>
									</div>
									</c:if>
								</td>	
									<td width=473px style="text-align: right; font-size: 16px"><fmt:formatDate value="${comment.date }" pattern="yyyy-MM-dd"/></td>	
								</tr>								
								<tr>
									<td colspan="4" style="text-align: left">
											<pre>${comment.content }</pre>
											<br>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
				</div>
			</c:forEach>
			<script>
				$(".btn_delete_comment").click(function(){
					var seq = $(this).next().val();
					var check = confirm("삭제하시겠습니까?");
					if(check) {
						$.ajax({
							url : "/deleteCommunityComment.do",
							type : "post",
							data : {
								seq : seq
							},
							success : function(data) {
								location.reload();
							}
						});
					}
				});							
			</script>
			<!-- 댓글달기(고정) -->
			<div class="write_comment_area rereply-off" id="comment-form1">
				<p style="font-size: 18px">댓글쓰기</p>
				<form action="communityComment.do" method="post">
					<input type="hidden" name="board_seq" value="${content.community_seq }"> 
					<input type="hidden" name="nickname" value="${nickname }"> 
					<div class="reply-div-padding">
						<div class="reply-border">
							<textarea class="text-padding font15" name="content" placeholder="댓글 내용 입력" cols="80" rows="5"></textarea>
						</div>
					</div>
					<div class="reply-num-border">
						<div class="float-box float-left">
							<div class="left-item50">
								<p class="font12 gray-font text-padding10">
								<p></p>
							</div>
							<div class="left-item50 text-padding10">
								<input type="submit" class="right-float reply-button" value="등록">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- end border_grid -->
	</div>
	<!-- end contents_all -->
</article>

<script>					
 // 신고모달 만들기
	function modal(id) {
	    var zIndex = 9999;
	    var modal = document.getElementById(id);

	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = document.createElement('div');
	    bg.setStyle({
	        position: 'fixed',
	        zIndex: zIndex,
	        left: '0px',
	        top: '0px',
	        width: '100%',
	        height: '100%',
	        overflow: 'auto',
	        // 레이어 색갈은 여기서 바꾸면 됨
	        backgroundColor: 'rgba(0,0,0,0.4)'
	    });
	    document.body.append(bg);

	    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	        
	        return;
	    });
	    modal.querySelector('.modal_cancle_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	        
	        return false;
	    });
		

	    modal.setStyle({
	        position: 'fixed',
	        display: 'block',
	        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

	        // 시꺼먼 레이어 보다 한칸 위에 보이기
	        zIndex: zIndex + 1,

	        // div center 정렬
	        top: '50%',
	        left: '50%',
	        transform: 'translate(-50%, -50%)',
	        msTransform: 'translate(-50%, -50%)',
	        webkitTransform: 'translate(-50%, -50%)'
	    });
	    
	    return;
	}
 
	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};
	
	document.querySelector('.btn_police').addEventListener('click', function() {
	    // 모달창 띄우기
	    modal('police_modal');
	});
	document.querySelector('.btn_police_comment').addEventListener('click', function() {
	    // 모달창 띄우기
	    modal('police_modal');
	});
	//신고하기 select box 선택 사유가 없을 경우 버튼 비활성화
	 	$("#police_reason").change(function(){
			if($("#police_reason").val() == ''){
				$("#modal_police_btn").attr("disabled",true);
							
			}else{
				$("#modal_police_btn").attr("disabled",false);
			}
		});

	
	</script>
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
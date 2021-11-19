<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>커뮤니티 상세 페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/community_post_content.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="../js/reply.js"></script>

<article>
	<!-- 카테RH리 -->
	<div class="contents_all">
		<div class="category_list">
			<input id="btn_write" type="button" value="글쓰기" onclick="location.href='/communityBoardWrite.do'">
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
							src="../img/character_sample.png">
					</div>
					<div class="writer_infomation">
						<table class="writer_info">
							<tr style="font-size: 18">
								<td colspan="2">${content.nickname }</td>
							</tr>
							<tr>
								<td>${content.address2 }</td>
								<td>&emsp;&emsp;&emsp;&emsp;${content.date }</td>
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
								<img class="img_good" src="../img/thumbs-up.png" alt="유용해요버튼">
							</button>
							<span>${content.likes }</span>
						</div>

						<div style="margin-left: 10px">
							<img class="img_comment" src="../img/comment.png"><span>${content.comments }</span>
						</div>

						<div style="margin-left: 10px">
							<button type="button" class="btn_police">
								<img class="img_police" src="../img/police.png" alt="신고버튼">글 신고
							</button>
						</div>
					</div>
				</div>
			</div>
			
			<div id="police_modal">
				<div>

					<div style="font-size:20px">🚨&nbsp;신고하기&nbsp;🚨</div>
					<hr>
					
					
					<div>
					<div class="police_category">
						<span style="padding-right:10px">신고사유</span> 
						<select id="police_reason" name="police_reason">
							<option value="" >신고 사유 선택</option>
							<option value="채팅앱유도">다른 채팅앱으로 유도하는 글</option>
							<option value="광고">광고/홍보 글</option>
							<option value="중고거래">중거거래 관련 글</option>
							<option value="반려동물">반려동물 분양/교배 글</option>
							<option value="부적절">부적절한 글(개인정보 포함·분쟁댓글·금전 요구·음란성 등)</option>
							<option value="비방">이웃 배제 및 비방 글</option>
							<option value="중복">중복/도배성 글</option>
							<option value="신고항목개선">신고항목 개선 제안 글</option>
							<option value="etc">기타(사유)</option>
						</select>
					</div>
					<div class="write_police_reason">
						<textarea style="border:1px solid lightgray" rows="10" cols="15"></textarea>
					</div>
					<br>
						<div style="text-align: center">
							<button disabled id="modal_police_btn" style="width: 90px; font-size: 15px">신고</button>
							<button class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
						</div>
					</div>
					
					
				</div>
				<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
			</div>
			
			<hr style="margin-right: 20px">
			<br>

			<c:forEach var="comment" items="${comment }">
				<div class="commenter_contents_all">
					<div class="commenter_infomation_all">
						<div class="img_box" >
							<img class="commenter_img" alt="작성자프로필사진" src="${comment.profile }">
						</div>
						<div class="commenter_infomation">
							<table class="commenter_info">
								<tr style="font-size: 18">
									<td colspan="4">${comment.nickname }</td>
								</tr>
								<tr>
									<td>${comment.date }</td>
									<td>
										<!-- <div>
											<div class="reply_police1">
												<div style="margin-left: 10px">
													<span id="re_reply_click_style"> 
													<label for="re-reply1"> 
														<input type="checkbox" id="re-reply1" style="display: none" value="1" onchange="reReply(this);"> 
														답글
													</label>
													</span>&nbsp;
												</div>
	
											</div>
										</div> -->
									</td>
									<td>
										<div class="reply_police2">
											<div style="margin-left: 10px">
												<span id="re_reply_click_style"> 
													<label style="cursor: pointer; margin-left:15px; margin-right:5px" for="re-reply1"> 
														<input type="checkbox" id="re-reply1" style="display: none; " value="1" onchange="reReply(this);"> 답글												
													</label>
													<span><input type="button" class="btn_delete_comment" value="삭제"/></span>
												</span>&nbsp;
											</div>

										</div>
									</div>
								</td>
								<td>
									<div class="reply_police2">

										<div style="margin-left: 10px">
											<button type="button" class="btn_police_comment">
												<img class="img_police" src="../img/police.png" alt="신고버튼">
											</button>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="comment_content">
						<pre>${comment.content }</pre>
					</div>
				</div>
				
				<%-- <c:forEach var="recomment" items=${recomment }>
					<!-- 답글내용 -->
					<div class="commenter_contents_all">
						<div class="commenter_infomation_all">
							<img class="reply_arrow_img" alt="답글화살표" src="../img/right-arrow.png">
							<div class="img_box">						
								<img class="commenter_img" alt="작성자프로필사진"
									src="../img/character_sample.png">
							</div>
							<div class="commenter_infomation">
								<table class="commenter_info">
									<tr style="font-size: 18">
										<td colspan="4">주난</td>
									</tr>
									<tr>
										<td>묘동</td>
										<td>&emsp;&emsp;&emsp;&emsp;4시간전</td>
										<td>
											<div>
												<div class="reply_police1">
													<div style="margin-left: 10px">
														<span class="post_writer"> 
															작성자
														</span>&nbsp;
													</div>
		
												</div>
											</div>

										</div>
									</div>
								</td>
								<td>
									<div class="reply_police2">

										<div style="margin-left: 10px">
											<button type="button" class="btn_police_comment">
												<img class="img_police" src="../img/police.png" alt="신고버튼">
											</button>
										</div>
									</div>
								</td>

							</tr>
						</table>
					</div>
				</div>
				<div class="comment_content">
					<pre>
넵~!! 좋은 하루 되세요!!
					</pre>
				</div>

			</div>
			
			
	

			<!-- 답글달기 글쓰기창 -->
			<div class="write_reply_area rereply-off " id="rereply-form1">
				<p style="font-size: 18px">답글쓰기</p>
				<form action="communityComment.do" method="post">
					<input type="hidden" name="board_seq" value="${content.community_seq }"> 
					<input type="hidden" name="nickname" value="${nickname }"> 
					<input type="hidden" name="address" value="${address2 }"> 
					<input type="hidden" name="reply_seq_n" value="이름"> 
					<input type="hidden" name="post_path" value="asd?asd">
					<div class="reply-div-padding">
						<div class="reply-border">
							<textarea class="text-padding font15" name="reply_content"
								placeholder="답글 내용 입력" cols="80" rows="5"></textarea>
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
			</div> --%>
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
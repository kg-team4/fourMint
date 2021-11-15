<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>커뮤니티 상세 페이지</title>
<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/community_post_content.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="../js/reply.js"></script>

<article>
	<div class="contents_all">
		<div class="category_list">
			<div>
				<a class="category_title" href="#">소식</a>
			</div>
			<div>
				<a class="category_title" href="#">질문</a>
			</div>
			<div>
				<a class="category_title" href="#">모임</a>
			</div>
			<div>
				<a class="category_title" href="#">맛집</a>
			</div>
			<div>
				<a class="category_title" href="#">분실센터</a>
			</div>
			<div>
				<a class="category_title" href="#">사진전</a>
			</div>
		</div>

		<div id="border_grid">
			<div class="content">
				<div class=category_and_title>
					<div class="category_detail">분실센터</div>
					<div class="title">오늘 대규모 시위로 지하철역 일부 미정차</div>
				</div>

				<div class="writer_content_all">

					<div class="img_box">
						<img class="writer_img" alt="작성자프로필사진"
							src="../img/character_sample.png">
					</div>
					<div class="writer_infomation">
						<table class="writer_info">
							<tr style="font-size: 18">
								<td colspan="2">우쭈쭈동동</td>
							</tr>
							<tr>
								<td>묘동</td>
								<td>&emsp;&emsp;&emsp;&emsp;8시간전</td>
							</tr>
						</table>
					</div>
				</div>
				<hr style="margin-right: 20px">
				<br>
				<br>
				<div class="write_content">
					<pre>
오늘 대규모 시위 때문에 오늘 대규모 시위 때문에 오늘 대규모 시위 때문에 오늘 대규모 시위 때문에 오늘 대규모 시위 때문에 오늘 대규모 시위 때문에 오늘 대규모 시위 때문에 오늘 대규모 시위 때문에						
지하철이 일부 정차하지 않네요..ㅠ
											
종로 3가에서는 내릴 수 있으니 
참고들 하세요~!
					</pre>

					<div class="img_contents">
						<img class="content_img1" alt="글작성이미지"
							src="../img/bike_riding.jpg"> <img class="content_img2"
							alt="글작성이미지" src="../img/biking_group.jpg"> <img
							class="content_img3" alt="글작성이미지" src="../img/book_group.jpg">
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
							<span>15</span>
						</div>

						<div style="margin-left: 10px">
							<img class="img_comment" src="../img/comment.png"><span>8</span>
						</div>

						<div style="margin-left: 10px">
							<button type="button" class="btn_police">
								<img class="img_police" src="../img/police.png" alt="신고버튼">글 신고
							</button>
						</div>
					</div>
				</div>
			</div>
			<hr style="margin-right: 20px">
			<br>

			<div class="commenter_contents_all">
				<div class="commenter_infomation_all">
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
								<td>불광동</td>
								<td>&emsp;&emsp;&emsp;&emsp;4시간전</td>
								<td>
									<div>
										<div class="reply_police1">
											<div style="margin-left: 10px">
												<span id="re_reply_click_style"> <label
													for="re-reply1"> <input type="checkbox"
														id="re-reply1" style="display: none" value="1"
														onchange="reReply(this);"> 답글
												</label>
												</span>&nbsp;
											</div>

										</div>
									</div>
								</td>
								<td>
									<div class="reply_police2">

										<div style="margin-left: 10px">
											<button type="button" class="btn_police">
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
너무 좋은 정보 감사드립니다~~!! 참고할게요!! 너무 좋은 정보 감사드립니다~~!! 참고할게요!! 너무 좋은 정보 감사드립니다~~!! 참고할게요!! 너무 좋은 정보 감사드립니다~~!! 참고할게요!! 너무 좋은 정보 감사드립니다~~!! 참고할게요!! 너무 좋은 정보 감사드립니다~~!! 참고할게요!!
						</pre>
				</div>

			</div>
			
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
								</td>
								<td>
									<div class="reply_police2">

										<div style="margin-left: 10px">
											<button type="button" class="btn_police">
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
				<form action="write_reply.do" method="post">
					<input type="hidden" name="no" value="1"> <input
						type="hidden" name="post_no" value="1"> <input
						type="hidden" name="reply_table_name" value="이름"> <input
						type="hidden" name="reply_seq_name" value="이름"> <input
						type="hidden" name="post_path" value="asd?asd">
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
			</div>

			<!-- 댓글달기(고정) -->
			<div class="write_comment_area rereply-off" id="comment-form1">
				<p style="font-size: 18px">댓글쓰기</p>
				<form action="write_reply.do" method="post">
					<input type="hidden" name="no" value="1"> <input
						type="hidden" name="post_no" value="1"> <input
						type="hidden" name="reply_table_name" value="이름"> <input
						type="hidden" name="reply_seq_name" value="이름"> <input
						type="hidden" name="post_path" value="asd?asd">
					<div class="reply-div-padding">
						<div class="reply-border">
							<textarea class="text-padding font15" name="reply_content"
								placeholder="댓글 내용 입력" cols="80" rows="5"></textarea>
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

<jsp:include page="../template/footer.jsp"></jsp:include>
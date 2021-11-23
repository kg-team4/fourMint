<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%
if (request.getAttribute("result") != null) {
   int result = (Integer) request.getAttribute("result");
   if (result == 1) {
      int flag = (Integer) request.getAttribute("flag");

      out.println("<script type='text/javascript'>");
      if (flag == 0) {
   out.println("alert('수정 성공!');");
   out.println("location.href='./profile.do';");
      } else {
   out.println("alert('수정에 실패했습니다.');");
   out.println("history.back();");
      }
      out.println("</script>");
   }

   if (result == 2) {
      int flag = (Integer) request.getAttribute("flag");

      out.println("<script type='text/javascript'>");
      if (flag == 0) {
   out.println("alert('삭제 성공!');");
   out.println("location.href='./profile.do';");
      } else {
   out.println("alert('삭제에 실패했습니다.');");
   out.println("history.back();");
      }
      out.println("</script>");
   }
}
%> --%>
<title>마이페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<link rel="stylesheet" href="../css/reset.css">
<jsp:include page="./index.jsp"></jsp:include>
<jsp:include page="../template/header.jsp"></jsp:include>
<script defer src="../js/profile.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- CSS File -->
<link href="../css/profile.css" rel="stylesheet">
<article>
	<script>
		var sns = $
		{
			sns
		};
		window.onload = function() {
			console.log(sns);
			if (sns == 'naver' || sns == 'kakao') {
				alert('개인정보를 추가해주세요!');
			}
		}
	</script>
	<!-- 메뉴바 
       현재페이지 뭔지 param.thisPage에 넣어서 navbar.jsp에  던짐 -->
	<%-- <jsp:include page="./navbar.jsp">
      <jsp:param value="profile" name="thisPage" />
   </jsp:include> --%>
	<br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
	<div class="container bootstrap snippet" style="padding-left: 100px">
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->
				<div class="nick-div">
					<h5>
						<b><span style="color: #26e4ca;">${user.nickname}&nbsp;</span>님의 프로필</b>
					</h5>
				</div>
				<div class="text-center row">
					<div class="box col-1">
						<div>
							<img src="${user.profile }" class="avatar img-circle img-profile" alt="avatar">
						</div>
					</div>
					<span class="col-0 profile_d_m" style="text-align: right; padding: 0px; width: 100px;">
						<button type="button" style="font-size: 10px; margin-left: 240px; margin-top: -30px" class="btn btn--blue-2 btn--radius-2" data-bs-toggle="modal" data-bs-target="#edit_img">edit</button>
					</span>
				</div>
				<br>
				<ul class="list-group">
					<li class="list-group-item text-muted">${user.nickname }&nbsp;&nbsp;</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>상점등급&nbsp;&nbsp;</strong></span> 열매</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>팔로잉&nbsp;&nbsp;</strong></span> ${follow.following }</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>팔로워&nbsp;&nbsp;</strong></span> ${follow.follower }</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>상품판매횟수&nbsp;&nbsp;</strong></span> ${boardCount}</li>
				</ul>
				<div class="col-6 offset-2 div_modify_profile">
					<div id="my_modal">
						<div>
							<div id="my_info_edit_title">나의 정보수정</div>
							<hr>
							<div>
							<form action="snsUpdate.do" method="post">
								<table id="my_info_edit_area">
									
									<c:choose>
										<c:when test="${empty sns }">
											<tr>
												<td width="200px" height="30px">이름</td>
												<td width="350px">${user.name}</td>
		
											</tr>
											<tr>
												<td height="30px">닉네임</td>
												<td colspan="2">${user.nickname}</td>
											</tr>
											<tr>
												<td height="30px">아이디</td>
												<td>${user.email_id}</td>
											</tr>
											<tr>
												<td rowspan="3" height="90px">주소</td>
												<td><input type="text" id="post_addr" placeholder="우편번호" style="width: 90px;">
													<button onclick="findAddr();" id="addr" class="address_find_btn">주소검색</button></td>
											</tr>
											<tr>
												<td  height="30px"><input type="text" id="base_addr" placeholder="기본주소"></td>
											</tr>
											<tr>
												<td  height="30px"><input type="text" id="detail_addr" placeholder="직접 입력해주세요"></td>
											</tr>
										</c:when>
										<c:otherwise>
										
											<c:choose>
												<c:when test="${empty name }">
													<tr>
														<td width="200px" height="30px">이름</td>
														<td width="350px"><input type="text" placeholder="이름" id="name" name="name" required="required"></td>
													</tr>
												</c:when>
												<c:otherwise>
														<td width="200px" height="30px">이름</td>
														<td width="350px">${user.name}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${empty nickname }">
													<tr>
														<td width="200px" height="30px">닉네임</td>
														<td><input id="nick" type="text" placeholder="닉네임" id="nickname" name="nickname" required="required"></td>
														<td rowspan="2"><button type="button" onclick="doubleCheck();">중복확인</button>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td height="30px">닉네임</td>
														<td colspan="2">${user.nickname}</td>
													</tr>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test='${sns eq "kakao"}'>
													<tr>
														<td width="200px" height="30px">핸드폰 번호</td>
														<td><input type="text" placeholder="핸드폰 번호" id="phone" name="phone" maxlength="11" required="required"></td>
														<td><button type="button" onclick="phoneCheck();">인증</button></td>
														<td><input type="text" placeholder="인증번호" id="phone2"></td>
														<td><button type="button" id="phoneCheck2" onclick="numcheck();">확인</button></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td height="30px">핸드폰번호</td>
														<td colspan="2">${user.phone}</td>
													</tr>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${empty brith }">
													<tr>
														<td width="200px" height="30px">생년월일</td>
														<td><input type="text" placeholder="생년월일" id="birth" name="birth" required="required"></td>
														<td><button type="button" id="birthCheck" onclick="checkBirth();">생년월일검수</button></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td height="30px">생년월일</td>
														<td colspan="2">${user.birth}</td>
													</tr>
												</c:otherwise>
											</c:choose>
											<tr>
												<td rowspan="3" height="90px">주소</td>
												<td><input type="text" id="post_addr" name="address1" placeholder="우편번호" style="width: 90px;">
													<button type="button" onclick="findAddr();" id="addr" class="address_find_btn">주소검색</button></td>
											</tr>
											<tr>
												<td  height="30px"><input type="text" id="base_addr" placeholder="기본주소" name="address2"></td>
											</tr>
											<tr>
												<td  height="30px"><input type="text" id="detail_addr" placeholder="직접 입력해주세요" name="address3"></td>
											</tr>
											
										</c:otherwise>
									</c:choose>
								</table>
								<br>
								<div style="text-align: center; margin-top: 10px">
									<c:choose>
										<c:when test="${empty sns }">
											<button onclick="updateAddr();">정보수정</button>
											<button class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
										</c:when>
										<c:otherwise>
											<button onclick="updateSns();">정보수정</button>
											<button class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
										</c:otherwise>
									</c:choose>
								</div>
								</form>
							</div>
						</div>
						<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
					</div>
					
					
					<!-- 비밀번호 일치용 모달 -->
					<div class="modal fade" id="pwCheck" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">비밀번호 수정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form onsubmit="return false">
										<table>
											<tr>
												<td><input type="password" id="pw" required="required" /></td>
											</tr>
										</table>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="button" id="pwCheck" class="btn btn-primary" onclick="pwCheck();">비밀번호 확인</button>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- 바말번호 수정용 모달 -->
					<div class="modal fade" id="newPw" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">비밀번호 변경</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div>
									<h2>8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</h2>
								</div>
								<form id="pwForm">
									<div class="modal-body">
										<table>
											<tr>
												<td><input id="fPw" type="password"></td>
											</tr>
											<tr>
												<td><input id="sPw" name="password" type="password"></td>
												<td><button type="button" onclick='correctPw();'>비밀번호확인</button></td>
											</tr>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										<button onclick="updatePw();" type="button" class="btn btn-primary">변경하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
	
					<!-- 회원 탈퇴용 모달 -->
					<div class="modal fade" id="secession" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">탈퇴하기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <form id="secessionForm" onsubmit="return false">
					     	 <div class="modal-body">
					        	<input id="cpw" type="password">
					    	  </div>
					     	 <div class="modal-footer">
					       		 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					       		 <button type="button" class="btn btn-primary" onclick="secession();">탈퇴하기</button>
					      	</div>
					      </form>
					    </div>
					  </div>
					</div>
					<!-- sns 탈퇴용 모달 -->
					<div class="modal fade" id="sns_secession" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">탈퇴하기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <form id="secessionForm" onsubmit="return false">
					     	 <div class="modal-body">
					        	탈퇴하시겠습니까?
					    	  </div>
					     	 <div class="modal-footer">
					       		 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					       		 <button type="button" class="btn btn-primary" onclick="sns_secession();">탈퇴하기</button>
					      	</div>
					      </form>
					    </div>
					  </div>
					</div>
					
					


				
					
					
					<c:choose>
						<c:when test = "${empty sns }">
						<button type="button" style="width: 135%; font-size: 15px"
							class="btn btn--blue-2 btn--radius-2 btn_modify_profile"
							id="popup_open_info">내 정보 수정하기</button>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#pwCheck">
			 				 비밀번호수정
						</button>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#secession">
							 탈퇴하기
						</button>
						</c:when>
						<c:otherwise>
						<button type="button" style="width: 135%; font-size: 15px"
							class="btn btn--blue-2 btn--radius-2 btn_modify_profile"
							id="popup_open_info">내 정보 수정하기</button>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#sns_secession">
							 탈퇴하기
						</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!--/col-3-->
			<div class="col-sm-9" style="padding-left: 150px">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="lan" data-bs-toggle="tab" data-bs-target="#lantrip" type="button" role="tab" aria-controls="home" aria-selected="true">나의 중고상점</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pic" data-bs-toggle="tab" data-bs-target="#Picture" type="button" role="tab" aria-controls="profile" aria-selected="false">나의 중고거래</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="acc" data-bs-toggle="tab" data-bs-target="#accom" type="button" role="tab" aria-controls="contact" aria-selected="false">나의 스토어거래</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="sho" data-bs-toggle="tab" data-bs-target="#shop" type="button" role="tab" aria-controls="contact" aria-selected="false">나의 커뮤니티</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="hii" data-bs-toggle="tab" data-bs-target="#heart_product" type="button" role="tab" aria-controls="contact" aria-selected="false">나의 관심상품</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="lantrip" role="tabpanel" aria-labelledby="home-tab">
						<div class="store_review_all">
							<br> <br>
							<p>
								<span><strong>상점후기 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">17</span>
							</p>
							<div class="store_review_grid">
								<div class="store_review">
									<table width="100%" height="140">
										<tr>
											<td width="20%" rowspan="2">
												<div id="img_box">
													<a id="store_review_img_area" href="#"> <img id="store_review_img" src="../img/character_sample2.jpg" width="100" height="100" alt="상점이미지">
													</a>
												</div>
											</td>
											<td style="font-size: 20px" width="10%" height="40px"><a href="#" style="color: #26e4ca">닉네임</a></td>
											<td width="30%">
												<div class="">
													<a class="" href="#"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png"
														width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지">
													</a>
												</div>
											</td>
											<td></td>
											<td style="font-size: 15px" width="10%">
												<div id="date">1달 전</div>
											</td>
										</tr>
										<tr>
											<td align="left" colspan="4" style="font-size: 15px">
												<button id="btn_sold_product_name">
													&nbsp;에스파 지젤 포토카드 <img src="../img/arrow_icon.png" width="6" height="10" alt="화살표 아이콘">&nbsp;
												</button>
												<div id="sold_product_review">빠른 쿨거래 해주셔서 너무 좋았어요!나불나불나불나불나불어찌고저찌고저찌고나불나불나불나불나불어찌고저찌고저찌</div>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<br> <br> <br>
								<div class="store_review">
									<table width="100%" height="120">
										<tr height="30">
											<td width="20%" rowspan="2"><a id="store_review_img_area" href="#">
													<div id="img_box">
														<img id="store_review_img" src="../img/character_sample1.jpg" alt="상점이미지">
													</div>
											</a></td>
											<td style="font-size: 20px" width="10%"><a href="#" style="color: #26e4ca">닉네임</a></td>
											<td width="30%"><a class="" href="#">
													<div class="">
														<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14"
															alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지">
													</div>
											</a></td>
											<td></td>
											<td style="font-size: 15px" width="10%">
												<div id="date">1달 전</div>
											</td>
										</tr>
										<tr>
											<td align="left" colspan="4" style="font-size: 15px">
												<button id="btn_sold_product_name">
													&nbsp;에스파 지젤 포토카드 <img src="../img/arrow_icon.png" width="6" height="10" alt="화살표 아이콘">&nbsp;
												</button>
												<div id="sold_product_review">빠른 쿨거래 해주셔서 너무 좋았어요!나불나불나불나불나불어찌고저찌고저찌고나불나불나불나불나불어찌고저찌고저찌</div>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
							</div>
							<br> <br> <br>
							<div class="following_all">
								<hr>
								<br> <br>
								<p>
									<span><strong>팔로잉 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${follow.following }</span>
								</p>
								<div class="following_all_grid">
									<c:forEach var="followings" items="${following }">
										<div class="following">
											<a class="following_img_area" href="#"> <!-- 이미지를 눌렀을 때 해당상점으로 이동 -->
												<div id="following_img_box">
													<img id="following_img" src="${followings.profile }" alt="상점이미지">
												</div>
											</a>
											<div class="store_review_text_area">
												<div class="">
													<a class="" href="#" style="color: #26e4ca">${followings.nickname }</a>
												</div>
												<div>
													<span class="">상품</span> <span><a class="" href=# style="color: #26e4ca">20</a> | </span> <span class="">팔로워</span> <span><a class="" href="#" style="color: #26e4ca">${followings.following }</a></span>
												</div>
											</div>
											<a class="" href="#">
												<div class="">
													<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14"
														alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지">
												</div>
											</a> <a class="" href="#">
												<button id="btn_sold_product_name">
													&nbsp;팔로우 <img src="../img/following_icon.png" width="15" height="10" alt="팔로잉아이콘">&nbsp;
												</button>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
							<br> <br> <br>
							<div class="follower_all">
								<hr>
								<br> <br>
								<p>
									<span><strong>팔로워 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${follow.follower }</span>
								</p>
								<div class="following_all_grid">
									<c:forEach var="followers" items="${follwer }">
										<div class="following">
											<a class="following_img_area" href="#"> <!-- 이미지를 눌렀을 때 해당상점으로 이동 -->
												<div id="following_img_box">
													<img id="following_img" src="${followers.profile }" alt="상점이미지">
												</div>
											</a>
											<div class="store_review_text_area">
												<div class="">
													<a class="" href="#" style="color: #26e4ca">${followers.nickname }</a>
												</div>
												<div>
													<span class="">상품</span> <span><a class="" href="#" style="color: #26e4ca">20</a> &nbsp;|&nbsp; </span> <span class="">팔로워</span> <span><a class="" href="#" style="color: #26e4ca">${followers.follower }</a></span>
												</div>
											</div>
											<a class="" href="#">
												<div class="">
													<img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14"
														alt="별점이미지"> <img src="../img/star_rank.png" width="15" height="14" alt="별점이미지">
												</div>
											</a> <a class="" href="#">
												<button id="btn_sold_product_name">
													&nbsp;팔로우 <img src="../img/following_icon.png" width="15" height="10" alt="팔로잉아이콘">&nbsp;
												</button>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!--나의 중고거래  -->
					<div class="tab-pane fade" id="Picture" role="tabpanel" aria-labelledby="profile-tab">
						<br>
						<div class="sell_list_all">
							<br>
							<p>
								<span><strong>판매내역 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${boardCount }</span>
							</p>
							<div class="sell_list_grid">
								<c:forEach var="market" items="${market }">
									<div class="sell_list">
										<table width="100%" height="120">
											<tr height="30">
												<td align="left" style="font-size: 15px">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${market.date }" /></td>
												<td width="70%"></td>
											</tr>
											<tr>
												<td rowspan="3"><a id="store_review_img_area" href="#">
														<div id="product_img_box">
															<img id="sell_product_img" src="${market.url }" alt="판매상품이미지">
														</div>
												</a></td>
												<td style="font-size: 18px"><a href="#" style="color: #26e4ca">${market.product_name }</a></td>
											</tr>
											<tr>
												<td style="font-size: 15px">${market.product_price }&nbsp;원</td>
											</tr>
											<tr>
												<td><c:choose>
														<c:when test="${market.status eq 1}">
															<button id="btn_sell_product_state">판매중</button>
														</c:when>
														<c:otherwise>
															<button id="btn_sold_product_state">판매완료</button>
														</c:otherwise>
													</c:choose>
													<button class="btn_sell_product_edit">글 수정</button></td>
											</tr>
										</table>
										<br>
										<hr>
									</div>
								</c:forEach>
								<br>
							</div>
						</div>
						<br> <br> <br>
						<div class="sold_list_all">
							<hr>
							<br> <br>
							<p>
								<span><strong>구매내역 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">28</span>
							</p>
							<div class="sell_list_grid">
								<div class="sell_list">
									<table width="100%" height="120">
										<tr height="30">
											<td align="left" style="font-size: 15px">&nbsp; 2021.11.04</td>
											<td width="70%"></td>
										</tr>
										<tr>
											<td rowspan="3"><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="sell_product_img" src="../img/store_recommand_product03.png" alt="판매상품이미지">
													</div>
											</a></td>
											<td style="font-size: 18px"><a href="#" style="color: gray">올인원 비건 샴푸볼 - 어성초 그린</a></td>
										</tr>
										<tr>
											<td style="font-size: 15px; color: gray">17,000 &nbsp;원</td>
										</tr>
										<tr>
											<td>
												<button id="btn_write_review" type="button">거래후기쓰기</button>
												<button id="btn_see_review" type="button" onclick="location.href='#' ">작성후기보기</button>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<div id="police_modal">
									<div>
										<div style="font-size: 20px">✍&nbsp;거래후기 작성하기&nbsp;✍</div>
										<hr>
										<div>
											<div class="police_category">
												<div>
													<span style="color: #26e4ca">거래(판매자)</span> 님과의 거래에 평점 남기기
												</div>
												<div class="rating">
													<div class="startRadio">
														<label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 0.5개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 1개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 1.5개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 2개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 2.5개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 3개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 3.5개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 4개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 4.5개</span></span>
														</label> <label class="startRadio__box"> <input type="radio" name="star" id="" checked> <span class="startRadio__img"><span class="blind">별 5개</span></span>
														</label>
													</div>
												</div>
											</div>
											<hr>
											<br>
											<div class="write_police_reason">
												<textarea style="border: 1px solid lightgray" rows="5" cols="63"></textarea>
											</div>
											<br>
											<div style="text-align: center">
												<button disabled id="modal_police_btn" style="width: 90px; font-size: 15px">후기 작성</button>
												<button class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
											</div>
										</div>
									</div>
									<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
								</div>
								<script type="text/javascript">
									// 모달 만들기
									function modal(id) {
										var zIndex = 9999;
										var modal = document.getElementById(id);

										// 모달 div 뒤에 희끄무레한 레이어
										var bg = document.createElement('div');
										bg.setStyle({
											position : 'fixed',
											zIndex : zIndex,
											left : '0px',
											top : '0px',
											width : '100%',
											height : '100%',
											overflow : 'auto',
											// 레이어 색갈은 여기서 바꾸면 됨
											backgroundColor : 'rgba(0,0,0,0.4)'
										});
										document.body.append(bg);

										// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
										modal
												.querySelector(
														'.modal_cancle_btn')
												.addEventListener(
														'click',
														function() {
															bg.remove();
															modal.style.display = 'none';
														});
										modal
												.querySelector(
														'.modal_close_btn')
												.addEventListener(
														'click',
														function() {
															bg.remove();
															modal.style.display = 'none';
														});

										modal
												.setStyle({
													position : 'fixed',
													display : 'block',
													boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

													// 시꺼먼 레이어 보다 한칸 위에 보이기
													zIndex : zIndex + 1,

													// div center 정렬
													top : '50%',
													left : '50%',
													transform : 'translate(-50%, -50%)',
													msTransform : 'translate(-50%, -50%)',
													webkitTransform : 'translate(-50%, -50%)'
												});
									}
									// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
									Element.prototype.setStyle = function(
											styles) {
										for ( var k in styles)
											this.style[k] = styles[k];
										return this;
									};

									document.querySelector('#btn_write_review')
											.addEventListener('click',
													function() {
														// 모달창 띄우기
														modal('police_modal');
													});
									//평가점수버튼을 줘서 점수를 줬으면 버튼 활성화
									$(".rating").change(
											function() {
												$("#modal_police_btn").attr(
														"disabled", false);

											});
								</script>
								<div class="sold_list">
									<table width="100%" height="120">
										<tr height="30">
											<td align="left" style="font-size: 15px">&nbsp; 2021.10.24</td>
											<td width="70%"></td>
										</tr>
										<tr>
											<td rowspan="3"><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="sell_product_img" src="../img/store_recommand_product02.png" alt="판매완료상품이미지">
													</div>
											</a></td>
											<td style="font-size: 18px"><a href="#" style="color: gray">고무장갑 팔목라인</a></td>
										</tr>
										<tr>
											<td style="font-size: 15px; color: gray">2,000 &nbsp;원</td>
										</tr>
										<tr>
											<td>
												<button id="btn_see_review" button type="button" onclick="location.href='#' ">작성후기보기</button>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<br>
							</div>
						</div>
					</div>
					<!-- 나의커뮤니티 -->
					<div class="tab-pane fade" id="shop" role="tabpanel" aria-labelledby="contact-tab">
						<div class="community_list_all">
							<br> <br>
							<p>
								<span><strong>내가 쓴 커뮤니티글 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">8</span>
							</p>
							<div class="community_list_grid">
								<c:forEach var="community" items="${community }">
									<div class="community_list">
										<table width="100%" height="120">
											<tr height="30">
												<td align="left" style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${community.date }" /></td>
												<td width="60%" align="center" style="font-size: 18px">
													<div>${community.category }</div>
													<div>${community.title }</div>
												</td>
												<td align="left" style="font-size: 15px"><c:choose>
														<c:when test="${community.category eq '소식' }">
															<div>유용해요 ${community.likes }</div>
														</c:when>
														<c:when test="${community.category eq '질문' }">
															<div>궁금해요 ${community.likes }</div>
														</c:when>
														<c:when test="${community.category eq '모임' }">
															<div>함께해요 ${community.likes }</div>
														</c:when>
														<c:when test="${community.category eq '맛집' }">
															<div>맛있어요 ${community.likes }</div>
														</c:when>
														<c:when test="${community.category eq '분실센터' }">
															<div>슬퍼요 ${community.likes }</div>
														</c:when>
														<c:otherwise>
															<div>멋져요 ${community.likes }</div>
														</c:otherwise>
													</c:choose>
													<div>조회수 ${community.views }</div>
													<div>답변 ${community.comments }</div></td>
												<td width="15%" align="center">
													<button id="btn_community_update">글 수정</button>
													<button id="btn_community_delete">글 삭제</button>
												</td>
											</tr>
										</table>
										<br>
										<hr>
									</div>
								</c:forEach>
								<br> <br>
							</div>
						</div>
						<br> <br> <br>
						<div class="community_comment_list_all">
							<hr>
							<br> <br>
							<p>
								<span><strong>내가 쓴 커뮤니티 댓글 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">28</span>
							</p>
							<div class="community_comment_list_grid">
								<div class="community_comment_list">
									<table width="100%" height="120">
										<tr height="30">
											<td align="left" style="font-size: 15px">2020.09.18</td>
											<td width="70%" align="center" style="font-size: 18px">
												<div style="color: gray;">[원글] XX동 근처 잘하는 병원이 어디인가요?</div>
												<div>
													&nbsp;&nbsp;<img src="../img/right-arrow.png" style="width: 9px; height: 9px"> [내가 쓴 댓글] 점심시간에 사람 많나요?
												</div>
											</td>
											<td width="20%" align="center">
												<button id="btn_community_comment_update">댓글 수정</button>
												<button id="btn_community_comment_delete">댓글 삭제</button>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<div class="community_comment_list">
									<table width="100%" height="120">
										<tr height="30">
											<td align="left" style="font-size: 15px">2020.09.18</td>
											<td width="70%" align="center" style="font-size: 18px">
												<div style="color: gray;">[원글] XX동 근처 잘하는 병원이 어디인가요?</div>
												<div>
													&nbsp;&nbsp;<img src="../img/right-arrow.png" style="width: 9px; height: 9px"> [내가 쓴 댓글] 점심시간에 사람 많나요?
												</div>
											</td>
											<td width="20%" align="center">
												<button id="btn_community_comment_update">댓글 수정</button>
												<button id="btn_community_comment_delete">댓글 삭제</button>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<br>
							</div>
						</div>
					</div>
					<!-- 나의 스토어거래 -->
					<div class="tab-pane fade" id="accom" role="tabpanel" aria-labelledby="contact-tab">
						<div class="store_bought_list_all">
							<br> <br>
							<p>
								<span><strong>스토어 상품 구매 내역 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">3</span>
							</p>
							<div class="store_bought_list_grid">
								<div class="store_bought_list">
									<table width="100%" height="120">
										<tr>
											<td align="left" style="font-size: 20px">결제완료</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="bought_product_img" src="../img/store_recommand_product02.png" alt="판매완료상품이미지">
													</div>
											</a></td>
											<td align="left" style="font-size: 15px">
												<div style="font-size: 15px">06.22 결제</div>
												<div style="font-size: 18px">Cambro 캠트레이 - 3가지 색상</div>
												<div>
													<span style="font-size: 18px">18,000</span>&nbsp;원
												</div>
												<div style="font-size: 15px;">
													<a style="color: #26e4ca" href="#">주문상세 ></a>
												</div>
											</td>
											<td align="center">
												<div>
													<button id="btn_store_bought_product">취소 요청</button>
												</div>
												<div>
													<button id="btn_store_bought_product">배송지 변경</button>
												</div>
												<div>
													<button id="btn_store_bought_product">영수증 조회</button>
												</div>
												<div>
													<button id="btn_store_bought_product">판매자 문의</button>
												</div>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<div class="store_bought_list">
									<br>
									<table width="100%" height="120">
										<tr>
											<td align="left" style="font-size: 20px">상품 준비 중</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="bought_product_img" src="../img/store_recommand_product02.png" alt="판매완료상품이미지">
													</div>
											</a></td>
											<td align="left" style="font-size: 15px">
												<div style="font-size: 15px">06.22 결제</div>
												<div style="font-size: 18px">Cambro 캠트레이 - 3가지 색상</div>
												<div>
													<span style="font-size: 18px">18,000</span>&nbsp;원
												</div>
												<div style="font-size: 15px;">
													<a style="color: #26e4ca" href="#">주문상세 ></a>
												</div>
											</td>
											<td align="center">
												<div>
													<button id="btn_store_bought_product">취소 요청</button>
												</div>
												<div>
													<button id="btn_store_bought_product">영수증 조회</button>
												</div>
												<div>
													<button id="btn_store_bought_product">판매자 문의</button>
												</div>
											</td>
										</tr>
									</table>
									<br>
									<hr>
									<br>
								</div>
								<div class="store_bought_list">
									<br> <br>
									<table width="100%" height="120">
										<tr>
											<td align="left" style="font-size: 20px">상품 배송 중</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>
												<div id="product_img_box">
													<a id="store_review_img_area" href="#"> <img id="bought_product_img" src="../img/store_recommand_product02.png" alt="판매완료상품이미지">
													</a>
												</div>
											</td>
											<td align="left" style="font-size: 15px"><br> <br> <br>
												<div style="font-size: 15px">06.22 결제</div>
												<div style="font-size: 18px">Cambro 캠트레이 - 3가지 색상</div>
												<div>
													<span style="font-size: 18px">18,000</span>&nbsp;원
												</div>
												<div style="font-size: 15px;">
													<a style="color: #26e4ca" href="#">주문상세 ></a>
												</div></td>
											<td align="center">
												<div>
													<button id="btn_store_bought_product">취소 요청</button>
												</div>
												<div>
													<button id="btn_store_bought_product">배송 조회</button>
												</div>
												<div>
													<button id="btn_store_bought_product">영수증 조회</button>
												</div>
												<div>
													<button id="btn_store_bought_product">판매자 문의</button>
												</div>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<div class="store_bought_list">
									<br> <br> <br>
									<table width="100%" height="120">
										<tr>
											<td align="left" style="font-size: 20px">상품 배송 완료</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="bought_product_img" src="../img/store_recommand_product02.png" alt="판매완료상품이미지">
													</div>
											</a></td>
											<td align="left" style="font-size: 15px">
												<div style="font-size: 15px">06.22 결제</div>
												<div style="font-size: 18px">Cambro 캠트레이 - 3가지 색상</div>
												<div>
													<span style="font-size: 18px">18,000</span>&nbsp;원
												</div>
												<div style="font-size: 15px;">
													<a style="color: #26e4ca" href="#">주문상세 ></a>
												</div>
											</td>
											<td align="center">
												<div>
													<button id="btn_store_bought_product">반품 요청</button>
												</div>
												<div>
													<button id="btn_store_bought_product">교환 요청</button>
												</div>
												<div>
													<button id="btn_store_bought_product">영수증 조회</button>
												</div>
												<div>
													<button id="btn_store_bought_product">상품 리뷰 쓰기</button>
												</div>
												<div>
													<button id="btn_store_bought_product">판매자 문의</button>
												</div>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<br>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="heart_product" role="tabpanel" aria-labelledby="contact-tab">
						<br> <br>
						<div class="heart_list_all">
							<p>
								<span><strong>중고거래 관심상품 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">28</span>
							</p>
							<div class="sell_list_grid">
								<div class="sell_list">
									<table width="100%" height="120">
										<tr height="30">
											<td align="left" style="font-size: 15px">&nbsp; 2021.11.04</td>
											<td width="70%"></td>
										</tr>
										<tr>
											<td rowspan="3"><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="sell_product_img" src="../img/wallet.jpg" alt="판매상품이미지">
													</div>
											</a></td>
											<td style="font-size: 18px"><a href="#" style="color: #26e4ca">구찌 지갑</a></td>
										</tr>
										<tr>
											<td style="font-size: 15px">170,000 &nbsp;원</td>
										</tr>
										<tr>
											<td>
												<button id="btn_heart_product" type="button" onclick="location.href='#' ">관심상품</button>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<div class="sold_list">
									<table width="100%" height="120">
										<tr height="30">
											<td align="left" style="font-size: 15px">&nbsp; 2021.10.24</td>
											<td width="70%"></td>
										</tr>
										<tr>
											<td rowspan="3"><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="sell_product_img" src="../img/hair_purfum.jpg" alt="판매완료상품이미지">
													</div>
											</a></td>
											<td style="font-size: 18px"><a href="#" style="color: #26e4ca">디올 헤어 미스트</a></td>
										</tr>
										<tr>
											<td style="font-size: 15px">30,000 &nbsp;원</td>
										</tr>
										<tr>
											<td>
												<button id="btn_heart_product" type="button" onclick="location.href='#' ">관심상품</button>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<br>
							</div>
							<br> <br> <br>
						</div>
						<hr>
						<br> <br>
						<div class="heart_list_all">
							<p>
								<span><strong>민트스토어 관심상품 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">18</span>
							</p>
							<div class="sell_list_grid">
								<div class="sell_list">
									<table width="100%" height="120">
										<tr>
											<td rowspan="3"><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="sell_product_img" src="../img/store_recommand_product03.png" alt="판매상품이미지">
													</div>
											</a></td>
											<td style="font-size: 18px"><a href="#" style="color: #26e4ca">올인원 비건 샴푸볼 - 어성초 그린</a></td>
										</tr>
										<tr>
											<td style="font-size: 15px">19,000 &nbsp;원</td>
										</tr>
										<tr>
											<td>
												<button id="btn_heart_product" type="button" onclick="location.href='#' ">관심상품</button>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<div class="sell_list">
									<table width="100%" height="120">
										<tr>
											<td rowspan="3"><a id="store_review_img_area" href="#">
													<div id="product_img_box">
														<img id="sell_product_img" src="../img/store_recommand_product03.png" alt="판매상품이미지">
													</div>
											</a></td>
											<td style="font-size: 18px"><a href="#" style="color: #26e4ca">올인원 비건 샴푸볼 - 어성초 그린</a></td>
										</tr>
										<tr>
											<td style="font-size: 15px">19,000 &nbsp;원</td>
										</tr>
										<tr>
											<td>
												<button id="btn_heart_product" type="button" onclick="location.href='#' ">관심상품</button>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								<br> <br> <br>
							</div>
						</div>
						<!--/col-9-->
					</div>
					<!--/row-->
				</div>
			</div>
		</div>
		<form action="profileImage.do" name="efrm" method="post" enctype="multipart/form-data">
			<div class="modal fade" id="edit_img" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<br />
						<div class="modal-title">
							<b>&nbsp; &nbsp; 프로필 사진 수정&nbsp; &nbsp;</b>
						</div>
						<hr />
						<div class="modal-body row" style="padding: 0px 0px 0px 5px;">
							<div class="used_photo_img" style="text-align: center;">
								<input class="form-input" type="file" name="file" multiple accept=".jpg, .png, .gif" onchange="preview();" /> <br> <img class="preview-wrap" src="${user.profile }" alt="등록할 프로필 사진을 넣어주세요." /> <br>
							</div>
						</div>
						<div class="modal-footer">
							<input type="hidden" name="nickname" value="${nickname }" /> <input type="submit" class="btn btn--blue-2 btn--radius-2" id="btn_edit_img" value="확인">
							<button type="button" class="btn btn--blue-1 btn--radius-2" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<form action="delete_img_ok.do" name="dfrm" method="post">
			<div class="modal fade bs-delete-modal-sm" id="delete_img" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<br />
						<div style="height: 60px;">&nbsp;&nbsp;정말 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn--blue-2 btn--radius-2" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn--blue-1 btn--radius-2" id="btn_delete_img">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
<script>

		//============= 글리스트 가져오기 함수 =============
		//페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정한다.
		//let currentPage=1;
		//현재 페이지가 로딩중인지 여부를 저장할 변수이다.
		let currentPage = 1;
		//currentPage는 무한스크롤에 필요한 현재 페이지
		//doName은 클릭한 게시판의 컨트롤러명
		//divName은 ajax로 받은 데이터를 append시킬 div명
		const GetList = function(currentPage, doName, divName) {

			//하트 컨트롤러 이름 만들어주기
			let heartUrl = 'lanTrip_';
			if (divName == 'lantrip') {

			} else if (divName == 'Picture') {
				heartUrl = '';

			} else if (divName == 'shop') {
				heartUrl = 'shop_';

			} else if (divName == 'accom') {
				heartUrl = 'accom_';
			}

			$.ajax({
				url : doName,
				method : "GET",
				data : "pageNum=" + currentPage,
				//ajax_page.jsp의 내용이 jspPage로 들어온다.
				success : function(jspPage) {

					//응답된 문자열은 jsp 형식이다.(profile/게시판명_ajax_page.jsp에 응답내용이 있다.)
					//해당 문자열을 특정div 태그에 붙여준다.
					if (divName == 'lantrip') {
						$('#Picture').empty();
						$('#shop').empty();
						$('#accom').empty();

					} else if (divName == 'Picture') {
						$('#lantrip').empty();
						$('#shop').empty();
						$('#accom').empty();

					} else if (divName == 'shop') {
						$('#lantrip').empty();
						$('#Picture').empty();
						$('#accom').empty();

					} else if (divName == 'accom') {
						$('#lantrip').empty();
						$('#Picture').empty();
						$('#shop').empty();

					}

					$('#' + divName).append(jspPage);

					//로딩바를 숨긴다.
					$(".back-drop").hide();
					//로딩중이 아니라고 표시한다.
					isLoading = false;

					if (divName == 'lantrip') {
						$('.card-img-top').mouseover(function() {
							$(this).get(0).play();
						}).mouseout(function() {
							$(this).get(0).pause();
						});
					}

				}

			});
		}

		//============= 댓글 리스트 가져오는 함수 =============
		const ReplyList = function(no, divName) {
			console.log('replyllist의 divName확인중 : ' + divName);
			$.ajax({
				url : divName + '_replyList.do',
				type : 'get',
				data : {
					no : no
				},
				success : function(jspPage) {
					///////////// 동적으로 넣어준 html에 대한 이벤트 처리는 같은 함수내에서 다 해줘야한다.
					///////////// $(document).ready(function(){}); 안에 써주면 안된다.

					// 댓글 리스트 부분에 받아온 댓글 리스트를 넣기
					$(".reply-list" + no).html(jspPage);

					// 답글에서 답글달기를 누르면 input란에 "@답글작성자"가 들어간다.
					//$('.write_re_reply_start').on('click', function(){
					//   $('#input_rereply'+ $(this).attr('no')).val("@"+$(this).attr('writer')+" ");
					//});

					//답글을 작성한 후 답글달기 버튼을 눌렀을 때 그 click event를 아래처럼 jquery로 처리한다.
					$('button.btn.btn-success.mb-1.write_rereply').on('click',
							function() {
								console.log('no', $(this).attr('no'));
								console.log('bno', $(this).attr('bno'));
								let bno = $(this).attr('bno');
								let no = $(this).attr('no');

								// 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
								WriteReReply(bno, no, divName);
							});

					// 삭제버튼을 클릭했을 때
					$('.reply_delete').on(
							'click',
							function() {
								// 모댓글 삭제일때
								if ($(this).attr('grpl') == 0) {
									DeleteReply($(this).attr('no'), $(this)
											.attr('bno'), $(this).attr('grpl'),
											divName);

									// 답글 삭제일때
								} else {
									DeleteReReply($(this).attr('no'), $(this)
											.attr('bno'), $(this).attr('grp'),
											divName);
								}

							})

				},
				error : function() {
					alert('서버 에러');
				}
			});
		};

		// 모댓글 삭제일때
		const DeleteReply = function(no, bno, grpl, divName) {
			// grp이 no인 댓글이 있는 경우 content에 null을 넣고 없으면 삭제한다.
			$.ajax({
				url : divName + '_delete_reply.do',
				type : 'get',
				data : {
					no : no,
					bno : bno,
					grpl : grpl
				},
				success : function(to) {

					let reply = to.reply;

					console.log("모댓글 reply : " + reply);

					// 페이지, 모달창에 댓글수 갱신
					$('#m_reply' + bno).text(reply);
					$('.span_reply' + bno).text(reply);

					alert("모댓글 삭제 성공");

					// 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
					ReplyList(bno, divName);
				},
				error : function() {
					alert('서버 에러');
				}
			});
		};

		//게시글 삭제하기
		const BoardDelete = function(no, divName) {
			//alert("함수들어왔다!");

			$.ajax({
				url : divName + '_delete_ok.do',
				type : 'get',
				data : {
					no : no,
				},
				success : function(to) {

					document.location.reload();
					alert("삭제되었습니다!");

				},
				error : function() {
					alert('서버 에러');
				}
			});
		}

		// 창 크기가 변할 때마다 가로세로 길이를 맞춰준다.
		$(window).resize(function() {
			$('.box').each(function() {
				$(this).height($(this).width());
			});
		}).resize();

		//============= 무한스크롤 함수 =============
		//웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
		/*    $(window).on("scroll",function(){
		 //위로 스크롤된 길이
		 let scrollTop=$(window).scrollTop();
		 //웹브라우저의 창의 높이
		 let windowHeight=$(window).height();
		 //문서 전체의 높이
		 let documentHeight=$(document).height();
		 //바닥까지 스크롤 되었는 지 여부를 알아낸다.
		 let isBottom=scrollTop+windowHeight + 10 >= documentHeight;
		
		 //GetList 함수에 매개변수를 위해 active된 id값을 받아와서 매개변수를 지정해준다.
		 let divName = $( '.tab-content' ).children( '.active' ).attr( 'id' );
		
		
		 let ajaxDoName = '';
		 if( divName == 'lantrip' ) {
		 ajaxDoName = 'profile_lanTrip_ajax_page.do';
		 } else if( divName == 'picture' ) {
		 ajaxDoName = 'profile_picture_ajax_page.do';
		 } else if( divName == 'shop' ) {
		 ajaxDoName = 'profile_shop_ajax_page.do';
		 } else {
		 ajaxDoName = 'profile_accom_ajax_page.do';
		 }

		
		 if(isBottom) {
		 //만일 현재 마지막 페이지라면
		 if(currentPage == ${totalPageCount} || isLoading){
		
		 return; //함수를 여기서 끝낸다.
		 }
		 //현재 로딩 중이라고 표시한다.
		 isLoading=true;
		 //로딩바를 띄우고
		 $(".back-drop").show();
		 //요청할 페이지 번호를 1 증가시킨다.
		 currentPage++;
		 //추가로 받아올 페이지를 서버에 ajax 요청을 하고
		
		 //추가로 불러올 글목록 가져오기
		 GetList( currentPage, ajaxDoName, divName );
		
		 }; 
		 }); */

		//맨처음 페이지 입장시 실행
		$(document).ready(function() {

			//현재페이지번호, 컨트롤러명, ajax결과 붙일 div태그명 넘겨준다.
			GetList(currentPage, 'profile_lanTrip_ajax_page.do', 'lantrip');

		});
	</script>
</article>
<br />
<br />
<br />
<br />
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>마이페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<jsp:include page="./index.jsp"></jsp:include>
<jsp:include page="../template/header.jsp"></jsp:include>
<script defer src="${pageContext.request.contextPath}/resources/user/js/profile.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- CSS File -->

<link href="${pageContext.request.contextPath}/resources/user/css/profile.css" rel="stylesheet">
<article>
	<script>
		var sns = '${sns}';
		var address = '${user.address2}';
		console.log(address);
		window.onload = function() {
			console.log(sns);
			if (sns == 'naver' || sns == 'kakao') {
				if(address == ''){
					alert('개인정보를 추가해주세요!');
				}
			}
		}
	</script>
	<br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
	<div class="container bootstrap snippet" style="padding-left: 100px">
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->
				<c:choose>
					<c:when test="${empty sns }">
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
							<button type="button" style="font-size: 10px; margin-left: 240px; margin-top: -60px" class="btn btn--blue-2 btn--radius-2" data-bs-toggle="modal" data-bs-target="#edit_img">edit</button>
						</span>
					</div>
					<br>
					<ul class="list-group" style="text-align:center">
						<li class="list-group-item text-muted" style="font-size:23px">${user.nickname }&nbsp;&nbsp;</li>
						<li class="list-group-item text-right"><span class="pull-left"><strong>상점등급&nbsp;&nbsp;</strong></span>
							<c:choose>
							<c:when test="${user.rating <= 1}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade1.png" style="width: 25px; height: 25px;"/>
							</c:when>
							<c:when test="${user.rating <= 2}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade2.png" style="width: 25px; height: 25px;"/>
							</c:when>
							<c:when test="${user.rating <= 3}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade3.png" style="width: 25px; height: 25px;"/>
							</c:when>
							<c:when test="${user.rating <= 4}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade4.png" style="width: 25px; height: 25px;"/>
							</c:when>
							<c:when test="${user.rating <= 5}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade5.png" style="width: 25px; height: 25px;"/>
							</c:when>
							</c:choose>
						</li>
						<li class="list-group-item text-right"><span class="pull-left"><strong>팔로잉&nbsp;&nbsp;</strong></span> ${follow.following }</li>
						<li class="list-group-item text-right"><span class="pull-left"><strong>팔로워&nbsp;&nbsp;</strong></span> ${follow.follower }</li>
						<li class="list-group-item text-right"><span class="pull-left"><strong>상품판매횟수&nbsp;&nbsp;</strong></span> ${boardCount}</li>
					</ul>
					</c:when>
					<c:otherwise>
						<div class="nick-div">
							<h5>
								<b><span style="color: #26e4ca;">${user.nickname }&nbsp;</span>님의 프로필</b>
							</h5>
						</div>
						<div class="text-center row">
							<div class="box col-1">
								<div>
									<img src="${user.profile }" class="avatar img-circle img-profile" alt="avatar">
								</div>
							</div>
							<span class="col-0 profile_d_m" style="text-align: right; padding: 0px; width: 100px;">
								<button type="button" style="font-size: 10px; margin-left: 240px; margin-top: -60px" class="btn btn--blue-2 btn--radius-2" data-bs-toggle="modal" data-bs-target="#edit_img">edit</button>
							</span>
						</div>
						<br>
						<ul class="list-group" style="text-align:center">
							<li class="list-group-item text-muted" style="font-size:23px">${user.nickname }&nbsp;&nbsp;</li>
							<li class="list-group-item text-right"><span class="pull-left"><strong>상점등급&nbsp;&nbsp;</strong></span>
							<c:choose>
							<c:when test="${user.rating <= 1}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade1.png" style="width: 25px; height: 25px;"/>
							</c:when>
							<c:when test="${user.rating <= 2}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade2.png" style="width: 25px; height: 25px;"/>
							</c:when>
							<c:when test="${user.rating <= 3}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade3.png" style="width: 25px; height: 25px;"/>
							</c:when>
							<c:when test="${user.rating <= 4}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade4.png" style="width: 25px; height: 25px;"/>
							</c:when>
							<c:when test="${user.rating <= 5}">
								<img src="${pageContext.request.contextPath}/resources/user/img/mint_grade5.png" style="width: 25px; height: 25px;"/>
							</c:when>
							</c:choose>
							</li>
							<li class="list-group-item text-right"><span class="pull-left"><strong>팔로잉&nbsp;&nbsp;</strong></span> ${follow.following }</li>
							<li class="list-group-item text-right"><span class="pull-left"><strong>팔로워&nbsp;&nbsp;</strong></span> ${follow.follower }</li>
							<li class="list-group-item text-right"><span class="pull-left"><strong>상품판매횟수&nbsp;&nbsp;</strong></span> ${boardCount}</li>
					</ul>
					</c:otherwise>
				</c:choose>
				<div class="col-6 offset-2 div_modify_profile">
					<div id="my_modal">
						<div>
							<div id="my_info_edit_title">📝&nbsp;나의 주소수정&nbsp;📝</div>
							<hr>
							<div>
							
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
												<td height="30px">생년월일</td>
												<td colspan="2">${user.birth}</td>
											</tr>
											<c:choose>
											<c:when test="${user.address1 == null }">
											<tr>
												<td rowspan="3" height="90px">주소</td>
												<td><input type="text" id="post_addr" placeholder="우편주소" style="width: 90px;">
													<button type="button" onclick="findAddr();" id="addr" class="address_find_btn">주소검색</button></td>
											</tr>
											<tr>
												<td  height="30px"><input style="width:280px" type="text" id="base_addr" placeholder="기본주소"></td>
											</tr>
											<tr>
												<td  height="30px"><input style="width:280px" type="text" id="detail_addr" placeholder="직접 입력해주세요"></td>
											</tr>
											
											</c:when>
											<c:otherwise>
											<tr>
												<td rowspan="3" height="90px">주소</td>
												<td><input type="text" id="post_addr" placeholder="${user.address1 }" style="width: 90px;">
													<button type="button" onclick="findAddr();" id="addr" class="address_find_btn">주소검색</button></td>
											</tr>
											<tr>
												<td  height="30px"><input type="text" style="width:280px" id="base_addr" placeholder="${user.address2 }"></td>
											</tr>
											<tr>
												<td  height="30px"><input type="text" style="width:280px" id="detail_addr" placeholder="${user.address3 }"></td>
											</tr>
											</c:otherwise>
											
											</c:choose>
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
														<td><input id="nick" type="text" placeholder="닉네임" name="nickname" required="required"></td>
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
												<c:when test='${sns eq "kakao" && user.phone == null}'>
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
												<c:when test="${user.birth == null }">
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
											<c:choose>
											<c:when test="${user.address1 == null }">
											<tr>
												<td rowspan="3" height="90px">주소</td>
												<td><input type="text" id="post_addr" placeholder="우편주소" style="width: 90px;">
													<button type="button" onclick="findAddr();" id="addr" class="address_find_btn">주소검색</button></td>
											</tr>
											<tr>
												<td  height="30px"><input style="width:280px" type="text" id="base_addr" placeholder="기본주소" ></td>
											</tr>
											<tr>
												<td  height="30px"><input style="width:280px" type="text" id="detail_addr" placeholder="직접 입력해주세요"></td>
											</tr>
											
											</c:when>
											<c:otherwise>
											<tr>
												<td rowspan="3" height="90px">주소</td>
												<td><input type="text" id="post_addr" placeholder="${user.address1 }" style="width: 90px;">
													<button type="button" onclick="findAddr();" id="addr" class="address_find_btn">주소검색</button></td>
											</tr>
											<tr>
												<td  height="30px"><input type="text" style="width:280px" id="base_addr" placeholder="${user.address2 }"></td>
											</tr>
											<tr>
												<td  height="30px"><input type="text" style="width:280px" id="detail_addr" placeholder="${user.address3 }"></td>
											</tr>
											</c:otherwise>
											
											</c:choose>
											
										</c:otherwise>
									</c:choose>
								</table>
								<br>
								<div style="text-align: center; margin-bottom: 10px">
									<c:choose>
										<c:when test="${empty sns }">
											<button class="btn btn-primary" onclick="updateAddr();"> 주소수정</button>
											<button class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-primary" onclick="updateSns();">주소수정</button>
											<button class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
										</c:otherwise>
									</c:choose>
								</div>
							
							</div>
						</div>
						<a style="cursor: pointer; color: gray" class="modal_close_btn">X</a>
					</div>
					
					
					<!-- 비밀번호 일치용 모달 -->
					<div class="modal fade" id="pwCheck" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title" id="staticBackdropLabel" style="font-size: 23px">  🛠&nbsp;비밀번호 수정&nbsp;🛠 </div>
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
									<button style="font-size: 15px" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button style="font-size: 15px" type="button" id="pwCheck" class="btn btn-primary" onclick="pwCheck();">비밀번호 확인</button>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- 바말번호 수정용 모달 -->
					<div class="modal fade" id="newPw" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title" id="staticBackdropLabel" style="font-size: 23px" >🛠&nbsp;비밀번호 변경&nbsp;🛠</div>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div>
									<div style="text-align:left; font-size: 18px; margin-top:10px; margin-left:20px">8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
								</div>
								<form id="pwForm">
									<div class="modal-body">
										<table>
											<tr>
												<td><input id="fPw" type="password" style="height:24px"></td>
											</tr>
											<tr>
												<td><input id="sPw" name="password" type="password" style="margin-top:10px;height:24px"></td>
												<td><button style="width:80px; margin-left:10px; margin-top:10px; font-size:15px; border-radius: 3px; border: 1px solid lightgray; background:lightgray;" type="button" onclick='correctPw();'>비밀번호확인</button></td>
											</tr>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="font-size:15px">닫기</button>
										<button onclick="updatePw();" type="button" class="btn btn-primary" style="font-size:15px" >변경하기</button>
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
					        <div class="modal-title" id="staticBackdropLabel" style="font-size: 23px">❌&nbsp;탈퇴하기&nbsp;❌</div>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <form id="secessionForm" onsubmit="return false">
					     	 <div class="modal-body" style="text-align:left">
					     	 	<span style="margin-left:15px">비밀번호 입력 &emsp;</span>
					        	<span><input style="width:230px" id="cpw" type="password"></span>
					    	  </div>
					     	 <div class="modal-footer">
					       		 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="font-size:15px" >닫기</button>
					       		 <button type="button" class="btn btn-primary" onclick="secession();" style="font-size:15px">탈퇴하기</button>
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
					        <div class="modal-title" id="staticBackdropLabel" style="font-size: 23px">❌&nbsp;탈퇴하기&nbsp;❌</div>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <form id="secessionForm" onsubmit="return false">
					     	 <div class="modal-body">
					        	탈퇴하시겠습니까?
					    	  </div>
					     	 <div class="modal-footer">
					       		 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="font-size:15px">닫기</button>
					       		 <button type="button" class="btn btn-primary" onclick="sns_secession();" style="font-size:15px">탈퇴하기</button>
					      	</div>
					      </form>
					    </div>
					  </div>
					</div>
					
					


				
					
					
					<c:choose>
						<c:when test = "${empty sns }">
						<button type="button" style="width: 135%; font-size: 15px; box-shadow: none"
							class="btn btn--blue-2 btn--radius-2 btn_modify_profile"
							id="popup_open_info">주소 수정하기</button>
						<button type="button" style="width: 135%; font-size: 15px; box-shadow: none" class="btn btn--blue-2 btn--radius-2 btn_modify_password" data-bs-toggle="modal" data-bs-target="#pwCheck">
			 				 비밀번호 수정하기
						</button>
						<button type="button" style="width: 135%; font-size: 15px; box-shadow: none" class="btn btn--blue-2 btn--radius-2 btn_quit" data-bs-toggle="modal" data-bs-target="#secession">
							 탈퇴하기
						</button>
						</c:when>
						<c:otherwise>
						<button type="button" style="width: 135%; font-size: 15px; box-shadow: none"
							class="btn btn--blue-2 btn--radius-2 btn_modify_profile"
							id="popup_open_info">주소 수정하기</button>
						<button type="button" style="width: 135%; font-size: 15px; box-shadow: none" class="btn btn-primary btn--blue-2 btn--radius-2 btn_quit" data-bs-toggle="modal" data-bs-target="#sns_secession">
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
							
							
							<!-------------------- 상점 후기 --------------------------->
							<p>
								<span><strong>상점후기 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(rating) }</span>
							</p>
							<div class="store_review_grid">
								<c:forEach var="rate" items="${rating }">
								<div class="store_review">
									<table width="100%" height="140">
										<tr>
											<td width="20%" rowspan="2">
												<div id="img_box">
													<a id="store_review_img_area" href="#"> 
													<img id="store_review_img" src="${rate.profile }" width="100" height="100" alt="상점이미지">
													</a>
												</div>
											</td>
											<td style="font-size: 20px" width="30%" height="54px">
												<button class="reviewer_nick" style="color: #26e4ca; border:none; background:none;">${rate.writer }</button>
												<br>
												<a class="" href="#">
													<c:set var="star" value="${rate.rating }"/>
													<c:forEach var="i" begin="1" end="${star}">
														<img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> 
													</c:forEach>
													<c:if test="${star % 1 > 0 }">
														<img src="${pageContext.request.contextPath}/resources/user/img/star_rank_half.png" width="15" height="14" alt="별점이미지">
													</c:if>
												</a>
											</td>
											<td width="30%">
												<div class="">
												</div>
											</td>
											<td></td>
											<td style="font-size: 15px" width="30%">
												<div id="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${rate.date }" /></div>
											</td>
										</tr>
										<tr>
											<td align="left" colspan="4" style="font-size: 15px">
												<button id="btn_sold_product_name" onclick="location.href='marketBoard.do?seq=${rate.market_seq}'">
													&nbsp;${rate.product_name } <img src="${pageContext.request.contextPath}/resources/user/img/arrow_icon.png" width="6" height="10" alt="화살표 아이콘">&nbsp;
												</button>
												<div id="sold_product_review">${rate.content }</div>
											</td>
										</tr>
									</table>
									<br> <hr>
								</div>
								<br>
								</c:forEach>
								<br>
								</div>
							 <br> <br>
								
								
								
<!-- 								이름을 눌렀을 때 프로필 모달창 띄우기  -->
<!-- 									<div id="popup01"> -->
<!-- 									    <div class="close">X</div> -->
<!-- 									    tab 이외의 내부 내용 -->
<!-- 									    <div style="padding-left:11px"> -->
<!-- 									    	<div id="my_info_edit_title"> -->
<!-- 												<div class="padding-top30"> -->
<!-- 													<div class="float-box float-left"> -->
<!-- 														<div class="left-item25  pic-align left-font" style="padding-left:30px" > -->
<%-- 															<img class="reply-pic-circle" src="${user.profile } "> --%>
<!-- 														</div> -->
<!-- 														<div class="right-item75"> -->
<!-- 															<div class="top-margin10 left-font seller"> -->
<!-- 																작성자 -->
<!-- 																<div id="member-form"> -->
<!-- 																	<div style="font-size: 22px; color:#26e4ca">닉네임 </div> -->
<!-- 																	<div class="seller_grade"> -->
<%-- 																		<img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> --%>
<%-- 																		<img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> --%>
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<br> -->
<!-- 											End tab 이외의 내부 내용 -->
<!-- 											tab -->
<!-- 											<div class="tab"> -->
<!-- 												<ul class="tabnav"> -->
<!-- 													<li><a href="#tab01">판매 상품</a></li> -->
<!-- 													<li><a href="#tab02">작성한 커뮤니티 글</a></li> -->
<!-- 													<li><a href="#tab03">받은 거래 후기</a></li> -->
<!-- 												</ul> -->
<!-- 												<div class="tabcontent"> -->
<!-- 													<div id="tab01"> -->
<!-- 														<div class="info_grid"> -->
<%-- 															<c:forEach var="market" items="${market }"> --%>
<!-- 																<div class="sell_list"> -->
<!-- 																	<table width="100%" height="120" style="padding-top: 20px"> -->
																		
<!-- 																			<tr height="30"> -->
																				
<%-- 																				<td align="left" style="font-size: 15px">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${market.date }" /></td> --%>
<!-- 																				<td width="70%"></td> -->
<!-- 																			</tr> -->
<!-- 																			<tr> -->
<!-- 																				<td rowspan="3"><a id="store_review_img_area" href="#"> -->
<!-- 																						<div id="product_img_box"> -->
<%-- 																							<img id="sell_product_img" src="${market.url}" alt="판매상품이미지"> --%>
<!-- 																						</div> -->
<!-- 																				</a></td> -->
<%-- 																				<td style="font-size: 18px"><a href="#" style="color: #26e4ca">${market.product_name }</a></td> --%>
<!-- 																			</tr> -->
<!-- 																			<tr> -->
<%-- 																				<td style="font-size: 15px">${market.product_price } &nbsp;원</td> --%>
<!-- 																			</tr> -->
<!-- 																			<tr> -->
<!-- 																				<td> -->
<%-- 																					<c:choose> --%>
<%-- 																						<c:when test="${market.status eq 1}"> --%>
<!-- 																							<button id="btn_sell_product_state">판매중</button> -->
<%-- 																						</c:when> --%>
<%-- 																						<c:otherwise> --%>
<!-- 																							<button id="btn_sell_product_state">판매 완료</button> -->
<%-- 																						</c:otherwise> --%>
<%-- 																					</c:choose> --%>
<!-- 																				</td> -->
<!-- 																			</tr> -->
<!-- 																	</table> -->
<!-- 																	<br> -->
<!-- 																	<hr> -->
<!-- 																	<br> -->
<!-- 																</div> -->
<!-- 															<br> -->
<%-- 															</c:forEach> --%>
<!-- 														</div> -->
<!-- 													</div> -->
<%-- 													<c:choose> --%>
<%-- 														<c:when test="${community ne null }"> --%>
<%-- 															<c:forEach var="community" items="${community }"> --%>
<!-- 																<div id="tab02"> -->
<!-- 																	<div class="community_post_record"> -->
<!-- 																		<table> -->
<!-- 																			<tr> -->
<%-- 																				<td style="text-align: center; padding: 8px;"><div class="community_category">${community.category }</div>&nbsp;</td> --%>
<%-- 																				<td style="text-align: center; padding: 8px;"><div class="community_title">${community.title }</div>&nbsp;</td> --%>
<%-- 																				<td style="text-align: center; padding: 8px;"><div class="community_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${community.date }" /></div>&nbsp;</td> --%>
<!-- 																			</tr> -->
<!-- 																		</table> -->
<!-- 																	</div> -->
<!-- 																	<hr> -->
<!-- 																</div> -->
<%-- 															</c:forEach> --%>
<%-- 														</c:when> --%>
<%-- 														<c:otherwise> --%>
<!-- 															<div class="community_no_post">작성한 커뮤니티 글이 없습니다.</div> -->
<%-- 														</c:otherwise> --%>
<%-- 													</c:choose> --%>
													
<!-- 													<div id="tab03"> -->
<!-- 														<div class="info_grid"> -->
<!-- 															<div class="store_review"> -->
<!-- 																<table width="100%" height="140"> -->
<!-- 																	<tr> -->
<!-- 																		<td width="20%" rowspan="2" style="padding: 10px"> -->
<!-- 																			<div id="img_box"> -->
<%-- 																				<a id="market_review_img_area" href="#"> <img id="store_review_img" src="${pageContext.request.contextPath}/resources/user/img/character_sample2.jpg" width="100" height="100" alt="상점이미지"> --%>
<!-- 																				</a> -->
<!-- 																			</div> -->
<!-- 																		</td> -->
<!-- 																		<td style="font-size: 20px" width="10%" height="40px"><div  style="color: #26e4ca;">닉네임</div></td> -->
<!-- 																		<td width="30%"> -->
<!-- 																			<div class=""> -->
<%-- 																				<a class="" href="#"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" --%>
<%-- 																					width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> --%>
<!-- 																				</a> -->
<!-- 																			</div> -->
<!-- 																		</td> -->
<!-- 																		<td style="font-size: 15px" width="10%"> -->
<!-- 																			<div id="date" style="text-align: right">1달 전</div> -->
<!-- 																		</td> -->
<!-- 																	</tr> -->
<!-- 																	<tr> -->
<!-- 																		<td align="left" colspan="4" style="font-size: 15px"> -->
<!-- 																			<button id="btn_sold_product_name"> -->
<%-- 																				&nbsp;에스파 지젤 포토카드 <img src="${pageContext.request.contextPath}/resources/user/img/arrow_icon.png" width="6" height="10" alt="화살표 아이콘">&nbsp; --%>
<!-- 																			</button> -->
<!-- 																			<div id="sold_product_review">빠른 쿨거래 해주셔서 너무 좋았어요!나불나불나불나불나불어찌고저찌고저찌고나불나불나불나불나불어찌고저찌고저찌</div> -->
<!-- 																		</td> -->
<!-- 																	</tr> -->
<!-- 																</table> -->
<!-- 																<br> -->
<!-- 																<hr> -->
<!-- 															</div> -->
<!-- 															<br> -->
<!-- 															<div class="store_review"> -->
<!-- 																<table width="100%" height="120"> -->
<!-- 																	<tr height="30"> -->
<!-- 																		<td width="20%" rowspan="2" style="padding: 10px"><a id="market_review_img_area" href="#"> -->
<!-- 																				<div id="img_box"> -->
<%-- 																					<img id="store_review_img" src="${pageContext.request.contextPath}/resources/user/img/character_sample1.jpg" alt="상점이미지"> --%>
<!-- 																				</div> -->
<!-- 																		</a></td> -->
<!-- 																		<td style="font-size: 20px" width="10%"><a href="#" style="color: #26e4ca">닉네임</a></td> -->
<!-- 																		<td width="30%"><a class="" href="#"> -->
<!-- 																				<div class=""> -->
<%-- 																					<img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" --%>
<%-- 																						alt="별점이미지"> <img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> --%>
<!-- 																				</div> -->
<!-- 																		</a></td> -->
<!-- 																		<td style="font-size: 15px" width="10%"> -->
<!-- 																			<div id="date" style="text-align: right">1달 전</div> -->
<!-- 																		</td> -->
<!-- 																	</tr> -->
<!-- 																	<tr> -->
<!-- 																		<td align="left" colspan="4" style="font-size: 15px"> -->
<!-- 																			<button id="btn_sold_product_name"> -->
<%-- 																				&nbsp;에스파 지젤 포토카드 <img src="${pageContext.request.contextPath}/resources/user/img/arrow_icon.png" width="6" height="10" alt="화살표 아이콘">&nbsp; --%>
<!-- 																			</button> -->
<!-- 																			<div id="sold_product_review">빠른 쿨거래 해주셔서 너무 좋았어요!나불나불나불나불나불어찌고저찌고저찌고나불나불나불나불나불어찌고저찌고저찌 좋았어요!나불나불나불나불나불어찌고저찌고저찌고나불나불나불나불나불어찌고저찌고저찌</div> -->
<!-- 																		</td> -->
<!-- 																	</tr> -->
<!-- 																</table> -->
<!-- 																<br> -->
<!-- 																<hr> -->
<!-- 															</div> -->
<!-- 															<div class="transmit_no_post">받은 거래 후기가 없습니다.</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										End tab										 -->
<!-- 									    </div>		     -->
<!-- 									</div> -->
<!-- 								<script> -->
<!-- // 								/*상품 후기 작성자 및 팔로우 팔로워 프로필 모달*/ -->
<!-- // 								  $(document).ready(function( $ ){      -->
<!-- // 								    $(".reviewer_nick").on("click", function(event) {  //팝업오픈 버튼 누르면 -->
<!-- // 								    $("#popup01").show();   //팝업 오픈 -->
<!-- // 								    $("body").append('<div class="backon"></div>'); //뒷배경 생성 -->
<!-- // 								    }); -->
								    
<!-- // 								    $("body").on("click", function(event) {  -->
<!-- // 								        if(event.target.className == 'close' || event.target.className == 'backon'){ -->
<!-- // 								            $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제 -->
<!-- // 								              $(".backon").hide(); -->
<!-- // 								        } -->
<!-- // 								      }); -->
								 
<!-- // 								  }); -->
								  
<!-- // 								//tab 만들기  -->
<!-- // 									$(function(){ -->
<!-- // 										  $('.tabcontent > div').hide(); -->
<!-- // 										  $('.tabnav a').click(function () { -->
<!-- // 										    $('.tabcontent > div').hide().filter(this.hash).fadeIn(); -->
<!-- // 										    $('.tabnav a').removeClass('active'); -->
<!-- // 										    $(this).addClass('active'); -->
<!-- // 										    return false; -->
<!-- // 										  }).filter(':eq(0)').click(); -->
<!-- // 										  }); -->

<!-- 								</script> -->



							
							<div class="following_all" id="following_re">
								<hr>
								<br> <br>
								<p>
									<span><strong>팔로잉 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(following)}</span>
								</p>
								<div class="following_all_grid">
									<c:forEach var="followings" items="${following }">
										<div class="following">
											<div id="following_img_box">
												<a class="following_img_area" style="cursor: pointer" > 
													<img id="following_img" src="${followings.profile }" alt="상점이미지">
												</a>
											</div>
											<input type="hidden" value="${followings.nickname }"/>
											<div class="store_review_text_area" style="cursor: pointer">
												<div class="">
													<a class="following_nick_name" style="color: #26e4ca">${followings.nickname }</a>
												</div>
												<div>
													<span class="">상품</span> 
													<span>
														<a class="" href=# style="color: #26e4ca">${followings.content }</a> | 
													</span> 
													<span class="">팔로워</span> 
													<span>
														<a class="" href="#" style="color: #26e4ca">${followings.following }</a>
													</span>
												</div>
											</div>
											<div class="">
												<c:set var="star" value="${followings.rating }"/>
												<c:forEach var="i" begin="1" end="${star }">
													<img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> 
												</c:forEach>
												<c:if test="${star % 1 > 0 }">
													<img src="${pageContext.request.contextPath}/resources/user/img/star_rank_half.png" width="15" height="14" alt="별점이미지">
												</c:if>
											</div>
											<button id="btn_sold_product_name" class="btn_sold_product_name">
												&nbsp;언팔로우 <img src="${pageContext.request.contextPath}/resources/user/img/following_icon.png" width="15" height="10" alt="팔로잉아이콘">&nbsp;
											</button>
											<input type="hidden" value="${followings.nickname }"/>
										</div>
									</c:forEach>
								</div>
							</div>
							
							<br> <br> <br>
<!-- 							<script>
								/*상품 후기 작성자 및 팔로우 팔로워 프로필 모달*/
								  $(document).ready(function( $ ){     
								    $(".following_img_area").on("click", function(event) {  //팝업오픈 버튼 누르면
								    	var target = $(this).next().val();
								    	
									    $("#popup01").show();   //팝업 오픈
									    $("body").append('<div class="backon"></div>'); //뒷배경 생성
								    });
								    
								    $("body").on("click", function(event) { 
								        if(event.target.className == 'close' || event.target.className == 'backon'){
								            $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
								              $(".backon").hide();
								        }
								      });
								 
								  });
								  $(document).ready(function( $ ){     
									    $(".store_review_text_area").on("click", function(event) {  //팝업오픈 버튼 누르면
									    $("#popup01").show();   //팝업 오픈
									    $("body").append('<div class="backon"></div>'); //뒷배경 생성
									    });
									    
									    $("body").on("click", function(event) { 
									        if(event.target.className == 'close' || event.target.className == 'backon'){
									            $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
									              $(".backon").hide();
									        }
									      });
									 
									  });	
								 
								</script>
 -->								
								
								
							<div class="follower_all">
								<hr>
								<br> <br>
								<p>
									<span><strong>팔로워 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(follower)}</span>
								</p>
								<div class="following_all_grid">
									<c:forEach var="followers" items="${follower }">
										<div class="following">
											<a class="following_img_area" style="cursor:pointer"> <!-- 이미지를 눌렀을 때 해당상점으로 이동 -->
												<div id="following_img_box">
													<img id="following_img" src="${followers.profile }" alt="상점이미지">
												</div>
											</a>
											<div class="store_review_text_area" style="cursor:pointer">
												<div class="">
													<a class="" style="color: #26e4ca">${followers.nickname }</a>
												</div>
												<div>
													<span class="">상품</span> <span><a class="" href="#" style="color: #26e4ca">${followers.content }</a> &nbsp;|&nbsp; </span> 
													<span class="">팔로워</span> <span><a class="" href="#" style="color: #26e4ca">
													<c:choose>
													<c:when test="${followers.follower eq null }">
													0
													</c:when>
													<c:otherwise>
													${followers.follower}
													</c:otherwise>
													</c:choose>
													</a></span>
												</div>
											</div>
											<div class="">
												<c:set var="star" value="${followers.rating }"/>
												<c:forEach var="i" begin="1" end="${star }">
													<img src="${pageContext.request.contextPath}/resources/user/img/star_rank.png" width="15" height="14" alt="별점이미지"> 
												</c:forEach>
												<c:if test="${star % 1 > 0 }">
													<img src="${pageContext.request.contextPath}/resources/user/img/star_rank_half.png" width="15" height="14" alt="별점이미지">
												</c:if>
											</div>
											<c:choose>
											<c:when test="${followers.status eq null }">
												<button id="btn_sold_product_name" class="btn_sold_product">
													&nbsp;팔로우 <img src="${pageContext.request.contextPath}/resources/user/img/following_icon.png" width="15" height="10" alt="팔로잉아이콘">&nbsp;
												</button>
											</c:when>
											<c:otherwise>
												<button id="btn_sold_product_name" class="btn_sold_product_name">
													&nbsp;언팔로우 <img src="${pageContext.request.contextPath}/resources/user/img/following_icon.png" width="15" height="10" alt="팔로잉아이콘">&nbsp;
												</button>
											</c:otherwise>
											</c:choose>
											<input type="hidden" value="${followers.nickname }"/>
										</div>
									</c:forEach>
								</div>
							</div>
							
							<!-- 언팔로우 -->
							<script>
								$(".btn_sold_product_name").click(function(){
									var seller = $(this).next().val();
									$.ajax({
										url : "/profileUnfollow.do",
										type : "post",
										data : {
											seller : seller
										},
										success : function(data) {
											location.href="profile.do";
										}
									});
								});
							</script>
							<!-- 끝 언팔로우 -->
							
							<!-- 팔로우 버튼 -->
							<script>
								$(".btn_sold_product").click(function(){
									var seller2 = $(this).next().val();
									$.ajax({
										url : "/profileFollow.do",
										type : "post",
										data : {
											seller : seller2
										},
										success : function(data) {
											location.href="profile.do";
										}
									});
								});
							</script>
							<!-- 끝 팔로우 버튼 -->
							
							
							<!-- <script>
								/*상품 후기 작성자 및 팔로우 팔로워 프로필 모달*/
								  $(document).ready(function( $ ){     
								    $(".following_img_area").on("click", function(event) {  //팝업오픈 버튼 누르면
								    $("#popup01").show();   //팝업 오픈
								    $("body").append('<div class="backon"></div>'); //뒷배경 생성
								    });
								    
								    $("body").on("click", function(event) { 
								        if(event.target.className == 'close' || event.target.className == 'backon'){
								            $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
								              $(".backon").hide();
								        }
								      });
								 
								  });
								  $(document).ready(function( $ ){     
									    $(".store_review_text_area").on("click", function(event) {  //팝업오픈 버튼 누르면
									    $("#popup01").show();   //팝업 오픈
									    $("body").append('<div class="backon"></div>'); //뒷배경 생성
									    });
									    
									    $("body").on("click", function(event) { 
									        if(event.target.className == 'close' || event.target.className == 'backon'){
									            $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
									              $(".backon").hide();
									        }
									      });
									 
									  });	
								 
								</script> -->
							
						</div>
					</div>
					
					
					
					
					
					<!--나의 중고거래  -->
					<div class="tab-pane fade" id="Picture" role="tabpanel" aria-labelledby="profile-tab">
						<br>
						<div class="sell_list_all">
							<br>
							<p>
								<span><strong>판매내역 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(market)}</span>
							</p>
							<div class="sell_list_grid">
								<c:forEach var="market" items="${market }" varStatus="status">
									<div class="sell_list">
										<table width="100%" height="120">
											<tr height="30">
												<td align="left" style="font-size: 15px">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${market.date }" /></td>
												<td width="70%"></td>
											</tr>
											<tr>
												<td rowspan="3">
													<div id="product_img_box">
														<a id="store_review_img_area" href="marketBoard.do?seq=${market.market_seq }">
															<img id="sell_product_img" src="${market.url }" alt="판매상품이미지">
														</a>	
													</div>
												</td>
												<td style="font-size: 18px"><a href="marketBoard.do?seq=${market.market_seq }" style="color: #26e4ca">${market.product_name }</a></td>
											</tr>
											<tr>
												<td style="font-size: 15px">${market.product_price }&nbsp;원</td>
											</tr>
											<tr>
												<td>
												<c:choose>
														<c:when test="${market.status eq 1}">																											
															<button class="btn_sell_product_state">판매중</button>
															<input type="hidden" name="market_seq" value="${market.market_seq}" >
															<button class="btn_sell_product_edit" onclick="location.href='updateMarket.do?seq=${market.market_seq}'">글 수정</button>		
														</c:when>
														<c:otherwise>
															<button id="btn_sold_product_state">판매완료</button>
														</c:otherwise>
													</c:choose>
												</td>
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
						
						
						<div id="popup02">
							<div>
								<div style="font-size: 20px; margin-left:30px; margin-top:20px">📃&nbsp;판매 확정&nbsp;📃</div>
								<hr>
								<div>
									<div class="police_category" style="font-size:16px; margin-left:30px">
										<div>
											<span style="color: #26e4ca;">구매자</span>&nbsp;확인
											<div>
												<input form="form1" type="text" id="deal_completed_preson" style="width:250px" name="buyer">
												<input id="nickCck"type="button" class="btn_check" value="확인" style="width:40px;">
												<div id="chMsg" style="color: red; display: none;">존재하지 않는 사람입니다.</div>
												<div id="cheMsg" style="color: skyblue; display: none;">확인되었습니다.</div>
												<script>
													$("#nickCck").click(function(){
														var nick = $(this).prev().val();
														$.ajax({
															url : 'nickCheck.do', 
															type : "post", 
															cache: false,
															headers: {"cache-control":"no-cache", "pragma": "no-cache"},
															data : nick, 
															dataType : "JSON",
															contentType : "application/json; charset=UTF-8",
															success : function(data){ 
																console.log(data.nickCheck);
																if(data.nickCheck > 0) {
																	$("#sellCheck").attr("disabled", false);
																	$("#cheMsg").attr('style', "display: block");
																	$("#cheMsg").css('color', 'skyblue');
																} else if(data.nickCheck == 0){
																	$("#chMsg").attr('style', "display: block");
																	$("#chMsg").css('color', 'red');
																}
															},
															error : function(data){
																alert('error');
															}//error
														})//ajax
													});
													
													$("#deal_completed_preson").keyup(function(){
														$("#sellCheck").attr("disabled", true);
														$("#chMsg").attr('style', "display: none");
														$("#cheMsg").attr('style', "display: none");
													});
												</script>
											</div>
										</div>
																					
									</div><br>
									<div style="text-align: center">
										<form action="marketFinish.do" method="post" id="form1">											
											<button id="sellCheck" class="modal_complete_btn" style="width: 90px; font-size: 15px" disabled>판매완료</button>
											<input id="sellID" name="buy_seq" type="hidden"/>
											<button type="button" class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
										</form>
									</div>
									<br>
								</div>
							</div>
							<a style="cursor: pointer; color: gray" class="close02">X</a>
						</div>
							<script>
								/*판매중을 거래완료로 변경하는 모달 */
								  $(document).ready(function( $ ){     
								    $(".btn_sell_product_state").on("click", function(event) {  //팝업오픈 버튼 누르면
									    var sell_id = $(this).next().val();
									    $("#popup02").show();   //팝업 오픈
									    $("body").append('<div class="backon"></div>'); //뒷배경 생성
									    $("#sellID").val(sell_id);
								    });
								    
								    $("body").on("click", function(event) { 
								        if(event.target.className == 'close02' || event.target.className == 'backon' || event.target.className =='modal_complete_btn' || event.target.className =='modal_cancle_btn' ){
								            $("#popup02").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
								              $(".backon").hide();
								        }
								      });
								 
								  });
								 	
								</script>
						
				<div class="sold_list_all">
							<hr>
							<br> <br>
							<p>
								<span><strong>구매내역 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(buy) }</span>
							</p>
							<div class="sell_list_grid">
								<c:forEach var="buy" items="${buy }">
								<div class="sell_list">
									<table width="100%" height="120">
										<tr height="30">
											<td align="left" style="font-size: 15px">&nbsp; <fmt:formatDate pattern="yyyy-MM-dd" value="${buy.sell_date }" /></td>
											<td width="70%"></td>
										</tr>
										<tr>
											<td rowspan="3"><a id="store_review_img_area" href="marketBoard.do?seq=${buy.market_seq }">
													<div id="product_img_box">
														<img id="sell_product_img" src="${buy.url }" alt="판매상품이미지">
													</div>
											</a></td>
											<td style="font-size: 18px"><a href="marketBoard.do?seq=${buy.market_seq }" style="color: gray">${buy.product_name }</a></td>
										</tr>
										<tr>
											<td style="font-size: 15px; color: gray"><fmt:formatNumber type="number" maxFractionDigits="3" value="${buy.product_price}" /> &nbsp;원</td>
										</tr>
										<tr>
											<td>
												<c:choose>
												<c:when test="${buy.content eq null }">
													<button class="btn_write_review" type="button" >거래후기쓰기</button>
													<input type="hidden" value="${buy.nickname }"/>
													<input type="hidden" value="${buy.market_seq }"/>
												</c:when>
												<c:otherwise>
													<button class="btn_see_review" type="button">작성후기보기</button>
													<input type="hidden" value="${buy.content }"/>
													<input type="hidden" value="${buy.product_name }"/>
												</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								</c:forEach>
								
								
							
								<!-- 거래후기 작성 모달 -->
								<div id="popup03">
									<div>
										<div style="font-size: 20px; margin-left:30px; margin-top:20px">✍&nbsp;거래후기 작성하기&nbsp;✍</div>
										<hr>
										<div>
											<div class="police_category">
												<div style="margin-left:30px">
													<span id="sellerName" style="color: #26e4ca; "></span> 님과의 거래에 평점 남기기
												</div>
												<div class="rating" style="margin-left:30px">
													<div class="startRadio">
														<label class="startRadio__box"> 
															<input form="formScore" type="radio" name="star" class="starScore" value="0.5"> 
															<span class="startRadio__img">                   
																<span class="blind">0.5</span>               
															</span>                                          
														</label> 
														                                            
														<label class="startRadio__box"> 
															<input form="formScore" type="radio" name="star" class="starScore" value="1.0"> 
															<span class="startRadio__img">                   
																<span class="blind">1.0</span>               
															</span>                                          
														</label>               
														                              
														<label class="startRadio__box"> 
															<input form="formScore" type="radio" name="star" class="starScore" value="1.5"> 
															<span class="startRadio__img">                   
																<span class="blind">1.5</span>               
															</span>                                          
														</label>                                             
														                                                     
														<label class="startRadio__box">                      
															<input form="formScore" type="radio" name="star" class="starScore" value="2.0"> 
															<span class="startRadio__img">
																<span class="blind">2.0</span>
															</span>																											
														</label> 
														
														<label class="startRadio__box"> 
															<input form="formScore" type="radio" name="star" class="starScore" value="2.5"> 
															<span class="startRadio__img">
																<span class="blind">2.5</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input form="formScore" type="radio" name="star" class="starScore" value="3.0"> 
															<span class="startRadio__img">
																<span class="blind">3.0</span>
															</span>
														</label> 
														
														<label class="startRadio__box">
															<input form="formScore" type="radio" name="star" class="starScore" value="3.5"> 
															<span class="startRadio__img">
																<span class="blind">3.5</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input form="formScore" type="radio" name="star" class="starScore" value="4.0"> 
															<span class="startRadio__img">
																<span class="blind">4.0</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input form="formScore" type="radio" name="star" class="starScore" value="4.5"> 
															<span class="startRadio__img">
																<span class="blind">4.5</span>
															</span>
														</label> 
														
														<label class="startRadio__box"> 
															<input form="formScore" type="radio" name="star" class="starScore" value="5.0" checked> 
															<span class="startRadio__img">
																<span class="blind">5.0</span>
															</span>
														</label>
													</div>
												</div>
											</div>
											<hr>
											<br>
											<div class="write_police_reason" style="margin-left:30px">
												<textarea form="formScore" name="content" style="border: 1px solid lightgray" rows="5" cols="63"></textarea>
											</div>
											<br>
											<div style="text-align: center; margin-bottom:20px">
												<form id="formScore" action="rating.do" method="post">
													<input type="hidden" value="" name="seq" id="seq"/>
													<button class="modal_complete_btn" style="width: 90px; font-size: 15px">후기 작성</button>
													<button type="button" class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
												</form>
											</div>
										</div>
									</div>
									<a style="cursor: pointer; color: gray" class="close03">X</a>
								</div>
								<script>
								/*거래후기 작성 모달*/
								  $(document).ready(function( $ ){     
								    $(".btn_write_review").on("click", function(event) {  //팝업오픈 버튼 누르면
								    	$("#sellerName").text($(this).next().val());
								    	$("#seq").val($(this).next().next().val());
								    $("#popup03").show();   //팝업 오픈
								    $("body").append('<div class="backon"></div>'); //뒷배경 생성
								    });
								    
								    $("body").on("click", function(event) { 
								        if(event.target.className == 'close03' || event.target.className == 'backon' || event.target.className =='modal_complete_btn' || event.target.className =='modal_cancle_btn' ){
								            $("#popup03").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
								              $(".backon").hide();
								        }
								      });
								 
								  });
								
									//평가점수버튼을 줘서 점수를 줬으면 버튼 활성화
									$(".rating").change(
											function() {
												$(".modal_complete_btn").attr(
														"disabled", false);

											});
								</script>
																					
								<br>
							</div>
							<!-- 작성한 거래 후기 보기 -->
								<div id="popup04">
									<div>
										<div style="font-size: 24px; margin-left:30px; margin-top:20px">📃&nbsp;작성한 후기 보기&nbsp;📃</div>
										<hr>
										<div>
											<div class="police_category">
												<div style="margin-left:30px">
													<span id="ratingName" style="color: #26e4ca"></span>&nbsp;후기
												</div>												
											</div>

											<div class="write_police_reason" style="border:none; margin-left:30px; padding:2px">
												<pre id="ratingContent" style="font-size:16px;">											
												</pre>
											</div>
											<br>
											<div style="text-align: center; margin-bottom:20px">
												<button class="modal_complete_btn" style="width: 90px; font-size: 15px">확인</button>
												<button class="modal_cancle_btn" style="width: 90px; font-size: 15px">취소</button>
											</div>
										</div>
									</div>
									<a style="cursor: pointer; color: gray" class="close04">X</a>
								</div>
							
							<script>
								/* 작성한 거래후기 보기 모달*/
								  $(document).ready(function( $ ){     
								    $(".btn_see_review").on("click", function(event) {  //팝업오픈 버튼 누르면
								    	$("#ratingContent").text($(this).next().val());
								    	$("#ratingName").text($(this).next().next().val());
									    $("#popup04").show();   //팝업 오픈
									    $("body").append('<div class="backon"></div>'); //뒷배경 생성
								    });
								    
								    $("body").on("click", function(event) { 
								        if(event.target.className == 'close04' || event.target.className == 'backon' || event.target.className =='modal_complete_btn' || event.target.className =='modal_cancle_btn' ){
								            $("#popup04").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
								              $(".backon").hide();
								        }
								      });
								 
								  });
								
							</script>
						</div>
					</div>
					<!-- 나의커뮤니티 -->
					<div class="tab-pane fade" id="shop" role="tabpanel" aria-labelledby="contact-tab">
						<div class="community_list_all">
							<br> <br>
							<p>
								<span><strong>내가 쓴 커뮤니티글 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(community)}</span>
							</p>
							<div class="community_list_grid">
								<c:forEach var="community" items="${community }">
									<div class="community_list" style="width:100% ; height:auto">
										<table width="100%" height="auto">
											<tr height="30">
												<td align="left" style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${community.date }" /></td>
												<td width="60%" align="center" style="font-size: 18px">
													<div>${community.category }</div>
													<div><a href="communityBoard.do?seq=${community.community_seq }">${community.title }</a></div>
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
													<form action="communityEdit.do" method="get">
														<input type="hidden" value="${community.community_seq }" name="seq"/>
														<button class="btn_community_update">글 수정</button>
													</form>
													<input type="button" class="btn_community_delete" value="글 삭제"/>
													<input type="hidden" value="${community.community_seq }"/>
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
						
						<script>
							$(".btn_community_delete").click(function(){
								var seq = $(this).next().val();
								var check = confirm("삭제하시겠습니까?");
								if(check) {
									$.ajax({
										url : "/deleteCommunity.do",
										type : "post",
										data : {
											seq : seq
										},
										success : function(data) {
											location.href="profile.do"
										}
									});
								}
							});							
						</script>
						
						
						<br> <br> <br>
						<div class="community_comment_list_all" id="commentList">
							<hr>
							<br> <br>
							<p>
								<span><strong>내가 쓴 커뮤니티 댓글 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(commentList)}</span>
							</p>
							<div class="community_comment_list_grid">
								<c:forEach var="comment" items="${commentList }">
									<div class="community_comment_list" style="width:100% ; height:auto">
										<table width="100%" height="auto">
											<tr height="30">
												<td align="left" style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.date }" /></td>
												<td width="70%" align="center" style="font-size: 18px">
													<div><a href="communityBoard.do?seq=${comment.board_seq }" style="color: gray;">[원글] ${comment.title }</a></div>
													<div>
														&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/resources/user/img/right-arrow.png" style="width: 9px; height: 9px"> [내가 쓴 댓글] ${comment.content }
													</div>
												</td>
												<td width="20%" align="center">
													<button class="btn_community_comment_delete">댓글 삭제</button>
													<input type="hidden" value="${comment.comment_seq }"/>
												</td>
											</tr>
										</table>
										<br>
										<hr>
									</div>
								</c:forEach>
								
								<script>
									$(".btn_community_comment_delete").click(function(){
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
													location.href="profile.do";
												}
											});
										}
									});							
								</script>
								
								<br>
							</div>
						</div>
					</div>
					
					
					
					<!-- 나의 스토어거래 -->
					<div class="tab-pane fade" id="accom" role="tabpanel" aria-labelledby="contact-tab">
						<div class="store_bought_list_all">
							<br> <br>
							<p>
								<span><strong>스토어 상품 구매 내역 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(history) }</span>
							</p>
							<div class="store_bought_list_grid">
								<c:forEach var="his" items="${history }">
									<c:choose>
										<c:when test="${his.status eq '상품 준비 중' }">
											<div class="store_bought_list">
												<table width="100%" height="120">
													<tr>
														<c:choose>
														<c:when test="${his.cancel_status eq null }">
															<td height=40px align="left" colspan="3" style="font-size: 20px">${his.status }</td>
														</c:when>
														<c:otherwise>
															<td height=40px  align="left" colspan="3" style="font-size: 20px">${his.pay_cancel }</td>
														</c:otherwise>
														</c:choose>
													</tr>
													<tr>
														<td>
															<div id="product_img_box">
																<a id="store_review_img_area" href="storeBoard.do?seq=${his.store_seq }">
																	<img id="bought_product_img" src="${his.url }" alt="판매완료상품이미지">
																</a>
															</div>
														</td>
														<td align="left" style="font-size: 15px">
															<div style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${his.date }" /> 결제</div>
															<div style="font-size: 18px"><a href="storeBoard.do?seq=${his.store_seq }">${his.product_name }</a></div>
															<div>
																<span style="font-size: 18px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${his.product_price}" /></span>&nbsp;원
															</div>
															<div style="font-size: 15px; margin-top:10px">
																🚛&nbsp; <span>${his.address2 }</span>&nbsp;🚛
															</div>
														</td>
														<td align="center">
															<div>
																<c:if test="${his.cancel_status eq null }">
																	<button class="btn_order_cancle">취소 요청</button>
																	<input type="hidden" name="transaction_product_name" value="${his.product_name}" >
																	<input type="hidden" value="${his.transaction_seq }"/>
																</c:if>
															</div>
															<div>
																<button type="button" id="btn_seller_ask" onclick="location.href='storeBoard.do?seq=${his.store_seq}#ask_about_product'">판매자 문의</button>
															</div>
														</td>
													</tr>
												</table>
												<br><hr>
											</div>
										</c:when>
										<c:when test="${his.status eq '상품 배송 중' }">
											<div class="store_bought_list">
												<table width="100%" height="120">
													<tr>
														<c:choose>
														<c:when test="${his.cancel_status eq null }">
															<td height=40px  align="left" colspan="3" style="font-size: 20px">${his.status }</td>
														</c:when>
														<c:otherwise>
															<td height=40px  align="left" colspan="3" style="font-size: 20px">${his.pay_cancel }</td>
														</c:otherwise>
														</c:choose>
													</tr>
													<tr>
														<td>
															<div id="product_img_box">
																<a id="store_review_img_area" href="storeBoard.do?seq=${his.store_seq }"> 
																	<img id="bought_product_img" src="${his.url }" alt="판매완료상품이미지">
																</a>
															</div>
														</td>
														<td align="left" style="font-size: 15px">
															<div style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${his.date }" /> 결제</div>
															<div style="font-size: 18px"><a href="storeBoard.do?seq=${his.store_seq }">${his.product_name }</a></div>
															<div>
																<span style="font-size: 18px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${his.product_price}" /></span>&nbsp;원
															</div>
															<div style="font-size: 15px; margin-top:10px">
																🚛&nbsp;<span>${his.address2 }</span>&nbsp;🚛
															</div></td>
														<td align="center">
															<c:if test="${his.cancel_status eq null }">
															<div>
																<button class="btn_order_cancle">취소 요청</button>
																<input type="hidden" name="transaction_product_name" value="${his.product_name}" >
																<input type="hidden" value="${his.transaction_seq }"/>
															</div>
															<div>
																<button id="btn_store_bought_product">배송 조회</button>
															</div>
															</c:if>
															<div>
																<button id="btn_seller_ask" onclick="location.href='storeBoard.do?seq=${his.store_seq}#ask_about_product'">판매자 문의</button>
															</div>
														</td>
													</tr>
												</table>
												<br><hr>
											</div>
										</c:when>
										<c:when test="${his.status eq '상품 배송 완료' }">
											<div class="store_bought_list">
												<table style="width: 100%; height: 120px;">
													<tr>
														<c:choose>
														<c:when test="${his.cancel_status eq null }">
															<td  height=40px  align="left" colspan="3" style="font-size: 20px">${his.status }</td>
														</c:when>
														<c:otherwise>
															<td height=40px  align="left" colspan="3" style="font-size: 20px">${his.pay_cancel }</td>
														</c:otherwise>
														</c:choose>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td>
															<div id="product_img_box">
																<a id="store_review_img_area" href="storeBoard.do?seq=${his.store_seq }">
																	<img id="bought_product_img" src="${his.url }" alt="판매완료상품이미지">
																</a>
															</div>
														</td>
														<td align="left" style="font-size: 15px">
															<div style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${his.date }" /> 결제</div>
															<div style="font-size: 18px"><a href="storeBoard.do?seq=${his.store_seq }">${his.product_name }</a></div>
															<div>
																<span style="font-size: 18px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${his.product_price}" /></span>&nbsp;원
															</div>
															<div style="font-size: 15px; margin-top:10px">
																🚛&nbsp; <span>${his.address2 }</span>&nbsp;🚛
															</div>
														</td>
														<td align="center">
															<c:if test="${his.cancel_status eq null }">
															<div>
																<button class="btn_store_bought_return_ask">반품 요청</button>
																<input type="hidden" name="transaction_product_name" value="${his.product_name}" >
																<input type="hidden" value="${his.transaction_seq }"/>
															</div>
															<div>
																<button class="btn_store_bought_exchange_product">교환 요청</button>
																<input type="hidden" name="transaction_product_name" value="${his.product_name}" >
																<input type="hidden" value="${his.transaction_seq }"/>
															</div>
															
															<div>
																<button id="btn_store_bought_product" onclick="location.href='storeBoard.do?seq=${his.store_seq}#wirte_product_review'">상품 리뷰 쓰기</button>
															</div>
															</c:if>
															<div>
																<button id="btn_seller_ask" onclick="location.href='storeBoard.do?seq=${his.store_seq}#ask_about_product'">판매자 문의</button>
															</div>
														</td>
													</tr>
												</table>
												<br><hr>
											</div>
										</c:when>
										<c:otherwise>
											<div class="store_bought_list">
												<table style="width: 100%; height: 120px;">
													<tr>
														<td height=40px align="left" colspan="3" style="font-size: 20px">${his.pay_cancel }</td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td>
															<div id="product_img_box">
																<a id="store_review_img_area" href="storeBoard.do?seq=${his.store_seq }">
																	<img id="bought_product_img" src="${his.url }" alt="판매완료상품이미지">
																</a>
															</div>
														</td>
														<td align="left" style="font-size: 15px">
															<div style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${his.date }" /> 결제</div>
															<div style="font-size: 18px"><a href="storeBoard.do?seq=${his.store_seq }">${his.product_name }</a></div>
															<div>
																<span style="font-size: 18px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${his.product_price}" /></span>&nbsp;원
															</div>
															<div style="font-size: 15px; margin-top:10px">
																🚛&nbsp; <span>${his.address2 }</span>&nbsp;🚛
															</div>
														</td>
														<td align="center">
															<div>
																<button id="btn_seller_ask" onclick="location.href='storeBoard.do?seq=${his.store_seq}#ask_about_product'">판매자 문의</button>
															</div>
														</td>
													</tr>
												</table>
												<br><hr>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								
								
										
								<!-- 스토어 상품 주문 취소요청 모달 -->				
								<div id="popup05">
									<div>
										<div style="font-size: 20px; margin-left:30px; margin-top:20px"> ❌&nbsp;상품 주문 취소하기&nbsp;❌ </div>
										<hr>
										<div>
											<div class="police_category" style="margin-left:30px">
												<div style="margin-bottom:15px">
													<span style="font-size:16px">주문 취소 상품 : </span>
													<input type="text" id="order_product" value="" width="auto" readonly style="color: #26e4ca; border:0px; font-size:18px">													
												</div>
												<div class="police_category">
													<span style="padding-right: 10px">취소사유</span>
													<select class="order_cancle_reason" name="cancel_reason" form="formCancel">
														<option value="">취소 사유 선택</option>
														<option value="품절">상품 품절 </option>
														<option value="배송지연">배송 지연</option>
														<option value="서비스불만족">서비스 불만족</option>
														<option value="변심">구매의사 취소</option>
														<option value="잘못주문">다른 상품 잘못 주문</option>
														<option value="기타">기타(사유)</option>
													</select>
												</div>
											</div>
											<hr>
											<br>
											<div class="write_police_reason" style="margin-left:30px">
												<textarea name="content" form="formCancel" style="border: 1px solid lightgray" rows="5" cols="63"></textarea>
											</div>
											
											<div style="font-size:14px; color:gray; margin-left:30px">※ 취소 완료 시 결제했던 수단으로 환불됩니다.</div>
											<br>
											<div style="text-align: center">		
												<form id="formCancel" action="payCancel.do" method="post">						
													<input type="hidden" value="" id="cancelSeq" name="cancelSeq"/>
													<input type="hidden" value="취소 처리 중" name="pay_cancel"/>
													<button class="modal_cancel_request_btn" disabled style="width: 90px; font-size: 15px">취소신청</button>
												</form>
											</div>
											<br>
										</div>
									</div>
									<a style="cursor: pointer; color: gray" class="close05">X</a>
								</div> 
								<script type="text/javascript">
								/* 스토어 상품 주문 취소 모달*/
								  $(document).ready(function( $ ){     
								    $(".btn_order_cancle").on("click", function(event) {  //팝업오픈 버튼 누르면
								    	$("#order_product").val($(this).next().val());
								    	$("#cancelSeq").val($(this).next().next().val());
								   		$("#popup05").show();   //팝업 오픈
								    	$("body").append('<div class="backon"></div>'); //뒷배경 생성
								    });
								    
								    $("body").on("click", function(event) { 
								        if(event.target.className == 'close05' || event.target.className == 'backon'  || event.target.className =='modal_cancel_request_btn' ){
								            $("#popup05").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
								              $(".backon").hide();
								        }
								      });
								 
								  });
								
									//취소사유 select box 선택 사유가 없을 경우 버튼 비활성화
								 	$(".order_cancle_reason").change(function(){
										if($(".order_cancle_reason").val() == ''){
											$(".modal_cancel_request_btn").attr("disabled",true);
														
										}else{
											$(".modal_cancel_request_btn").attr("disabled",false);
										}
									});
								</script>
											
								
								
								
								
								
								<!-- 스토어 상품 반품요청 모달 -->				
								<div id="popup06">
									<div>
										<div style="font-size: 20px; margin-left:30px; margin-top:20px">   🔀&nbsp;주문한 상품 반품하기&nbsp;🔀 </div>
										<hr>
										<div>
											<div class="police_category" style="margin-left:30px">
												<div style="margin-bottom:15px">
													<span style="font-size:16px">반품 요청 상품 : </span>
													<input type="text" id="refund_product" value="" width="auto" readonly style="color: #26e4ca; border:0px; font-size:18px">
												</div>
												<div class="police_category">
													<span style="padding-right: 10px">반품사유</span>
													<select class="order_refund_reason" name="cancel_reason" form="exForm">
														<option value="">반품 사유 선택</option>
														<option value="배송누락">배송 누락</option>
														<option value="배송지연">배송 지연</option>
														<option value="상품파손">상품파손</option>
														<option value="포장불량">포장불량</option>
														<option value="상품정보상이">상품정보상이</option>
														<option value="서비스불만족">서비스 불만족</option>
														<option value="변심">구매의사 취소</option>
														<option value="잘못주문">다른 상품 잘못 주문</option>
														<option value="기타">기타(사유)</option>
													</select>
												</div>
											</div>
											<hr>
											<br>
											<div class="write_police_reason" style="margin-left:30px">
												<textarea name="content" style="border: 1px solid lightgray" rows="5" cols="63"></textarea>
											</div>
											
											<div style="font-size:14px; color:gray; margin-left:30px">※ 반품 요청 시 등록한 주소로 담당 택배사 직원이 3~4일 이내로 수거 예정입니다.</div>
											<div style="font-size:14px; color:gray; margin-left:30px">※ 단순변심으로 인한 교환/반품의 경우 왕복 배송비 5,000원은 고객측 부담입니다.</div>
											<br>
											<div style="text-align: center">
												<form id="exForm" action="payCancel.do" method="post">								
													<button class="modal_refund_btn" disabled style="width: 90px; font-size: 15px">반품신청</button>
													<input type="hidden" name="pay_cancel" value="반품 처리 중"/>
													<input type="hidden" name="cancelSeq" value="" id="exSeq"/>
												</form>
											</div>
											<br>
										</div>
									</div>
									<a style="cursor: pointer; color: gray" class="close06">X</a>
								</div>
								<script>
								/* 스토어 상품 주문 반품요청 모달*/
								  $(document).ready(function( $ ){     
								    $(".btn_store_bought_return_ask").on("click", function(event) {  //팝업오픈 버튼 누르면
									    $("#refund_product").val($(this).next().val());	
									    $("#exSeq").val($(this).next().next().val());
									   	$("#popup06").show();   //팝업 오픈
									    $("body").append('<div class="backon"></div>'); //뒷배경 생성
								    });
								    
								    $("body").on("click", function(event) { 
								        if(event.target.className == 'close06' || event.target.className == 'backon' || event.target.className =='modal_police_btn' || event.target.className =='modal_refund_btn' ){
								            $("#popup06").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
								              $(".backon").hide();
								        }
								      });
								 
								  });
								
									//반품사유 select box 선택 사유가 없을 경우 버튼 비활성화
								 	$(".order_refund_reason").change(function(){
										if($(".order_refund_reason").val() == ''){
											$(".modal_refund_btn").attr("disabled",true);
														
										}else{
											$(".modal_refund_btn").attr("disabled",false);
										}
									});
								</script>
								
								<!-- 스토어 상품 교환요청 모달  -->		
								<div id="popup07">
									<div>
										<div style="font-size: 20px; margin-left:30px; margin-top:20px">   🔁&nbsp;주문한 상품 교환하기&nbsp;🔁 </div>
										<hr>
										<div>
											<div class="police_category" style="margin-left:30px">
												<div style="margin-bottom:15px">
													<span style="font-size:16px">교환 요청 상품 : </span>
													<input type="text" id="exchange_product" value="" width="auto" readonly style="color: #26e4ca; border:0px; font-size:18px">
												</div>
												<div class="police_category">
													<span style="padding-right: 10px">교환사유</span>
													<select form="ex2Form" class="order_exchange_reason" name="cancel_reason">
														<option value="">교환 사유 선택</option>
														<option value="배송누락">배송 누락</option>
														<option value="배송지연">배송 지연</option>
														<option value="상품파손">상품파손</option>
														<option value="포장불량">포장불량</option>
														<option value="상품정보상이">상품정보상이</option>
														<option value="서비스불만족">서비스 불만족</option>
														<option value="변심">구매의사 취소</option>
														<option value="잘못주문">다른 상품 잘못 주문</option>
														<option value="기타">기타(사유)</option>
													</select>
												</div>
											</div>
											<hr>
											<br>
											<div class="write_police_reason" style="margin-left:30px">
												<textarea form="ex2Form" style="border: 1px solid lightgray" rows="5" cols="63"></textarea>
											</div>
											
											<div style="font-size:14px; color:gray; margin-left:30px">※ 교환요청 시 등록한 주소로 담당 택배사 직원이 3~4일 이내로 수거 예정입니다.</div>
											<div style="font-size:14px; color:gray; margin-left:30px">※ 단순변심으로 인한 교환/반품의 경우 왕복 배송비 5,000원은 고객측 부담입니다.</div>
											<br>
											<div style="text-align: center">
												<form id="ex2Form" action="payCancel.do" method="post">									
													<button class="modal_exchange_btn" disabled style="width: 90px; font-size: 15px">교환신청</button>
													<input type="hidden" name="pay_cancel" value="교환 처리 중"/>
													<input type="hidden" name="cancelSeq" value="" id="ex2Seq"/>
												</form>
											</div>
											<br> 
										</div>
									</div>
									<a style="cursor: pointer; color: gray" class="close07">X</a>
								</div>
								<script type="text/javascript">
								/* 스토어 상품 주문 교환요청 모달*/
								  $(document).ready(function( $ ){     
								    $(".btn_store_bought_exchange_product").on("click", function(event) {  //팝업오픈 버튼 누르면
								    	$("#exchange_product").val($(this).next().val());
								    	$("#ex2Seq").val($(this).next().next().val());
									    $("#popup07").show();   //팝업 오픈
									    $("body").append('<div class="backon"></div>'); //뒷배경 생성
									    });
								    
								    $("body").on("click", function(event) { 
								        if(event.target.className == 'close07' || event.target.className == 'backon' || event.target.className =='modal_police_btn' || event.target.className =='modal_exchange_btn' ){
								            $("#popup07").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
								              $(".backon").hide();
								        }
								      });

								  });
								
									//교환사유 select box 선택 사유가 없을 경우 버튼 비활성화
								 	$(".order_exchange_reason").change(function(){
										if($(".order_exchange_reason").val() == ''){
											$(".modal_exchange_btn").attr("disabled",true);
														
										}else{
											$(".modal_exchange_btn").attr("disabled",false);
										}
									});
								</script>
								
								
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="heart_product" role="tabpanel" aria-labelledby="contact-tab">
						<br> <br>
						<div class="heart_list_all">
							<p>
								<span><strong>중고거래 관심상품 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(marketLike)}</span>
							</p>
							<div class="sell_list_grid">
								<c:forEach var="mlike" items="${marketLike }">
								<div class="sell_list">
									<table width="100%" height="120">
										<tr height="30">
											<td colspan="2" width=200px align="left" style="font-size: 15px">&nbsp; <fmt:formatDate pattern="yyyy-MM-dd" value="${mlike.date }" /></td>
										</tr>
										<tr >
											<td rowspan="3" width=200px>
												<a id="store_review_img_area" href="#">
														<div id="product_img_box">
															<img id="sell_product_img" src="${mlike.url }" alt="판매상품이미지">
														</div>
												</a>
											</td>
											<td style="font-size: 18px"><a href="marketBoard.do?seq=${mlike.market_seq }" style="color: #26e4ca">${mlike.product_name }</a></td>
										</tr>
										<tr>
											<td style="font-size: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mlike.product_price}" /> &nbsp;원</td>
										</tr>
										<tr>
											<td>
												<button id="btn_heart_product" class="btn_heart_market" type="button">관심상품</button>
												<input type="hidden" value="${mlike.market_seq }"/>
											</td>
										</tr>
									</table>
									<br>
									<hr>
								</div>
								</c:forEach>
								<script>
								$(".btn_heart_market").click(function() {
									var seq = $(this).next().val();
									var check = confirm('취소하시겠습니까?');
									if(check) {
										$.ajax({
											url : "/marketHate.do",
											type : "post",
											data : {
												seq : seq
											},
											success : function(data) {
												location.href="profile.do";
											}
										});
									}
								});
								</script>
								<br>
							</div>
							<br> <br> 
						</div>
						<hr>
						<br> 
						<div class="heart_list_all">
							<p>
								<span><strong>민트스토어 관심상품 &nbsp;&nbsp;</strong></span> <span style="color: #26e4ca">${fn:length(storeLike) }</span>
							</p>
							<div class="sell_list_grid">
								<c:forEach var="slike" items="${storeLike }">
									<div class="sell_list" style="height:220px">
										<table width="100%" height="100">
											<tr>
												<td rowspan="3"  width=200px>
													<div id="product_img_box">
														<a id="store_review_img_area" href="#">
															<img id="sell_product_img" src="${slike.url }" alt="판매상품이미지">
														</a>
													</div>
												</td>
												<td style="font-size: 18px"><a href="storeBoard.do?seq=${slike.store_seq }" style="color: #26e4ca">${slike.product_name }</a></td>
											</tr>
											<tr>
												<td style="font-size: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${slike.product_price}" /> &nbsp;원</td>
											</tr>
											<tr>
												<td>
													<button id="btn_heart_product" class="btn_heart_store" type="button">관심상품</button>
													<input type="hidden" value="${slike.store_seq }"/>
												</td>
											</tr>
										</table>
										<br>
										<hr>
									</div>
								</c:forEach>
								<script>
								$(".btn_heart_store").click(function() {
									var seq = $(this).next().val();
									var check = confirm('취소하시겠습니까?');
									if(check) {
										$.ajax({
											url : "/storeHate.do",
											type : "post",
											data : {
												seq : seq
											},
											success : function(data) {
												location.href="profile.do";
											}
										});
									}
								});
								</script>
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
								<input class="form-input" type="file" name="file" multiple accept=".jpg, .png, .gif" onchange="preview();" required /> <br> <img class="preview-wrap" src="${user.profile }" alt="등록할 프로필 사진을 넣어주세요." /> <br>
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

		// 창 크기가 변할 때마다 가로세로 길이를 맞춰준다.
		$(window).resize(function() {
			$('.box').each(function() {
				$(this).height($(this).width());
			});
		}).resize();

	</script>
	
</article>
<br />
<br />
<br />
<br />
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>
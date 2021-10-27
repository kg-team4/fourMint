<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript" src="../js/mypage.js"></script>
    <link href="../css/8-1.mypage-top.css?ver=1" type="text/css" rel="stylesheet">
    <link href="../css/8-2.mypage-bottom.css?ver=1" type="text/css" rel="stylesheet">

        <article id="mypage-article">
            <div id="mypage-form">
                <div id="mypage-top">
                    <div id="mypage-top-left">
                        <div id="mypage-top-left-up">
                       			<img alt="닉네임" src="profile_img_down.user?member_img_no=1">
                       			<!-- 회원 이미지가 없을 경우 -->
                            	<img alt="user_profile_none" src="../img/user_profile.jpg">
                           	<label id="profile-edit" for="profile-check">
                          		<input type="checkbox" id="profile-check" class="profile-check" onchange="profileImgButton();">
                           				<span class="profileimg-button">
	                           			<!-- 마이페이지 회원이 자신일 경우 -->
	                           				<!-- 회원 이미지가 있을 경우 -->
	                           				<a href="profile_img_edit.jsp?no=1&member_img_no=1" onclick="window.open(this.href, '_blank', 'width=305px,height=400px,toolbars=no,scrollbars=no'); return false;" id="profile-img">수정</a>
	                           				<a href="delete_profile.user?member_img_no=1">삭제</a>
	                           				<!-- 회원 이미지가 없을 경우 -->
	                           				<a href="profile_img_create.jsp?no=1" onclick="window.open(this.href, '_blank', 'width=305px,height=400px,toolbars=no,scrollbars=no'); return false;" id="profile-img">추가</a>
                           		</span>
                           	</label>
                        </div>
                        <div id="mypage-top-left-down">
                            <div>
                                <a href="change_info.jsp?no=1"><button>회원정보 수정</button></a>
                                <a href="check_exit.jsp?no=1"><button>회원 탈퇴</button></a>
                            </div>
                        </div>
                    </div>
                    <div id="mypage-top-right">
                        <div id="mypage-top-right-up">
                            <div id="nickname">
                                <div>
                                    닉네임
                                    <ul>
                                        <li>
                                        	<form action="manner.user" method="post">
                                        		<input type="hidden" name="this_member_no" value="1"> <!-- 좋아요 누를 회원 -->
                                        		<input type="hidden" name="push_member_no" value="1"> <!-- 좋아요를 누른 회원 -->
                                        		<input type="hidden" name="path" value="<%-- <%=request.getRequestURI() %>?<%=request.getQueryString()%> --%>">
                                        		<input type="hidden" name="good" value="">
                                        		<input type="submit" value="좋아요" class="submit-button">
                                        	</form>
                                        </li>
                                        <li>
                                        	<form action="manner.user" method="post">
                                        		<input type="hidden" name="this_member_no" value="1"> <!-- 좋아요 누를 회원 -->
                                        		<input type="hidden" name="push_member_no" value="1"> <!-- 좋아요를 누른 회원 -->
                                        		<input type="hidden" name="path" value="<%-- <%=request.getRequestURI() %>?<%=request.getQueryString()%> --%>">
                                        		<input type="hidden" name="bad" value="">
                                        		<input type="submit" value="싫어요" class="submit-button">
                                        	</form>
                                        </li>
                                        <li><a href="">신고하기</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div id="manner">
                                <div>
                                   <span id="manner-count"><img src="../img/manner.png" style="width: 25px; height: auto;"></span><input type="range" value="1" readonly>
                                </div>
                            </div>
                        </div>
                        <div id="mypage-top-right-down">
                        
                            <div id="mypage-top-right-down-in">
                                <div id="intro-top">
                                    <div id="post-count">
                                        게시글 수 : 1
                                    </div>
                                    <div id="reply-count">
                                        댓글 수 : 1
                                    </div>
                                </div>
                                <div id="intro-bottom">
                                    <form action="edit_intro.user" method="post">
                                    	<input type="hidden" name="member_no" value="1">
                                        <textarea maxlength="800" name="intro">멋진 자기소개를 작성해주세요!</textarea>
                                        <input type="submit" value="">
                                    </form>
                                		<div id="intro-content">
                                			자기소개가 없어요! 
                                		</div>
                                	<div id="write-intro">
                                		<a href="info.jsp?no=1&edit_intro"><button></button></a>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mypage-bottom">
                    <div id="mypage-nav">
                        <div id="nav-1" class="back-color" onmouseover="radiusEdit(this);" onchange="changeBackcolor(this);">
                            <label for="select-1">
                                <input type="radio" name="board" id="select-1" onchange="toggleTabAuto(this);" checked>
                                <span>중고</span>
                            </label>
                        </div>
	                        <div id="nav-2" onmouseover="radiusEdit(this);" onchange="changeBackcolor(this);">
	                            <label for="select-2">
	                                <input type="radio" name="board" id="select-2" onchange="toggleTabAuto(this);">
	                                <span>홍보</span>
	                            </label>
	                        </div>
                        <div id="nav-3" onmouseover="radiusEdit(this);" onchange="changeBackcolor(this);">
                            <label for="select-3">
                                <input type="radio" name="board" id="select-3" onchange="toggleTabAuto(this);">
                                <span>댓글</span>
                            </label>
                        </div>
                        <div id="nav-5" onmouseover="radiusEdit(this);" onchange="changeBackcolor(this);">
                            <label for="select-4">
                                <input type="radio" name="board" id="select-4" onchange="toggleTabAuto(this);">
                                <span>찜꽁</span>
                            </label>
                        </div>
                    </div>

                    <div id="mypage-board">
                    <!-- 중고 거래 게시판 -->
                        <div class="area on" id="select-1-area">
                        <div class="empty"></div>
                            <div class="mypage-board-table">
                                <div class="mypage-post-list">
                                	<div style="flex: 9; width: 100%; heigth: 90%;">
                                		게시물이 없습니다.
                                	</div>
	                                    <div class="product">
	                                        <div class="product-inner">
	                                        	<div class="photo">
	                                        		<a href="../board/used_post_content.jsp?board_no=1&used_cate_num=1&post_no=1&board_no=1"><img src="../board/showImg.user?post_img_no=1"></a>
	                                        	</div>
	                                        	<div class="product-title">
	                                        		<a href="../board/used_post_content.jsp?board_no=1&used_cate_num=1&post_no=1&board_no=1">제목...</a>	
	                                        	</div>
	                                        	<div class="map">
	                                        		<div>
		                                        		시 군 구
	                                        		</div>
	                                        	</div>
	                                        	<div class="price-date">
	                                        		<div class="price">가격</div>
	                                        		<div class="date">날짜</div>
	                                        	</div>
	                                        	<div class="post-like">좋아요</div>
	                                        </div>
	                                    </div>
	                                	</div><div style="height: 100px; padding: 40px 0px;"><hr></div><div class="mypage-post-list">
	                       		</div>
                            </div>
                        </div>
                        
                        <!--홍보 게시판 -->
                        <div class="area" id="select-2-area">
                        <div class="empty"></div>
                            <div class="mypage-board-table">
                                <div class="mypage-post-list">
		                                	<div style="flex: 9; width: 100%; heigth: 90%;">
		                                		게시물이 없습니다.
		                                	</div>
			                                    <div class="product">
			                                        <div class="product-inner">
			                                        	<div class="photo"><a href="../board/promotion_post_content.jsp?board_no=1%>&promotion_cate_num=1&post_no=1"><img src="../board/showImg2.user?post_img_no=1"></a></div>
			                                        	<div class="product-title"><a href="../board/promotion_post_content.jsp?board_no=1&promotion_cate_num=1&post_no=1">제목...</a></div>
			                                        	<div class="map">
			                                        		<div>
				                                        		시 군 구
			                                        		</div>
			                                        	</div>
			                                        	<div class="price-date">
			                                        		<div class="price">가격</div>
			                                        		<div class="date">날짜</div>
			                                        	</div>
			                                        	<div class="post-like">좋아요</div>
			                                        </div>
			                                    </div>
			                                	</div><div style="height: 100px; padding: 40px 0px;"><hr></div><div class="mypage-post-list">
	                       			</div>
                            	</div>
                        	</div>
                        
                        <!-- 댓글 -->
                        <div class="area" id="select-3-area">
                            <div id="reply-nav" class="empty">
                            	<label for="1-reply">
                            		<input type="radio" id="1-reply" name="reply-package" onchange="replyNav(this);" checked>
                            		중고
                            	</label>
                            	<label for="2-reply">
                            		<input type="radio" id="2-reply" name="reply-package" onchange="replyNav(this);">
                            		홍보
                            	</label>
                            </div>
                            <div id="1-reply-area" class="area2 on">
                            	<div class="mypage-board-table">
	                                <div class="mypage-post-list">
	                                	<div style="flex: 9; width: 100%; heigth: 90%;">
	                                		게시물이 없습니다.
	                                	</div>
			                                    <div class="product">
			                                        <div class="product-inner">
			                                        	<div class="photo">
			                                        		<a href="../board/used_post_content.jsp?board_no=1&used_cate_num=1&post_no=1&board_no=1"><img src="../board/showImg.user?post_img_no=1"></a>
			                                        	</div>
			                                        	<div class="product-title">
			                                        		<a href="../board/used_post_content.jsp?board_no=1&used_cate_num=1&post_no=1&board_no=1">제목...</a>	
			                                        	</div>
			                                        	<div class="map">
			                                        		<div>
				                                        		시 군 구
			                                        		</div>
			                                        	</div>
			                                        	<div class="price-date">
			                                        		<div class="price">돈</div>
			                                        		<div class="date">날짜</div>
			                                        	</div>
			                                        	<div class="post-like">좋아요</div>
			                                        </div>
			                                    </div>
				                                	</div><div style="height: 100px; padding: 40px 0px;"><hr></div><div class="mypage-post-list">
		                       		</div>
	                            </div>
                            </div>
                            <div id="2-reply-area" class="area2">
                            	<div class="mypage-board-table">
	                                <div class="mypage-post-list">
			                                	<div style="flex: 9; width: 100%; heigth: 90%;">
			                                		게시물이 없습니다.
			                                	</div>
					                                    <div class="product">
					                                        <div class="product-inner">
					                                        	<div class="photo"><a href="../board/promotion_post_content.jsp?board_no=1&promotion_cate_num=1&post_no=1"><img src="../board/showImg2.user?post_img_no=1"></a></div>
					                                        	<div class="product-title"><a href="../board/promotion_post_content.jsp?board_no=1&promotion_cate_num=1&post_no=1">제목...</a></div>
					                                        	<div class="map">
					                                        		<div>
						                                        		시 군 구
					                                        		</div>
					                                        	</div>
					                                        	<div class="price-date">
					                                        		<div class="price">가격</div>
					                                        		<div class="date">날짜</div>
					                                        	</div>
					                                        	<div class="post-like">좋아요</div>
					                                        </div>
					                                    </div>
					                                	</div><div style="height: 100px; padding: 40px 0px;"><hr></div><div class="mypage-post-list">
		                       			</div>
	                            	</div>
	                        	</div>
                            </div>
                        
                        <!-- 찜꽁 -->
                        <div class="area" id="select-4-area">
                        	<div class="empty"></div>
                            <div class="mypage-board-table">
                                <div class="mypage-post-list">
                                	<div style="flex: 9; width: 100%; heigth: 90%;">
                                		게시물이 없습니다.
                                	</div>
	                                    <div class="product">
	                                        <div class="product-inner">
	                                        	<div class="photo">
	                                        		<a href="../board/used_post_content.jsp?board_no=1&used_cate_num=1&post_no=1"><img src="../board/showImg.user?post_img_no=1"></a>
	                                        	</div>
	                                        	<div class="product-title"><a href="../board/used_post_content.jsp?board_no=1&used_cate_num=1&post_no=1">제목...</a></div>
	                                        	<div class="map">
	                                        		<div>
		                                        		시 군 구
	                                        		</div>
	                                        	</div>
	                                        	<div class="price-date">
	                                        		<div class="price">가격</div>
	                                        		<div class="date">날짜</div>
	                                        	</div>
	                                        	<div class="post-like">좋아요</div>
	                                        </div>
	                                    </div>
	                                	</div><div style="height: 100px; padding: 40px 0px;"><hr></div><div class="mypage-post-list">
	                       		</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>

<jsp:include page="../template/footer.jsp"></jsp:include>

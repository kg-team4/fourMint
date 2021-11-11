<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%-- 
<%
	PromotionPostDAO ppdao = new PromotionPostDAO();
	MemberDAO mdao = new MemberDAO();
	MemberDTO mdto = (MemberDTO) session.getAttribute("memberinfo"); // 회원번호 불러오기

	//List<DetailList2DTO> list = ppdao.getList();

	// 시간 출력 수정 
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");

	String sysdate = date.format(cal.getTime()); // 현재 날짜
	String systime = time.format(cal.getTime()); // 현재 시간 

	int syshour = (Integer.parseInt(systime.substring(0, 2)) * 60) * 60; // 현재 시 * 60분 
	int sysminute = Integer.parseInt(systime.substring(3, 5)) * 60; // 현재 분 * 60초
	int syssecound = Integer.parseInt(systime.substring(6, 8)); // 현재 초 

	// 현재 시간 > 초 단위 변환
	int systime_s = syshour + sysminute + syssecound;

	//검색인지 목록인지 검사 

	// 페이지 계산 코드 
	int pageSize = 12; // 한 페이지에 16개의 데이터를 표시하겠다 

	String pageStr = request.getParameter("page");
	int pageNo;

	try {
		pageNo = Integer.parseInt(pageStr);
		if (pageNo <= 0) {
			throw new Exception();
		}
	} catch (Exception e) {
		pageNo = 1;
	}

	int finish = pageNo * pageSize;
	int start = finish - (pageSize - 1);

	// 페이지 네비게이터 계산 코드 
	int blockSize = 10; // 네비게이터 블록을 10개씩 배치하겠다 ! 
	int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
	int finishBlock = startBlock + blockSize - 1;

	int count; // 페이지 개수 출력하기 위함
	int pageCount;

	List<DetailList2DTO> list;

	if (mdto != null) { // 회원인 경우(로그인이 되어있는 경우)
		MemberDTO member = mdao.get(mdto.getMember_no());

		AddrDAO adao = new AddrDAO();
		AddrDTO adto = adao.get(member.getMember_addr_no());

		count = ppdao.getCount(member.getMember_addr_no());
		list = ppdao.getAreaList(start, finish, member.getMember_addr_no()); // (지역 상관O)지역 전체목록 출력 

		//(** 다음 버튼의 경우 계산을 총하여 페이지 개수를 구해야 출력 여부 판단이 가능)
		pageCount = (count + pageSize - 1) / pageSize;
		if (finishBlock > pageCount) {
			finishBlock = pageCount;
		}
	} else { // 비회원인 경우	
		count = ppdao.getCount();
		list = ppdao.getList(start, finish); // (지역 상관X)전체목록
		
		//(** 다음 버튼의 경우 계산을 총하여 페이지 개수를 구해야 출력 여부 판단이 가능)
		pageCount = (count + pageSize - 1) / pageSize;
		if (finishBlock > pageCount) {
			finishBlock = pageCount;
		}
	}

	String path = request.getContextPath();
%> --%>



<link href="../css/10.promotion&used_post_list.css" type="text/css"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<title>민트 커뮤니티</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_community.css">
<jsp:include page="../template/header.jsp"></jsp:include>


<article style="padding-top: 200px; margin: 0px 20%">


<!-- 소식 -->
	<div class="community_news_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject"><strong>소식 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">34</span>
		</p>

			<div class="community_news">
				<div align="right" id="more_link">
					<a href="communityDetailList.do?board_no=2&promotion_cate_num=1">더보기 ></a>
				</div>
				<table>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/megaphone.png" width=25px; height=25px>
								<a href="#">묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서
								교통이 혼잡</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/thumbs-up.png" width=15px; height=15px>
								<span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td>
							<div>작성자명작성자명</div>
						</td>
					</tr>
					
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/megaphone.png" width=25px; height=25px>
								<a href="#">묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서
								교통이 혼잡</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/thumbs-up.png" width=15px; height=15px>
								<span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td>
							<div>작성자명작성자명</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/megaphone.png" width=25px; height=25px>
								<a href="#">묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서
								교통이 혼잡</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/thumbs-up.png" width=15px; height=15px>
								<span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td>
							<div>작성자명작성자명</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/megaphone.png" width=25px; height=25px>
								<a href="#">공사 중</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/thumbs-up.png" width=15px; height=15px>
								<span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td>
							<div>작성자명작성자명</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/megaphone.png" width=25px; height=25px>
								<a href="#">묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서 교통이 혼잡묘동 공사 시작해서
								교통이 혼잡</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/thumbs-up.png" width=15px; height=15px>
								<span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td>
							<div>작성자명작성자명</div>
						</td>
					</tr>
				</table>
			</div>
		
	</div>

<!-- 질문 -->
	<div class="question_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject"><strong>질문 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">17</span>
		</p>

		<div class="community_news_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="#">더보기 ></a>
				</div>
				<table>
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명명멍멍멍</div>
						</td>
					</tr>
					
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명명멍멍멍</div>
						</td>
					</tr>
					
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명명멍멍멍</div>
						</td>
					</tr>
					
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명명멍멍멍</div>
						</td>
					</tr>
					
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px>
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명명멍멍멍</div>
						</td>
					</tr>
					
				</table>
				<br>
			</div>
		</div>
	</div>

<!-- 모임 -->
	<div class="group_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject"><strong>모임 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">8</span>
		</p>

		<div class="group_grid">
			<div class="group_list">
				<div align="right" id="more_link">
					<a href="#">더보기 ></a>
				</div>
				
				<table style="border : 0">
					<tr>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/bike_riding.jpg" alt="모임이미지">
								</div>
								<div id="group_name">한강자전거라이딩 모임</div>
							</a> 
						</td>
						
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/leather_making.png" alt="모임이미지">
								</div>
								<div id="group_name">가죽공예 모임</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/badminton.png" alt="모임이미지">
								</div>
								<div id="group_name">배드민턴 모임</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/running.png" alt="모임이미지">
								</div>
								<div id="group_name">한강런닝 모임</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/baking.png" alt="모임이미지">
								</div>
								<div id="group_name">베이킹 모임</div>
							</a> 
						</td>
					</tr>
							
				</table>
				<br>
				<br>
			</div>
		</div>
	</div>

<!-- 맛집 -->
<div class="must_go_restaurant_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject"><strong>맛집 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">25</span>
		</p>

		<div class="group_grid">
			<div class="group_list">
				<div align="right" id="more_link">
					<a href="#">더보기 ></a>
				</div>
				
				<table style="border : 0">
					<tr>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/must_go_restaurant01.jpg" alt="맛집이미지">
								</div>
								<div id="group_name">만성찬팅 마파두부</div>
							</a> 
						</td>
						
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/must_go_restaurant02.jpg" alt="맛집이미지">
								</div>
								<div id="group_name">맛있는 지삼선 맛집</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/must_go_restaurant03.jpg" alt="맛집이미지">
								</div>
								<div id="group_name">안주 맛집</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/must_go_restaurant04.jpg" alt="맛집이미지">
								</div>
								<div id="group_name">숨은 케이크 맛집</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/must_go_restaurant05.jpg" alt="맛집이미지">
								</div>
								<div id="group_name">최고의 닭발집</div>
							</a> 
						</td>
					</tr>
							
				</table>
				<br>
				<br>
			</div>
		</div>
	</div>

<!-- 분실센터 -->
	<div class="lost_find_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject"><strong>분실센터 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">9</span>
		</p>

		<div class="community_news_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="#">더보기 ></a>
				</div>
				<table>
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명</div>
						</td>
					</tr>
					
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명</div>
						</td>
					</tr>
					
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명</div>
						</td>
					</tr>
					
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명</div>
						</td>
					</tr>
					
					<tr>
						<td nowrap id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td nowrap>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								<span>15</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px>
								<span>40</span>
							</div>
						</td>
						<td nowrap>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 
								<span>5</span>
							</div>
						</td>
						<td nowrap>
							<div>작성자명</div>
						</td>
					</tr>
				
					
				</table>
				<br>
			</div>
		</div>
	</div>

<!-- 사진전 -->
<div class="picture_all">
		<br> <br>
		<p style="font-size: 20px">
			<span id="subject"><strong>사진전 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">25</span>
		</p>

		<div class="group_grid">
			<div class="group_list">
				<div align="right" id="more_link">
					<a href="#">더보기 ></a>
				</div>
				
				<table style="border : 0">
					<tr>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/picture01.jpg" alt="사진전이미지">
								</div>
								<div id="group_name">저희 집 뒷산에서 바라본 야경</div>
							</a> 
						</td>
						
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/picture02.jpg" alt="사진전이미지">
								</div>
								<div id="group_name">벚꽃풍경</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/picture03.jpg" alt="사진전이미지">
								</div>
								<div id="group_name">썰매타는 귀여운 우리 아들 구경하세요</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/picture04.jpg" alt="사진전이미지">
								</div>
								<div id="group_name">봉순이와 익명이</div>
							</a> 
						</td>
						<td id="td_group">
							<a id="store_review_img_area" href="#"  >
								<div id="group_img_box">
									<img id="group_img" src="../img/picture05.jpg" alt="사진전이미지">
								</div>
								<div id="group_name">오늘자 예쁜 하늘</div>
							</a> 
						</td>
					</tr>
							
				</table>
				<br><br>
			</div>
		</div>
		<br><br><br>
	</div>


	
</article>


<jsp:include page="../template/footer.jsp"></jsp:include>


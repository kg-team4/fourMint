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
			<span><strong>소식 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">34</span>
		</p>

		<div class="community_news_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="#">더보기></a>
				</div>
				<table width="100%" height="140">
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
								유용해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 댓글
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>3분 전</div>
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
							<div>
								<img src="../img/thumbs-up.png" width=15px; height=15px>
								유용해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div>
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div>
								<img src="../img/comment.png" width=15px; height=15px> 댓글
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>3분 전</div>
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
								유용해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 댓글
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>3분 전</div>
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
								유용해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 댓글
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>3분 전</div>
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
								유용해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 댓글
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>3분 전</div>
						</td>
					</tr>
				</table>
				<br>
			</div>
		</div>
	</div>

<!-- 질문 -->
	<div class="community_news_all">
		<br> <br>
		<p style="font-size: 20px">
			<span><strong>질문 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">17</span>
		</p>

		<div class="community_news_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="#">더보기></a>
				</div>
				<table>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								궁금해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								궁금해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								궁금해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								궁금해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/question_mark.png" width=20px; height=20px>
								<a href="#">묘동에서 잘하는 병원이 어디일까요??</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/raise-your-hand-to-ask.png" width=18px; height=18px>
								궁금해요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
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
			<span><strong>모임 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">8</span>
		</p>

		<div class="group_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="#">더보기></a>
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
			<span><strong>맛집 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">25</span>
		</p>

		<div class="group_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="#">더보기></a>
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
			<span><strong>분실센터 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">9</span>
		</p>

		<div class="community_news_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="#">더보기></a>
				</div>
				<table>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								슬퍼요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								슬퍼요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								슬퍼요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">묘동 스타벅스 사거리에서 에어팟 잃어버렸어요ㅠㅠㅠ</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								슬퍼요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
						</td>
					</tr>
					<tr>
						<td id="news_title">
							<div id="news_title_content">
								<img src="../img/find.png" width=20px; height=20px>
								<a href="#">강아지를 분실했어엉요우우도와주세요우우ㅜ우우으우으으으으우우ㅜ웅우우ㅜ우우ㅜ으아아아ㅏ앙</a>
							</div>
						</td>
						<td>
							<div id="news_useful">
								<img src="../img/sad_icon.png" width=18px; height=18px>
								슬퍼요 &nbsp; <span>15</span>
							</div>
						</td>
						<td>
							<div id="news_views">
								<img src="../img/eye.png" width=15px; height=15px> 조회수
								&nbsp; <span>40</span>
							</div>
						</td>
						<td>
							<div id="news_comment">
								<img src="../img/comment.png" width=15px; height=15px> 답변
								&nbsp; <span>5</span>
							</div>
						</td>
						<td>
							<div>1분 전</div>
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
			<span><strong>사진전 &nbsp;&nbsp;</strong></span> <span
				style="color: #26e4ca">25</span>
		</p>

		<div class="group_grid">
			<div class="community_news">
				<div align="right" id="more_link">
					<a href="#">더보기></a>
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


	<!-- <div align="left">
		<h2 style="font-size: 30px; margin: 15px;">
			<span style="color: orange">동네홍보</span> 상품목록
		</h2>

		<hr class="hr_style1">
	</div>
	<div align="left">
		<div class="box">

			<div class=detail>
				<div class="product">
					<div class="product_photo">
						<a class="move"
							href="promotion_post_content.jsp?board_no=1&promotion_cate_num=1&post_no=1"><img
							src="showImg2.do?post_img_no=1"></a>
					</div>
					<div class="product_title">
						<div class="hideText">
							<a class="move"
								href="promotion_post_content.jsp?board_no=1&promotion_cate_num=1&post_no=1">제목</a>
						</div>
					</div>
					<div class="post_location">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
							width="15" height="17" alt="위치 아이콘">
					</div>
					<div class="product_info">
						<div class="product_price">
							12345원
							<div class="product_time">
								<span>날짜</span>
							</div>
						</div>
						<hr class="hr_style">
						<div class="product_like">
							<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC" 
							width="17" height="12" alt="상품 상태 아이콘">
						</div>
					</div>

				</div>
			</div>
			<div style="clear: both;"></div>
			
			 페이지 네비게이터 
			<div class="row center pagination">
				<a href = "promotion_all_post_list.jsp?page=1&lt;"></a>
				<a href="promotion_all_post_list.jsp?page=1">1</a>
			</div>			
		</div>
	</div> -->
</article>


<jsp:include page="../template/footer.jsp"></jsp:include>


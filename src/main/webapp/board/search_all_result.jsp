<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트마켓 검색하기</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/search_result.css">

<jsp:include page="../template/header.jsp"></jsp:include>
</head>

<body>
<article>
	<div class="contents_all">
		
		<div class="search_used_all">
			<div class="search_cate">중고거래</div>
			<hr>
				<div class="search_contents">
					<div style="margin-bottom:5px;"><a class="search_link" href="#">꼬치구이&nbsp;[]</a></div>
					<div class="search_content">
						꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용
						꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용 꼬치구이에 대한 내용내용내용내용
						
					</div>				
				</div>
				
			
				
				<div style="text-align: right">
					<a href="searchMarketMoreResult.do" class="result_more"> 더보기 > </a>
				</div>				
		</div>			
		
		
		<div class="search_community_all">
			<div class="search_cate">커뮤니티</div>
			<hr>
			
			<div class="search_contents">
				<div style="margin-bottom:5px;"><a class="search_link" href="#">치즈베이글 맛집</a></div>
				<div class="search_content">
					치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!! 치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!! 치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!! 치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!!
					치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!! 치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!!치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!! 치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!! 치즈베이글과 라떼가 맛있는 곳!!!안국역 스타벅스로 !!!
					
				</div>				
			</div>
			
			
			<div style="text-align: right">
					<a href="searchCommunityMoreResult.do" class="result_more"> 더보기 > </a>
			</div>
			
		</div>				
	</div><!-- end contents_all -->
</article>




<!-- 검색결과가 없을 때 -->
<article>
	<div class="contents_all">
		
		<div class="search_used_all">
			<div class="search_cate">동네거래</div>
			<hr>
			<div class="no_result">
				<img alt="검색결과없음" src="../img/no_search.png" style="width:30px; height:20px" >
				<span class="search_word">"멍멍이"  </span>에 대한 검색결과가 없습니다.				
			</div>
				
		</div>
		
		
		<div class="search_community_all">
			<div class="search_cate">커뮤니티</div>
			<hr>
			<div class="no_result">
				<img alt="검색결과없음" src="../img/no_search.png" style="width:30px; height:20px" >
				<span class="search_word">"멍멍이"  </span>에 대한 검색결과가 없습니다.			
			</div>
		</div>				
	</div><!-- end contents_all -->
</article>


<jsp:include page="../template/footer.jsp"></jsp:include>


</body>
</html>
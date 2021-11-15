<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트스토어 서비스센터</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/store_service_center.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>

<jsp:include page="../template/header.jsp"></jsp:include>

</head>
<body>
<article>
	<!-- 카테고리 -->
	<div class="contents_all">
		<div class="category_list">
			<div>
				<a class="category_title" href="storeServiceCenter.do">NOTICE</a>
			</div>
			<div>
				<a class="category_title" href="storeServiceCenterFAQ.do">FAQ</a>
			</div>
		</div>
	</div>
	<!-- 공지사항 -->
		<div class="store_review_all">
			<div class="store_review">
				<table>
					<tr>
						<td id="news_num">
							<img src="../img/megaphone.png" width=23px; height=23px>
						</td>
						<td id="news_title">
							<div id="news_title_content">
								 <a id="news_title_detail" href="#">민트스토어 택배없는 날 관련 배송 지연 안내</a>
							</div>
						</td>
						<td id="down_arrow" style="color:gray">
							<input type="button" class="slider" value="▼" style="background: none; border:0px; color:gray; cursor:pointer;">
						</td>
					</tr>
									
					
					
					
					<tr  id="contents_all" style=" display: none">
						<td></td>
						
						<td>
							<div style="text-align: right">
								2020-08-14
							</div>
							
							<pre><br>							
안녕하세요.

지구샵입니다.

8/14(금)은 코로나 이후 극심한 노동으로 고단함을 느끼고 있는 택배 노동자를 위한 '택배없는 날'입니다.

평소 택배노동자분들의 고단함으로 우리가 얼마나 편한 생활을 하고 있는지 그 소중함을 느낍니다.
진정한 택배없는 날을 위해 불요불급한 택배 주문을 피하고 주변 상점 및 전통시장을 이용하시거나 차주에 이용하시기를 권장 드립니다 :)

아울러 택배없는 날 전일부터 택배노동자의 휴식을 보장하고자 8/12 오후 3시 이후 주문 건부터는 택배노동자분들의 연휴가 끝난 다음 주 8/17(월)에 출고됩니다.
이용에 참고 바랍니다.

8/12(수) 오후 3시 이전 주문 건 : 당일 발송

감사합니다.
					
							<br></pre>
						</td>
						
						<td></td>
					</tr>
					
					
					<tr>
						<td id="news_num">
							2
						</td>
						<td id="news_title">
							<div id="news_title_content">
								 <a id="news_title_detail" href="#">채용공고</a>
							</div>
						</td>
						<td style="color:gray">					
							<input type="button" class="slider" value="▼" style="background: none; border:0px; color:gray; cursor:pointer">
						</td>
					</tr>										
										
					<tr>
						<td id="news_num">
							1
						</td>
						<td id="news_title">
							<div id="news_title_content">
								 <a id="news_title_detail" href="#">홈페이지 오픈 기념 할인 이벤트</a>
							</div>
						</td>
						<td style="color:gray">
							<input type="button" class="slider" value="▼" style="background: none; border:0px; color:gray; cursor:pointer">
						</td>
					</tr>
					
				</table>
			</div>	
				
	</div><!-- end contents_all -->
</article>
<script>
$( document ).ready( function() {	
	$(".slider").click(function(){
		if($(this).parent().parent().next().is(":visible")){
			$(this).parent().parent().next().slideUp(400);
	      	$(this).val("▼");
	    } else{
	    	$(this).parent().parent().next().slideDown(400);
	    	$(this).val("▲");
	   	}
	});
 });
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
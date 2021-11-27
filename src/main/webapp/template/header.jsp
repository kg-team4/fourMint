<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>어서오세요! 민트마켓!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="../css/1.header.css" type="text/css" rel="stylesheet">
<link href="../css/2.nav.css" type="text/css" rel="stylesheet">
<link href="../css/3.promotion.css" type="text/css" rel="stylesheet">
<link href="../css/4.article.css" type="text/css" rel="stylesheet">
<link href="../css/5.footer.css" type="text/css" rel="stylesheet">
<script src="../js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
		<div class="logo">
			<a href="home.do"><img src="../img/mintmarket_logo.png"></a>
		</div>
		<div class="search">
			<form action="searchAllResult.do" method="get" style="border: 1px solid white;">
				<input type="text" class="search-bar" id="search-bar" name="keyword" placeholder="검색어를 입력해주세요!"> 
				<input type="submit" class="search-icon" value="">
			</form>
		</div>
		<div class="sign">
			<ul>
				<c:choose>
					<c:when test="${empty userEmail_id}">
						<li><a href="login.do">로그인</a></li>
						<li><a href="join.do">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sns eq 'kakao'}">
								<li onclick="kakaoLogout()"><a href="javascript:void(0)">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="profile.do">마이페이지</a></li>
						<li>
							<button id="btn_mint_cart" onclick="location.href='payment.do?chk=first'">
								<img src="../img/shopping-cart.png" style="height: 18px; width: 20px">
							</button>
						</li>
						<li>
							<button id="btn_mint_talk" onclick="location.href='./message_list.do'">
								<img src="../img/message.png" style="height: 18px; width: 20px">
							</button>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
		<script>
        $(".search-icon").click(function() {
			
			var str = $(".search-bar").val();

            if( str == '' || str == null ){
                alert( '검색어를 입력해주세요' );
                return false;
            } 

            var blank_pattern = /^\s+|\s+$/g;
            if( str.value.replace( blank_pattern, '' ) == "" ){
                alert(' 공백만 입력되었습니다 ');
                return false;
            }

 

//공백 금지
            //var blank_pattern = /^\s+|\s+$/g;(/\s/g
/*             var blank_pattern = /[\s]/g;
            if( blank_pattern.test( str.value) == true){
                alert(' 공백은 사용할 수 없습니다. ');
                return false;
            }
			
			var special_pattern = /[`~!@#$%^&*()_|+\-=?;:,.<>\{\}\[\]\\\/]/gim; 
            var special_pattern = /[~!@#$%^&*()_+|<>?:{}]/;

            if( special_pattern.test(str.value) == true ){
                alert('특수문자는 사용할 수 없습니다.');
                return false;
            }

            alert( '최종 : ' + str.value );

            
            if( str.value.search(/\W|\s/g) > -1 ){
                alert( '특수문자 또는 공백을 입력할 수 없습니다.' );
                str.focus();
                return false;
            }
 */
 

        });
    </script>
		
	</header>
	<jsp:include page="../template/nav.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<title>민트마켓 상품 글 수정</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/user/css/11.used_write.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/user/js/jquery-3.6.0.min.js"></script>
	
<article style="padding-top: 200px;" id="used-write-form">
	<div class="container" align="left">
		<h1 align="left" style="font-size: 30px; font-weight: normal;">
	         중고거래 글 수정 &nbsp; <span class="must">&nbsp;*필수항목 </span>
		</h1>
		<br><br>
		<hr class="hr_style2">
		<br><br>

		<form action="updateMarket.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm();">
      	
         <div class="used_container" >

            <!--  이미지 등록 -->
			<div class="used_photo">
				<div class="used_photo_text">
					상품이미지 <span class="must">*</span>
				</div>
				<div class="used_photo_img">
					<input class="form-input" type="file" name="file" multiple accept=".jpg, .png, .gif" oninput="preview();" required> 
					<br> 
					<img class="preview-wrap" src="#" alt="등록할 상품 사진을 넣어주세요." onerror="this.style.display='none'"/> 
					<br>
					<div class="used_photo_explain">
						* 상품 이미지는 640x640에 최적화 되어 있습니다.<br> - 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br> - 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다. <br> - 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다. <br> - 이미지는 최대 5개까지 등록 가능합니다.<br> 최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
					</div>
				</div>
			</div>
			<hr>

            <!-- 제목 입력 -->
			<div class="used_title">
				<div class="used_text">
					제목 <span class="must">*</span> <input class="form-title" type="text" value="${market.product_name }" name="product_name" placeholder="상품 제목을 입력해주세요." oninput="checkTitle();" required>
					<div id="titleInfo"></div>
					<div class="titleHeight"></div>
				</div>
			</div>
			<hr>

            <!-- 카테고리 선택 -->
			<div class="used_cate">
				<div class="used_text">
					카테고리 <span class="must">*</span> 
					<select id="cate_sel" class="used_cate_style" name="category_big" required>
						<option value="">카테고리 선택</option>
						<c:forEach var="big" items="${ marketCategoryBig }">
							<option value="${big.name }">${big.name }</option>
						</c:forEach>
					</select>
				</div>
				<c:forEach var="big" items="${ marketCategoryBig }">
					<div id="category_${big.num }" class="used_text cate_all" style="display: none;">
						<select class="used_cate_style" name="category_middle">
							<option value="">카테고리 선택</option>
							<c:forEach var="middle" items="${ big.middle }">
								<c:if test="${middle.value ne null}">
									<option value="${middle.value }">${middle.value }</option>
								</c:if>
							</c:forEach>
						</select>	
					</div>
				</c:forEach>
			</div>
			<hr>
			
            <!-- 가격 입력 -->
			<div class="used_price">
				<div class="used_text">
					가격 <span class="must">*</span> <input class="form-price" type="text" name="product_price" placeholder="숫자만 입력해주세요" oninput="checkPrice();" value="${market.product_price }" required>&nbsp;원
				</div>
				<div id="priceInfo"></div>
				<div class="titleHeight"></div>
			</div>
			<hr>
			<br> <br>

            <!-- 상품 내용 입력 -->
			<div class="used_content">
				<div class="main">
					<div class="used_content_text">
						설명<span class="must">*</span>
					</div>
					<div class="content">
						<div>
							<textarea class="first" name="product_content" required>${market.product_content }</textarea>
							<div align="right" class="countNum">
								<span class="letter-count">0</span>/2000
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="clear: both;"></div>
			<br>
			<hr>
         </div>
         
         <!--  등록 버튼 -->
			<div align="right" class="form-input">.
				<input type="hidden" name="market_seq" value="${market.market_seq }"/>
				<input class="form-btn" type="submit" value="수정하기" required>
			</div>
		 <br><br>
		</form>
		
	</div>
</article>

<script>
	$(function() {
		$(".form-input").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.preview-wrap').attr('src', e.target.result);				
			}

			reader.readAsDataURL(input.files[0]);
		}
		$('.preview-wrap').show();
	}
	
	$(".first").keyup(function (e){
	    var content = $(this).val();
	    $('.letter-count').html(content.length);    //글자수 실시간 카운팅

	    if (content.length > 2000){
	        alert("최대 2000자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 2000));
	        $('.letter-count').html(2000);
	    }
	});
	
	$("#cate_sel").change(function() {
		if($(this).val() == "디지털 · 가전") {
			$(".cate_all").hide();
			$("#category_1").show();
		} else if($(this).val() == "가구 · 인테리어") {
			$(".cate_all").hide();
			$("#category_2").show();
		} else if($(this).val() == "유아동 · 출산") {
			$(".cate_all").hide();
			$("#category_3").show();
		} else if($(this).val() == "생활 · 가공식품") {
			$(".cate_all").hide();
			$("#category_4").show();
		} else if($(this).val() == "스포츠 · 레저") {
			$(".cate_all").hide();
			$("#category_5").show();
		} else if($(this).val() == "여성의류") {
			$(".cate_all").hide();
			$("#category_6").show();
		} else if($(this).val() == "남성의류") {
			$(".cate_all").hide();
			$("#category_7").show();
		} else if($(this).val() == "패션잡화") {
			$(".cate_all").hide();
			$("#category_8").show();
		} else if($(this).val() == "게임 · 취미") {
			$(".cate_all").hide();
			$("#category_9").show();
		} else if($(this).val() == "뷰티 · 미용") {
			$(".cate_all").hide();
			$("#category_10").show();
		} else if($(this).val() == "반려동물용품") {
			$(".cate_all").hide();
			$("#category_11").show();
		} else if($(this).val() == "도서 · 음반") {
			$(".cate_all").hide();
			$("#category_12").show();
		} else if($(this).val() == "기타") {
			$(".cate_all").hide();
		}
	});

</script>

<jsp:include page="../template/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>민트스토어 상품 글 쓰기</title>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/user/css/11.used_write.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/user/js/jquery-3.6.0.min.js"></script>
<article style="padding-top: 200px;" id="used-write-form">
	<div class="container" align="left">
		<h1 align="left" style="font-size: 30px; font-weight: normal;">
			스토어 글쓰기 &nbsp; <span class="must">&nbsp;*필수항목 </span>
		</h1>
		<br> <br>
		<hr class="hr_style2">
		<br> <br>
		<!--  
          준비 : post_title(글제목), used_cate_num(카테고리 번호), used_price(가격), used_content(내용) 
    	-->

		<form action="storeSell.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm();">

			<!-- board_no 값 hidden으로 넘겨주기  -->
			<div class="used_container">

				<!--  이미지 등록 -->
				<div class="used_photo">
					<div class="used_photo_text">
						상품이미지 <span class="must">*</span>
					</div>
					<div class="used_photo_img">
						<input class="form-input" type="file" name="file" multiple accept=".jpg, .png, .gif" oninput="preview();"> 
						<br> 
						<img class="preview-wrap" src="#" alt="등록할 상품 사진을 넣어주세요." onerror="this.style.display='none'"/> 
						<br>
						<div class="used_photo_explain">
							- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다. <br> - 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다. <br> - 이미지는 1개 등록 가능합니다. 
						</div>
					</div>
				</div>
				<hr>

				<!-- 제목 입력 -->
				<div class="used_title">
					<div class="used_text">
						제목 <span class="must">*</span> <input class="form-title" type="text" name="product_name" placeholder="상품 제목을 입력해주세요." oninput="checkTitle();">
						<div id="titleInfo"></div>
						<div class="titleHeight"></div>
					</div>
				</div>
				<hr>

				<!-- 카테고리 선택 -->
				<div class="used_cate">
					<div class="used_text">
						카테고리 <span class="must">*</span> 
						<select id="cate_sel" class="used_cate_style" name="category_big">
							<option value="">카테고리 선택</option>
							<c:forEach var="big" items="${ storeCategoryBig }">
								<option value="${big.name }">${big.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<hr>

				<!-- 가격 입력 -->
				<div class="used_price">
					<div class="used_text">
						가격 <span class="must">*</span> <input class="form-price" type="text" name="product_price" placeholder="숫자만 입력해주세요" oninput="checkPrice();">&nbsp;원
						&emsp;&emsp;&emsp;수량 <span class="must">*</span> <input class="form-price" type="text" name="product_stock" placeholder="숫자만 입력" style="width: 150px;"> 
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
								<textarea class="first" name="product_content"></textarea>
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
			<div align="right" class="form-input">
				<input class="form-btn" type="submit" value="등록하기">
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


</script>

<jsp:include page="../template/footer.jsp"></jsp:include>
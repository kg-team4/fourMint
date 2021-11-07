<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/reset.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<link href="../css/11.used_write.css" rel="stylesheet">
<script src="../js/jquery-3.6.0.min.js"></script>
<article style="padding-top: 200px;" id="used-write-form">
	<div class="container" align="left">
		<h1 align="left" style="font-size: 30px; font-weight: normal;">
			중고거래 글쓰기 &nbsp; <span class="must">&nbsp;*필수항목 </span>
		</h1>
		<br> <br>
		<hr class="hr_style2">
		<br> <br>
		<!--  
          준비 : post_title(글제목), used_cate_num(카테고리 번호), used_price(가격), used_content(내용) 
      -->

		<form action="marketSell.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm();">

			<!-- board_no 값 hidden으로 넘겨주기  -->
			<input type="hidden" name="board_no" value="1">

			<div class="used_container">

				<!--  이미지 등록 -->
				<div class="used_photo">
					<div class="used_photo_text">
						상품이미지 <span class="must">*</span>
					</div>
					<div class="used_photo_img">
						<input class="form-input" type="file" name="file" multiple accept=".jpg, .png, .gif" oninput="preview();"> 
						<br> 
						<img class="preview-wrap" src="#" /> 
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
						제목 <span class="must">*</span> <input class="form-title" type="text" name="product_name" placeholder="상품 제목을 입력해주세요." oninput="checkTitle();">
						<div id="titleInfo"></div>
						<div class="titleHeight"></div>
					</div>
				</div>
				<hr>

				<!-- 카테고리 선택 -->
				<div class="used_cate">
					<div class="used_text">
						카테고리 <span class="must">*</span> <select class="used_cate_style" name="category_middle">
							<option value="">카테고리 선택</option>
							<option value="1">디지털/가전</option>
							<option value="2">가구/인테리어</option>
							<option value="3">유아동/유아도서</option>
							<option value="4">생활/가공식품</option>
							<option value="5">스포츠/레저</option>
							<option value="6">여성/잡화</option>
							<option value="7">여성 의류</option>
							<option value="8">남성패션/잡화</option>
							<option value="9">게임/취미</option>
							<option value="10">뷰티/미용</option>
							<option value="11">반려동물</option>
							<option value="12">도서/티켓/음반</option>
							<option value="13">기타</option>
						</select>
					</div>
				</div>
				<hr>

				<!-- 가격 입력 -->
				<div class="used_price">
					<div class="used_text">
						가격 <span class="must">*</span> <input class="form-price" type="text" name="product_price" placeholder="숫자만 입력해주세요" oninput="checkPrice();">&nbsp;원
					</div>
					<div class="used_text">
						<label for="freesShipping" id="free"> <input type="checkbox"> 무료배송 </label> 
						<label for="priceSuggest" id="suggest"> <input type="checkbox"> 가격협의가능 </label>
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
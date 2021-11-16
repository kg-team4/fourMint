<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<title>커뮤니티 글 쓰기</title>
<link rel="shortcut icon" type="image/x-icon"
	href="../img/logo_icon.png" />
<jsp:include page="../template/header.jsp"></jsp:include>
<link href="../css/12.promotion_write.css" type="text/css" rel="stylesheet">
<article style="padding-top: 200px;" id="used-write-form">
   <div class="container" align="left">
      <h1 align="left" style="font-size: 30px; font-weight: normal;">
        커뮤니티 글쓰기 &nbsp; <span class="must">   *필수항목 </span>
      </h1>
      <br><br>
      <hr class="hr_style2">
      <br><br>
 
      <!--  
          준비 : post_title(글제목), used_cate_num(카테고리 번호), used_price(가격), used_content(내용) 
      -->

      <form action="promotion_post_write.do" method="post" enctype="multipart/form-data">
         <input type="hidden" name="board_no" value="2">
         
         <div class="used_container" >

            <!--  이미지 등록 -->
            <div class="used_photo">
               <div class="used_photo_text" >
                  글 이미지 <span class="must">*</span>
               </div>
               <div class="used_photo_img">                 
                  <input class="form-input" type="file" name="promotion_post_img" multiple accept=".jpg, .png, .gif" onchange="preview();">
                  <br> 
				  <img class="preview-wrap" src="#" alt="등록할 상품 사진을 넣어주세요." onerror="this.style.display='none'"/> 
				  <br>
                  <div class="used_photo_explain" >
                     * 상품 이미지는 640x640에 최적화 되어 있습니다.<br> 
                     - 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br> 
                     - 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다. <br> 
                     - 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다. <br> 
                     - 이미지는 최대 5개까지 등록 가능합니다.<br>
                     최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
                  </div>
               </div>
            </div>
            <hr>

           <!-- 제목 입력 -->
            <div class="used_title" style="list-style: none;">
               <div class="used_text">
                  <span class="title_announce">제목 <span class="must">*</span></span>
                  <span><input class="form-title" type="text" name="post_title" placeholder="글 제목을 입력해주세요." oninput="checkTitle();"></span>
                  <div id="titleInfo"></div>
                  <div class="titleHeight"></div>              
            </div>
            <hr>


            <!-- 카테고리 선택 -->
            <div class="used_cate" >
               <div class="used_text">
                  카테고리 <span class="must">*</span>
                  <select class="promotion_cate_style" name="promotion_cate_num">
                     <option value="">카테고리 선택</option>
                     <option value="1">소식</option>
                     <option value="2">질문</option>
                     <option value="3">모임</option>
                     <option value="4">맛집</option>
                     <option value="5">분실센터</option>
                     <option value="6">사진전</option>                 
                  </select>
               </div>
            </div>
            <hr><br><br>						
            <!-- 상품 내용 입력 -->
            <div class="used_content">
               <div class="main">
                  <div class="used_content_text">
                     설명<span class="must">*</span>
                  </div>
                  <div class="content">
                     <div>
                        <textarea class="first" name="post_content" oninput="calculateCount();"></textarea>
                        <div align="right" class="countNum">
                           <span class="letter-count">0</span>/2000
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div style="clear: both;"></div>
            <br><hr>

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
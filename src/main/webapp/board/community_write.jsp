<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp"></jsp:include>
<link href="../css/12.promotion_write.css" type="text/css" rel="stylesheet">
<article style="padding-top: 200px;" id="used-write-form">
   <div class="container" align="left">
      <h1 align="left" style="font-size: 30px; font-weight: normal;">
         동네홍보 글쓰기 &nbsp; <span class="must">   *필수항목 </span>
      </h1>
      <br><br>
      <hr class="hr_style2">
      <br><br>
 
      <!--  
          준비 : post_title(글제목), used_cate_num(카테고리 번호), used_price(가격), used_content(내용) 
      -->

      <form action="promotion_post_write.user" method="post" enctype="multipart/form-data">
         <input type="hidden" name="board_no" value="2">
         
         <div class="used_container" >

            <!--  이미지 등록 -->
            <div class="used_photo">
               <div class="used_photo_text" >
                  상품이미지 <span class="must">*</span>
               </div>
               <div class="used_photo_img">
                 
                  <input class="form-input" type="file" name="promotion_post_img" multiple accept=".jpg, .png, .gif" onchange="preview();">
                  <div class="preview-wrap"></div>                
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
                  제목 <span class="must">*</span> 
                  <input class="form-title" type="text" name="post_title" placeholder="상품 제목을 입력해주세요." oninput="checkTitle();">
                  <div id="titleInfo"></div>
                  <div class="titleHeight"></div>
               </div>
            </div>
            <hr>


            <!-- 카테고리 선택 -->
            <div class="used_cate" >
               <div class="used_text">
                  카테고리 <span class="must">*</span>
                  <select class="promotion_cate_style" name="promotion_cate_num">
                     <option value="">카테고리 선택</option>
                     <option value="1">중고차/오토바이</option>
                     <option value="2">동네 구인구직</option>
                     <option value="3">부동산</option>
                     <option value="4">농수산물</option>
                     <option value="5">지역업체</option>
                     <option value="6">과외/클래스 모집</option>   
                     <option value="7">전시/공연</option>               
                  </select>
               </div>
            </div>
            <hr>
			
			 <!-- 전화번호 입력 -->
            <div class="used_phone" style="list-style: none;">
               <div class="used_text">
                  전화번호 <span class="must">*</span> 
                  <input class="form-phone" type="text" name="post_phone" placeholder="전화번호를 입력해주세요."  oninput="checkPhone();">
              	  <div id="phoneInfo"></div>
                  <div class="titleHeight"></div>
               </div>
            </div>
            <hr>
			
            <!-- 가격 입력 -->
            <div class="used_price">
               <div class="used_text">
                  가격 <span class="must">*</span> 
                  <input class="form-price" type="text" name="post_price" placeholder="숫자만 입력해주세요" oninput="checkPrice();">원
                  <div id="priceInfo"></div>
                  <div class="titleHeight"></div>
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

      </form>
   </div>
</article>

<jsp:include page="../template/footer.jsp"></jsp:include>
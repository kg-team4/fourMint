<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<title>민트 마켓</title>
<link rel="shortcut icon" type="image/x-icon"
   href="../img/logo_icon.png" />
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_market.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<script defer src="../js/mint_store.js"></script>

<!-- <script type="text/javascript" src="../js/mint_store.js"></script> -->

<article>
   <div class="slide">
      <input type="radio" name="circle" id="slide1">
        <input type="radio" name="circle" id="slide2">
        <input type="radio" name="circle" id="slide3">
        <input type="radio" name="circle" id="slide4">
      <ul class="slideImg">
         <li class="jsSlide"><a href=""><img src="../img/market_slide1.png" alt="민트마켓슬라이드1"></a></li>
         <li class="jsSlide"><a href=""> <img src="../img/market_slide2.png" alt="민트마켓슬라이드2"></a></li>
         <li class="jsSlide"><a href=""><img src="../img/market_slide3.png" alt="민트마켓슬라이드3"></a></li>
         <li class="jsSlide"><a href=""><img src="../img/market_slide4.png" alt="민트마켓슬라이드4"></a></li>
         <!-- <li class="jsSlide"><a href=""><img src="../img/slide5.png" alt="tea"></a></li> -->
      </ul>
      <ul class="circleBtn">
         <li><span class="circle" onclick="dotSlide(0)"><label for="slide1">&nbsp;</label></span></li>
         <li><span class="circle" onclick="dotSlide(1)"><label for="slide2">&nbsp;</label></span></li>
         <li><span class="circle" onclick="dotSlide(2)"><label for="slide3">&nbsp;</label></span></li>
         <li><span class="circle" onclick="dotSlide(3)"><label for="slide4">&nbsp;</label></span></li>
         <!-- <li>
                       <span class="circle" onclick="dotSlide(4)"></span>
                   </li> -->
      </ul>
   </div>



   <div class="best">
      <br>
      <br>
      <br>
      <h1>주변상품</h1>
      <p class="more">
         <a href="">more ></a>
      </p>
      <ul class="bestBox">
         <li><a href=""> <img
               src="../img/store_recommand_product01.png" alt="추천상품1">
         </a>
            <p>
               <span class="red">[카테고리]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(0)"></i>
               </span>
            </p>
            <p>
               <span>유칼리 스킨케어 원형패드</span> <span>9,900원</span>
            </p></li>
         <li><a href=""> <img
               src="../img/store_recommand_product02.png" alt="추천상품2">
         </a>
            <p>
               <span class="red">[카테고리]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(1)"></i>
               </span>
            </p>
            <p>
               <span>고무장갑 팔목라인</span> <span>2,500원</span>
            </p></li>
         <li><a href=""> <img
               src="../img/store_recommand_product03.png" alt="추천상품3">
         </a>
            <p>
               <span class="red">[카테고리]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(2)"></i>
               </span>
            </p>
            <p>
               <span>올인원 비건 샴푸볼 - 어성초 그린</span> <span>19,000원</span>
            </p></li>

      </ul>
   </div>

   <div class="best">
      <br>
      <br>
      <br>
      <h1>추천상품</h1>
      <p class="more">
         <a href="">more ></a>
      </p>
      <ul class="bestBox">
         <li><a href=""> <img
               src="../img/store_recommand_product01.png" alt="추천상품1">
         </a>
            <p>
               <span class="red">[LIVING]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(3)"></i>
               </span>
            </p>
            <p>
               <span>유칼리 스킨케어 원형패드</span> <span>9,900원</span>
            </p></li>
         <li><a href=""> <img
               src="../img/store_recommand_product02.png" alt="추천상품2">
         </a>
            <p>
               <span class="red">[KITCHEN]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(4)"></i>
               </span>
            </p>
            <p>
               <span>고무장갑 팔목라인</span> <span>2,500원</span>
            </p></li>
         <li><a href=""> <img
               src="../img/store_recommand_product03.png" alt="추천상품3">
         </a>
            <p>
               <span class="red">[BATH]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(5)"></i>
               </span>
            </p>
            <p>
               <span>올인원 비건 샴푸볼 - 어성초 그린</span> <span>19,000원</span>
            </p></li>

      </ul>
   </div>


   <div class="best">
      <br>
      <br>
      <br>
      <h1>인기상품</h1>
      <p class="more">
         <a href="">more ></a>
      </p>
      <ul class="bestBox">
         <li><a href=""> <img
               src="../img/store_recommand_product01.png" alt="추천상품1">
         </a>
            <p>
               <span class="red">[LIVING]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(6)"></i>
               </span>
            </p>
            <p>
               <span>유칼리 스킨케어 원형패드</span> <span>9,900원</span>
            </p></li>
         <li><a href=""> <img
               src="../img/store_recommand_product02.png" alt="추천상품2">
         </a>
            <p>
               <span class="red">[KITCHEN]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(7)"></i>
               </span>
            </p>
            <p>
               <span>고무장갑 팔목라인</span> <span>2,500원</span>
            </p></li>
         <li><a href=""> <img
               src="../img/store_recommand_product03.png" alt="추천상품3">
         </a>
            <p>
               <span class="red">[BATH]</span> <span> <i
                  class="fas fa-heart" onclick="handleModal(8)"></i>
               </span>
            </p>
            <p>
               <span>올인원 비건 샴푸볼 - 어성초 그린</span> <span>19,000원</span>
            </p></li>

      </ul>
   </div>



   <div class="modal">
      <ul>
         <li><img src="../img/store_recommand_product01.png"
            alt="카트에 넣은 상품" class="modalImg"></li>
         <li>장바구니에 담겼습니다.</li>
      </ul>
      <p>
         <a href="">이동 > </a>
      </p>
   </div>
   <div class="review">
      <!-- <h1>Review</h1>
            <p class="more"><a href="">more ></a></p>
            <ul class="reviewImg">
                <li><a href=""><img src="img/review1.png" alt="reviewImg"></a></li>
                <li><a href=""><img src="img/review2.png" alt="reviewImg"></a></li>
                <li><a href=""><img src="img/review3.png" alt="reviewImg"></a></li>
                <li><a href=""><img src="img/review4.png" alt="reviewImg"></a></li>
                <li><a href=""><img src="img/review5.png" alt="reviewImg"></a></li>
            </ul> -->
      <div class="top" onclick="handleTop()">TOP</div>
   </div>
   <!-- <img src="img/banner.png" alt="bannerImg" class="banner"> -->


</article>
<jsp:include page="../template/footer.jsp"></jsp:include>
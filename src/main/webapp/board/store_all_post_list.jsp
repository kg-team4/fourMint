<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>민트 스토어</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mint_store.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<jsp:include page="../template/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a93dcadf53.js" crossorigin="anonymous"></script>
<script defer src="../js/mint_store.js"></script>

<!-- <script type="text/javascript" src="../js/mint_store.js"></script> -->

<article>
	<div class="slide">
            <ul class="slideImg">
                <li class="jsSlide"><a href=""><img src="../img/store_slide1.png" alt="chickenBreast"></a></li>
                <li class="jsSlide"><a href=""><img src="../img/store_slide2.png" alt="dietLunchBox"></a></li>
                <li class="jsSlide"><a href=""><img src="../img/store_slide3.png" alt="konjacNoodles"></a></li>
                <li class="jsSlide"><a href=""><img src="../img/store_slide4.png" alt="freeShipping"></a></li>
                <!-- <li class="jsSlide"><a href=""><img src="../img/slide5.png" alt="tea"></a></li> -->
            </ul>
            <ul class="circleBtn">
                <li>
                    <span class="circle" onclick="dotSlide(0)"></span>
                </li>
                <li>
                    <span class="circle" onclick="dotSlide(1)"></span>
                </li>
                <li>
                    <span class="circle" onclick="dotSlide(2)"></span>
                </li>
                <li>
                    <span class="circle" onclick="dotSlide(3)"></span>
                </li>
                <!-- <li>
                    <span class="circle" onclick="dotSlide(4)"></span>
                </li> -->
            </ul>
        </div>
        <div class="best">
        	<br><br><br>
            <h1>추천상품</h1>
            <p class="more"><a href="">more ></a></p>
            <ul class="bestBox">
                <li>
                    <a href="">
                        <img src="../img/store_recommand_product01.png" alt="추천상품1">
                    </a>
                    <p>
                        <span class="red">[LIVING]</span>
                        <span>
                            <i class="fas fa-heart" onclick="handleModal(0)"></i>
                        </span>
                    </p>
                    <p>
                        <span>유칼리 스킨케어 원형패드</span>
                        <span>9,900원</span>
                    </p>
                </li>
                <li>
                    <a href="">
                        <img src="../img/store_recommand_product02.png" alt="추천상품2">
                    </a>
                    <p>
                        <span class="red">[KITCHEN]</span>
                        <span>
                            <i class="fas fa-heart" onclick="handleModal(1)"></i>
                        </span>
                    </p>
                    <p>
                        <span>고무장갑 팔목라인</span>
                        <span>2,500원</span>
                    </p>
                </li>
                <li>
                    <a href="">
                        <img src="../img/store_recommand_product03.png" alt="추천상품3">
                    </a>
                    <p>
                        <span class="red">[BATH]</span>
                        <span>
                            <i class="fas fa-heart" onclick="handleModal(2)"></i>
                        </span>
                    </p>
                    <p>
                        <span>올인원 비건 샴푸볼 - 어성초 그린</span>
                        <span>19,000원</span>
                    </p>
                </li>
                <li>
                    <a href="">
                        <img src="../img/store_recommand_product04.png" alt="추천상품4">
                    </a>
                        <p>
                        <span class="red">[BATH]</span>
                        <span>
                            <i class="fas fa-heart" onclick="handleModal(3)"></i>
                        </span>
                    </p>
                    <p>
                        <span>대나무칫솔</span>
                        <span>2,900원</span>
                    </p>
                </li>
                <li>
                    <a href="">
                        <img src="../img/store_recommand_product01.png" alt="추천상품5">
                    </a>
                    <p>
                        <span class="red">[LIVING]</span>
                        <span>
                            <i class="fas fa-heart" onclick="handleModal(4)"></i>
                        </span>
                    </p>
                    <p>
                        <span>유칼리 스킨케어 원형패드</span>
                        <span>19,000원</span>
                    </p>
                </li>
                <li>
                    <a href="">
                        <img src="../img/store_recommand_product01.png" alt="추천상품6">
                    </a>
                    <p>
                        <span class="red">[LIVING]</span>
                        <span>
                            <i class="fas fa-heart" onclick="handleModal(5)"></i>
                        </span>
                    </p>
                    <p>
                        <span>유칼리 스킨케어 원형패드</span>
                        <span>19,000원</span>
                    </p>
                </li>
            </ul>
        </div>
        <div class="modal">
            <ul>
                <li><img src="../img/store_recommand_product01.png" alt="카트에 넣은 상품" class="modalImg"></li>
                <li>장바구니에 담겼습니다.</li>
            </ul>
            <p><a href="">이동 > </a></p>
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
            <div class="top" onclick="handleTop()">
                TOP
            </div>
        </div>
        <!-- <img src="img/banner.png" alt="bannerImg" class="banner"> -->
        
    </section>


</article>













<!-- <script type="text/javascript" src="../js/4.10.js"></script>
<link href="../css/4.10.layout.css" type="text/css" rel="stylesheet">
<link href="../css/4.10.content.css" type="text/css" rel="stylesheet">
 -->
<!-- <article>
	<div class="block wide-banner">
            "와이드 슬라이드 배너"
            <div class="wide-slide">
                <input type="radio" name="slide" id="slide1" checked>
                <input type="radio" name="slide" id="slide2">
                <input type="radio" name="slide" id="slide3">
                <input type="radio" name="slide" id="slide4">
                <ul class="imgs">
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                </ul>
                <div class="bullets">
                    <label for="slide1">&nbsp;</label>
                    <label for="slide2">&nbsp;</label>
                    <label for="slide3">&nbsp;</label>
                    <label for="slide4">&nbsp;</label>
                </div>            
            </div>
     </div>
     "메인 컨텐츠 영역"
        <main class="block">
            "이미지 띠 배너"
            <div class="element banner">
                <a href="#"><img src="./img/banner_01.jpg" alt="띠 배너"></a>
            </div>
            "롤링 배너"
            <div class="element rolling">
                <input type="radio" id="rollingprev" name="rolling" class="rollingprev" checked><label for="rollingprev"></label>
                <input type="radio" id="rollingnext" name="rolling" class="rollingnext"><label for="rollingnext"></label>
                <ul class="grid4 single-row">
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="./img/shop1.jpg" alt="샘플상품1"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">샘플상품1</a></div>
                            <ul>
                                <li><span>상품요약정보</span> : <span>#상품요약 설명</span></li>
                                <li><span>정가</span> : <span>12,345원</span></li>
                                <li><span>판매가</span> : <span>12,345원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="./img/shop2.jpg" alt="샘플상품1"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">샘플상품2</a></div>
                            <ul>
                                <li><span>상품요약정보</span> : <span>#상품요약 설명</span></li>
                                <li><span>정가</span> : <span>12,345원</span></li>
                                <li><span>판매가</span> : <span>12,345원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="./img/shop3.jpg" alt="샘플상품1"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">샘플상품3</a></div>
                            <ul>
                                <li><span>상품요약정보</span> : <span>#상품요약 설명</span></li>
                                <li><span>정가</span> : <span>12,345원</span></li>
                                <li><span>판매가</span> : <span>12,345원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="./img/shop4.jpg" alt="샘플상품1"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">샘플상품4</a></div>
                            <ul>
                                <li><span>상품요약정보</span> : <span>#상품요약 설명</span></li>
                                <li><span>정가</span> : <span>12,345원</span></li>
                                <li><span>판매가</span> : <span>12,345원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="./img/shop5.jpg" alt="샘플상품1"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">샘플상품5</a></div>
                            <ul>
                                <li><span>상품요약정보</span> : <span>#상품요약 설명</span></li>
                                <li><span>정가</span> : <span>12,345원</span></li>
                                <li><span>판매가</span> : <span>12,345원</span></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            "상품목록 4개씩 "
            <div class="element">
            	<h1>추천상품</h1>
            	<br>
                <ul class="grid4 multi-row">
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="../img/store_recommand_product01.png" alt="추천상품1"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">유칼리 스킨케어 원형패드</a></div>
                            <ul>
                                <li><span>판매가</span> : <span>9,900원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="../img/store_recommand_product02.png" alt="추천상품2"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">고무장갑 팔목라인</a></div>
                            <ul>
                                <li><span>판매가</span> : <span>2,000원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="../img/store_recommand_product03.png" alt="추천상품3"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">올인원 비건 샴푸볼 - 어성초 그린</a></div>
                            <ul>
                                <li><span>판매가</span> : <span>19,000원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="../img/store_recommand_product04.png" alt="추천상품4"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">대나무칫솔</a></div>
                            <ul>
                                <li><span>판매가</span> : <span>2,800원</span></li>
                            </ul>
                        </div>
                    </li>                                                
                </ul>
            </div>          	
            신상품
            <div class="element">
            	<h1>신상품</h1>
            	<br>
                <ul class="grid4 multi-row">
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="../img/store_recommand_product01.png" alt="추천상품1"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">유칼리 스킨케어 원형패드</a></div>
                            <ul>
                                <li><span>판매가</span> : <span>9,900원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="../img/store_recommand_product02.png" alt="추천상품2"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">고무장갑 팔목라인</a></div>
                            <ul>
                                <li><span>판매가</span> : <span>2,000원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="../img/store_recommand_product03.png" alt="추천상품3"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">올인원 비건 샴푸볼 - 어성초 그린</a></div>
                            <ul>
                                <li><span>판매가</span> : <span>19,000원</span></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="thumbnail">
                            <div class="img">
                                <a href="#"><img src="../img/store_recommand_product04.png" alt="추천상품4"></a>
                            </div>
                            <div class="icon">
                                <span class="new"></span><span class="md"></span><span class="sale"></span>
                            </div>
                        </div>
                        <div class="description txt-xs">
                            <div class="pname"><a href="#">대나무칫솔</a></div>
                            <ul>
                                <li><span>판매가</span> : <span>2,800원</span></li>
                            </ul>
                        </div>
                    </li>                                                
                </ul>
            </div>
        </main>
</article> -->

<jsp:include page="../template/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<title>��Ʈ ����</title>
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
			<li class="jsSlide"><a href=""><img src="../img/market_slide1.png" alt="chickenBreast"></a></li>
			<li class="jsSlide"><a href=""><img src="../img/store_slide2.png" alt="dietLunchBox"></a></li>
			<li class="jsSlide"><a href=""><img src="../img/store_slide3.png" alt="konjacNoodles"></a></li>
			<li class="jsSlide"><a href=""><img src="../img/store_slide4.png" alt="freeShipping"></a></li>
		</ul>
		<ul class="circleBtn">
			<li><span class="circle" onclick="dotSlide(0)"><label for="slide1">&nbsp;</label></span></li>
			<li><span class="circle" onclick="dotSlide(1)"><label for="slide2">&nbsp;</label></span></li>
			<li><span class="circle" onclick="dotSlide(2)"><label for="slide3">&nbsp;</label></span></li>
			<li><span class="circle" onclick="dotSlide(3)"><label for="slide4">&nbsp;</label></span></li>
		</ul>
	</div>

	<div class="best">
		<br>
		<br>
		<br>
		<h1>�ֺ���ǰ</h1>
		<p class="more">
			<a href="">more ></a>
		</p>
		<ul class="bestBox">
			<li><a href=""> <img
					src="../img/store_recommand_product01.png" alt="��õ��ǰ1">
			</a>
				<p>
					<span class="red">[ī�װ�]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(0)"></i>
					</span>
				</p>
				<p>
					<span>��Į�� ��Ų�ɾ� �����е�</span> <span>9,900��</span>
				</p></li>
			<li><a href=""> <img
					src="../img/store_recommand_product02.png" alt="��õ��ǰ2">
			</a>
				<p>
					<span class="red">[ī�װ�]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(1)"></i>
					</span>
				</p>
				<p>
					<span>���尩 �ȸ����</span> <span>2,500��</span>
				</p></li>
			<li><a href=""> <img
					src="../img/store_recommand_product03.png" alt="��õ��ǰ3">
			</a>
				<p>
					<span class="red">[ī�װ�]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(2)"></i>
					</span>
				</p>
				<p>
					<span>���ο� ��� ��Ǫ�� - ��� �׸�</span> <span>19,000��</span>
				</p></li>

		</ul>
	</div>

	<div class="best">
		<br>
		<br>
		<br>
		<h1>��õ��ǰ</h1>
		<p class="more">
			<a href="">more ></a>
		</p>
		<ul class="bestBox">
			<li><a href=""> <img
					src="../img/store_recommand_product01.png" alt="��õ��ǰ1">
			</a>
				<p>
					<span class="red">[LIVING]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(0)"></i>
					</span>
				</p>
				<p>
					<span>��Į�� ��Ų�ɾ� �����е�</span> <span>9,900��</span>
				</p></li>
			<li><a href=""> <img
					src="../img/store_recommand_product02.png" alt="��õ��ǰ2">
			</a>
				<p>
					<span class="red">[KITCHEN]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(1)"></i>
					</span>
				</p>
				<p>
					<span>���尩 �ȸ����</span> <span>2,500��</span>
				</p></li>
			<li><a href=""> <img
					src="../img/store_recommand_product03.png" alt="��õ��ǰ3">
			</a>
				<p>
					<span class="red">[BATH]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(2)"></i>
					</span>
				</p>
				<p>
					<span>���ο� ��� ��Ǫ�� - ��� �׸�</span> <span>19,000��</span>
				</p></li>

		</ul>
	</div>


	<div class="best">
		<br>
		<br>
		<br>
		<h1>�α��ǰ</h1>
		<p class="more">
			<a href="">more ></a>
		</p>
		<ul class="bestBox">
			<li><a href=""> <img
					src="../img/store_recommand_product01.png" alt="��õ��ǰ1">
			</a>
				<p>
					<span class="red">[LIVING]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(0)"></i>
					</span>
				</p>
				<p>
					<span>��Į�� ��Ų�ɾ� �����е�</span> <span>9,900��</span>
				</p></li>
			<li><a href=""> <img
					src="../img/store_recommand_product02.png" alt="��õ��ǰ2">
			</a>
				<p>
					<span class="red">[KITCHEN]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(1)"></i>
					</span>
				</p>
				<p>
					<span>���尩 �ȸ����</span> <span>2,500��</span>
				</p></li>
			<li><a href=""> <img
					src="../img/store_recommand_product03.png" alt="��õ��ǰ3">
			</a>
				<p>
					<span class="red">[BATH]</span> <span> <i
						class="fas fa-heart" onclick="handleModal(2)"></i>
					</span>
				</p>
				<p>
					<span>���ο� ��� ��Ǫ�� - ��� �׸�</span> <span>19,000��</span>
				</p></li>

		</ul>
	</div>



	<div class="modal">
		<ul>
			<li><img src="../img/store_recommand_product01.png"
				alt="īƮ�� ���� ��ǰ" class="modalImg"></li>
			<li>��ٱ��Ͽ� �����ϴ�.</li>
		</ul>
		<p>
			<a href="">�̵� > </a>
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
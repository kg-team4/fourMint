<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../css/payment.css" />

<jsp:include page="../template/header.jsp"></jsp:include>
<style>
.title_box {
	list-style: none;
	padding-left: 0px;
}
</style>
<!-- #Container -->
<div id="Container" style="padding-top: 143px;">
	<!-- #Contents -->
	<form name="cartForm" id="cartForm">
		<div id="Contents">
			<!-- title_box -->
			<div class="title_box" style="display: flex; align-items: center; justify-content: space-between;">
				<h1>
					장바구니 <span class="tx_num"></span>
				</h1>
				<ul class="step_list">
					<li class="on"><span class="hide">현재단계</span> <span class="step_num tx_num">1</span> 장바구니</li>
					<!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li>&emsp; <span class="step_num tx_num">2</span> 주문/결제
					</li>
					<li class="last">&emsp; <span class="step_num tx_num">3</span> 주문완료
					</li>
				</ul>
			</div>
			<!--// title_box -->
			<!-- 민트마켓 배송상품 -->
			<h2 class="sub-title2">민트마켓 배송상품</h2>
			<table class="tbl_prd_list tableFix">
				<colgroup>
					<col style="width: 100px" />
					<col style="width: 300px" />
					<col style="width: 100px" />
					<col style="width: 100px" />
					<col style="width: 110px" />
					<col style="width: 120px" />
					<col style="width: 150px" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><input type="checkbox" checked id="inp_allRe1" name="" value="" disabled="disabled" title="민트마켓 배송상품 전체 선택" /></th>
						<th scope="col">상품정보</th>
						<th scope="col">판매가</th>
						<th scope="col">수량</th>
						<th scope="col">구매가</th>
						<th scope="col">배송정보</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="delivery" value="0" />	
					<c:set var="priceAll" value="0" />
					<c:set var="iu" value="0" />
					<c:forEach var="cart" items="${ cart }">
						<c:set var="price" value="${cart.product_price * cart.amount}" />
						<c:set var="bool" value="0" />
						<tr>
							<td colspan="7">
								<div class="tbl_cont_area">
									<div class="tbl_cell w40" style="width: 100px;">
										<c:set var="doo" value="first"/>
										<c:choose>
											<c:when test="${first eq doo}">
												<input type="checkbox" checked name="checkBox" value="${iu}" class="chkSmall" />
											</c:when>
											<c:otherwise>
												<c:forEach var="check" items="${chk}">
													<c:if test="${iu eq check}">
														<input type="checkbox" checked name="checkBox" value="${iu}" class="chkSmall" />
														<c:set var="bool" value="1" />
													</c:if>
												</c:forEach>
												<c:if test="${bool eq 0 }">
													<input type="checkbox" name="checkBox" value="${iu}" class="chkSmall" />
												</c:if>
											</c:otherwise>
										</c:choose>
										<c:set var="iu" value="${iu + 1 }" />
									</div>
									<div class="tbl_cell w390" style="width: 300px;">
										<div class="prd_info " style="width: 300px; padding: 0 10px 0 10px; display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
											<a href="#"><img src="${cart.url }" style="width: 180px; height: 150px; object-fit: contain; background-color: #f7f7f7;" /></a>
											<p class="prd_flag">${cart.product_name}</p>
										</div>
									</div>
									<div class="tbl_cell w110" style="width: 100px;">
										<span style="color: #26e4ca" class="price tx_num">${cart.product_price }</span>원
									</div>
									<div class="tbl_cell w200" style="width: 100px;">
										<div class="prd_cnt" style="display: flex;">
											<input type="hidden" value="${cart.cart_id }" /> 
											<input class="amount" name="amount" type="text" style="width: 30px; height: 28px" value="${cart.amount }"> 
											<input type="button" class="plus" style="padding: 0; width: 13px; height: 13px" value="+" /> 
											<input type="button" class="minus" style="padding: 0; width: 13px; height: 13px" value="-" />
										</div>
									</div>
									<div class="tbl_cell w110">
										<span style="color: #26e4ca" class="editPrice tx_num">${price }</span>원
										<c:set var="priceAll" value="${ priceAll + price }" />
									</div>
									<div class="tbl_cell w120  ">
										<p class="prd_delivery">
											<strong class="deliStrongText"> 
											<c:choose>
												<c:when test="${price < 50000 }">
													2500원
												</c:when>
												<c:otherwise>
													무료배송
												</c:otherwise> 
											</c:choose>
											<span class="ex">도서·산간 제외</span></strong>
										</p>
									</div>
									<div class="tbl_cell w150">
										<div class="btn_group">
											<button type="button" class="btnSmall wGreen buyBtn" name="btnBuy">
												<span>바로구매</span>
											</button>
											<input type="hidden" name="cart_id" value="${cart.cart_id }" />
											<input type="hidden" name="priceAll" value="${price }" />
											<input type="hidden" name="delivery" value="1" />
											<button type="button" class="btnSmall wGray delete" name="btnDelete">
												<span>삭제</span>
											</button>
											<input type="hidden" name="cart_id" value="${cart.cart_id }" />
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 민트마켓 배송상품 결제금액 -->
			<div class="basket_price_info">
				<div class="btn_area">
					<button type="button" class="btnSmall wGray type2" id="partDelBtn1" name="partDelBtn">
						<span>선택상품 삭제</span>
					</button>
				</div>
				<div class="sum_price">
					<c:choose>
						<c:when test="${priceAll >= 50000 }">
							<c:set var="delivery" value="0" />
						</c:when>
						<c:otherwise>
							<c:set var="delivery" value="1" />
						</c:otherwise>
					</c:choose>
					총 판매가 <span class="tx_num">${priceAll }</span>원 <span class="tx_sign plus">+</span> 배송비 <span class="tx_num">${delivery * 2500 }</span>원 <span class="tx_sign equal">=</span> <span class="tx_total_price">총 결제금액 <span class="tx_price"><span class="tx_num">${priceAll + delivery * 2500}</span>원</span></span>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="order_btn_area order_cart">
	<button type="button" class="btnOrangeW" name="partOrderBtn" onclick="location.href='order.do'">선택주문</button>
	<a href="order.do?priceAll=${priceAll}&delivery=${delivery}" ><button type="button" class="btnOrange" name="allOrderBtn">전체주문</button></a>
</div>
<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
<div id="directTop">
	<button>
		<span></span>
	</button>
</div>
<div id="directTop" style="display: block;">
	<button>
		<span></span>
	</button>
</div>

<script>
	$(".buyBtn").on('click', function() {
		var id = $(this).next().val();
		var priceAll = $(this).next().next().val();
		var delivery = $(this).next().next().next().val();
		var amount = $(this).parent().parent().prev().prev().prev().find(".amount").val(); 
		
		location.href="order.do?id="+id+"&priceAll="+priceAll+"&delivery="+delivery+"&amount="+amount;
	});

	$(".delete").on('click', function() {
		var id = $(this).next().val();
		$.ajax({
			url : 'delete.do',
			type : "post",
			cache : false,
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			data : {
				"id" : id,
			},
			success : function(data) {
				console.log(data);
				$('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
			},
			error : function(data) {
				alert('error');
			}//error
		})//ajax
	});//click

	var fnBtnAction = {
		init : function() {
			var scroll_pos = $(window).scrollTop();
			if (scroll_pos > $(window).height() / 2) {
				$('#directTop').fadeIn(500);
			}

			this.addEvent();
		},
		addEvent : function() {
			$(window).scroll(function() {
				var scroll_pos = $(window).scrollTop();

				if (scroll_pos > $(window).height() / 2) {
					$('#directTop').fadeIn(500);
				} else if (scroll_pos == 0) {
					$('#directTop').fadeOut(500);
				}
			});
			$('#directTop button').click(function() {
				$(window).scrollTop(0);
			});
		}
	}
	$('#directTop').length && fnBtnAction.init();

	$(".plus").on('click', function() {
		var amount = $(this).prev().val();
		var id = $(this).prev().prev().val();

		var checkboxValues = new Array();
		$("input[name='checkBox']:checked").each(function() {
			checkboxValues.push($(this).val());
		});

		$.ajax({
			url : 'countUp.do',
			type : "post",
			cache : false,
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			data : {
				"amount" : amount,
				"id" : id,
				"checkboxValues" : checkboxValues
			},
			success : function(data) {
				console.log(data);
				$('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
			},
			error : function(data) {
				alert('error');
			}//error
		})//ajax
	});//click

	$(".minus").on('click', function() {
		var amount = $(this).prev().prev().val();
		var id = $(this).prev().prev().prev().val();

		var checkboxValues = [];
		$("input[name='checkBox']:checked").each(function() {
			checkboxValues.push($(this).val());
		});

		$.ajax({
			url : 'countDown.do',
			type : "post",
			cache : false,
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			data : {
				"amount" : amount,
				"id" : id,
				"checkboxValues" : checkboxValues
			},
			success : function(data) {
				console.log(data);
				$('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
			},
			error : function(data) {
				alert('error');
			}//error
		})//ajax
	});//click
</script>
<%@include file="../template/footer.jsp"%>

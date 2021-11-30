<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/payment.css" />
<jsp:include page="../template/header.jsp"></jsp:include>
<style>
.title_box {
	list-style: none;
	padding-left: 0px;
}
</style>
<!-- #Container -->
<article>
	<div id="Container">
		<!-- #Contents -->
		<form name="cartForm" id="cartForm" action="order.do" method="post" style="display: flex;">
			<div id="Contents" style="min-height: 150%;">
				<!-- title_box -->
				<div class="title_box" style="display: flex; align-items: center; justify-content: space-between;">
					<h1>
						장바구니<span class="tx_num">${fn:length(cart) }</span>
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
							<th scope="col"><input type="checkbox" checked id="inp_allRe1" name="" value="" title="민트마켓 배송상품 전체 선택" /> <script>
								$("#inp_allRe1").click(function() {
									var chk = $("#inp_allRe1").prop("checked");
									if (chk) {
										$(".chkSmall").prop("checked",true);
									} else {
										$(".chkSmall").prop("checked",false);
									}

									var allList = new Array();
									$("input[class='chkSmall']:checked").each(function() {
										allList.push($(this).attr("data-cartNum"));
									});

									if (allList.length != 0) {
										$.ajax({
											url : "/calculate.do",
											type : "post",
											data : {
												chbox : allList
											},
											success : function(data) {
												$("#allPrice").text(data);
												if (Number($("#allPrice").text()) >= 50000) {
													$("#allDelivery").text('0원');
													$("#reallyPrice").text(data);
												} else {
													$("#allDelivery").text('2500원');
													$("#reallyPrice").text(data + 2500);
												}
											}
										});
									} else if (allList.length == 0) {
										$("#allPrice").text('0');
										$("#allDelivery").text('0원');
										$("#reallyPrice").text('0');
									}
								});
							</script></th>
							<th scope="col">상품정보</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">구매가</th>
							<th scope="col">배송정보</th>
							<th scope="col">선택</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum" value="0" />
						<c:forEach var="cart" items="${cart }" varStatus="status">
							<tr>
								<td colspan="7">
									<div class="tbl_cont_area">
										<div class="tbl_cell w40" style="width: 100px;">
											<input type="checkbox" checked name="checkBox" class="chkSmall" data-cartNum="${cart.cart_id }" />
											<script>
												$(".chkSmall").click(function() {
													$("#inp_allRe1").prop("checked",false);

													var list = new Array();
													$("input[class='chkSmall']:checked").each(function() {
														list.push($(this).attr("data-cartNum"));
													});

													if (list.length != 0) {
														$.ajax({
															url : "/calculate.do",
															type : "post",
															data : {
																chbox : list
															},
															success : function(data) {
																$("#allPrice").text(data);
															if (Number($("#allPrice").text()) >= 50000) {
																$("#allDelivery").text('0원');
																$("#reallyPrice").text(data);
															} else {
																$("#allDelivery").text('2500원');
																$("#reallyPrice").text(data + 2500);
															}
														}
													});
													} else if (list.length == 0) {
														$("#allPrice").text('0');
														$("#allDelivery").text('0원');
														$("#reallyPrice").text('0');
													}
												});
											</script>
										</div>
										<div class="tbl_cell w390" style="width: 300px;">
											<div class="prd_info " style="width: 300px; padding: 0 10px 0 10px; display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
												<a href="#"><img src="${cart.url }" style="width: 180px; height: 150px; object-fit: contain; background-color: #f7f7f7;" /></a>
												<p class="prd_flag">${cart.product_name}</p>
											</div>
										</div>
										<div class="tbl_cell w110" style="width: 100px;">
											<span style="color: #26e4ca" class="price">${cart.product_price }</span>원
										</div>
										<div class="tbl_cell w200" style="width: 100px;">
											<div class="prd_cnt" style="display: flex;">
												<input disabled class="amount${status.index }" name="amount" type="text" style="width: 30px; height: 28px" value="${cart.amount }">
												<input type="button" class="plus" style="padding: 0; width: 13px; height: 13px" value="+" />
												<input type="button" class="minus" style="padding: 0; width: 13px; height: 13px" value="-" />
												<input type="hidden" value="${cart.cart_id }" />
											</div>
										</div>
										<div class="tbl_cell w110">
											<span style="color: #26e4ca" class="aPrice${status.index }">${cart.product_price * cart.amount }</span>원
										</div>
										<div class="tbl_cell w120  ">
											<p class="prd_delivery s">
												<strong class="deliStrongText${status.index }"> <c:choose>
														<c:when test="${(cart.product_price * cart.amount) > 50000 }">무료배송</c:when>
														<c:otherwise>2,500원</c:otherwise>
													</c:choose>
												</strong> <span class="ex">도서·산간 제외</span>
											</p>
										</div>
										<div class="tbl_cell w150">
											<div class="btn_group">
												<input type="hidden" value="${cart.cart_id }" />
												<button type="button" class="btnSmall wGreen buyBtn" name="btnBuy">
													<span>바로구매</span>
												</button>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<c:set var="sum" value="${sum + (cart.product_price * cart.amount)}" />
						</c:forEach>
					</tbody>
				</table>
				<!-- 민트마켓 배송상품 결제금액 -->
				<div class="basket_price_info">
					<div class="btn_area">
						<button type="button" class="btnSmall wGray type2" id="partDelBtn1" name="partDelBtn">
							<span>선택상품 삭제</span>
						</button>
						<script>
							$("#partDelBtn1").click(function() {
								var confirm_val = confirm("정말 삭제하시겠습니까?");

								if (confirm_val) {
									var checkArr = new Array();

									$("input[class='chkSmall']:checked").each(function() {
										checkArr.push($(this).attr("data-cartNum"));
									});

									$.ajax({
										url : "/delete.do",
										type : "post",
										data : {
											chbox : checkArr
										},
										success : function() {
											location.href = "/payment.do";
										}
									});
								}
							});
						</script>
					</div>
					<div class="sum_price" id="reloadTest">
						총 판매가 <span class="tx_num" id="allPrice">${sum}</span>원 <span class="tx_sign plus"> + </span> 배송비 <span class="tx_num" id="allDelivery"> <c:choose>
								<c:when test="${sum >= 50000 }">
						0원
						</c:when>
								<c:otherwise>
						2500원
						</c:otherwise>
							</c:choose>
						</span> <span class="tx_sign equal">=</span> <span class="tx_total_price">총 결제금액 <span class="tx_price"><span id="reallyPrice" class="tx_num"> <c:choose>
										<c:when test="${sum >= 50000 }">
						${sum}
						</c:when>
										<c:otherwise>
						${sum + 2500 }
						</c:otherwise>
									</c:choose></span>원</span></span>
					</div>
				</div>
				<div class="order_btn_area order_cart">
					<input type="hidden" id="arrayParam" name="arrayParam" />
					<button type="button" class="btnOrange" name="allOrderBtn" id="orderBuy">주문하기</button>
					<script>
						$("#orderBuy").click(function() {
							var array = new Array();
							$("input[class='chkSmall']:checked").each(function() {
								array.push($(this).attr("data-cartNum"));
							});
							$("#arrayParam").val(array);
							$("#cartForm").submit();
						});
					</script>
				</div>
			</div>
		</form>
	</div>
</article>
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
<div id="footer_wrapper" style="position: relative;">
	<footer>
		<div class="footer-right">
			<a href="storeServiceCenter.do?cate=notice" style="font-size: 20px;"><strong>고객센터</strong></a>
			<p>
				1588-8282<br> 09:00 ~ 18:00<br> SAT 10:00 ~ 13:00
			</p>
		</div>
		<div class="footer-center">
			<p class="link">
				<a href="useAgreement.do">이용약관</a>&nbsp; | &nbsp; <a href="privacyPolicy.do">개인정보처리방침</a>&nbsp; | &nbsp; <a href="locationPolicy.do">위치기반서비스</a>
			</p>
			<p>
				서울 종로구 돈화문로 26 단성사 4층 <br> 사업자 등록번호 : 010-0000-4919 &nbsp; (주)민트마켓 대표 이승재 <br> <span class="copyright">COPYRIGHT Mint Market Inc. ALL RIGHTS RESERVED.</span>
			</p>
		</div>
		<div class="footer-left">
			<p>
				대표이사, 개인정보 책임자 : 이승재 <br> TEL : 02-0000-0000 <br> FAX : 02-000-0001 <br> E-MAIL : asd4919@daum.net
			</p>
		</div>
	</footer>
</div>
<script>
	$(".buyBtn").on('click', function() {
		var id = $(this).prev().val();

		location.href = "order.do?one=" + id;
	});

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

	$(".plus").on('click',function() {
		var name = "." + $(this).prev().attr("class");
		var amount = $(this).prev().val();
		var id = $(this).next().next().val();
		var aPrice = "."
				+ $(this).parent().parent().next().children()
						.attr("class");
		var bPrice = $(this).parent().parent().prev()
				.children().text();
		var delivery = "."
				+ $(this).parent().parent().next().next()
						.children().children().attr("class");

		$.ajax({
			url : 'countUp.do',
			type : "post",
			cache : false,
			dataType : 'json',
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			data : {
				"amount" : amount,
				"id" : id
			},
			success : function(data) {
				if ((Number($(name).val()) + 1) < 11) {
					$(name).val(Number($(name).val()) + 1);
					$(aPrice).text(
							Number($(name).val())
									* Number(bPrice));
					if (Number($(aPrice).text()) >= 50000) {
						$(delivery).text("무료배송");
					} else {
						$(delivery).text("2,500원");
					}
					var list = new Array();
					$("input[class='chkSmall']:checked").each(
							function() {
								list.push($(this).attr(
										"data-cartNum"));
							});
					console.log(list);

					$.ajax({
						url : "/calculate.do",
						type : "post",
						data : {
							chbox : list
						},
						success : function(data) {
							$("#allPrice").text(data);
							if (Number($("#allPrice")
									.text()) >= 50000) {
								$("#allDelivery").text(
										'0원');
								$("#reallyPrice").text(
										data);
							} else {
								$("#allDelivery").text(
										'2500원');
								$("#reallyPrice").text(
										data + 2500);
							}
						}
					});
				} else {
					return;
				}
			},
			error : function(data) {
				alert('error');
			}//error
		})//ajax
	});//click

	$(".minus").on('click',function() {
		var name = "." + $(this).prev().prev().attr("class");
		var amount = $(this).prev().prev().val();
		var id = $(this).next().val();
		var aPrice = "."
				+ $(this).parent().parent().next().children()
						.attr("class");
		var bPrice = $(this).parent().parent().prev()
				.children().text();
		var delivery = "."
				+ $(this).parent().parent().next().next()
						.children().children().attr("class");

		$.ajax({
			url : 'countDown.do',
			type : "post",
			cache : false,
			dataType : 'json',
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			data : {
				"amount" : amount,
				"id" : id
			},
			success : function(data) {
				if ((Number($(name).val()) - 1) > 0) {
					$(name).val(Number($(name).val()) - 1);
					$(aPrice).text(
							Number($(name).val())
									* Number(bPrice));
					if (Number($(aPrice).text()) >= 50000) {
						$(delivery).text("무료배송");
					} else {
						$(delivery).text("2,500원");
					}
					var list = new Array();
					$("input[class='chkSmall']:checked").each(
							function() {
								list.push($(this).attr(
										"data-cartNum"));
							});
					console.log(list);

					$.ajax({
						url : "/calculate.do",
						type : "post",
						data : {
							chbox : list
						},
						success : function(data) {
							$("#allPrice").text(data);
							if (Number($("#allPrice")
									.text()) >= 50000) {
								$("#allDelivery").text(
										'0원');
								$("#reallyPrice").text(
										data);
							} else {
								$("#allDelivery").text(
										'2500원');
								$("#reallyPrice").text(
										data + 2500);
							}
						}
					});
				} else {
					return;
				}
			},
			error : function(data) {
				alert('error');
			}//erro
		})//ajax
	});//click
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	Kakao.init('3095bed7ad41f197a883fe4fb8b87ee3');
	console.log(Kakao.isInitialized());

	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						$.ajax({
							type : "POST",
							url : "kakaoLogin.do",
							data : JSON.stringify(response.kakao_account),
							contentType : "application/json",
							success : function(res) {
								let url = 'home.do';
								location.replace(url);
							},
						})
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}

	//카카오로그아웃
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					$.ajax({
						url : 'kakaoLogout.do',
						success : function(res) {
							let url = 'home.do';
							location.replace(url);
						},

						fail : function(error) {
							console.log(error.message)
						}
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
</script>
</body>
</html>

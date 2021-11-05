<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/payment.css" />	
<script>		
		
		var _jsUrl = 'https://www.oliveyoung.co.kr/pc-static-root/js/';
		var _cssUrl = 'https://www.oliveyoung.co.kr/pc-static-root/css/';
		var _imgUrl = 'https://image.oliveyoung.co.kr/pc-static-root/image/';
		var _imgUrlLocale = 'https://image.oliveyoung.co.kr/pc-static-root/image/ko/';
		var _stampEvtUrl = '500000100140038';
		var _goodsImgUploadUrl = 'https://image.oliveyoung.co.kr/uploads/images/goods/';
		var _cabUrl = 'https://image.oliveyoung.co.kr/pc-static-root/cab/';
		var _isLogin = true;
		var _genSctCd  = 'B' == 'A' ? 'M' :  ('null' == 'B' ? 'F' : '');
		var _mainUrl = 'home.do';
		var _goodsImg85 = '85';
		var _gdasImgUploadUrl = 'https://image.oliveyoung.co.kr/uploads/images/gdasEditor/';
		var _profileImgUploadUrl = 'https://image.oliveyoung.co.kr/uploads/images/mbrProfile/';
		
		var _cdnImgUrl = '//image.oliveyoung.co.kr/uploads/';
		var _fileUploadUrl = 'https://image.oliveyoung.co.kr/uploads/images/';
		var _currentUrl = '/cart/getCart.do';		
				
		var _redirectFoBaseUrl = 'https://www.oliveyoung.co.kr/store'; // ston redirect 처리위해 추가
		var _redirectMoBaseUrl = 'https://m.oliveyoung.co.kr/m'; // ston redirect 처리위해 추가
		var _redirectMaBaseUrl = 'https://ma.oliveyoung.co.kr/m'; // ston redirect 처리위해 추가
		
		var _stonUseYnReqHeader = 'N'; // ston redirect 처리위해 추가

		var _offlineGoodsNo = 'A000000000000';
</script>	
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/common/publish/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/common/publish/prefixfree.min.js"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/common/publish/slick.min.js"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/common/publish/common.js?dumm=202110280001"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/netfunnel/netfunnel.js?dumm=202110280001" charset="UTF-8"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/netfunnel/pc_skin.js?dumm=202110280001" charset="UTF-8"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/common/oylogger/oy-logger.20200128113203.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/common/common.utils.js" charset="UTF-8"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/common/publish/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
		
	<!-- RecoBell Script Start -->
	<script type="text/javascript"
		src="//logger.ai.oliveyoung.co.kr/js/eglpcidgen.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script type="text/javascript">
try {
	var recoSsoMbrNo = 'M0000000500064';
	var recoCuid = '8b47cf9f-efd1-48e4-8f83-10ee8a07945b';
	// User ID 암호화
	var hashedRecoSsoMbrNo = CryptoJS.SHA256(recoSsoMbrNo).toString();
	
	if(recoSsoMbrNo === 'null'){
	    hashedRecoSsoMbrNo = "";
	}

}catch(e){}

</script>
	<!-- RecoBell Script End  -->
	<!-- New Relic을 위한 작업 -->
	<!-- 20210813 데이터 독 사용시 뉴렐릭 부분 삭제 필요 with newRelic.js-->
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.popupWindow.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.ddslick.min.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.tmpl.min.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.number.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.lazyload.js"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/publish/slick.min.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/elrte/elrte.full.js?dumm=202110280001"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/elrte/i18n/elrte.ko.js?dumm=202110280001"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/common.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/common.link.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/text.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/ajax.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/utf_8.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/useragent_util.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jcarousellite_1.0.1.min.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/search/beta.fix.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/search/beta2.fix.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/search/search.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/search/ark.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/curation/curation.js?dumm=202110280001"
		charset="utf-8"></script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/gtm/gtm.js?dumm=202110280001"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="https://www.oliveyoung.co.kr/pc-static-root/js/event/eventLiveBroadcast.js?dumm=202110280001"></script>
	<script>
		(function(h,o,u,n,d) {
			h=h[d]=h[d]||{q:[],onReady:function(c){h.q.push(c)}}
			d=o.createElement(u);d.async=1;d.src=n
			n=o.getElementsByTagName(u)[0];n.parentNode.insertBefore(d,n)
		})(window,document,'script','https://www.datadoghq-browser-agent.com/datadog-rum.js','DD_RUM')
		DD_RUM.onReady(function() {
			DD_RUM.init({
				clientToken: 'pubc89a173fb013152879aea4ea5580abcb',
				applicationId: '4a379cad-dfb2-4a67-930e-6416ebc206b1',
				site: 'datadoghq.com',
				service:'oympprd',
				env:'prd',
				// Specify a version number to identify the deployed version of your application in Datadog
				// version: '1.0.0',
				sampleRate: 20,
				trackInteractions: true,
				allowedTracingOrigins:[/http:\/\/.*\.oliveyoung\.co\.kr/, /https:\/\/.*\.oliveyoung\.co\.kr/]
			})
		})
	</script>
	<form name="ssologinfrm"
		action="https://www.oliveyoung.co.kr/store/login/ssoLogin.do"
		method="post">
		<input type="hidden" id="cjssoq" name="cjssoq" />
	</form>

	<script type="text/javascript">
	
</script>
	<!-- #Container -->
	<div id="Container" style="padding-top: 143px;">
		<!-- #Contents -->
		<form name="cartForm" id="cartForm">
			<input type="hidden" id="btnOrderTp" name="btnOrderTp" value="" /> 
			<input type="hidden" id="cartNo" name="cartNo" value="" /> 
			<input type="hidden" id="partYn" name="partYn" value="" /> 
			<input type="hidden" id="optChgYn" name="optChgYn" value="Y" /> 
			<input type="hidden" id="quickYn" name="quickYn" value="N" /> 
			<input type="hidden" id="quickOrdPsbMaxQty" name="quickOrdPsbMaxQty" value="999"> 
			<input type="hidden" id="quickOrdTimeFrom" name="quickOrdTimeFrom" value="0" /> 
			<input type="hidden" id="quickOrdTimeTo" name="quickOrdTimeTo" value="24" /> 
			<input type="hidden" id="ktmDestYn" name="ktmDestYn" value='Y' /> 
			<input type="hidden" id="oldAddrYn" name="oldAddrYn" value='Y' />
			
			<div id="Contents">			
			<!-- title_box -->
			<div class="title_box">
				<h1>장바구니 										
						<span class="tx_num"></span>									
				</h1>
				<ul class="step_list">
					<li class="on"><span class="hide">현재단계</span>
					<span class="step_num tx_num">1</span> 장바구니</li>
					<!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li><span class="step_num tx_num">2</span> 주문/결제</li>
					<li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
				</ul>
				<style>
					.title_box {
					    list-style: none;
					    padding-left: 0px;
				}
				</style>
			</div>
			<!--// title_box -->
						
				<!--// 배송지 선택 -->
					<script type="text/javascript">
					var cartInfoList = new Array();
					var cartTenInfoList = new Array();
					var cartFourtyInfoList = new Array();
					</script>
				<!--     /////////////////////////////           직 배 송 상 품 리 스 트         //////////////////////////////////    -->
				<!-- 민트마켓 배송상품 -->
				<h2 class="sub-title2">민트마켓 배송상품</h2>
				<table class="tbl_prd_list tableFix">
					<caption>상품정보, 판매가, 수량, 구매가, 배송정보, 선택으로 이루어진 민트마켓 배송상품 장바구니 목록 표</caption>
					<colgroup>
						<col style="width: 100px" />
						<col style="width: *" />
						<col style="width: 100px" />
						<col style="width: 100px" />
						<col style="width: 110px" />
						<col style="width: 120px" />
						<!-- 2017-01-13 수정 -->
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
						<tr soldOutYn="N" cno="255549202" goodsNo="A000000154991"
							itemNo="001" lgcGoodsNo="8809657113673" oriPno="" pno=""
							promKndCd="" rsvSaleYn="N" drtPurYn="N" dispCatNo=''
							buyCondStrtQtyAmt="" getCondStrtQtyAmt="" pkgGoodsNo=""
							quickYn='N' strNo='' criteo-goods="A000000154991001"
							trackingCd="Home_Curation2_1" gateCd="Main">
							<input type="hidden" id="soldout_yn" name="soldout_yn" value="N" />
							<td colspan="7">
								<div class="tbl_cont_area">
								<script type="text/javascript">
									cartItem = {};
									cartItem.orgSalePrc = parseInt("#");
									cartItem.salePrc = parseInt("#");
									cartItem.normPrc = parseInt("0");
									cartItem.goodsNo = "A000000154991";
									cartItem.goodsNm = "#";
									cartItem.cartNo =  "255549202";
									cartItem.promNo =  "";
									cartItem.thnlPathNm = "10/0000/0015/A00000015499102ko.jpg?l=ko";
									cartItem.onlBrndNm = "#";
									cartItem.itemNo = "001";
									cartItem.itemNm = "";
									cartItem.ordQty = parseInt("1");
									cartItem.ordPsbMinQty = parseInt("1");
									cartItem.ordPsbMaxQty = parseInt("10");
									cartItem.cpnDcAmt = parseInt("0");
									cartItem.dlexFreeYn = "N";
									cartItem.dlexFreeStdAmt = parseInt("20000");
									cartItem.dlexCostTpCd = "10";
									cartItem.dlexAmt = parseInt("2500");
									cartItem.goodsCpnYn = "N";
									cartItem.midCatNo = "10000010001";
									cartItem.sumPkgYn = "Y";
									cartItem.pkgGoodsNo = "";
								</script>
									<div class="tbl_cell w40">
										<input type="checkbox" salePrc="0" orgSalePrc="0" cpnDcAmt="0" ordQty="0" rsvStockQty="N" stockQty="3142" checked="checked" id="inp_prd_chk1" name="s_checkbox1" soldOutYn="N" value="0" class="chkSmall" title="#" /> 
										<input type="hidden" name="s_cart_no" value="255549202" /> 
										<input type="hidden" name="s_prom_no" value="" />
										<input type="hidden" name="s_buy_cond_strt_qty_amt" value="" /> 
										<input type="hidden" name="s_disp_cat_no" value="" /> 
										<input type="hidden" name="s_goods_no" value="A000000154991" /> 
										<input type="hidden" name="s_item_no" value="001" /> 
										<input type="hidden" name="s_cpn_dc_amt" value="0" /> 
										<input type="hidden" name="s_org_sale_prc" value="37800" /> 
										<input type="hidden" name="s_sale_prc" value="29400" /> 
										<input type="hidden" name="s_drt_pur_yn" value="N" /> 
										<input type="hidden" name="s_dlex_polc_no" value="1" /> 
										<input type="hidden" name="s_trade_shp_cd" value="1" />
										<input type="hidden" name="s_entr_no" value="C19207" /> 
										<input type="hidden" name="s_sum_pkg_yn" value="Y" /> 
										<input type="hidden" name="s_whsg_expc_dt" value="" /> 
										<input type="hidden" name="s_dlex_free_yn" value="N" />
									</div>
									<div class="tbl_cell w390">
										<div class="prd_info ">
											<a class="prd_img" href="javascript:common.link.moveGoodsDetail('A000000154991','');"></a>										
											<p class="prd_opt"></p>
											<p class="prd_flag"></p>
										</div>
									</div>
									<div class="tbl_cell w110">
										<span class="cur_price"><span class="tx_num"></span>원</span>
									</div>
									<div class="tbl_cell w200">
										<div class="prd_cnt">
											<select class="amount" name="s_amount" prdTp="1" prdCnt="0"
												ordPsbMinQty="1" ordPsbMaxQty="10" qtyAddUnit="1" ordQty="1"
												title="상품 수량 선택">
												<option value="1" selected>1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="10+">10+</option>
											</select>
										</div>
										<button type="button" class="btnSmall wGray"
											style="display: none;" name="btnQtyMod">
											<span>변경</span>
										</button>
									</div>
									<div class="tbl_cell w110">
										<span class="org_price"> <span class="tx_num"></span>원</span> 
										<span class="pur_price"><span class="tx_num"></span>원</span>
									</div>
									<!-- 2017-01-13 수정 -->
									<div class="tbl_cell w120  ">
										<!-- 합배송, 배송 예정 class / sum   delay추가 하기 -->
										<p class="prd_delivery">
											<strong id="deliStrongText"> 무료배송
										 		<span class="ex">도서·산간 제외</span>
											</strong>
										</p>
									</div>
									<div class="tbl_cell w150">
										<div class="btn_group">
											<button id="255549202|A000000154991|001" type="button" class="btnSmall wGreen" name="btn_buy" data-attr="장바구니^장바구니바로구매^바로구매">
												<span data-attr="장바구니^장바구니바로구매^바로구매">바로구매</span>
											</button>
											<button type="button" class="btnSmall wGray delete" name="btnDelete" data-attr="장바구니^장바구니상품삭제^삭제">
												<span data-attr="장바구니^장바구니상품삭제^삭제">삭제</span>
											</button>
									<!-- 버튼 공간(스페이스바)없이 붙여주세요. -->
										</div>
									</div>
								</div> 								
								</div>
							</td>
						</tr>
						<script type="text/javascript">
							cartInfoList.push(cartItem);
							cartTenInfoList.push(cartItem);
						</script>
					</tbody>
				</table>			
				<!-- 민트마켓 배송상품 결제금액 -->
				<div class="basket_price_info">
					<div class="btn_area">
						<button type="button" class="btnSmall wGray type2"
							id="partDelBtn1" name="partDelBtn">
							<span>선택상품 삭제</span>
						</button>
					</div>
					<div class="sum_price">
						총 판매가 <span class="tx_num">0</span>원 <span class="tx_num">0</span>원
						<span class="tx_sign plus">+</span> 배송비 <span class="tx_num">0</span>원
						<span class="tx_sign equal">=</span> <span
							class="tx_total_price">총 결제금액 <span class="tx_price"><span
								class="tx_num">0</span>원</span></span>
					</div>
				</div>
				<!-- 민트마켓 배송상품 결제금액 -->
				<!--     /////////////////////////////           업 체 배 송 상 품 리 스 트 END        //////////////////////////////////    -->
				총 결제예상금액 <span class="span_quickDeliCharge" style="display: none;">최소</span><span
					class="tx_price"><span class="tx_num">0</span>원</span>
			</div>
	</div>
	<div class="order_btn_area order_cart">
		<button type="button" class="btnOrangeW" name="partOrderBtn" onclick="location.href=' ../pay/order.jsp'" data-attr="장바구니^주문유형^선택주문">선택주문</button>
		<button type="button" class="btnOrange" name="allOrderBtn" onclick= "location.href=' ../pay/order.jsp'" data-attr="장바구니^주문유형^전체주문">전체주문</button>
	</div>
	<!-- Y  -->
	</form>
	</div>
	<!-- //#Contents -->
	</div>
	<!-- //#Container -->
	<!-- LayerPop Dim 영역 -->
	<div class="dim"></div>
	<!-- //LayerPop Dim 영역 -->
	<!-- popCont 스크롤 영역 -->
	<div class="popCont" id="dlexAmtPopLayer" style="display: none;"></div>
	<!-- //popCont 스크롤 영역 -->
		
	<script type="text/javascript"
		src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/delivery.js?dumm=202110280001"></script>
	<script type="text/javascript"
		src="https://www.oliveyoung.co.kr/pc-static-root/js/cart/cart.js?dumm=202110280001"></script>
	<script type="text/javascript"
		src="https://www.oliveyoung.co.kr/pc-static-root/js/goods/prom.js?dumm=202110280001"></script>
	<script type="text/javascript"
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/popup/zipcode.js?dumm=202110280001"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
$(document).ready(function() {
 	// 레코벨 사용 여부 셋팅
    mcart.base.recoBellUseYn = "Y";
	// 장바구니 부하를 줄이기 위한 레코벨 show 여부 셋팅
    mcart.base.recoBellViewYn = "Y";
    
    if(typeof cartInfoList != "undefined"){
        if(cartInfoList != null && cartInfoList != ''){
            mcart.base.init();   
        }   
    }
    mcart.base.quick.init();
    
    mcart.base.quick.quickCnt = "0";
});

$('[data-rel="layer"]').layerOpen();
</script>
	
	<!-- 찜 확인 레이어 -->
	<div class="layerAlim zzimOn wishPrd" style="display: none;">
		<span class="icon"></span>
		<p class="one">
			<strong>좋아요</strong>
		</p>
	</div>
	<!--// 찜 확인 레이어 -->
	<!-- 찜 취소 레이어 -->
	<div class="layerAlim zzimOff wishPrd" style="display: none;">
		<span class="icon"></span>
		<p class="one">
			<strong>좋아요</strong>
		</p>
	</div>
	<!--// 찜 취소 레이어 -->
	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop">
		<button>
			<span></span>TOP
		</button>
	</div>
	<script type="text/javascript">
var _isLoginPage =false;
if(_isLoginPage){
	if (history.state == null) {
	    history.replaceState({status:"check"}, null, null);
	    history.pushState({status:"checkPage"}, null, null);
	}
	
	// 백키
	$(window).bind("popstate", function() {
	    if (history.state != null && history.state.status == "check") {
			//로그인페이지 통한 진입 메인페이지 이동       
			location.href = _baseUrl + "main/main.do";
	    }
	});
}
$('.sel_family_group').find('.sel_option').on({
	'click' : function(e){
		e.preventDefault();
		$(this).parent().find('.sel_option_list').toggleClass('hide');
		if($(this).parent().find('.sel_option_list').hasClass('hide')){
			$(this).attr('title','상세내용 보기')
		}else{
			$(this).attr('title','상세내용 닫기')
		}
	}
});

var _gaUaKey = "UA-92021806-1";
var _wlDomain = "www.oliveyoung.co.kr";

// [3533553] (GA) GA/GTM 기본 셋팅 및 데이터레이어 태깅
var _cartNormalCnt = "1";
var _cartQuickCnt = "0";

//복사/선택 방지 소스
$(window).load(function() {
	
	oy.log.expose();
	console.log('log 종료 처리');
	//기본 상단 GNB & 슬라이드 바 처리
	common.gnb.init();

	//LazyLoad 실행
	common.setLazyLoad();

	//공통 둥둥이 배너 실행
	$('.main_moving_banner').length && common.bann.init();
 
	var parser = new UserAgentUtil(navigator.userAgent);
	// alert(parser.getBrowser().name + " : " + parser.getBrowser().version);
 	if (parser.getBrowser().name.indexOf("msie") >= 0 && (parser.getBrowser().version.startWith("8") || parser.getBrowser().version.startWith("7"))) {
		$(".infoUpgr").show();
	}
 
});

</script>
	<script
		src="https://www.oliveyoung.co.kr/pc-static-root/js/common/common.weblog.js?dumm=202110280001"
		charset="utf-8">
	</script>
	<!-- [3533553] (GA) GA/GTM 기본 셋팅 및 데이터레이어 태깅 - dataLayer -->
	<script>
	window.dataLayer = window.dataLayer || [];
	window.dataLayer.push({
		'dimension3': 'pc', 																										// cd3 : 채널유형 [앱:app, 모바일웹:mw, PC웹:pc]
		'dimension18': (sessionStorage.getItem("checkLoginStatus") ? 'y' : 'n'),													// cd18 : 로그인 여부 [로그인:y, 비로그인:n]
		'dimension25': (_cartNormalCnt ? _cartNormalCnt : 0),																		// cd25 : 장바구니 내 상품수 (일반배송) [* 없을경우:0]
		'dimension121': (sessionStorage.getItem("gtmPreviousTitle") ? sessionStorage.getItem("gtmPreviousTitle") : undefined)		// cd121 : 이전 페이지명 (title) [* 없을경우 undefined]
	});

	// 이전 페이지 title 저장 to sessionStorage
	sessionStorage.setItem("gtmPreviousTitle", document.title);

	// GTM Product Impression 공통 적용
	$(document).ready(function() {
		gtm.goods.initProductImpression();
	});
</script>
	<!-- Google Tag Manager -->
	<!-- [3561762] (GA) GTM 컨테이너 분리 -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-PJLS5M7');
	</script>
			<!-- 기존 GA 스크립트 -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-NF4R92W');
	</script>
	<!-- End Google Tag Manager -->
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NF4R92W"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
	<div class="layer_pop_wrap" id="layer_pop_wrap" style="z-index: 999">
	</div>
	<div class="popup-contents" id="pop_cont" style="top: 50%; width: 650px; margin: -258px 0 0 -325px; display: none; z-index: 999"></div>
	<div class="layer_pop_wrap w490" id="basketOption" style="z-index: 999"></div>
	<div class="layer_pop_wrap w488" id="layerWrap488" style="z-index: 999"></div>
	<div class="layer_pop_wrap w680" id="layerWrap680" style="z-index: 999"></div>
	<div class="layer_pop_wrap w850" id="layerWrap850" style="z-index: 999"></div>	
	<div class="layer_pop_wrap" id="zipcodeQuick" style="z-index: 999"></div>
	<div class="layer_pop_wrap w750 tdLayer" id="deliveryTracking"></div>
	
	
<%@include file="../template/footer.jsp" %>

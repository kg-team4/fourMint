<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"></jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/order.css" />
<style>
.search-icon{
	border: 4px solid #26e4ca !important;
	border-left: 0px !important;
	background-color: white !important;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<div id="Gnb" class="main gen1">
	<div id="gnbWrap"></div>
</div>

<script src="//logger.ai.oliveyoung.co.kr/js/eglpcidgen.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script>
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
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.popupWindow.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.ddslick.min.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.tmpl.min.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.number.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jquery.lazyload.js" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/publish/slick.min.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/elrte/elrte.full.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/elrte/i18n/elrte.ko.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/common.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/common.link.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/text.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/ajax.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/utf_8.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/useragent_util.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/common/jcarousellite_1.0.1.min.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/search/beta.fix.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/search/beta2.fix.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/search/search.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/search/ark.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/gtm/gtm.js?dumm=202110280001" charset="utf-8"></script>

<div id="Container">
	<input type="hidden" id="all" name="all" value="${all }" />
	<!-- #Contents -->
	<div id="Contents" style="padding-top: 135px;">
		<script>;
			var kakaoApiKey = "";
			
			var jsDum = "?dumm=202110280001";
			$(document).ready(function(){
			
			function layTooltip(tar){
				var tar = '#'+tar,
					_target = $(tar);
					_this = _target.siblings('button'),
					_thisPos = _this.position();
				_target.css({
					bottom:(_thisPos.bottm)+22,
					left:(_thisPos.left)-9
				});
				_target.show();
				_target.focus();
			}
			function layTooltipClose(tar){
				var tar = '#'+tar,
					_target = $(tar);
				_target.hide();
				_target.siblings('button').focus();
			}
		</script>
		
		<!-- title_box -->
		<div class="title_box" style="list-style: none; padding-left: 0px; margin: auto; width: 1040px; display: flex; align-items: center; justify-content: space-between;">
			<h1 style="padding: 0;">주문/결제</h1>
			<ul class="step_list">
				<li>&emsp;<span class="step_num tx_num">1</span>장바구니</li>
				<li class=on>&emsp;<span class="hide">현재단계</span> <span class="step_num tx_num">2</span>주문/결제</li>
				<!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
				<li class=last>&emsp;<span class="step_num tx_num">3 </span>주문완료</li>
			</ul>
		</div>
		<!--// title_box -->
		
		<form name="orderForm" id="orderForm">
			<!-- 배송지 정보 -->
			<div class="title_wrap">
				<h2 class="sub-title2">배송지정보</h2>
				<p class="sub_area" id="pickupHide6"></p>
			</div>
			<table class="tbl_inp_form important" id="dlvpInfo">
				<!-- 2017-01-18 클래스 추가 -->
				<caption></caption>
				<colgroup>
					<col style="width: 2000px" />
					<col style="width: *" />
				</colgroup>       
				<tbody>
					<tr>
						<th scope="row">배송지선택</th>
						<td>
							<span class="chk_area mgzero"> 
								<input type="radio" id="btn_dlvp_exist" name="inpAddrSel" value="" targetid="exist" checked="checked" data-attr="배송지정보^1_배송지선택" /> 
								<label for="btn_dlvp_exist">기존 배송지</label>
							</span> <!-- 2020-08-04 o2oJJ 24H 화면 제어로 인한 주석 처리 --> 
							<span class="chk_area">
								<input type="radio" id="btn_dlvp_new" name="inpAddrSel" value="" onclick="this.form.reset();" autocomplete="off" targetid="new" data-attr="배송지정보^1_배송지선택" /> 
								<label for="btn_dlvp_new">신규 배송지</label>
							</span> 
							<span class="chk_area"> 
								<input style="margin-left: 36.5px;" type="checkbox" id="setBaseDlvpYn" name="baseDlvpYn" value="Y" checked="checked" /> 
								<label for="setBaseDlvpYn">기본 배송지 설정</label>
							</span>
							<div class="show" id="divSelect_div"></div>
						</td>
					</tr>
					<tr id="pickupHide1" type="exist">
						<th scope="row">받는분</th>
						<td class="imp_data">
							<!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 --> 
							<input type="text" id="rmitNm_exist" name="rmitNm" value="" orgvalue="" class="inpH28" title="받는분 이름을 입력해주세요." style="width: 200px; readonly: false;" this="받는분 이름은" data-attr="배송지정보^1_받는분" /> 
							<span class="chk_area"> 
								<input type="checkbox" id="copyToDlvp_exist" class="sameSame" targetid="exist" /> 
								<label class="" for="copyToDlvp_exist">주문자정보와 동일</label>
							</span> 
							<!-- 2017-01-18 수정 : 위치변경 -->
						</td>
					</tr>
					<tr class="sumtr1" id="pickupHide2" type="exist">
						<th scope="row">연락처1</th>
						<td class="imp_data">
							<!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 --> 
							<select id="rmitCellSctNo_exist" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." style="width: 90px;" orgvalue="" data-attr="배송지정보^1_연락처1">
								<option value="">선택</option>
								<option value="010" selected='selected'>010</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">070</option>
								<option value="080">080</option>
						</select>
						 - 
						<input type="text" id="rmitCellTxnoNo_exist" name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28" j title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width: 90px" data-attr="배송지정보^1_연락처1" />
						 - 
						<input type="text" id="rmitCellEndNo_exist" name="rmitCellEndNo" value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width: 90px" data-attr="배송지정보^1_연락처1" />
						</td>
					</tr>
					<tr class="sumtr2" id="pickupHide3" type="exist">
						<th scope="row">연락처2</th>
						<td>
							<select id="rmitTelRgnNo_exist" name="rmitTelRgnNo" class="selH28" title="연락처2 앞자리를 선택해주세요." style="width: 90px">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">070</option>
								<option value="080">080</option>
							</select>
							 - 
							<input type="text" id="rmitTelTxnoNo_exist" name="rmitTelTxnoNo" value="" class="inpH28" title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는" style="width: 90px" />
							 - 
							<input type="text" id="rmitTelEndNo_exist" name="rmitTelEndNo" value="" class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는" style="width: 90px" />
						</td>
					</tr>
					<!-- --------------------------------------------------------- 주소 시작 --------------------------------------------------------- -->
					<tr id="pickupHide4" type="exist">
						<th scope="row">주소</th>
						<td class="imp_data">
							<!-- 2017-01-25 수정 : 클래스 추가 --> 
							<input type="text" id="stnmRmitPostNo_exist" name="rmitPostNo" value="" class="inpH28" title="우편번호를 검색해주세요." style="width: 90px" readonly="readonly" /> 
							<input type="hidden" id="rmitPostNo_exist" name="stnmRmitPostNo" value="" title="우편번호를 검색해주세요." /> 
							<!-- ..2020-08-05 o2oJJ 24H에서의 우편번호 찾기 버튼 제어를 위해서 기존 버튼 hide 처리후 제어 버튼 추가-->
							<button type="hidden" class="btnSamll wGreen w100" id="search-zipcode-pop_exist" style="display: none;" data-attr="배송지정보^1_주소">
								<span>우편번호 찾기(기존)</span>
							</button>
							<button type="button" class="btnSmall wGreen w100" onclick="openDaumPostcode()" id="search-zipcode-pop_exist" data-attr="배송지정보^1_주소">
								<span>우편번호 찾기</span>
							</button>
							<div class="addr_box">
								<input type="hidden" id="stnmRmitPostAddr_exist" name="stnmRmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" /> 
								<input type="hidden" id="rmitBaseAddr_exist" name="rmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" />
								<!-- 주소 입력 시 보여지는 부분 -->
								<p class="addr_new">
									<span class="tx_tit">주소</span> : <input type="text" name="stnmPostAddr_exist" id="roadAddress" readonly required="required"> <span class="tx_addr" id="stnmPostAddr_exist"></span>
									<!--  도로명주소를 넣어주세요 -->
								</p>
							</div> 
							<input type="text" id="tempRmitDtlAddr_exist" value="" class="inpH28" title="상세주소를 입력해주세요." style="width: 500px;" this="상세 주소는" /> 
							<input type="hidden" id="stnmRmitDtlAddr_exist" name="stnmRmitDtlAddr" value="" orgvalue="" class="inpH28" title="상세주소를 입력해주세요." style="width: 500px" this="상세 주소는" /> 
							<input type="hidden" id="rmitDtlAddr_exist" name="rmitDtlAddr" value="" orgvalue="" class="inpH28" title="상세주소를 입력해주세요. " style="width: 500px" /> 
							<input type="hidden" id="emdNm_exist" name="emdNm" /> <input type="hidden" id="admrNm_exist" name="admrNm" />
						</td>
					</tr>
					<!-- 2017-01-18 추가 (신규 배송지 선택 시) -->
					<tr type="new" class="new_order_area" style="display: none;">
						<th scope="row">배송지명</th>
						<td class="imp_data">
							<input type="text" id="dlvpNm_new" name="dlvpNm" value="" class="inpH28" title="배송지명을 입력해주세요." style="width: 300px;" this="배송지명은" disabled="disabled" />
						</td>
					</tr>
					<!-- --------------------------------------------------------- 주소 끝 --------------------------------------------------------- -->
					<!--// 2017-01-18 추가 -->
					<tr type="new" class="new_order_area" style="display: none;">
						<th scope="row">받는분</th>
						<td class="imp_data">
							<!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 --> <input type="text" id="rmitNm_new" name="rmitNm" value="" orgvalue="" class="inpH28" title="받는분 이름을 입력해주세요." style="width: 200px" this="받는분 이름은" disabled="disabled" data-attr="배송지정보^1_받는분" /> <span class="chk_area"> <input type="checkbox"
								id="copyToDlvp_new" targetid="new" disabled="disabled" /> <label for="copyToDlvp_new">주문자정보와 동일</label></span> <!-- 2017-01-18 수정 : 위치변경 -->
						</td>
					</tr>
					<tr type="new" class="new_order_area" style="display: none;">
						<th scope="row">연락처1</th>
						<td class="imp_data">
							<!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 --> 
							<select id="rmitCellSctNo_new" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." orgvalue="" style="width: 100px" disabled="disabled" data-attr="배송지정보^1_연락처1">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">070</option>
								<option value="080">080</option>
							</select>
							 - 
							<input type="text" id="rmitCellTxnoNo_new" name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width: 100px" disabled="disabled" data-attr="배송지정보^1_연락처1" />
							 - 
							<input type="text" id="rmitCellEndNo_new" name="rmitCellEndNo" value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width: 100px" disabled="disabled" data-attr="배송지정보^1_연락처1" />
						</td>
					</tr>
					<tr type="new" class="new_order_area" style="display: none;">
						<th scope="row">연락처2</th>
						<td>
							<select id="rmitTelRgnNo_new" name="rmitTelRgnNo" class="selH28" title="연락처2 앞자리를 선택해주세요." style="width: 90px" disabled="disabled">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="044">044</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
									<option value="070">070</option>
									<option value="080">080</option>
							</select>
							 - 
							<input type="text" id="rmitTelTxnoNo_new" name="rmitTelTxnoNo" value="" class="inpH28" title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는" style="width: 100px" disabled="disabled" />
							 - 
							<input type="text" id="rmitTelEndNo_new" name="rmitTelEndNo" value="" class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는" style="width: 100px" disabled="disabled" /></td>
					</tr>
					<tr type="new" class="new_order_area" style="display: none;">
						<th scope="row">주소</th>
						<td class="imp_data">
							<!-- 2017-01-25 수정 : 클래스 추가 --> 
							<input type="text" id="stnmRmitPostNo_new" name="rmitPostNo" value="" class="inpH28" title="우편번호를 검색해주세요." style="width: 90px" readonly="readonly" disabled="disabled" /> 
							<input type="hidden" id="rmitPostNo_new" name="stnmRmitPostNo" value="" title="우편번호를 검색해주세요." disabled="disabled" /> 
							<input type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_new" data-attr="배송지정보^1_주소"> 
							<span>우편번호 찾기</span>

							<div class="addr_box">
								<input type="hidden" id="stnmRmitPostAddr_new" name="stnmRmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled" /> 
								<input type="hidden" id="rmitBaseAddr_new" name="rmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled" />
								<!-- 주소 입력 시 보여지는 부분 -->
								<p class="addr_new">
									<span class="tx_tit">도로명</span> : <span class="tx_addr" id="stnmPostAddr_new"></span>
									<!--  도로명주소를 넣어주세요 -->
								</p>
								<p class="addr_old">
									<span class="tx_tit">지번</span> : <span class="tx_addr" id="baseAddr_new"></span>
									<!--  지번주소를 넣어주세요 -->
								</p>
								<!--// 주소 입력 시 보여지는 부분 -->
							</div> 
							<input type="text" id="tempRmitDtlAddr_new" value="" class="inpH28" title="상세주소를 입력해주세요." style="width: 500px;" this="상세 주소는" disabled="disabled" />
							<p class="txtDot mgT5">신규배송지 정보는 마이페이지 내 배송지에 저장됩니다.</p> 
							<input type="hidden" id="stnmRmitDtlAddr_new" name="stnmRmitDtlAddr" value="" class="inpH28" title="상세주소를 입력해주세요." style="width: 500px" this="상세 주소는" disabled="disabled" /> 
							<input type="hidden" id="rmitDtlAddr_new" name="rmitDtlAddr" value="" class="inpH28" title="상세주소를 입력해주세요." style="width: 500px" disabled="disabled" /> 
							<input type="hidden" id="emdNm_new" name="emdNm" /> 
							<input type="hidden" id="admrNm_new" name="admrNm" />
						</td>
					</tr>
				</tbody>
			</table>
			<!--// 배송지 정보 --> 
			
			<!-- 배송 요청사항 -->
			<div id="pickupHide5" style="margin-bottom: 250px;">
				<div class="title_wrap">
					<h2 class="sub-title2">배송 요청사항</h2>
				</div>
				<table class="tbl_inp_form important">
					<caption></caption>
					<colgroup>
						<col style="width: 170px" />
						<col style="width: *" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">배송 메시지</th>
							<td>
								<select id="mbrMemoCont" class="selH28" title="택배배송 메시지를 선택해주세요." style="width: 350px">
									<option value="none">배송메시지를 선택해주세요.</option>
									<option value="그냥 문 앞에 놓아 주시면 돼요.">그냥 문 앞에 놓아 주시면 돼요.</option>
									<option value="직접 받을게요.(부재 시 문 앞)">직접 받을게요.(부재 시 문 앞)</option>
									<option value="벨을 누르지 말아주세요.">벨을 누르지 말아주세요.</option>
									<option value="도착 후 전화주시면 직접 받으러 갈게요.">도착 후 전화주시면 직접 받으러 갈게요.</option>
								</select> 
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</form>
	</div>
	<div class="order_payment_box fixArea" >
		<div class="right_area" style="margin-top: 250px; margin-left: 400px;">
			<!-- 최종 결제정보 -->
			<h2 class="sub-title2" style="margin-right: 0;">최종 결제정보</h2>
			<!-- 최종 결제정보 -->
			<ul class="total_payment_box" style="margin-top: 0; margin-bottom: 15px;">
				<li style="padding-left: 0;">
					<span class="tx_tit">총 상품금액</span> 
					<span class="tx_cont">
						<span class="tx_num">${price}</span>원
					</span> 
					<input type="hidden" name="goodsAmt" value="0">
				</li>
				<li style="padding-left: 0;" class="line_top2">
					<span class="tx_tit">총 배송비</span> 
					<span class="tx_cont"> 
						<span class="tx_num" id="dlexPayAmt_span">${delivery }</span>원
					</span> 
					<input type="hidden" name="dlexPayAmt" value="0">
				</li>
				<li class="total">
					<span class="tx_tit">최종 결제금액</span> 
					<span class="tx_cont"> 
						<span class="tx_num" id="totPayAmt_sum_span">${price + delivery}</span>원
					</span> 
					<input type="hidden" name="remainAmt" value="0"> <input type="hidden" name="ordPayAmt" value="0"> <input type="hidden" name="goodsNm" value="" />
				</li>
				<li>
					<button class="btnPayment" id="btnPay" name="btnPay" type="button" data-attr="최종결제정보^6_결제하기">결제하기</button>
				</li>
			</ul>
			<p class="inchk clrfix">
				<input type="checkbox" id="savePayMethodYn" name="savePayMethodYn" value="Y" checked="checked" paymeancd="" acqrcd="" instmmcnt="" pntuseyn="" bnkcd="" morcmannm="" data-attr="최종결제정보^6_빠른모드" />
				<!-- <input type="checkbox" id="fastpaySave" name="" value=""> -->
				<label for="savePayMethodYn">지금 설정을 다음 주문에도 사용하겠습니다.<br>(빠른모드)</label>
			</p>
			<div class="agree_payment_box open" id="agreeList">
				<div class="all_agree_cont">
					<p>주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</p>
					<!-- 2017-01-18 수정 : 문구수정 -->
					<input type="checkbox" id="agree_all" name="TrrmsCheck1ed" value="Y" data-attr="최종결제정보^6_결제대행동의" onchange="agreeList()" class="selectBox" /> 
					<label for="agree_all">모두 동의</label>
				</div>
				<ul class="other_agree_cont">
					<p class="tx_tit">주문 상품정보에 대한 동의</p>
					<p class="tx_cont2">
						<input type="checkbox" id="agree_1" name="agreeChk" value="" title="주문 상품정보 및 결제대행 서비스 이용약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의" class="selectBox" /> 
						<label for="agree_1"> 주문하실상품, 가격, 배송정보, 할인내역등을 최종 확인하였으며, 구매에 동의합니다. <br> (전상거래법 제8조 제2항)	</label>
					</p>
					<p class="tx_tit">결제대행 서비스 이용약관 동의</p>
					<p class="tx_cont">
						<input type="checkbox" id="agree_2_1" name="agreeChk" value="" title="전자금융거래 기본약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의" class="selectBox" /> 
						<label for="agree_2_1">전자금융거래 기본약관</label> <input type="button" value="약관보기" id="agree_2_1" class="btnSmall wGray" onclick="location.href='../order_agreement/order_agree_2_1.html'" />
					</p>
					<p class="tx_cont">
						<input type="checkbox" id="agree_2_2" name="agreeChk" value="" title="개인정보 수집 및 이용약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의" class="selectBox" /> 
						<label for="agree_2_2">개인정보 수집 및 이용 동의</label> <input type="button" value="약관보기" id="agree_2_2" class="btnSmall wGray" onclick="location.href='../order_agreement/order_agree_2_2.html'" />
					</p>
					<p class="tx_cont">
						<input type="checkbox" id="agree_2_3" name="agreeChk" value="" title="개인정보 제공 및 위탁약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의" class="selectBox" /> 
						<label for="agree_2_3">개인정보 제공 및 위탁 동의</label> <input type="button" value="약관보기" id="agree_2_3" class="btnSmall wGray" onclick="location.href='../order_agreement/order_agree_2_3.html'" />
					</p>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- #Contents -->
<!-- #Container -->
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/goods/goods.js?dumm=202110280001" charset="utf-8"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/order/order.js?dumm=202110280001"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/store/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- 결제창 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
      $( document ).ready( function() {
        $( '.check-all' ).click( function() {
          $( '.ab' ).prop( 'checked', this.checked );
        } );
      } );
    </script>
<script>
	// 페이지 만료 체크
    var checkExpire = function() {
        var state = window.history.state;
        
        // 결제 후 뒤로가기로 접근한 경우
        if(!!state && !!state.isExpire) {
            alert("이용이 만료된 페이지입니다.");
            document.location.replace(state.redirectUrl);
            return false;
            
        // url직접입력으로 접근한 경우
        } else if(true) {
            alert("정상적인 접근이 아닙니다.");
            document.location.replace(_baseUrl + "pay/order.jsp");
            return false;
        }
       	return true;
    };
    
    // 페이지 만료 체크
    
    if(checkExpire()){
    	forder.orderForm.init();
		$(window).load(function() {
		    //최대할인 추천 세팅
		    forder.orderForm.coupon.autoSetCoupon(); 
		});
    }
    
    // 데이터 스토리 바인딩 20180905
    var wlogObjs = [
     	// 결제버튼
        {"selector" : "#btnPay", "wlogId" : "pay_button"},                        
       // 주결제수단
        {"selector" : "#payMethod_11", "wlogId" : "card_radio"}, // 신용카드
        {"selector" : "#payMethod_21", "wlogId" : "account_radio"}, // 계좌이체
        {"selector" : "#payMethod_61", "wlogId" : "cash_radio"}, // 무통장입금
        {"selector" : "#payMethod_22", "wlogId" : "mobile_radio"}, // 휴대폰결제
        {"selector" : "#payMethod_26", "wlogId" : "kakao_radio"},  // 카카오페이
		{"selector" : "#payMethod_29", "wlogId" : "naver_radio"} //네이버페이        
    ];
    
    $.each(wlogObjs, function(idx, wlogObj){
        $(wlogObj.selector).click(function(){common.wlog(wlogObj.wlogId);});        
    });
    var _mbrNo = '';
    var blackList = ['M0000016522771'];

    // 블랙리스트 차단을 위함 임시 결제 버튼 삭제 처리
	if($.inArray(_mbrNo, blackList) > -1) {
		$('.btnPayment').remove();
	}


	// [3551897] (GA) 전자상거래 태깅 - 매출
	var urlParams = common.cart.urlParams();
	var gateCd = "";
	var trackingCd = "";
	if(urlParams.gateCd != undefined){
		gateCd = urlParams.gateCd;
	}else{
		gateCd = common.cart.trackingInfo.getGateCd();
	}
	if(urlParams.trackingCd != undefined){
		trackingCd = urlParams.trackingCd;
	}else{
		trackingCd = common.cart.trackingInfo.getTrackingCd();
	}
	
	window.dataLayer = window.dataLayer || [];
	var productArr = new Array();
	
	var gtmParam = {
		"event":'ee-checkout1',
		'dimension75':(gateCd ? gateCd : undefined), // 게이트코드
		'dimension76':(trackingCd ? trackingCd : undefined), // 트래킹 코드
		'ecommerce': {
			'currencyCode': 'KRW',
			'checkout': {
				'actionField': {
					'step': 1
				},
				'products': productArr
			}
		}
	};
	window.dataLayer.push(gtmParam);
	
	var gtmFormArray = [];
	$("#orderForm").find("[data-attr]").focusout(function(){
		var gtmDataAttrStr = $(this).attr("data-attr");
		if (gtmDataAttrStr != null && gtmDataAttrStr != "") {
			gtmFormArray.push(gtmDataAttrStr);
		}
	});
	$(window).on("beforeunload", function(){
		if (gtmFormArray!= null && gtmFormArray.length) {
			window.dataLayer.push({
				'event' : 'formAbandonment',
				'data-attr' : '폼이탈^' + ('' == 'Y' ?  : '일반주문서') + '^' + gtmFormArray.join(' > '),
			});
		}
	});
	$(document).on("submit", "form", function(event) {
		$(window).off("beforeunload");
	});
</script>

<!-- 전자금융거래 기본약관 팝업 -->
<div class="layer_pop_wrap w650" id="eCommerceTerm">
	<div class="layer_cont">
		<h2 class="layer_title">전자금융거래 기본약관</h2>
		<div class="term_scroll_box">
			<!-- 약관내용이 들어갑니다. -->
		</div>
		<div class="layer_btn_area">
			<button type="button" class="btnMedium fullGreen">
				<span>확인</span>
			</button>
		</div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>
</div>
<!--// 전자금융거래 기본약관 팝업 -->
<!-- 개인정보 수집 및 이용동의 팝업 -->
<div class="layer_pop_wrap w650" id="personalTerm">
	<div class="layer_cont">
		<h2 class="layer_title">개인정보 수집 및 이용동의</h2>
		<div class="term_scroll_box">
			<!-- 약관내용이 들어갑니다. -->
		</div>
		<div class="layer_btn_area">
			<button type="button" class="btnMedium fullGreen">
				<span>확인</span>
			</button>
		</div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>
</div>
<!--// 개인정보 수집 및 이용동의 팝업 -->
<!-- 개인정보 제공 및 위탁동의 팝업 -->
<div class="layer_pop_wrap w650" id="provideTerm">
	<div class="layer_cont">
		<h2 class="layer_title">개인정보 제공 및 위탁동의</h2>
		<div class="term_scroll_box">
			<!-- 약관내용이 들어갑니다. -->
		</div>
		<div class="layer_btn_area">
			<button type="button" class="btnMedium fullGreen">
				<span>확인</span>
			</button>
		</div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>
</div>
<!--// 개인정보 제공 및 위탁동의 팝업 -->

<!--신규 배송지 remove   -->
<script>	
	$("#btn_dlvp_new").click(function(){
		//style="checked";
		$(this).attr("checked","checked");
		$("form").find('input').each(function(){ 
   			$(this).val(''); 
		});
	});
</script>
<!--신규 배송지 remove  -->

<!-- 결제창 -->
<script>
	$("#btnPay").click(function () {
		var merchant_uid_origin = 'merchant_' + new Date().getTime();
		var buyer_name1 = $("#rmitNm_exist").val();
		var buyer_tel1 = $("#rmitCellSctNo_exist").val() + $("#rmitCellTxnoNo_exist").val() + $("#rmitCellEndNo_exist").val();
		var buyer_addr1 = $("#roadAddress").val();
		var buyer_postcode1 = $("#stnmRmitPostNo_exist").val();		
		var all1 = $("#all").val();
		var req = $("#mbrMemoCont option:selected").val();
		
	   var IMP = window.IMP; // 생략가능
	   IMP.init('imp56939417');
	   /*'iamport' 대신 부여받은 "가맹점 식별코드"를 사용*/
	   // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	   IMP.request_pay({
	   pg: 'inicis',// version 1.1.0부터 지원.
	   /*
	   'kakao':카카오페이,
	   html5_inicis':이니시스(웹표준결제)
	   'nice':나이스페이
	   'jtnet':제이티넷
	   'uplus':LG유플러스
	   'danal':다날
	   'payco':페이코
	   'syrup':시럽페이
	   'paypal':페이팔
	   */
	   pay_method: 'card',
	   /*
	   'samsung':삼성페이,
	   'card':신용카드,
	   'trans':실시간계좌이체,
	   'vbank':가상계좌,
	   'phone':휴대폰소액결제
	   */
	   merchant_uid: merchant_uid_origin,
	   /*
	   merchant_uid에 경우
	   https://docs.iamport.kr/implementation/payment
	   위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	   참고하세요.
	   나중에 포스팅 해볼게요.
	   */
	   name: '민트마켓 결제창',
	   //결제창에서 보여질 이름
	   amount: '${price + delivery}',
	   //가격
	   buyer_email: '${userEmail_id}',
	   buyer_name: buyer_name1,
	   buyer_tel: buyer_tel1,
	   buyer_addr: buyer_addr1,
	   buyer_postcode: buyer_postcode1,
	   m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	   /*
	   모바일 결제시,
	   결제가 끝나고 랜딩되는 URL을 지정	
	   (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	   */
	   }, function (rsp) {
		   console.log(rsp);
		   if (rsp.success) {
			   var msg = '결제가 완료되었습니다.\n';
			   msg += '결제 금액 : ' + rsp.paid_amount;
			   msg += '\n민트마켓을 이용해주셔서 감사합니다. 행복한 하루되세요. :)';
			   
			   $.ajax({
					url : "/payHistory.do",
					type : "post",
					data : {
						email : '${userEmail_id}',
						cart : '${cart}',
						code : merchant_uid_origin,
						request : req,
						address : buyer_addr1
					},
					success : function() {
						
					}
				});
				alert(msg);
				location.href="home.do";		
		   } else {
			   var msg = '결제에 실패하였습니다.';
			   msg += '에러내용 : ' + rsp.error_msg;
			   alert(msg);
		   }
	   });
	});  
</script>
<!-- 결제창 -->

<!-- 약관 모두동의 -->
<script>
	function agreeList() {
		var all = document.querySelector("#agree_all").checked;
		var checkBox = document.querySelectorAll(".selectBox");
	
		for (var i in checkBox) {
			checkBox[i].checked = all;
		}
	
		console.log(checkBox.length);
	}
</script>

<!-- 약관 모두동의 -->

<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function openDaumPostcode() {
	       
	      new daum.Postcode({
	         
	         oncomplete : function(data) {
	            document.querySelector("#search-zipcode-pop_exist").value = data.address;
	         	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
	
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("stnmRmitPostNo_exist").value = data.zonecode;
				document.getElementById("roadAddress").value = data.roadAddress;
				document.getElementById("jibunAddress").value = data.jibunAddress;
	         }
	      }).open();
	}
</script>

<script>
	$(document).ready(function(){
		$('#mbrMemoCont').change(function() {
			var key = $("#mbrMemoCont option:selected").val();
		    if (key == '020') {
		      $('#mbrMemoContSub').show();
		    } else {
		      $('#mbrMemoContSub').hide();
		    }
		});

		var name = "${user.name}";
		var address1 = "${user.address1}"
		var address2 = "${user.address2}"
		var address3 = "${user.address3}"
		var phone1 = "${phone1}"
		var phone2 = "${phone2}"
		var phone3 = "${phone3}"
		$('#copyToDlvp_exist').click(function(){
			$("#rmitNm_exist").val(name);
			$("#rmitCellSctNo_exist").val(phone1);
			$("#rmitCellTxnoNo_exist").val(phone2);
			$("#rmitCellEndNo_exist").val(phone3);
			$("#stnmRmitPostNo_exist").val(address1);
			$("#roadAddress").val(address2);
			$("#tempRmitDtlAddr_exist").val(address3);
		});
	});
</script>
<!-- 우편번호 -->

<%@include file="../template/footer.jsp"%>
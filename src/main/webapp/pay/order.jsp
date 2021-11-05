<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp"></jsp:include>

<link rel="stylesheet" href="../css/order.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<div id="Gnb" class="main gen1">
	<div id="gnbWrap">
	</div>
</div>
 
<script type="text/javascript" src="//logger.ai.oliveyoung.co.kr/js/eglpcidgen.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
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
	src="https://www.oliveyoung.co.kr/pc-static-root/js/gtm/gtm.js?dumm=202110280001"
	charset="utf-8"></script>

<div id="Container">
	<!-- #Contents -->
	<div id="Contents" style="padding-top: 143px;">		
		<script type="text/javascript">;
			var kakaoApiKey = "24077b12ac18b11a96696382ccaa7138";
			
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
				
				var systemIFMgmtList = {
				    
				};	
					
		</script>
		
		<!-- title_box -->
		<div class="title_box">
			<h1>주문/결제</h1>
			<ul class="step_list">
				<li><span class="step_num tx_num">1</span> 장바구니</li>
				<li class=on><span class="hide">현재단계</span>
				<span class="step_num tx_num">2</span> 주문/결제</li>
				<!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
				<li class=last><span class="step_num tx_num">3 </span> 주문완료</li>
			</ul>
			<style>
				.title_box {
				    list-style: none;
				    padding-left: 0px;
				}
				</style> 
		</div>
		<!--// title_box -->
		
		<form name="orderForm" id="orderForm">
			<input type="hidden" id="quickYn" name="quickYn" value=""><value=""> 
			<input type="hidden" id="quickInfoYn" name="quickInfoYn" value="N"> 
			<input type="hidden" id="ocbValidChk" name="ocbValidChk" value="N"> 
			<input type="hidden" id="o2oVisitTypeVal" name="o2oVisitTypeVal" value="">
			<!-- 최근 직접 입력한 배송메시지 카운트 : 직접 입력한 배송메시지가 있으면 3개 까지 화면에 노출한다.--> 
			<input type="hidden" id="mhCnt" name="mhCnt" value=""> 
			
		<!-- 주문자 정보 -->
			<h2 class="sub-title2 mgT20" style="display: none;">주문자정보</h2>
			<!-- 2017-02-21 수정 : mgT20 클래스 추가 -->
			<table class="tbl_inp_form" style="display: none;">
				<caption></caption>
				<colgroup>
					<col style="width: 170px" />
					<col style="width: *" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">주문자명</th>
						<td><input type="text" id="ordManNm" name="ordManNm" value=""
							class="inpH28" title="주문자명을 입력해주세요." this="주문자명은"
							style="width: 200px" /></td>
				<!-- id와 label for를 맞춰주세요 (임시로 넣어둠) -->
					</tr>
					<tr>
						<th scope="row">휴대폰</th>
						<td><select id="ordManCellSctNo" name="ordManCellSctNo"
							class="selH28" title="주문자 휴대폰 번호 앞자리를 선택해주세요."
							style="width: 90px">
								<option value="">선택</option>
								<option value="010" selected='selected'>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
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
								<option value="0130">0130</option>
								<option value="0303">0303</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0504">0504</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
						</select>
						 - <input type="text" id="ordManCellTxnoNo"
							name="ordManCellTxnoNo" value="" class="inpH28"
							title="주문자 휴대폰 번호 가운데 자리를 입력해주세요." this="주문자 휴대폰 번호 가운데 자리는"
							style="width: 100px" />
						- <input type="text"
							id="ordManCellEndNo" name="ordManCellEndNo" value=""
							class="inpH28" title="주문자 휴대폰 번호 마지막 4자리를 입력해주세요."
							this="주문자 휴대폰 번호 마지막 자리는" style="width: 100px" /></td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>
							<input type="hidden" id="ordManEmailAddr" name="ordManEmailAddr" value="" title="주문자 이메일 주소를 입력해주세요.">
							<input type="text" id="ordManEmailAddrId" value="" class="inpH28" title="주문자 이메일 주소를 입력해주세요." this="주문자 이메일 주소는" style="width: 120px" /> @ 
							<input type="text" id="ordManEmailAddrDmn" value="" class="inpH28" title="이메일도메인을 입력해주세요." this="이메일도메인은" style="width: 120px" />
							 <select id="ordManEmailAddrDmn_select" class="selH28" title="주문자 이메일 주소 도메인을 선택해주세요." style="width: 120px">
								<option value="">직접 입력하기</option>
								<option value="hanmir.com">hanmir.com</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net" selected='selected'>hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="empal.com">empal.com</option>
								<option value="paran.com">paran.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="freechal.com">freechal.com</option>
								<option value="hanafos.com">hanafos.com</option>
								<option value="korea.com">korea.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
						</select></td>
					</tr>
				</tbody>
			</table>
			<!--// 주문자 정보 -->
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
							<label for="btn_dlvp_exist">기존 배송지</label></span> 
					<!-- 2020-08-04 o2oJJ 24H 화면 제어로 인한 주석 처리 --> 
							<span class="chk_area">
							<input type="radio" id="btn_dlvp_new" name="inpAddrSel" value="" onclick= "this.form.reset();" autocomplete="off"  targetid="new" data-attr="배송지정보^1_배송지선택" />							 
							<label for="btn_dlvp_new">신규 배송지</label></span> 
							<span class="chk_area">
							<input style="margin-left: 36.5px;" type="checkbox" id="setBaseDlvpYn" name="baseDlvpYn" value="Y" checked="checked" /> 
							<label for="setBaseDlvpYn">기본 배송지 설정</label></span>
						<div class="show" id="divSelect_div">
						</div>						
						</td>
					</tr>
					<tr id="pickupHide1" type="exist">
						<th scope="row">받는분</th>
						<td class="imp_data">
							<!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 --> 
							
						<input type="text"
							id="rmitNm_exist" name="rmitNm" value="" orgvalue=""
							class="inpH28" title="받는분 이름을 입력해주세요." style="width: 200px; readonly: false;"
							this="받는분 이름은" data-attr="배송지정보^1_받는분" /> 
						<span class="chk_area">
						<input type="checkbox" id="copyToDlvp_exist" targetid="exist" />
						 <label
								for="copyToDlvp_exist">주문자정보와 동일</label></span> 
						<!-- 2017-01-18 수정 : 위치변경 -->
						</td>
					</tr>
					<tr class="sumtr1" id="pickupHide2" type="exist">
						<th scope="row">연락처1</th>
						<td class="imp_data">
						
					<!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<select id="rmitCellSctNo_exist" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." style="width: 90px" orgvalue="" data-attr="배송지정보^1_연락처1">
								<option value="">선택</option>
								<option value="010" selected='selected'>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
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
								<option value="0130">0130</option>
								<option value="0303">0303</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0504">0504</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
						</select> 
						- <input type="text" id="rmitCellTxnoNo_exist"
							name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28"j
							title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는"
							style="width: 90px" data-attr="배송지정보^1_연락처1" /> 
						- <input
							type="text" id="rmitCellEndNo_exist" name="rmitCellEndNo"
							value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요."
							this="연락처1 마지막 자리는" style="width: 90px" data-attr="배송지정보^1_연락처1" />
						</td>
					</tr>
					<tr class="sumtr2" id="pickupHide3" type="exist">
						<th scope="row">연락처2</th>
						<td><select id="rmitTelRgnNo_exist" name="rmitTelRgnNo"
							class="selH28" title="연락처2 앞자리를 선택해주세요." style="width: 90px">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
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
								<option value="0130">0130</option>
								<option value="0303">0303</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0504">0504</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
						</select> 
						- <input type="text" id="rmitTelTxnoNo_exist"
							name="rmitTelTxnoNo" value="" class="inpH28"
							title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는"
							style="width: 90px" /> 
						- <input type="text"
							id="rmitTelEndNo_exist" name="rmitTelEndNo" value=""
							class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는"
							style="width: 90px" />
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
					<button type="hidden" class="btnSamll wGreen w100"  id="search-zipcode-pop_exist" style="display: none;" data-attr="배송지정보^1_주소">
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
					<span class="tx_tit">도로명</span> :
					<input type="text" name="stnmPostAddr_exist"  id="roadAddress" readonly required="required">	
					<span class="tx_addr" id="stnmPostAddr_exist"></span>
					<!--  도로명주소를 넣어주세요 -->
					</p>
					<p class="addr_old">									
					<span class="tx_tit">지번</span> :
					<input type="text" name="baseAddr_exist"  id="jibunAddress" readonly required="required">
					<span class="tx_addr" id="baseAddr_exist"></span>
					<!--  지번주소를 넣어주세요 -->
					</p>
					<!--// 주소 입력 시 보여지는 부분 -->
				</div> 
					<input type="text" id="tempRmitDtlAddr_exist" value="" class="inpH28" title="상세주소를 입력해주세요." style="width: 500px;" this="상세 주소는" /> 
					<input type="hidden" id="stnmRmitDtlAddr_exist" name="stnmRmitDtlAddr" value="" orgvalue="" class="inpH28" title="상세주소를 입력해주세요." style="width: 500px" this="상세 주소는" /> 
					<input type="hidden" id="rmitDtlAddr_exist" name="rmitDtlAddr" value="" orgvalue="" class="inpH28" title="상세주소를 입력해주세요. "style="width: 500px" /> 
					<input type="hidden" id="emdNm_exist" name="emdNm" /> 
					<input type="hidden" id="admrNm_exist" name="admrNm" />
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
							<!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 --> 
						<input type="text" id="rmitNm_new" name="rmitNm" value="" orgvalue="" class="inpH28"
							title="받는분 이름을 입력해주세요." style="width: 200px" this="받는분 이름은"
							disabled="disabled" data-attr="배송지정보^1_받는분" /> 
							<span class="chk_area">
						<input type="checkbox" id="copyToDlvp_new" targetid="new" disabled="disabled" /> 
						<label for="copyToDlvp_new">주문자정보와 동일</label></span>
					 <!-- 2017-01-18 수정 : 위치변경 -->
						</td>
					</tr>
					<tr type="new" class="new_order_area" style="display: none;">
						<th scope="row">연락처1</th>
						<td class="imp_data">
			<!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 --> 
				<select id="rmitCellSctNo_new" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." orgvalue="" style="width: 100px" disabled="disabled" data-attr="배송지정보^1_연락처1">
					<option value="">선택</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
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
					<option value="0130">0130</option>
					<option value="0303">0303</option>
					<option value="0502">0502</option>
					<option value="0503">0503</option>
					<option value="0504">0504</option>
					<option value="0505">0505</option>
					<option value="0506">0506</option>
					<option value="0507">0507</option>
				</select> 
					- <input type="text" id="rmitCellTxnoNo_new" name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는"
							style="width: 100px" disabled="disabled" data-attr="배송지정보^1_연락처1" />
					- <input type="text" id="rmitCellEndNo_new" name="rmitCellEndNo"
							value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요."
							this="연락처1 마지막 자리는" style="width: 100px" disabled="disabled"
							data-attr="배송지정보^1_연락처1" /> 
						</td>
					</tr>
					<tr type="new" class="new_order_area" style="display: none;">
						<th scope="row">연락처2</th>
						<td>
				<select id="rmitTelRgnNo_new" name="rmitTelRgnNo" class="selH28" title="연락처2 앞자리를 선택해주세요." style="width: 90px" disabled="disabled">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
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
								<option value="0130">0130</option>
								<option value="0303">0303</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0504">0504</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
				</select> 
				- <input type="text" id="rmitTelTxnoNo_new" name="rmitTelTxnoNo" value="" class="inpH28" title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는" style="width: 100px" disabled="disabled" />
				- <input type="text" id="rmitTelEndNo_new" name="rmitTelEndNo" value="" class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는" style="width: 100px" disabled="disabled" />
						</td>
					</tr>
					<tr type="new" class="new_order_area" style="display: none;">
						<th scope="row">주소</th>
						<td class="imp_data">
							<!-- 2017-01-25 수정 : 클래스 추가 --> 
							<input type="text" id="stnmRmitPostNo_new" name="rmitPostNo" value="" class="inpH28" title="우편번호를 검색해주세요." style="width: 90px" readonly="readonly"
							disabled="disabled" /> 
							<input type="hidden" id="rmitPostNo_new" name="stnmRmitPostNo" value="" title="우편번호를 검색해주세요."
							disabled="disabled" />
							<input type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_new" data-attr="배송지정보^1_주소">
								<span>우편번호 찾기</span>
							
							<div class="addr_box">
							<input type="hidden" id="stnmRmitPostAddr_new"
									name="stnmRmitPostAddr" value="" class="inpH28"
									title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled" />
							<input type="hidden" id="rmitBaseAddr_new" name="rmitPostAddr"
									value="" class="inpH28" title="우편번호를 검색해주세요."
									readonly="readonly" disabled="disabled" />
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
							<input type="text" id="tempRmitDtlAddr_new" value=""
							class="inpH28" title="상세주소를 입력해주세요." style="width: 500px;"
							this="상세 주소는" disabled="disabled" />
							<p class="txtDot mgT5">신규배송지 정보는 마이페이지 내 배송지에 저장됩니다.</p> 
							<input
							type="hidden" id="stnmRmitDtlAddr_new" name="stnmRmitDtlAddr"
							value="" class="inpH28" title="상세주소를 입력해주세요."
							style="width: 500px" this="상세 주소는" disabled="disabled" />
							 <input
							type="hidden" id="rmitDtlAddr_new" name="rmitDtlAddr" value=""
							class="inpH28" title="상세주소를 입력해주세요." style="width: 500px"
							disabled="disabled" /> 
							<input type="hidden" id="emdNm_new" name="emdNm" /> 
							<input type="hidden" id="admrNm_new" name="admrNm" />
						</td>
					</tr>
				</tbody>
			</table>
			<!--// 배송지 정보 --> 
			
			<!-- 배송 요청사항 -->
			<div id="pickupHide5">
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
							<td><select id="mbrMemoCont" class="selH28"
								title="택배배송 메시지를 선택해주세요." style="width: 350px"
								data-attr="배송지정보^1_배송메세지">
									<option value="MH">배송메시지를 선택해주세요.</option>
									<option value="10">그냥 문 앞에 놓아 주시면 돼요.</option>
									<option value="40">직접 받을게요.(부재 시 문앞)</option>
									<option value="30">벨을 누르지 말아주세요.</option>
									<option value="20">도착 후 전화주시면 직접 받으러 갈게요.</option>
									<option value="O2O">직접 입력하기</option>
							</select> 
							<input type="text" name="mbrMemoCont" value=""
								class="inpH28 mgT6" title="배송메시지를 입력해주세요."
								style="width: 700px; display: none;" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--// 배송 요청사항 --> 
			
	<!-- 현금영수증 신청 -->
	<div class="" id="cashReceipt" style="display: none;">
		<h2 class="sub-title2">현금영수증 신청</h2>
		<table class="tbl_inp_form type2" id="receipt_table">
			<caption>현금영수증 신청 입력 폼</caption>
			<colgroup>
				<col style="width: 170px" />
				<col style="width: *" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">현금영수증</th>
					<td>
						<div>
							<select id="crIssuCd" name="crIssuCd" class="selH28"
								title="현금영수증 신청여부를 선택해주세요." style="width: 200px"
								data-attr="현금영수증신청^5_현금영수증">
								<option value="">신청안함</option>
								<option value="10">개인소득공제용</option>
								<option value="20">사업자지출증빙용</option>
							</select>
						</div>
					</td>
				</tr>
				<!-- 개인소득공제용신청 시 -->
				<tr crIssuCd="10">
					<th scope="row">발급방법</th>
					<td>
						<div>
							<input type="radio" id="crIssuMeanSctCd_3" name="crIssuMeanSctCd"
								value="3" checked="checked" data-attr="현금영수증신청^5_발급방법" /> 
								<label for="crIssuMeanSctCd_3">휴대폰</label> 
								<input type="radio"
								id="crIssuMeanSctCd_5" name="crIssuMeanSctCd" value="5"
								data-attr="현금영수증신청^5_발급방법" /> 
								<label for="crIssuMeanSctCd_5">현금영수증카드</label>
						</div>
					</td>
				</tr>
				<!-- 개인소득공제용 [휴대폰] 선택 시 -->
				<tr crIssuCd="10" crIssuMeanSctCd="3">
					<th scope="row">휴대폰</th>
					<td>
						<div>
							<select id="dispCashReceiptInfo11" class="selH28"
								title="현금영수증 휴대폰 앞자리를 선택해주세요." style="width: 90px"
								data-attr="현금영수증신청^5_휴대폰">
								<option value="010" selected='selected'>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
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
								<option value="0130">0130</option>
								<option value="0303">0303</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0504">0504</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
							</select> 
							- <input type="text" id="dispCashReceiptInfo12" value=""
								class="inpH28" title="현금영수증 휴대폰 가운데 자리를 입력해주세요."
								this="현금영수증 휴대폰 가운데 자리는" style="width: 90px"
								data-attr="현금영수증신청^5_휴대폰" />
							- <input type="text"
								id="dispCashReceiptInfo13" value="" class="inpH28"
								title="현금영수증 휴대폰 마지막 4자리수를 입력해주세요." this="현금영수증 휴대폰 마지막 자리는"
								style="width: 90px" data-attr="현금영수증신청^5_휴대폰" />
							 <input
								type="hidden" id="crPhoneNumber" name="crIssuMeanNo" value="">
						</div>
					</td>
				</tr>
				<!--//개인소득공제용 [휴대폰] 선택 시 -->
				<!-- 개인소득공제용 [현금영수증카드] 선택 시 -->
				<tr crIssuCd="10" crIssuMeanSctCd="5">
					<th scope="row">현금영수증 카드번호</th>
					<td>
						<div>
							<input type="text" id="CashReceipts" name="crIssuMeanNo"
								class="inpH28" title="현금영수증 카드번호를 입력해주세요." this="현금영수증 카드번호는"
								style="width: 300px" />
						</div>
					</td>
				</tr>
				<!--// 개인소득공제용 [현금영수증카드] 선택 시 -->
				<!--// 개인소득공제용신청 시 -->
				<!-- 사업자지출증빙용 시 -->
				<tr crIssuCd="20">
					<th scope="row">사업자등록번호</th>
					<td>
						<div>
							<input type="hidden" name="crIssuMeanSctCd" value="2"> <input
								type="text" id="BusinessNumber" name="crIssuMeanNo"
								class="inpH28" title="현금영수증 사업자 등록번호를 입력해주세요."
								this="현금영수증 사업자 등록번호는" style="width: 300px" />
						</div>
					</td>
				</tr>
				<!--// 사업자지출증빙용 시 -->
			</tbody>
		</table>
		<!--// 현금영수증 신청 -->
	</div>
</div>
<div class="order_payment_box fixArea">
	<div class="left_area">
		<!-- 현금영수증 신청 -->
		<div class id="cashReceipt" style="display: none;">
			<h2 class="sub-title2">햔금영수증 신청</h2>
			<table class="tbl_inp_form type2" id="recepty_table">
				<caption>현금영수증 신청 입력 폼</caption>
				<colgroup>
					<col style="width: 170px">
					<col style="width: *">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">현금영수증</th>
						<td>
							<div>
								<select id="crIssuCd" name="crIssuCd" class="selH28"
									title="현금영수증 신청여부를 선택해주세요." style="width: 200px"
									data-attr="현금영수증신청^5_현금영수증">
									<option value="">신청안함</option>
									<option value="10">개인소득공제용</option>
									<option value="20">사업자지출증빙용</option>
								</select>
							</div>
						</td>
					</tr>
					<!-- 개인소득공제용신청 시 -->
					<tr crIssuCd="10">
						<th scope="row">발급방법</th>
						<td>
							<div>
								<input type="radio" id="crIssuMeanSctCd_3"
									name="crIssuMeanSctCd" value="3" checked="checked"
									data-attr="현금영수증신청^5_발급방법" /> <label for="crIssuMeanSctCd_3">휴대폰</label>
								<input type="radio" id="crIssuMeanSctCd_5"
									name="crIssuMeanSctCd" value="5" data-attr="현금영수증신청^5_발급방법" />
								<label for="crIssuMeanSctCd_5">현금영수증카드</label>
							</div>
						</td>
					</tr>
					<!-- 개인소득공제용 [휴대폰] 선택 시 -->
					<tr crIssuCd="10" crIssuMeanSctCd="3">
						<th scope="row">휴대폰</th>
						<td>
							<div>
								<select id="dispCashReceiptInfo11" class="selH28"
									title="현금영수증 휴대폰 앞자리를 선택해주세요." style="width: 90px"
									data-attr="현금영수증신청^5_휴대폰">
									<option value="010" selected='selected'>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
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
									<option value="0130">0130</option>
									<option value="0303">0303</option>
									<option value="0502">0502</option>
									<option value="0503">0503</option>
									<option value="0504">0504</option>
									<option value="0505">0505</option>
									<option value="0506">0506</option>
									<option value="0507">0507</option>
								</select> 
								- <input type="text" id="dispCashReceiptInfo12" value=""
									class="inpH28" title="현금영수증 휴대폰 가운데 자리를 입력해주세요."
									this="현금영수증 휴대폰 가운데 자리는" style="width: 90px"
									data-attr="현금영수증신청^5_휴대폰" /> 
								- <input type="text"
									id="dispCashReceiptInfo13" value="" class="inpH28"
									title="현금영수증 휴대폰 마지막 4자리수를 입력해주세요." this="현금영수증 휴대폰 마지막 자리는"
									style="width: 90px" data-attr="현금영수증신청^5_휴대폰" /> 
								<input
									type="hidden" id="crPhoneNumber" name="crIssuMeanNo"
									value="">
							</div>
						</td>
					</tr>
					<!--//개인소득공제용 [휴대폰] 선택 시 -->
					<!-- 개인소득공제용 [현금영수증카드] 선택 시 -->
					<tr crIssuCd="10" crIssuMeanSctCd="5">
						<th scope="row">현금영수증 카드번호</th>
						<td>
							<div>
								<input type="text" id="CashReceipts" name="crIssuMeanNo"
									class="inpH28" title="현금영수증 카드번호를 입력해주세요." this="현금영수증 카드번호는"
									style="width: 300px" />
							</div>
						</td>
					</tr>
					<!--// 개인소득공제용 [현금영수증카드] 선택 시 -->
					<!--// 개인소득공제용신청 시 -->
					
					<!-- 사업자지출증빙용 시 -->				
					<tr crIssuCd="20">
						<th scope="row">사업자등록번호</th>
						<td>
						<div>
							<input type="hidden" name="crIssuMeanSctCd" value="2"> 
							<input type="text" id="BusinessNumber" name="crIssuMeanNo" class="inpH28" title="현금영수증 사업자 등록번호를 입력해주세요." this="현금영수증 사업자 등록번호는" style="width: 300px" />
						</div>
						</td>
				</tr>
					<!--// 사업자지출증빙용 시 -->
				</tbody>
			</table>
			<!--// 현금영수증 신청 -->
		</div>
	</div>	
	<div class="right_area" style="margin-top: 250px; margin-left: 400px;">
		<!-- 최종 결제정보 -->
		<h2 class="sub-title2" style="margin-right: 0;">최종 결제정보</h2>
		<!-- 최종 결제정보 -->
		<ul class="total_payment_box"
			style="margin-top: 0; margin-bottom: 15px;">
			<li style="padding-left: 0;">
				<span class="tx_tit">총 상품금액</span>
				<span class="tx_cont"><span class="tx_num">0</span>원</span> 
				<input type="hidden" name="goodsAmt" value="0"></li>
			<li style="padding-left: 0;" class="line_top2">
				<span class="tx_tit">총 배송비</span> <span class="tx_cont">
				<span class="tx_num" id="dlexPayAmt_span">0</span>원</span>
				<input type="hidden" name="dlexPayAmt" value="0"></li>
			<li class="total">
				<span class="tx_tit">최종 결제금액</span> 
				<span class="tx_cont">
				<span class="tx_num" id="totPayAmt_sum_span">0</span>원</span>
				<input type="hidden" name="remainAmt" value="0"> 
				<input type="hidden" name="ordPayAmt" value="0"> 
				<input type="hidden" name="goodsNm" value="" /></li>
			<li>
				<button class="btnPayment" id="btnPay" name="btnPay" type="button" data-attr="최종결제정보^6_결제하기">결제하기</button>
			</li>
		</ul>
		<p class="inchk clrfix">
			<input type="checkbox" id="savePayMethodYn" name="savePayMethodYn" value="Y" checked="checked" paymeancd="" acqrcd="" instmmcnt=""
				pntuseyn="" bnkcd="" morcmannm="" data-attr="최종결제정보^6_빠른모드" />
			<!-- <input type="checkbox" id="fastpaySave" name="" value=""> -->
			<label for="savePayMethodYn">지금 설정을 다음 주문에도 사용하겠습니다.<br>(빠른모드)
			</label>
		</p>
		</ul>
		<div class="agree_payment_box open" id="agreeList">
			<div class="all_agree_cont">
				<p>주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</p>
				<!-- 2017-01-18 수정 : 문구수정 -->
				<input type="checkbox" id="agree_all" name="TrrmsCheck1ed" value="Y" data-attr="최종결제정보^6_결제대행동의" onchange="agreeList()" class="selectBox"/> 
				<label for="agree_all">모두 동의</label>
			</div>
			<ul class="other_agree_cont">
			<p class="tx_tit">주문 상품정보에 대한 동의</p>
			<p class="tx_cont2">
				<input type="checkbox" id="agree_1" name="agreeChk" value="" title="주문 상품정보 및 결제대행 서비스 이용약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의" class="selectBox"/>
				<label for="agree_1"> 주문하실상품, 가격, 배송정보, 할인내역등을 최종 확인하였으며, 구매에 동의합니다.
						  <br>
						   (전상거래법 제8조 제2항)
				</label>
			</p>
			<p class="tx_tit">결제대행 서비스 이용약관 동의</p>
			<p class="tx_cont">
				<input type="checkbox" id="agree_2_1" name="agreeChk" value="" title="전자금융거래 기본약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의" class="selectBox"/>
				<label for="agree_2_1">전자금융거래 기본약관</label> 
				<input type="button" value="약관보기" id="agree_2_1" class="btnSmall wGray" onclick="location.href='../order_agreement/order_agree_2_1.html'"></input>
			</p>
			<p class="tx_cont">
				<input type="checkbox" id="agree_2_2" name="agreeChk" value="" title="개인정보 수집 및 이용약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의" class="selectBox"/>
				 <label for="agree_2_2">개인정보 수집 및 이용 동의</label> 
				<input type="button" value="약관보기" id="agree_2_2" class="btnSmall wGray" onclick="location.href='../order_agreement/order_agree_2_2.html'"></input>
			</p>
			<p class="tx_cont">
				<input type="checkbox" id="agree_2_3" name="agreeChk" value="" title="개인정보 제공 및 위탁약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의" class="selectBox"/> 
				<label for="agree_2_3">개인정보 제공 및 위탁 동의</label> 
				<input type="button" value="약관보기" id="agree_2_3" class="btnSmall wGray" onclick="location.href='../order_agreement/order_agree_2_3.html'"></input>
				</p>
			</ul>
		</div>
	</div>
</div>
</form>

</div>
<!-- #Contents -->
</div>
<!-- #Container -->
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/goods/goods.js?dumm=202110280001" charset="utf-8"></script>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/order/order.js?dumm=202110280001"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://www.oliveyoung.co.kr/pc-static-root/js/store/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- 결제창 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
      $( document ).ready( function() {
        $( '.check-all' ).click( function() {
        }
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
			</div>
			</div>

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
<!--// 스크롤 영역 -->
<!-- <div class="order_btn_area">
						<button class="btnGray" id="btnClose">이전</button>
						<button class="btnGreen" id="btnSubmit">확인</button>
					</div>  -->
<!-- </div>
				<button class="layer_close">창 닫기</button>
			</div>
		</div>	 -->
<!--  
			<div class="layer_scroll_box mgT10 type3">
				<div class="item_table_list">
					<table>
						<caption></caption>
						<colgroup><col style="width:85px" /><col style="width:*" /></colgroup>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
			-->
<!-- <div class="layer_btn_area mgT25">
						<button class="btnMedium btnGreenW w120" id="stopToday"
							onclick="javascript:forder.orderForm.giftBoxPopToday();">오늘
							하루 안보기</button>
						<button class="btnMedium fullGreen w120" id="btnConfirm"
							onclick="javascript:forder.orderForm.layerClose();">확인</button>
					</div>
				</div>
				<button class="layer_close type2"
					onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
			</div>
		</div>	
			 		<!-- //item_table_list -->
<!-- </div>				
					<div class="layer_btn_area mgT25">
						<button class="btnMedium fullGreen w120" id="btnConfirm"
							onclick="javascript:forder.orderForm.layerClose();">확인</button>
					</div>
				</div>
				<button class="layer_close type2"
					onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
			</div>
		</div>
					<div class="area2sButton">
						<a href="#none" class="btnGreen"
							onclick="javascript:forder.orderForm.layerClose();">확인</a>
					</div>
				</div>
				<button class="layer_close type2"
					onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
			</div>
		</div> -->
<!--// 스크롤 영역 -->
<!-- <button class="layer_close">창 닫기</button>
			</div>
		</div>
	 -->
<!-- 찜 확인 레이어 -->
<!-- <div class="layerAlim zzimOn wishPrd" style="display: none;">
	<span class="icon"></span>
	<p class="one">
		<strong>좋아요</strong>
	</p>
</div> -->
<!--// 찜 확인 레이어 -->

<!-- 찜 취소 레이어 -->
<!-- div class="layerAlim zzimOff wishPrd" style="display: none;">
	<span class="icon"></span>
	<p class="one">
		<strong>좋아요</strong>
	</p>
</div> -->
<!--// 찜 취소 레이어 -->
<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop"style="display:block;">
			<button>
				<span>TOP</span>
			</button>	
	</div>
	<!--// 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	
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
		         merchant_uid: 'merchant_' + new Date().getTime(),
		         /*
		         merchant_uid에 경우
		         https://docs.iamport.kr/implementation/payment
		         위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		         참고하세요.
		         나중에 포스팅 해볼게요.
		         */
		         name: '민트마켓 결제창',
		         //결제창에서 보여질 이름
		         amount: 1004,
		         //가격
		         buyer_email: 'iamport@siot.do',
		         buyer_name: '구매자이름',
		         buyer_tel: '010-1234-5678',
		         buyer_addr: '서울특별시 강남구 삼성동',
		         buyer_postcode: '123-456',
		         m_redirect_url: 'https://www.yourdomain.com/payments/complete'
		         /*
		         모바일 결제시,
		         결제가 끝나고 랜딩되는 URL을 지정
		         (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		         */
		         }, function (rsp) {
		         console.log(rsp);
		         if (rsp.success) {
		         var msg = '결제가 완료되었습니다.';
		         msg += '고유ID : ' + rsp.imp_uid;
		         msg += '상점 거래ID : ' + rsp.merchant_uid;
		         msg += '결제 금액 : ' + rsp.paid_amount;
		         msg += '카드 승인번호 : ' + rsp.apply_num;
		         } else {
		         var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		         }
		         alert(msg);
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
		<script type="text/javascript"  src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		<!-- 우편번호 -->

<%@include file="../template/footer.jsp"%>
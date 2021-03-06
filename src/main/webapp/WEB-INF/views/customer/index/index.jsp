<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/user/img/logo_icon.png" />
<title>민트마켓</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/mint_store.css">
<%@include file="../template/header.jsp"%>

<!-- css -->
<link href="${pageContext.request.contextPath}/resources/user/css/swiper.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/user/css/3.promotion.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/user/css/4.article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/user/css/map.css" rel="stylesheet">

<!-- Java Script -->
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e779d3db34b72df8c41309b36657dbf8&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/user/js/index.js"></script>
<script src="${pageContext.request.contextPath}/resources/user/js/jquery-3.6.0.min.js"></script>

<!-- 회원 주소 데이터 자바스크립트로 보내기 -->
<input type="hidden" value="주소" id="member_address">
<input type="hidden" value="베이스" id="member_base">
	
<aside>
	<!-- 이미지 슬라이더 영역 -->
	<div class="promotion">
	
		<div class="main_img_area">
		
			<img width="100%" src="${pageContext.request.contextPath}/resources/user/img/main_img_ex.png">
		</div>
		
	

		<%-- <div class="swiper-container" id="promotion">
			<!-- 필수 영역 -->
			<div class="swiper-wrapper">
				<!-- 배치되는 이미지 혹은 화면 (슬라이더) -->
				<!-- <div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/user/img/banner_1903x300.png">
				</div>
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/user/img/banner_1903x300_2.png">
				</div> -->
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/user/img/banner_1903x300_3.png">
				</div>
			</div>
			<!-- pagination 이 필요하다면 (선택) -->
			<div class="swiper-pagination"></div>
		</div> --%>
		
		
		
	</div>
</aside>

<article id="map_article">
	<div class="hot-title" style="color:#26e4ca; font-size:35px">나의 동네 주변 살펴보기</div>
	<div class="dongnae">
		<div id="map-area">
			<div class="map_wrap">
				<!-- 지도가 표시될 div -->
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<!-- 지도 위에 표시될 마커 카테고리 -->
				<div class="map_category">
					<ul>
						<li><img id="ruler" src="${pageContext.request.contextPath}/resources/user/img/ruler.png"
							onmouseover="this.src='${pageContext.request.contextPath}/resources/user/img/ruler_hover.png'"
							onmouseout="this.src='${pageContext.request.contextPath}/resources/user/img/ruler.png'" onclick="rulerStatus()">
						</li>
						<li><img id="marker" src="${pageContext.request.contextPath}/resources/user/img/marker.png"
							onmouseover="this.src='${pageContext.request.contextPath}/resources/user/img/marker_hover.png'"
							onmouseout="this.src='${pageContext.request.contextPath}/resources/user/img/marker.png'"
							onclick="markerStatus()"></li>
						<li><img id="radius" src="${pageContext.request.contextPath}/resources/user/img/radius.png"
							onmouseover="this.src='${pageContext.request.contextPath}/resources/user/img/radius_hover.png'"
							onmouseout="this.src='${pageContext.request.contextPath}/resources/user/img/radius.png'"
							onclick="radiusStatus()"></li>
					</ul>
				</div>
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" id="keyword" size="15">
								<button type="submit" style="background:#26e4ca; color:black; border:2px solid #26e4ca; border-radius: 3px">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
		</div>
	</div>

</article>
<script>
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.57087363566864, 126.99279644520193), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	var imageSrc = '/resources/user/img/mint.png', // 마커이미지의 주소입니다    
	imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	imageOption = {
		offset : new kakao.maps.Point(27, 69)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imageOption), markerPosition = new kakao.maps.LatLng(
			37.57087363566864, 126.99279644520193); // 마커가 표시될 위치입니다

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition,
		image : markerImage
	// 마커이미지 설정 
	});
	var iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1,
		removable : iwRemoveable
	});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout = function() {
					infowindow.close();
				};
			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.place_name + '</h5>';

		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>'
					+ '   <span class="jibun gray">' + places.address_name
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address_name + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px; z-index:1;">' + title
				+ '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}

	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		// 마커 위에 인포윈도우를 표시합니다
		infowindow.open(map, marker);
	});

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}
	// --------------------------------------------------------------- 선 그리기 --------------------------------------------------------
	var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
	var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
	var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
	var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
	var clickHandler = function(mouseEvent) {

		// 마우스로 클릭한 위치입니다 
		var clickPosition = mouseEvent.latLng;

		// 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
		if (!drawingFlag) {

			// 상태를 true로, 선이 그리고있는 상태로 변경합니다
			drawingFlag = true;

			// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
			deleteClickLine();

			// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
			deleteDistnce();

			// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
			deleteCircleDot();

			// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
			clickLine = new kakao.maps.Polyline({
				map : map, // 선을 표시할 지도입니다 
				path : [ clickPosition ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
				strokeWeight : 3, // 선의 두께입니다 
				strokeColor : '#db4040', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid' // 선의 스타일입니다
			});

			// 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
			moveLine = new kakao.maps.Polyline({
				strokeWeight : 3, // 선의 두께입니다 
				strokeColor : '#db4040', // 선의 색깔입니다
				strokeOpacity : 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid' // 선의 스타일입니다    
			});

			// 클릭한 지점에 대한 정보를 지도에 표시합니다
			displayCircleDot(clickPosition, 0);

		} else { // 선이 그려지고 있는 상태이면

			// 그려지고 있는 선의 좌표 배열을 얻어옵니다
			var path = clickLine.getPath();

			// 좌표 배열에 클릭한 위치를 추가합니다
			path.push(clickPosition);

			// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
			clickLine.setPath(path);

			var distance = Math.round(clickLine.getLength());
			displayCircleDot(clickPosition, distance);
		}
	};

	// 지도에 마우스무브 이벤트를 등록합니다
	// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
	var mousemoveHandler = function(mouseEvent) {
		// 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
		if (drawingFlag) {

			// 마우스 커서의 현재 위치를 얻어옵니다 
			var mousePosition = mouseEvent.latLng;

			// 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
			var path = clickLine.getPath();

			// 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
			var movepath = [ path[path.length - 1], mousePosition ];
			moveLine.setPath(movepath);
			moveLine.setMap(map);

			var distance = Math.round(clickLine.getLength()
					+ moveLine.getLength()), // 선의 총 거리를 계산합니다
			content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">'
					+ distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

			// 거리정보를 지도에 표시합니다
			showDistance(content, mousePosition);
		}
	};

	// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
	// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
	var rightclickHandler = function(mouseEvent) {

		// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
		if (drawingFlag) {

			// 마우스무브로 그려진 선은 지도에서 제거합니다
			moveLine.setMap(null);
			moveLine = null;

			// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
			var path = clickLine.getPath();

			// 선을 구성하는 좌표의 개수가 2개 이상이면
			if (path.length > 1) {

				// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
				if (dots[dots.length - 1].distance) {
					dots[dots.length - 1].distance.setMap(null);
					dots[dots.length - 1].distance = null;
				}

				var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
				content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

				// 그려진 선의 거리정보를 지도에 표시합니다
				showDistance(content, path[path.length - 1]);

			} else {

				// 선을 구성하는 좌표의 개수가 1개 이하이면 
				// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
				deleteClickLine();
				deleteCircleDot();
				deleteDistnce();

			}

			// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
			drawingFlag = false;
		}
	};

	// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
	function deleteClickLine() {
		if (clickLine) {
			clickLine.setMap(null);
			clickLine = null;
		}
	}

	// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
	// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
	function showDistance(content, position) {

		if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

			// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
			distanceOverlay.setPosition(position);
			distanceOverlay.setContent(content);

		} else { // 커스텀 오버레이가 생성되지 않은 상태이면

			// 커스텀 오버레이를 생성하고 지도에 표시합니다
			distanceOverlay = new kakao.maps.CustomOverlay({
				map : map, // 커스텀오버레이를 표시할 지도입니다
				content : content, // 커스텀오버레이에 표시할 내용입니다
				position : position, // 커스텀오버레이를 표시할 위치입니다.
				xAnchor : 0,
				yAnchor : 0,
				zIndex : 3
			});
		}
	}

	// 그려지고 있는 선의 총거리 정보와 
	// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
	function deleteDistnce() {
		if (distanceOverlay) {
			distanceOverlay.setMap(null);
			distanceOverlay = null;
		}
	}

	// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
	function displayCircleDot(position, distance) {

		// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
		var circleOverlay = new kakao.maps.CustomOverlay({
			content : '<span class="dot"></span>',
			position : position,
			zIndex : 1
		});

		// 지도에 표시합니다
		circleOverlay.setMap(map);

		if (distance > 0) {
			// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			var distanceOverlay = new kakao.maps.CustomOverlay({
				content : '<div class="dotOverlay">거리 <span class="number">'
						+ distance + '</span>m</div>',
				position : position,
				yAnchor : 1,
				zIndex : 2
			});

			// 지도에 표시합니다
			distanceOverlay.setMap(map);
		}

		// 배열에 추가합니다
		dots.push({
			circle : circleOverlay,
			distance : distanceOverlay
		});
	}

	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
	function deleteCircleDot() {
		var i;

		for (i = 0; i < dots.length; i++) {
			if (dots[i].circle) {
				dots[i].circle.setMap(null);
			}

			if (dots[i].distance) {
				dots[i].distance.setMap(null);
			}
		}

		dots = [];
	}

	// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
	// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {

		// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
		var walkkTime = distance / 67 | 0;
		var walkHour = '', walkMin = '';

		// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
		if (walkkTime > 60) {
			walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
					+ '</span>시간 '
		}
		walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

		// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
		var bycicleTime = distance / 227 | 0;
		var bycicleHour = '', bycicleMin = '';

		// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
		if (bycicleTime > 60) {
			bycicleHour = '<span class="number">'
					+ Math.floor(bycicleTime / 60) + '</span>시간 '
		}
		bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

		// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
		var content = '<ul class="dotOverlay distanceInfo">';
		content += '    <li>';
		content += '        <span class="label">총거리</span><span class="number">'
				+ distance + '</span>m';
		content += '    </li>';
		content += '    <li>';
		content += '        <span class="label">도보</span>' + walkHour + walkMin;
		content += '    </li>';
		content += '    <li>';
		content += '        <span class="label">자전거</span>' + bycicleHour
				+ bycicleMin;
		content += '    </li>';
		content += '</ul>'

		return content;
	}

	// --------------------------------------------------------------- 선 그리기 끝 --------------------------------------------------------
	// --------------------------------------------------------------- 좌표로 주소 얻기 시작 --------------------------------------------------------
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	// --------------------------------------------------------------- 좌표로 주소 얻기 끝 --------------------------------------------------------
	// --------------------------------------------------------------- 마커 찍기 시작 --------------------------------------------------------
	var markerHandler = function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
						+ result[0].road_address.address_name + '</div>' : '';
				detailAddr += '<div>지번 주소 : ' + result[0].address.address_name
						+ '</div>';

				var content = '<div>' + '<span class="title">법정동 주소정보</span>'
						+ detailAddr + '</div>';

				// 마커를 클릭한 위치에 표시합니다 
				marker.setPosition(mouseEvent.latLng);
				marker.setMap(map);

				// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				infowindow.setContent(content);
				infowindow.open(map, marker);
			}
		});
	};

	// -------------------------------------------------------------- 마커 찍기 끝 --------------------------------------------------------	
	// -------------------------------------------------------------- 반경 그리기 시작 -------------------------------------------------------
	var centerPosition; // 원의 중심좌표 입니다
	var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
	var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
	var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
	var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

	var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다

	// 지도에 클릭 이벤트를 등록합니다
	var drawRadius = function(mouseEvent) {

		// 원은 한 번만 그리게 초기화
		removeCircles();

		// 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
		if (!drawingFlag) {

			// 상태를 그리고있는 상태로 변경합니다
			drawingFlag = true;

			// 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
			centerPosition = mouseEvent.latLng;

			// 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
			if (!drawingLine) {
				drawingLine = new kakao.maps.Polyline({
					strokeWeight : 3, // 선의 두께입니다
					strokeColor : '#00a0e9', // 선의 색깔입니다
					strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
					strokeStyle : 'solid' // 선의 스타일입니다
				});
			}

			// 그려지고 있는 원을 표시할 원 객체를 생성합니다
			if (!drawingCircle) {
				drawingCircle = new kakao.maps.Circle({
					strokeWeight : 1, // 선의 두께입니다
					strokeColor : '#00a0e9', // 선의 색깔입니다
					strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
					strokeStyle : 'solid', // 선의 스타일입니다
					fillColor : '#00a0e9', // 채우기 색깔입니다
					fillOpacity : 0.2
				// 채우기 불투명도입니다 
				});
			}

			// 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
			if (!drawingOverlay) {
				drawingOverlay = new kakao.maps.CustomOverlay({
					xAnchor : 0,
					yAnchor : 0,
					zIndex : 1
				});
			}
		}
	};

	// 지도에 마우스무브 이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
	var moveRadius = function(mouseEvent) {

		// 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
		if (drawingFlag) {

			// 마우스 커서의 현재 위치를 얻어옵니다 
			var mousePosition = mouseEvent.latLng;

			// 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
			var linePath = [ centerPosition, mousePosition ];

			// 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
			drawingLine.setPath(linePath);

			// 원의 반지름을 선 객체를 이용해서 얻어옵니다 
			var length = drawingLine.getLength();

			if (length > 0) {

				// 그려지고 있는 원의 중심좌표와 반지름입니다
				var circleOptions = {
					center : centerPosition,
					radius : length,
				};

				// 그려지고 있는 원의 옵션을 설정합니다
				drawingCircle.setOptions(circleOptions);

				// 반경 정보를 표시할 커스텀오버레이의 내용입니다
				var radius = Math.round(drawingCircle.getRadius()), content = '<div class="info">반경 <span class="number">'
						+ radius + '</span>m</div>';

				// 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
				drawingOverlay.setPosition(mousePosition);

				// 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
				drawingOverlay.setContent(content);

				// 그려지고 있는 원을 지도에 표시합니다
				drawingCircle.setMap(map);

				// 그려지고 있는 선을 지도에 표시합니다
				drawingLine.setMap(map);

				// 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
				drawingOverlay.setMap(map);

			} else {

				drawingCircle.setMap(null);
				drawingLine.setMap(null);
				drawingOverlay.setMap(null);

			}
		}
	};

	// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
	// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
	var rightclickRadius = function(mouseEvent) {

		if (drawingFlag) {

			// 마우스로 오른쪽 클릭한 위치입니다 
			var rClickPosition = mouseEvent.latLng;

			// 원의 반경을 표시할 선 객체를 생성합니다
			var polyline = new kakao.maps.Polyline({
				path : [ centerPosition, rClickPosition ], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
				strokeWeight : 3, // 선의 두께 입니다
				strokeColor : '#00a0e9', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid' // 선의 스타일입니다
			});

			// 원 객체를 생성합니다
			var circle = new kakao.maps.Circle({
				center : centerPosition, // 원의 중심좌표입니다
				radius : polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
				strokeWeight : 1, // 선의 두께입니다
				strokeColor : '#00a0e9', // 선의 색깔입니다
				strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid', // 선의 스타일입니다
				fillColor : '#00a0e9', // 채우기 색깔입니다
				fillOpacity : 0.2
			// 채우기 불투명도입니다 
			});

			var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
			content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다

			// 반경정보를 표시할 커스텀 오버레이를 생성합니다
			var radiusOverlay = new kakao.maps.CustomOverlay({
				content : content, // 표시할 내용입니다
				position : rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
				xAnchor : 0,
				yAnchor : 0,
				zIndex : 1
			});

			// 원을 지도에 표시합니다
			circle.setMap(map);

			// 선을 지도에 표시합니다
			polyline.setMap(map);

			// 반경 정보 커스텀 오버레이를 지도에 표시합니다
			radiusOverlay.setMap(map);

			// 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
			var radiusObj = {
				'polyline' : polyline,
				'circle' : circle,
				'overlay' : radiusOverlay
			};

			// 배열에 추가합니다
			// 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
			circles.push(radiusObj);

			// 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
			drawingFlag = false;

			// 중심 좌표를 초기화 합니다  
			centerPosition = null;

			// 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
			drawingCircle.setMap(null);
			drawingLine.setMap(null);
			drawingOverlay.setMap(null);
		}
	}

	// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
	function removeCircles() {
		for (var i = 0; i < circles.length; i++) {
			circles[i].circle.setMap(null);
			circles[i].polyline.setMap(null);
			circles[i].overlay.setMap(null);
		}
		circles = [];
	}

	// -------------------------------------------------------------- 반경 그리기 끝 --------------------------------------------------------
	var markerSta = false;
	var radiusSta = false;
	var sta = false;

	function rulerStatus() {
		if (!sta) {
			sta = true;
			kakao.maps.event.addListener(map, 'click', clickHandler);
			kakao.maps.event.addListener(map, 'mousemove', mousemoveHandler);
			kakao.maps.event.addListener(map, 'rightclick', rightclickHandler);

			markerSta = false;
			kakao.maps.event.removeListener(map, 'click', markerHandler);
			marker.setMap(null);
			infowindow.close();

			radiusSta = false;
			removeCircles();
			kakao.maps.event.removeListener(map, 'click', drawRadius);
			kakao.maps.event.removeListener(map, 'mousemove', moveRadius);
			kakao.maps.event
					.removeListener(map, 'rightclick', rightclickRadius);
		} else {
			sta = false;
			deleteClickLine();
			deleteCircleDot();
			deleteDistnce();
			kakao.maps.event.removeListener(map, 'click', clickHandler);
			kakao.maps.event.removeListener(map, 'mousemove', mousemoveHandler);
			kakao.maps.event.removeListener(map, 'rightclick',
					rightclickHandler);
		}
	}

	function markerStatus() {
		if (!markerSta) {
			markerSta = true;
			kakao.maps.event.addListener(map, 'click', markerHandler);

			sta = false;
			deleteClickLine();
			deleteCircleDot();
			deleteDistnce();
			kakao.maps.event.removeListener(map, 'click', clickHandler);
			kakao.maps.event.removeListener(map, 'mousemove', mousemoveHandler);
			kakao.maps.event.removeListener(map, 'rightclick',
					rightclickHandler);

			radiusSta = false;
			removeCircles();
			kakao.maps.event.removeListener(map, 'click', drawRadius);
			kakao.maps.event.removeListener(map, 'mousemove', moveRadius);
			kakao.maps.event
					.removeListener(map, 'rightclick', rightclickRadius);
		} else {
			markerSta = false;
			kakao.maps.event.removeListener(map, 'click', markerHandler);
			marker.setMap(null);
			infowindow.close();
		}
	}

	function radiusStatus() {
		if (!radiusSta) {
			radiusSta = true;
			kakao.maps.event.addListener(map, 'click', drawRadius);
			kakao.maps.event.addListener(map, 'mousemove', moveRadius);
			kakao.maps.event.addListener(map, 'rightclick', rightclickRadius);

			markerSta = false;
			kakao.maps.event.removeListener(map, 'click', markerHandler);
			marker.setMap(null);
			infowindow.close();

			sta = false;
			deleteClickLine();
			deleteCircleDot();
			deleteDistnce();
			kakao.maps.event.removeListener(map, 'click', clickHandler);
			kakao.maps.event.removeListener(map, 'mousemove', mousemoveHandler);
			kakao.maps.event.removeListener(map, 'rightclick',
					rightclickHandler);
		} else {
			radiusSta = false;
			removeCircles();
			kakao.maps.event.removeListener(map, 'click', drawRadius);
			kakao.maps.event.removeListener(map, 'mousemove', moveRadius);
			kakao.maps.event.removeListener(map, 'rightclick', rightclickRadius);
		}
	}
</script>
<%@include file="../template/footer.jsp"%>
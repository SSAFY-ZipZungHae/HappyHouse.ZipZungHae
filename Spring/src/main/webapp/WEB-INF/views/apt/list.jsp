<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>happyhouse-아파트 거래</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<script src="/js/dong_name.js"></script>
<script src="/js/city_gu_match.js"></script>
<script src="/js/hangjungdong2.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAr3X1JBnC3e4b_CAJqGSd81q6OY_ex8Hc&callback=initMap"></script>


<script type="text/javascript">
	//Google map
	let map;
	function initMap() {
		var location_list = new Array();
		<c:forEach var="apt" items="${apts}">
		var tmp = new Array();
		tmp.push("${apt.aptName}");
		tmp.push("${apt.lat}");
		tmp.push("${apt.lng}");

		location_list.push(tmp);
		</c:forEach>

		console.log(location_list.length);

		map = new google.maps.Map(document.getElementById("map"), {
			center : {
				lat : Number("37.504258342"),
				lng : Number("127.0431032")
			},
			zoom : 16
		});

		var marker, i;
		for (i = 0; i < Math.min(100, location_list.length); i++) {
			marker = new google.maps.Marker({
				id : i,
				position : new google.maps.LatLng(location_list[i][1],
						location_list[i][2]),
				map : map,
				label : location_list[i][0]
			});
		}
	}
	$(document).ready(
			function() {

				$("#searchBtn").click(
						function() {

							if ($("#sword").val() == "") {
								alert("모든 목록 조회!!");
							}
							$("#searchform").attr("action", "${root}/apt/list")
									.submit();
						});

				$(".page-item").click(function() {
					$("#pg").val(($(this).attr("data-pg")));
					$("#pageform").attr("action", "${root}/apt/list").submit();
				});

				$("#searchArea").click(
						function() {

							if ($("#dong").val() == null
									|| $("#dong").val() == "선택") {
								alert("지역을 올바르게 선택해주세요!");
							} else {
								$("#areaform").attr("action",
										"${root}/apt/selectlist").submit();
							}

						});

				$(document).on('click', '.godetail', function() {
					var no = $(this).attr('id');
					location.href = "${root}/apt/detailview?no=" + no;

				});

			});
</script>
<style>
div {
	padding: 10px;
	text-align: center;
}

a {
	padding-right: 15px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" name="key" id="key" value="${key}"> <input
			type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container" align="center">
		<div class="col-lg-12" align="center">
			<h2>Apart 거래정보 목록</h2>

			<table class="table table-borderless">
				<!-- 이 부분에 시, 군 , 구 검색 부분 구현 -->
				<div class="row container">
					<div class="col-sm-2"></div>
					<div class="col-sm-8 row">
						<form id="areaform" method="GET" action="" class="form-inline row">
							<input type="hidden" name="pg" id="pg" value="1"> <input
								type="hidden" name="dongtext" id="dongtext" value="dong">
							<input type="hidden" name="dongarea" id="dongarea" value="dong">

							<div class="col-xs-3 form-group md">
								<select class="form-control" name="sido" id="sido">
								</select>
							</div>

							<div class="col-xs-3 form-group md-1">
								<select class="form-control" name="sigugun" id="sigugun">
								</select>
							</div>

							<div class="col-xs-3 form-group md-1">
								<!--<input type="text" class="form-control" name="dong" id="dong" placeholder="동을 입력하세요.">-->

								<select class="form-control" name="dong" id="dong">
								</select>
							</div>

							<div class="col-xs-3 col-12 col-md-3">
								<button type="button" id="searchArea"
									class="btn btn-block btn-lg btn-primary">검색</button>
							</div>
						</form>
					</div>
					<div class="col-sm-2"></div>
				</div>

			</table>
			<form id="searchform" method="get" class="form-inline" action="">
				<input type="hidden" name="pg" id="pg" value="1">
				<table class="table table-borderless">
					<tr>
						<td align="right"><select class="form-control" name="key"
							id="skey">
								<!-- <option value="articleno">아파트 이름</option> -->
								<option value="aptname">아파트 이름</option>
								<option value="dong">동</option>

						</select> <input type="text" class="form-control" placeholder="검색어 입력."
							name="word" id="sword">
							<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class=".container-fluid">

		<div class="row">
			<div class="col-sm-6">
				<div class='contents-title'>
					<h3 class="dealinfo">상세 검색</h3>
					<div>
						<form id="detailSearchForm" method="post" action="main">
							<input type="text" class="btn btn-secondary" name="aptName"
								style="width: 100px" value="아파트이름"> <input type="text"
								class="btn btn-secondary" name="price" style="width: 100px"
								value="거래금액"> <input type="text"
								class="btn btn-secondary" name="area" style="width: 100px"
								value="면적"> <input type="text" class="btn btn-secondary"
								name="date" style="width: 100px" value="날짜">
							<button type="button" class="btn btn-warning"
								id="detailSearchBtn">검색</button>
						</form>
					</div>
					<div>
						정렬 <select class="btn btn-primary ml-4">
							<option>거래금액</option>
							<option>면적</option>
							<option>날짜
							<option>
						</select> <select class="btn btn-primary">
							<option>오름차순</option>
							<option>내림차순</option>
						</select>
						<button type="button" class="btn btn-warning" id="">정렬</button>
					</div>
				</div>
				<!-- 아파트 목록 -->
				<table class="table table-hover">
					<colgroup>
						<col width="100">
						<col width="180">
						<col width="120">
						<col width="120">
						<col width="120">
						<col width="120">
						<col width="150">
						<col width="100">
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">아파트 명</th>
							<th class="text-center">주소</th>
							<th class="text-center">가격</th>
							<th class="text-center">면적</th>
							<th class="text-center">건축년도</th>
							<th class="text-center">거래날짜</th>
							<th class="text-center">층</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${apts.size() == 0}">
							<tr>
								<td colspan="8"><strong>아파트 정보가 없습니다.</strong></td>
							</tr>

						</c:if>

						<c:if test="${apts.size() != 0}">
							<div class="contents">
								<c:forEach var="apt" items="${apts}" varStatus="status">
									<tr class="godetail" id="${apt.no}"
										style="cursor: pointer;">
										<td>${status.count}</td>
										<td>${apt.aptName}</td>
										<td>${apt.dong}</td>
										<td>${apt.dealAmount}만원</td>
										<td>${apt.area}m*m</td>
										<td>${apt.buildYear}년</td>
										<td>${apt.dealYear}년${apt.dealMonth}월${apt.dealDay}일</td>
										<td>${apt.floor}층</td>
									</tr>
								</c:forEach>
								<tr>
									<td>${navigation.navigator}</td>
								</tr>
							</div>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="col-sm-6">
				<div id="map" style="height: 800px"></div>
			</div>
		</div>
	</div>
	<!-- 아파트목록 끝 -->


	<!-- 지도 -->
	<!-- <!-- 지도
	<div class="col-sm-5">

		<div id="map" style="width: 100%; height: 100vh; margin: auto;"></div>
	</div>
	<script defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAr3X1JBnC3e4b_CAJqGSd81q6OY_ex8Hc&callback=initMap"></script>
	<script>
		var map;
		var markers = [];
		var infoWindow;
		var markerimg = "/assets/images/marker.png";

		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 37.5012743,
					lng : 127.039585
				},
				zoom : 15
			});

			infoWindow = new google.maps.InfoWindow;

			/* var multimarker = {
					coords: multi,
					iconImage: myposition,
					content: '멀티캠퍼스(역삼)'
			};
			addMarker(multimarker);
			infoWindow.setPosition(multi);
			infoWindow.setContent('멀티캠퍼스.');
			infoWindow.open(map); */

		}

		/* function handleLocationError(browserHasGeolocation, infoWindow, pos) {
			infoWindow.setPosition(pos);
			infoWindow.setContent(browserHasGeolocation ?
				'Error: Geolocation 서비스 실패.' :
				'Error: Geolocation을 지원하지 않는 브라우저.');
			infoWindow.open(map);
		} */

		function addMarker(lat, lng) {
			//alert(lat+" "+lng);
			var point = new google.maps.LatLng(parseFloat(lat), parseFloat(lng));
			const marker = new google.maps.Marker({
				map : map,
				position : point
			});
			/* map.setCenter(marker.getPosition()); */
			/* map.setZoom(15); */

			if (markerimg) {
				marker.setIcon(markerimg);
			}

			/* if(props.content){
				infoWindow = new google.maps.InfoWindow({
					content:props.content
				}); 
			
			} */

			marker.addListener('click', function() {
				map.setZoom(17);
				map.setCenter(marker.getPosition());
				bounceMarker(marker);
			});
			markers.push(marker);
			setMapOnAll(map);
		}

		function bounceMarker(marker) {
			if (marker.getAnimation() !== null) {
				marker.setAnimation(null);
			} else {
				marker.setAnimation(google.maps.Animation.BOUNCE);
			}
		}

		function deleteMarkers() {
			clearMarkers();
			markers = [];
		}

		function clearMarkers() {
			setMapOnAll(null);
		}

		function setMapOnAll(map) {
			for (let i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
		}
	</script>

	환경정보, 등등 db -->



</body>
</html>

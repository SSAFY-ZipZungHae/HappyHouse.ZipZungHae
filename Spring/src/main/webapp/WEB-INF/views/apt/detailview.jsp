<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apt-detail</title>
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
	<c:forEach var="commerce" items="${commerces}">
	var tmp = new Array();
	tmp.push("${commerce.name}");
	tmp.push("${commerce.lat}");
	tmp.push("${commerce.lng}");

	location_list.push(tmp);
	</c:forEach>

	console.log(location_list.length);

	map = new google.maps.Map(document.getElementById("map"), {
		center : {
			lat : Number("37.504258342"),
			lng : Number("127.0442932")
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
	$(document).ready(function() {
		

		$("#btn_findcomm").click(function() {
			if ($("#comm").val() == "") {
				alert("모든 목록 조회!!");
			}
			$("#searchform").attr("action", "${root}/commerce/dong").submit();

		});
	});

</script>

<style>
.img-fluid {
	width: 800px;
	height: 500px;
	margin-left: 14%;
	margin-bottom: 5%;
}

tr, th {
	font-size: 20px;
}
.compa{
margin-left :40%
}
.form-control{
margin-left :2%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Page Header -->

	<div class="container">
		<c:if test="${ not empty house }">
			<!-- Page Heading/Breadcrumbs -->

			<ol class="breadcrumb">
				<div class="row">
					<h2 class="mt-4 mb-3">${ house.aptName }</h2>
				</div>
			</ol>

			<!-- Image Header -->
			<img class="img-fluid rounded mb-4" src="${root}/asset/img/경희궁.jpeg"
				alt="">

			<!-- Marketing Icons Section -->
			<div class="container">
				<table class="table">
					<tr>
						<th>매물 번호</th>
						<td style="width: 60%;">${ house.no}</td>
					</tr>
					<tr>
						<th>지역</th>
						<td style="width: 60%;">${ house.dong }</td>
					</tr>
					<tr>
						<th>거래 가격</th>
						<td style="width: 60%;">${ house.dealAmount }만원</td>
					</tr>
					<tr>
						<th>면적</th>
						<td style="width: 60%;">${ house.area}m*m</td>
					</tr>
					<tr>
						<th>거래 날짜</th>
						<td style="width: 60%;">${ house.dealYear }.${ house.dealMonth }.${house.dealDay }</td>
					</tr>
					<tr>
						<th>층수</th>
						<td style="width: 60%;">${ house.floor }층</td>
					</tr>
				</table>
			</div>
			<!-- /.row -->
		</c:if>

	</div>

	<!--환경 정보 -->

<div class="compa">
	<form id="searchform" method="get" class="form-inline" action="">
		<input type="hidden" name="pg" id="pg" value="1">
		<h2 class="post-title text-center" style="">주변 상권 정보 </h2>
		<input type="text" class="form-control" placeholder="동을 입력하세요"
			id="comm" name="comm" value="${house.dong}">
		<div class="form-group row text-right mr-5">
			<div class="ml-md-auto col-md-9">
				<button id="btn_findcomm" type="button"
					class="btn btn-group btn-info btn-animated">검색</button>
			</div>
		</div>
	</form>
	</div>
	<br>
	<br>
	
	<div class="col-12">
	<div class="row">
		<div class="col-sm-7">
				<div id="map" style="height: 800px"></div>
			</div>
	    <div class="col-sm-5" id="housedeal__des" style="cursor: pointer;">
	    	<h2>상권정보 정보</h2>
	    	<c:if test="${ not empty commerces }">
			<ul class="list-group" style="overflow-y:scroll; height:1000px;">
			  <c:forEach var="commerce" items="${ commerces }">
			  <li class="list-group-item" id="${ commerce.gu }">
			  		<div class="housedeal__p">
		    			<h3><strong>${ commerce.name }</strong></h3>
		    			<p> ${ commerce.categoryLarge }</p>
		    			<p> ${ commerce.categoryMiddle }</p>
		    			<p> ${ commerce.categorySmall }</p>
		    			<p>주소: ${ commerce.city }_${ commerce.gu }_${ commerce.dong}</p>
		    		</div>
		      </li>
		      </c:forEach>
			</ul>
			</c:if>
			<c:if test="${ empty houses }"><br>
			<h4><strong>주변 상권정보가 궁금하다면 검색버튼을 누르세요!</strong></h4>
			</c:if>
	    </div>
	</div>
</div>
	
</body>
</html>
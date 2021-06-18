<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>happyhouse-코로나선별진료소</title>
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
	$(document).ready(function() {

		$("#searchArea").click(function() {
			//alert($("#sigugun option:checked").text());
			//$("#areaform").attr("action", "${root}/corona/search").submit();
			location.href = "${root}/corona/search?gunguarea=" +$("#sigugun option:checked").text()+"&gungutext="+$("#sigugun option:checked").text();
		});

	});
</script>
<style>
th{
font-size:16px;
}

td{
font-size:15px;
}

</style>
</head>
<body>"/var/folders/j6/tnhgcbnn5ln44nbfz4bz77n00000gn/T/TemporaryItems/NSIRD_screencaptureui_lLRwC3/스크린샷 2021-05-24 오후 1.43.44.png"
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container" align="center">
		<div class="col-lg-12" align="center">
			<h2>
				<strong>코로나 선별진료소</strong>
			</h2>
			<br><br>

			<table class="table table-borderless">
				<!-- 이 부분에 시, 군 , 구 검색 부분 구현 -->
				<div class="row container">
					<div class="col-sm-3"></div>
					<div class="col-sm-8 row">
						<form id="areaform" method="GET" action="" class="form-inline row">
							<input type="hidden" name="gungutext" id="gungutext"
								value="${dong}"> <input type="hidden" name="gunguarea"
								id="gunguarea" value="${dong}">

							
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
					<div class="col-sm-1"></div>
				</div>

			</table>

		</div>
	</div>

	<!-- 병원 목록 -->
	<table class="table table-hover">
		<colgroup>
			<col width="40">
			<col width="90">
			<col width="90">
			<col width="140">
			<col width="180">
			<col width="120">
			<col width="120">
			<col width="150">
			<col width="100">
		</colgroup>
		<thead>
			<tr>
				<th class="text-center">번호</th>
				<th class="text-center">시</th>
				<th class="text-center">군구</th>
				<th class="text-center">진료소</th>
				<th class="text-center">주소</th>
				<th class="text-center">평일 진료시간</th>
				<th class="text-center">토요일 진료시간</th>
				<th class="text-center">일요일 진료시간</th>
				<th class="text-center">전화번호</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${hospitals.size() == 0}">
				<tr>
					<td colspan="8"><strong>병원 정보가 없습니다.</strong></td>
				</tr>

			</c:if>

			<c:if test="${hospitals.size() != 0}">
				<div class="contents">
					<c:forEach var="hospital" items="${hospitals}" varStatus="status">
						<tr >
							<td class="text-center">${status.count}</td>
							<td class="text-center">${hospital.sido}</td>
							<td class="text-center">${hospital.gungu}</td>
							<td class="text-center">${hospital.hospitalName}</td>
							<td class="text-center">${hospital.address}</td>
							<td class="text-center">${hospital.weekDayOp}</td>
							<td class="text-center">${hospital.satOp}</td>
							<td class="text-center">${hospital.sunOp}</td>
							<td class="text-center">${hospital.tel}</td>
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



	<!-- 병원 목록 끝 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Environment-page</title>
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
<script type="text/javascript">
	$(document).ready(
			function() {

				$("#searchArea").click(
						function() {

							if ($("#dong").val() == null
									|| $("#dong").val() == "선택") {
								alert("지역을 올바르게 선택해주세요!");
							} else {
								location.href = "${root}/env/search?gunguarea="
										+ $("#dong option:checked").text()
										+ "&gungutext="
										+ $("#dong option:checked").text();
							}
						});
			});
</script>
<style type="text/css">
tr{
text-align = right;
}
thead{
font-size: 17px;
}
td{
font-size:16px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" align="center">
		<div class="col-lg-12" align="center">
			<h2>환경 정보 목록</h2>
			<br>
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
			<!--주소 선택 완료  -->

		</div>
	</div>

	<!--  목록 뿌리기-->
	<div class=".container-fluid">
		<!-- 환경정보 목록 -->
		<table class="table table-hover">
			<colgroup>
				<col width="60">
				<col width="180">
				<col width="120">
				<col width="180">

			</colgroup>
			<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">(주)회사명</th>
					<th class="text-center">타입</th>
					<th class="text-center">주소</th>

				</tr>
			</thead>

			<tbody>
				<c:if test="${envs.size() == 0}">
					<tr>
						<td colspan="8"><strong>해당지역의 환경정보가 없습니다.</strong></td>
					</tr>

				</c:if>

				<c:if test="${envs.size() != 0}">
					<div class="contents">
						<c:forEach var="env" items="${envs}" varStatus="status">
							<tr class="godetail" id="" style="cursor: pointer;">
								<td class="text-center">${status.count}</td>
								<td class="text-center">${env.name}</td>
								<td class="text-center">${env.type}</td>
								<td class="text-center">${env.address}</td>
						</c:forEach>
						<tr>
							<td>${navigation.navigator}</td>
						</tr>
					</div>
				</c:if>
			</tbody>
		</table>
	</div>

	</div>
	</div>
	<!-- 아파트목록 끝 -->


</body>
</html>
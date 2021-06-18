<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse-공지사항</title>
<meta charset="utf-8">
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

<script type="text/javascript">
	$(document).ready(function() {

		$('#mvWriteBtn').focusin(function() {
			$(location).attr("href", "${root}/article/write");
		});

		$("#searchBtn").click(function() {

			if ($("#sword").val() == "") {
				alert("모든 목록 조회!!");
			}
			$("#searchform").attr("action", "${root}/article/list").submit();
		});

		$(".page-item").click(function() {
			$("#pg").val(($(this).attr("data-pg")));
			$("#pageform").attr("action", "${root}/article/list").submit();
		});

	});
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jsp" %>


	<!-- 글 목록 시작 -->
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" name="key" id="key" value="${key}"> <input
			type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container jumbotron" align="center">
		<!--
		<div class="col-lg-8" align="right">
		<strong>${userinfo.username}</strong>님 환영합니다.
		<a href="${root}/user/logout">로그아웃</a>
		</div>
	  -->

		<div class="jumbotron" align="center" style="cursor: pointer;">
			<a href="${root}/article/list?pg=1&key=&word="><h2
					style="color: black;">
					<strong>공지사항</strong>
				</h2></a>
			<p>공지사항 수정과 삭제는 관리자만 가능합니다.</p>
			<c:if test="${userinfo.userid == 'admin'}">
			<table class="table table-borderless">
				<tr>
				
					<td align="right"><button type="button" id="mvWriteBtn"
							class="btn btn-link" style="color: gray">글쓰기</button></td>
				</tr>
			</table>
			</c:if>
			<!-- 검색 -->
			<form id="searchform" method="get" class="form-inline" action="">
				<input type="hidden" name="pg" id="pg" value="1">
				<table class="table table-borderless">
					<tr>
						<td align="right"><select class="form-control" name="key"
							id="skey">
								<option value="userid" selected="selected">작성자</option>
								<option value="articleno">글번호</option>
								<option value="subject">제목</option>
						</select> <input type="text" class="form-control" placeholder="검색어 입력."
							name="word" id="sword">
							<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
						</td>
					</tr>
				</table>
			</form>
			<!-- 글목록 -->
			<table class="table table-striped">
				<thead>
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<c:if test="${articles.size() == 0}">
					<tbody>
						<tr>
							<td>공지사항이 없습니다.</td>
						</tr>
					</tbody>
				</c:if>
				<c:if test="${articles.size() != 0}">
					<tbody>
						<c:forEach var="article" items="${articles}">
							<tr>
								<td>${article.userid}</td>
								<td  onclick="location.href='${root}/article/read?articleno=${article.articleno}'"><strong>${article.subject}</strong></td>
								<td>${article.regtime}</td>
							</tr>

						</c:forEach>
					</tbody>
				</c:if>
			</table>


			<!-- 페이징 -->
			<table>
				<tr>
					<td>${navigation.navigator}</td>
				</tr>
			</table>

			<c:if test="${articles.size() == 0}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>작성된 글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>

</body>
</html>
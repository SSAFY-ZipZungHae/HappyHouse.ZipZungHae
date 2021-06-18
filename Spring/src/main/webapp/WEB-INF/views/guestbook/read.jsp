<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!-- 로그인되면 쓸수 있는걸로 바꾸기 -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>happyhouse-글읽기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>
<style>
.form-group{
font-size:20px;
}

</style>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container jumbotron" align="center">
	
	<div class="jumbotron" align="center">
		<h2><strong>공지사항</strong></h2><br><br>
		<form id="writeform" method="post" action="">
			<div class="form-group" align="left">
				<label for="subject">제목: </label>
				${article.subject}
			</div>
			<div class="form-group" align="left">
				<label for="content">내용: </label>
				${article.content}
			</div>
		<c:if test="${userinfo.userid == 'admin'}">
			<div align="right">
			<button type="button"  onclick="location.href='${root}/article/modify?articleno=${article.articleno}'"  class="btn btn-primary">수정</button>
			<button type="reset"  onclick="location.href='${root}/article/delete?articleno=${article.articleno}'" class="btn btn-warning">삭제</button>
			</div>
			</c:if>
		</form>
	</div>
</div>
</body>
</html>
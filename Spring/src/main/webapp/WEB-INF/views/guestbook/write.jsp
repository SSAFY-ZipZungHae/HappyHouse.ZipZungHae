<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!-- 로그인되면 쓸수 있는걸로 바꾸기 -->
<c:if test="${userinfo.userid != 'admin'}">
	<c:redirect url="/"/>
</c:if>
<c:if test="${userinfo.userid == 'admin'}">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>happyhouse-글작성</title>
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
  <script type="text/javascript">
  $(document).ready(function() {
	  $("#writeBtn").click(function() {
			if($("#subject").val() == "") {
				alert("제목 입력!!!");
				return;
			} else if($("#content").val() == "") {
				alert("내용 입력!!!");
				return;
			} else {
				$("#writeform").attr("action", "${root}/article/write").submit();
			}
		});
	});
  </script>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="${root}">HappyHouse</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="about.html">아파트검색</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${root}/article/list?pg=1&key=&word=">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">QnA</a></li>
					<c:if test="${userinfo == null}">

						<li class="nav-item"><a class="nav-link"
							href="${root}/user/login">로그인</a></li>
					</c:if>
					<c:if test="${userinfo != null}">
						<div>
							<strong>${userinfo.username}</strong>님 환영합니다. <a
								href="${root}/user/logout">로그아웃</a>
						</div>
					</c:if>
					<li class="nav-item"><a class="nav-link"
						href="${root}/user/join">회원가입</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownPages" href="#"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">임시</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item" href="${root}/user/login">n</a> <a
								class="dropdown-item" href="${root}/user/joinus">입</a> <a
								class="dropdown-item" href="faq.html">FAQ</a> <a
								class="dropdown-item" href="404.html">404</a> <a
								class="dropdown-item" href="pricing.html">Pricing Table</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>


<div class="container jumbotron" align="center">
	
	<div class="jumbotron" align="center">
		<h2><strong>공지사항 글쓰기</strong></h2>
		<form id="writeform" method="post" action="">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<div align="right">
			<button type="button" id="writeBtn" class="btn btn-primary">글작성</button>
			<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>

</body>
</html>
</c:if>

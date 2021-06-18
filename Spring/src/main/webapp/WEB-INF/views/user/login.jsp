<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
	<c:set var="idck" value=" checked=\"checked\"" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	

<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").click(function() {

			if ($("#userid").val() == "") {
				alert("아이디 입력!!!");
				return;
			} else if ($("#userpwd").val() == "") {
				alert("비밀번호 입력!!!");
				return;
			} else {
				$("#loginform").attr("action", "${root}/user/login").submit();
			}
		});

		$('#mvRegisterBtn').focusin(function() {
			$(location).attr("href", "${root}/user/join");
		});
		$('#passfindBtn').focusin(function() {
			$(location).attr("href", "${root}/user/passfind");
		});
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div class="container">
		<h2 class="form-signin-heading text-center jumbotron">로그인 페이지</h2>
		<form id="loginform" method="post" action="">

			<label for="id" class="sr-only">아이디</label> <input
				type="text" id="userid" name="userid" value="${saveid}" class="form-control"
				placeholder="아이디를 입력하세요" required autofocus> 
			<br>
				<label
				for="Password" class="sr-only">비밀번호</label> <input
				type="password" id="userpwd" name="userpwd" class="form-control"
				placeholder="비밀번호를 입력하세요" onkeydown="javascript:if(event.keyCode == 13) {login();}" required>
				<br>
			<div class="form-group form-check" align="left">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok"${idck}>아 아이디저장 
			    </label>
			</div>
			<div class="form-group" align="center">
				<button type="button" id="loginBtn" class="btn btn-warning">로그인</button>
				<button type="button" id="mvRegisterBtn" class="btn btn-primary">회원가입</button>
				<button type="button" id="passfindBtn" class="btn btn-info">비밀번호 찾기</button>
			</div>
		</form>

	</div>
	<!-- /container -->
	
	

	
</body>
</html>
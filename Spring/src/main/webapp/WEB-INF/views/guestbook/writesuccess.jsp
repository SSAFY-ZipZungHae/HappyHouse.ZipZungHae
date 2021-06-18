<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo.userid != 'admin'}">
	<c:redirect url="${root}/article/list?pg=1&key=&word="/>
</c:if>
<c:if test="${userinfo.userid == 'admin'}">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-글작성성공</title>
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
<body>
<div class="container" align="center">
	<div class="col-lg-6" align="right">
	<strong>${userinfo.username}</strong>님 환영합니다.
	<a href="${root}/user/logout">로그아웃</a>
	</div>
	<div class="col-lg-6">
	  <div class="jumbotron">
	    <h2 style="color:black;">글 작성에 성공하였습니다. 관리자님</h2>      
	  </div>  
	  <p><a href="${root}/article/list?pg=1&key=&word=">목록으로 돌아가기</a></p>
	</div>
</div>
</body>
</html>
</c:if>

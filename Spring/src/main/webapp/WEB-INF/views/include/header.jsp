<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
 <style>
img {
	width: 1900px;
	height: 600px;
}
.navbar-brand{
font-size : 25px;
}
#userna {
padding-top:13px;
	color: #fff;
}
.logout{
padding-top:15px;
}
li{
font-size : 18px;
padding-left : 10px;
}
.collapse navbar-collapse{
margin-left:20%;
}
</style>
 <!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/">HappyHouse</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive" style="margin-left:20%">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="${root}/apt/list?pg=1&key=&word=">아파트검색</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${root}/article/list?pg=1&key=&word=">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">QnA</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${root}/user/list?userid=${userinfo.userid}">회원목록</a></li>
					<c:if test="${userinfo == null}">

						<li class="nav-item"><a class="nav-link"
							href="${root}/user/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${root}/user/join">회원가입</a></li>
					</c:if>
					<c:if test="${userinfo != null}">
						<li class="nav-item"><a class="nav-link"
							href="${root}/user/mypage">마이페이지</a></li>
						<li class="nav-item nav-link underline" id="userna"><strong>${userinfo.username}님
								환영합니다.</strong></li>
						<li><a class="logout nav-item nav-link" href="${root}/user/logout">로그아웃</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%
	String findPwd = (String)request.getAttribute("findpwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find-page</title>
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
	$(document).ready(function () {
		
		$("#btn_findpass").click(function (e) { 
		
			let userid = $("#userid").val();
			let username = $("#username").val();
			
			$.ajax({
				type: "GET",
				url: "${root}/user/findpassword/"+userid+"/"+username,
				contentType: 'application/json',
				success: function (map) {
					if(map){	//비밀번호 찾기 성공
						$("#warning_badge").empty();
						$("#defaultForm").css("display","none");
						$("#successForm").css("display","block");
						$("#findpassword").text(map.userpwd);
					} else{		//비밀번호 찾기 실패
						$("#warning_badge").text("해당 정보의 사용자가 없습니다!");
					}
				},  
                error: function (xhr, status, msg) {
                    console.log("상태값 : " + status + " / Http 에러메시지 : " + msg);
                }
			});
		});

	});
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<!-- 중앙 메인 컨테이너-->
		<div class="row justify-content-center">

			<div class="col-8 mt-5 mb-5"
				style="background-color: gainsboro; border-radius: 10px;">

				<div id="formhead" class="font-weight-bold mb-3 mt-3 pl-2 pb-2">
				<span class="mr-3">비밀번호 찾기</span>
				<!--비밀번호 찾기에 실패하면 문구를 달 워닝뱃지-->
				<span id="warning_badge" class="badge badge-pill badge-danger"></span>
				</div>
				<!-- 비밀번호 찾기 전 or 실패-->
				<div id="defaultForm">
					<form class="form-horizontal was-validated">
						<div class="form-group row">
							<label class="col-sm-3 text-md-right" for="userid">아이디<span
								class="text-danger small">*</span></label>
							<div class="col-sm-8">
								<input type="text" class="form-control" placeholder="ID" id="userid" name="userid" required minlength="2">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 text-md-right" for="username">이름<span
								class="text-danger small">*</span></label>
							<div class="col-sm-8">
								<input type="text" class="form-control" placeholder="NAME" id="username" name="username" required minlength="2">
							</div>
						</div>
					
						<div class="form-group row text-right mr-5">
							<div class="ml-md-auto col-md-9">
								<button id="btn_findpass" type="button"
									class="btn btn-group btn-info btn-animated">비밀번호 찾기</button>
							</div>
						</div>
					</form>
				</div>

				<!-- 비밀번호 찾기 후 -->
				<div id="successForm" class="text-center" style="display: none;">
					<h5>Your Password is</h5>
					<h3 id="findpassword" class="text-info"></h3>
					<br>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="../vendor/jquery/jquery.min.js"></script>

<script type="text/javascript">
function modify(){
	if(document.getElementById("userpwd").value != document.getElementById("userpwd2").value){
		alert("비밀번호 불일치!!")
		return;
	}
	else if(document.getElementById("username").value == "") {
		alert("이름 입력!!!");
		return;
	} else if(document.getElementById("email").value == "") {
		alert("이메일 입력!!!");
		return;
	}else if(document.getElementById("address").value == "") {
		alert("주소 입력!!!");
		return;
	} 
	else {
		
		document.getElementById("modifyform").action = "${root}/user/usermodify";
		document.getElementById("modifyform").submit();
	}
};

function delete(){
	if(confirm("탈퇴하시겠습니까?")){
		alert("탈퇴되었습니다.");
		$("#delBtn").attr("action", "${root}/user/delete").submit();
	}
	
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div style="text-align: center" class="jumbotron">
		<h2>마이페이지</h2>

	</div>
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8 mb-4">

			<h3 class="text-center">${userinfo.username}님의 회원정보</h3>
			<div class="control-group form-group">
				<div class="controls">
					<label for="userid">아이디:</label> ${userinfo.userid}
				</div>

			</div>
			<form id="modifyform" method="post" action="" name="">
				<input type="hidden" name="userid" id="userid"
					value="${userinfo.userid }">
				<div class="control-group form-group">
					<div class="controls">
						<label for="username">이름:</label> <input type="text"
							class="form-control" id="username" name="username" required
							data-validation-required-message="Please enter your name."
							value="${ userinfo.username }">
						<p class="help-block"></p>
					</div>
				</div>

				<div class="control-group form-group">
					<div class="controls">
						<label for="userpwd">비밀번호: </label> <input type="text"
							class="form-control" id="userpwd" name="userpwd"
							value="${userinfo.userpwd}" placeholder="비밀번호는 공개되지 않습니다"
							required
							data-validation-required-message="Please enter your pwd.">
						<p class="help-block"></p>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">


						<label>비밀번호 확인:</label> <input type="text" class="form-control"
							id="userpwd2" value="${userinfo.userpwd}" required
							data-validation-required-message="Please enter your pwd.">
						<p class="help-block"></p>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label for="email">이메일: </label> <input type="text"
							class="form-control" id="email" value="${userinfo.email}"
							required
							data-validation-required-message="Please enter your email.">
						<p class="help-block"></p>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label for="tel">주소: </label> <input type="text"
							class="form-control" id="address" value="${userinfo.address}"
							required
							data-validation-required-message="Please enter your address.">
						<p class="help-block"></p>
					</div>
				</div>
				<div id="success"></div>
				<!-- For success/fail messages -->
				<div class="text-center">
					<button type="submit" class="btn btn-warning" id="modifyBtn"
						onclick="javascript=modify();">수정</button>
					<button type="submit" class="delBtn btn btn-danger" id="delBtn"
						onclick="javascript=delete();">탈퇴</button>
					<button type="button" class="delBtn btn btn-primary"
						onclick="location.href='${root}/'"
						class="modiBtn btn btn-outline-info">확인</button>

				</div>
			</form>
			탈퇴버튼을 누르면 바로 회원 탈퇴가 되니 주의하시기바랍니다.
		</div>

	</div>

</body>
</html>
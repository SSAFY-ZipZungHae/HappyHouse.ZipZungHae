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


<link href="../css/clean-blog.min.css" rel="stylesheet">
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function modify() {
		if (document.getElementById("veripwd1").value != document
				.getElementById("veripwd2").value) {
			alert("비밀번호 불일치!!")
			return;
		}
		if (document.getElementById("modname").value == "") {
			alert("이름 입력!!!");
			return;
		} else if (document.getElementById("modemail").value == "") {
			alert("이메일 입력!!!");
			return;
		} else if (document.getElementById("email").value == "") {
			alert("이메일 입력!!!");
			return;
		} else if (document.getElementById("address").value == "") {
			alert("주소 입력!!!");
			return;
		} else {
			document.getElementById("modifyform").action = "${root}/user/usermodify";
			document.getElementById("modifyform").submit();
		}
	};

	$(document).ready(function() {

		// 회원 탈퇴.
		$(document).on("click", ".delBtn", function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				let delid = $("#userid").val();
				$.ajax({
					url : '${root}/admin/user/' + delid,
					type : 'DELETE',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(users) {
						$("#success").css("display", "none");
						$("#successDel").css("display", "block");
						console.log("성공!!");

					},
					error : function(xhr, status, msg) {
						console.log("상태값 : " + status + " Http에러메시지 : " + msg);
					}
				});
			}
		});

		//회원 수정 
		$(document).on("click", ".modifyBtn", function() {
			let mid = $("#userid").val();
			
			let modifyinfo = JSON.stringify({
				"userid" : mid, 
				"userpwd" : $("#userpwd").val(), 
				"email" : $("#email" + mid).val(), 
				"address" : $("#address" + mid).val()
			   
			});

			$.ajax({
				url : '${root}/admin/user',
				type : 'PUT',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				data : modifyinfo,
				success : function(users) {
					console.log("성공!");
					console.log(modifyinfo);
				},
				error : function(xhr, status, msg) {
					console.log("상태값 : " + status + " Http에러메시지 : " + msg);
				}
			});
		});

		$('#modifymenu').click(function() {
			$('#modifycontent').css('display', '');
			$('#outcontent').css('display', 'none');
		});

		$('#outmenu').click(function() {
			$('#modifycontent').css('display', 'none');
			$('#outcontent').css('display', '');
		});

	});
</script>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<h1 class="mt-4 mb-3">마이 페이지</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a id="modifymenu" style="cursor: pointer;">회원 정보 수정</a></li>
			<li class="breadcrumb-item"><a id="outmenu" style="cursor: pointer;">회원 탈퇴</a></li>
		</ol>
		<div class="container" id="modifycontent">
			<div class="row">
				<!-- 탈퇴 전  -->

			</div>

			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8 mb-4">
					<form id="modifyform" method="post" action="" name="" novalidate>
						<input type="hidden" name="userid" id="userid"
							value="${userinfo.userid }">

						<h3 class="text-center">${userinfo.username}님의회원정보</h3>
						<div class="control-group form-group">
							<div class="controls">
								<label for="userid">아이디:</label> ${userinfo.userid}
							</div>

						</div>
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
									id="userpwd${'${user.userid}'}" value="${userinfo.userpwd}" required
									data-validation-required-message="Please enter your pwd.">
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label for="email">이메일: </label> <input type="text"
									class="form-control" id="email${'${user.userid}'}" value="${userinfo.email}"
									required
									data-validation-required-message="Please enter your email.">
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label for="tel">주소: </label> <input type="text"
									class="form-control" id="address${'${user.userid}'}" value="${userinfo.address}"
									required
									data-validation-required-message="Please enter your address.">
								<p class="help-block"></p>
							</div>
						</div>

						<div id="success"></div>
						<!-- For success/fail messages -->
						<div class="text-center">
							<button type="button" class="modifyBtn btn-primary" id="modifyBtn">회원
								정보 수정</button>
							<button type="button" class="btn btn-warning" id=""
								onclick="location.href='${root}/'">확인</button>
						</div>
					</form>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>
		<div class="container" id="outcontent" style="display: none">
			<div class="row">
				<div class="container mb-4 text-center">
					<form id="deleteform" method="post" action="" name="">
						<input type="hidden" name="act" id="act" value="delete">
						<button type="button" class="delBtn btn btn-primary" id=""<%-- onclick="location.href='${root}/user/delete?userid=${userinfo.userid}'" --%>>회원
							탈퇴</button>
						<button type="button" class="btn btn-warning" id=""
							onclick="location.href='${root}/user/logout'">확인</button>
					</form>
				</div>


			</div>
			<!-- 탈퇴 후 -->
			<div id="successDel" class="text-center" style="display: none;">
				<h5>탈퇴가 성공했습니다.</h5>
			</div>
		</div>
	</div>

</body>
</html>
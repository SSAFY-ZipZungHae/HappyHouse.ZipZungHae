<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HappyHouse</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="static/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	
</script>
<style>
img {
	width: 1900px;
	height: 600px;
}

#userna {
	color: #fff;
}

.card-img-top {
	width: 350px;
	height: 400px;
}

.btn {
	margin-left: 35%;
}

.card-text {
	font-size: 18px;
}
</style>
</head>
<body>
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
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="${root}/apt/list?pg=1&key=&word=">아파트검색</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${root}/article/list?pg=1&key=&word=">공지사항</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/">QnA</a></li>
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
						<a class="nav-item nav-link" href="${root}/user/logout">로그아웃</a>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
	<!-- 회원 정보 모달 -->
	<div class="modal" id="userViewModal" fade" id="createModal"
		data-backdrop="false">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원정보</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-bordered">
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center">ID</th>
								<td class="text-left" id="vid"></td>
								<th class="text-center">회원명</th>
								<td class="text-left" id="vname"></td>
							</tr>
							<tr>
								<th class="text-center">이메일</th>
								<td class="text-left" id="vemail"></td>
								<th class="text-center">가입일</th>
								<td class="text-left" id="vjoindate"></td>
							</tr>
							<tr>
								<th class="text-center">주소</th>
								<td class="text-left" colspan="3" id="vaddress"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Page header-->
	<header>
		<div class="carousel slide" id="carouselExampleIndicators"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li class="active" data-target="#carouselExampleIndicators"
					data-slide-to="0"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="${root}/asset/img/집8.jpeg"
						alt="..." />
					<div class="carousel-caption d-none d-md-block">
						<h3>HappyHouse</h3>
						<p>당신이 원하는 집을 찾아드립니다.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${root}/asset/img/집2.jpeg"
						alt="..." />
					<div class="carousel-caption d-none d-md-block">
						<h3>HappyHouse</h3>
						<p>주변 상권 분석 완료!</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${root}/asset/img/집5.jpeg"
						alt="..." />
					<div class="carousel-caption d-none d-md-block">
						<h3>HappyHouse</h3>
						<p>지금바로 회원가입하세요</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${root}/asset/img/집6.jpeg"
						alt="..." />
					<div class="carousel-caption d-none d-md-block">
						<h3>HappyHouse</h3>
						<p>당신이 원하는 집을 찾아드립니다.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${root}/asset/img/집3.jpeg"
						alt="..." />
					<div class="carousel-caption d-none d-md-block">
						<h3>HappyHouse</h3>
						<p>당신이 원하는 집을 찾아드립니다.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span><span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<h1 class="mb-4">Welcome to HappyHouse</h1>
			<!-- Marketing Icons Section-->
			<div class="row">
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="card h-100">
						<h4 class="card-header text-center">실거래가 검색</h4>
						<div class="card-body 	text-center">
							<p class="card-text">
								위치, 아파트 이름, 면적, 가격 등 정렬 검색<br> 주택, 아파트의 실거래가 검색 <br>

								구글맵을 활용한 위치 기반 서비스 <br> 사진, 가격, 면적등 정보 제공<br> 주변 상권
								정보까지 확인 가능
							</p>
						</div>
						<div class="card-footer">
							<a class="btn btn-outline-info"
								href="${root}/apt/list?pg=1&key=&word=">바로가기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="card h-100">
						<h4 class="card-header text-center">환경정보 검색</h4>
						<div class="card-body">
							<p class="card-text text-center">
								시, 군, 구 별 위치 기반 환경 정보 제공 <br> 회사명, 타입별 환경 정보 제공<br> 대기
								배출 업소<br> 폐수 배출 업소<br>


							</p>
						</div>
						<div class="card-footer">
							<a class="btn btn-outline-info" href="${root}/env/go">바로가기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card h-100">
						<h4 class="card-header text-center">코로나 선별진료소 검색</h4>
						<div class="card-body">
							<p class="card-text text-center">
								시, 군, 구 별 코로나 선별 진료소 정보 제공<br> 진료소 이름, 주소, 평일 진료시간<br>
								토요일 진료시간, 일요일 진료시간<br> 전화번호 정보 제공
							</p>
						</div>
						<div class="card-footer">
							<a class="btn btn-outline-info" href="${root}/corona/go">바로가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr class="my-0" />
	<!-- Portfolio Section-->
	<section class="py-5 bg-light">
		<div class="container">
			<h2 class="mb-4">오늘의 뉴스</h2>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a
							href="https://www.mk.co.kr/news/realestate/view/2021/05/495817/"><img
							class="card-img-top" src="${root}/asset/img/동탄.png" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="https://www.mk.co.kr/news/realestate/view/2021/05/495817/">이번주
									동탄에 또 '반값' 아파트 나온다</a>
							</h4>
							<p class="card-text">분양시장이 동탄에 다시 등장하는 '반값 아파트'로 열기를 이어갈 것으로
								전망된다. 23일 부동산 전문 리서치업체 리얼투데이에 따르면 이번주에는 전국 8곳에서 총
								2981가구(오피스텔·주상복합·공공분양 포함)가 공급될 예정이다. 견본주택은 10곳에서 오픈될 예정이고, 당첨자
								발표와 계약은 각각 15곳, 13곳에서 진행된다.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a
							href="https://www.edaily.co.kr/news/read?newsId=02712566629051216&mediaCodeNo=257&OutLnkChk=Y"><img
							class="card-img-top" src="${root}/asset/img/전세가율.png" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="https://www.edaily.co.kr/news/read?newsId=02712566629051216&mediaCodeNo=257&OutLnkChk=Y">전세가율
									80% 육박에...“지방 아파트 사자”</a>
							</h4>
							<p class="card-text">[이데일리 신수정 기자]지방 아파트 전세가율이 80%를 육박하거나
								넘어서면서 아파트 매수 수요가 몰리고 있다. 매매와 전세의 가격 차이가 크지 않아 내 집 마련으로 눈을 돌리는
								수요가 늘고 있는 데다 대부분 비규제지역에 해당돼 대출, 청약 등 규제 부담이 비교적 적기 때문으로 풀이된다.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a
							href="http://news.kmib.co.kr/article/view.asp?arcid=0015871815&code=61141511&cp=nv"><img
							class="card-img-top" src="${root}/asset/img/전세난민.png" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="http://news.kmib.co.kr/article/view.asp?arcid=0015871815&code=61141511&cp=nv">‘IN
									서울’인 줄 알았는데…서울 한복판 전세난민 속출 [이슈&탐사]</a>
							</h4>
							<p class="card-text">김모(38)씨는 2019년 전세금을 올려 달라는 집주인 요구에 서울
								은평구 빌라로 이사했다. 11년째 살던 서울 용산구 후암동 빌라촌을 떠나 또 빌라로 들어갔다. 직장과 가까운
								용산구를 떠나려니 부담스러웠지만 선택의 여지는 없었다. 후암동 빌라 전세 가격이 3억원대로 급등한 탓이었다.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a href="https://www.news1.kr/articles/?4313836"><img
							class="card-img-top" src="${root}/asset/img/제주도아파트.png" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="https://www.news1.kr/articles/?4313836">제주 아파트,
									매매·전세 '역대급' 상승세…무슨 일 있길래 </a>
							</h4>
							<p class="card-text">최근 제주 아파트 매매가격과 전셋값 모두 강세다. 매매시장은 외지인
								매수가 늘어나는 등 비규제 풍선효과에 고분양가 아파트의 주변 집값 자극 등이 복합적으로 더해진 결과다. 전세는
								코로나19 여파로 해외여행이 사실상 중단되면서 한동안 잠잠했던 '제주 한달살기'가 다시 주목을 받으면서 전셋값 상승
								배경으로 작용한다는 분석이 나온다.</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a
							href="https://biz.chosun.com/stock/finance/2021/05/21/KWADUS4GVFB3XGJVOG2GMNWEBM/?utm_source=naver&utm_medium=original&utm_campaign=biz"><img
							class="card-img-top" src="${root}/asset/img/전세사기.png" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="https://biz.chosun.com/stock/finance/2021/05/21/KWADUS4GVFB3XGJVOG2GMNWEBM/?utm_source=naver&utm_medium=original&utm_campaign=biz">전세
									사기 급증하자 ‘대출 제한’ 눈치 보는 금융권</a>
							</h4>
							<p class="card-text">최근 전세 사기가 급증하면서 보험사들의 고민이 커졌다. 보험사들은 보험금
								누수를 방지하기 위해 인수 심사(언더라이팅)를 강화해야 하지만, 인수 심사가 강화되면 해당 보험사와 협약을 맺은
								은행이 취급하는 일부 전세자금대출 상품이 제한되면서 소비자의 반발을 살 수 있기 때문이다.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a
							href="https://www.yna.co.kr/view/AKR20210517167100003?input=1195m"><img
							class="card-img-top" src="${root}/asset/img/인천.png" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="https://www.yna.co.kr/view/AKR20210517167100003?input=1195m">경기·인천
									아파트값 급등엔 외지인·30대 이하 매수 있다</a>
							</h4>
							<p class="card-text">경기·인천에서는 30대 이하 젊은 층의 아파트 매수 비중도 다른 지역보다
								높게 나타났다. 올해 1분기 전국 평균이 31.4%인 가운데 광명(52.3%)과 안양 동안구(50.9%)는 절반을
								넘었다. 이 지역에서 거래된 아파트 2채 중 1채는 30대 이하가 샀다는 의미이다.광명은 시·군·구별로 봤을 때
								전국에서 가장 높았다.</p>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>
	<hr class="my-0" />
	<!-- Features Section-->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<h2 class="mb-4">WebPage 소개</h2>
					<p>
						<strong>[집:중:해] 집속에서 해를 구한다</strong>
					</p>
					<ul>
						<li><strong>팀원</strong></li>
						<li>오도경 [FrontEnd]</li>
						<li>이승희 [BackEnd]</li>

					</ul>
					<br>
					<p>집의 가치가 점점 커지는 시대.. 한 평생 살 우리집 집 대충 구하시겠습니까?</p>
					<p>집은 우리의 안식처 그 이상..투자, 자산, 가치입니다.</p>
					<p>복잡하고 너무 많은 기능으로 사용하기 힘들었던 웹페이지.. 멈춰..!</p>
					<p>첫 방문자도 쉽게 사용할 수 있는 사이트 집중해입니다.</p>
					<p>지금 바로 체험해보세요</p>

				</div>
				<div class="col-lg-6">
					<img class="img-fluid rounded"
						src="${root}/asset/img/도경승희.jpg" alt="..." />
				</div>
				
			</div>
		</div>
	</section>
	<hr class="my-0" />
	<!-- Call to Action-->
	<aside class="py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<p>웹페이지에 오류를 찾거나 불편한 점이 있다면 언제든지 연락주세요. 사용자 입장에서 먼저 생각하는 웹페이지 집중해입니다. 감사합니다.</p>
				</div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-secondary btn-block" href="#!">Call to
						Action</a>
				</div>
			</div>
		</div>
	</aside>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 오도경 이승희</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


</body>
</html>
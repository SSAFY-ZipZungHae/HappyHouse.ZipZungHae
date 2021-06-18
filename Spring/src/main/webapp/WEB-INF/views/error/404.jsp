<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<meta charset="UTF-8">
<title>404</title>
<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

 <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
</head>
<body>
  
        <!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    404
                    <small>Page Not Found</small>
                </h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active">404</li>
                </ol>
                <div class="jumbotron">
                    <h2 class="display-2">죄송합니다</h2>
                    <p>페이지를 찾을 수 없습니다. 아래 원하는 페이지 위치를 눌러 이동하세요</p>
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="${root}/user/login">Login Page</a></li>
                        <li><a href="${root}/user/join">Join Page</a></li>
                        <li><a href="${root}/user/userlist">User List</a></li>
                        <li>
                            Portfolio
                            <ul>
                                <li><a href="portfolio-1-col.html">1 Column Portfolio</a></li>
                                <li><a href="portfolio-2-col.html">2 Column Portfolio</a></li>
                                <li><a href="portfolio-3-col.html">3 Column Portfolio</a></li>
                                <li><a href="portfolio-4-col.html">4 Column Portfolio</a></li>
                            </ul>
                        </li>
                        <li>
                            Blog
                            <ul>
                                <li><a href="blog-home-1.html">Blog Home 1</a></li>
                                <li><a href="blog-home-2.html">Blog Home 2</a></li>
                                <li><a href="blog-post.html">Blog Post</a></li>
                            </ul>
                        </li>
                        <li>
                            Other Pages
                            <ul>
                                <li><a href="full-width-page.html">Full Width Page</a></li>
                                <li><a href="sidebar.html">Sidebar Page</a></li>
                                <li><a href="faq.html">FAQ</a></li>
                                <li><a href="404.html">404 Page</a></li>
                                <li><a href="pricing-table.html">Pricing Table</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>
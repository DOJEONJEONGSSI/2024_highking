<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Playfair+Display:wght@700;900&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    
    <style>
        /* 내비게이션 바의 로그인 링크 크기 조정 */
        .nav-item.nav-link {
            font-size: 0.9rem; /* 기본 크기에서 줄이기 */
            padding: 0.5rem 1rem; /* 패딩 조정 */
        }
    </style>
</head>
<body>
    <!-- Navbar Start -->
    <div class="container-fluid bg-white sticky-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-2 py-lg-0">
                <a href="index.html" class="navbar-brand">
                   <img class="img-fluid" src="${pageContext.request.contextPath}/img/icon.jpg" alt="Logo" style="max-width: 100px; height: auto;">
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">HOME</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MAP</a>
                            <div class="dropdown-menu bg-light rounded-0 m-0">
                                <a href="${pageContext.request.contextPath}/hiking" class="dropdown-item">100대 명산</a>
                                <a href="${pageContext.request.contextPath}/weather" class="dropdown-item">날씨</a>
                                <a href="${pageContext.request.contextPath}/board" class="dropdown-item">고객센터</a>
                                <a href="${pageContext.request.contextPath}/test" class="dropdown-item">테스트</a>
                            </div>
                        </div>
                        <c:if test="${sessionScope.login == null}">
                            <a href="${pageContext.request.contextPath}/login" class="nav-item nav-link">로그인</a>
                        </c:if>
                        <c:if test="${sessionScope.login != null}">
                            <a href="${pageContext.request.contextPath}/board" class="nav-item nav-link">회원게시판</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">${sessionScope.login.memId} 님</a>
                                <div class="dropdown-menu bg-light rounded-0 m-0">
                                    <a href="${pageContext.request.contextPath}/mypage" class="dropdown-item">마이페이지</a>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/logoutDo" class="nav-item nav-link">로그아웃</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->

    <!-- JavaScript Files -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</body>

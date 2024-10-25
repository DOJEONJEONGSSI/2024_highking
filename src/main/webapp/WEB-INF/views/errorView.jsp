<%--
/**
 * <pre>
 * 1. 프로젝트명 : 스프링 웹 프로젝트
 * 2. 작성일 : 2024. 3. 5. 오후 12:11:14
 * 3. 작성자 : LeeApGil
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 화면정의서의 화면명
 * 6. 설명 : 화면명과 동일하거나 기타 특이사항 기술
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="utf-8">
    <title>404 오류</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
</head>
<body>
    <!-- top -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    
    <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="assets/img/avataaars.svg" alt="..." />
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">에러 페이지</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">의도치 않은 에러가 발생했습니다...</p>
            </div>
        </header>

    <!-- 404 시작 -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container text-center">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <i class="bi bi-exclamation-triangle display-1 text-primary"></i>
                    <h1 class="display-1">404</h1>
                    <h1 class="mb-4">페이지를 찾을 수 없습니다</h1>
                    <p class="mb-4">죄송합니다. 요청하신 페이지가 존재하지 않습니다! 홈 페이지로 돌아가시거나 검색을 사용해 보세요.</p>
                    <a class="btn btn-primary rounded-pill py-3 px-5" href="index.html">홈으로 돌아가기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 404 끝 -->

    <!-- footer -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
</head>
<body>
	<!-- top -->
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    <!-- Carousel Start -->
    <div class="container-fluid px-0 mb-5">
	 <!-- main -->
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="${pageContext.request.contextPath}/img/home2.jpg" alt="Image" style="max-height: 1100px; width: auto;">
                    <div class="carousel-caption" style="background: rgba(0, 0, 0, 0.5);"> <!-- 약간의 투명 배경 추가 -->
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7 text-center">
                                    <p class="fs-4 text-white animated zoomIn">Welcome to <strong
                                            class="text-light">Highking</strong></p> <!-- 텍스트 색상을 흰색으로 변경 -->
                                    <h1 class="display-1 text-light mb-4 animated zoomIn"> &nbsp;&nbsp; &nbsp;&nbsp;
                                        &nbsp;Happy ~ing &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;Good health</h1>
                                    <!-- 텍스트 색상을 흰색으로 변경 -->
                                    <a href="" class="btn btn-light rounded-pill py-3 px-5 animated zoomIn">Explore
                                        More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/img/home3.jpg" alt="Image" style="max-height: 1100px; width: auto;">
                    <div class="carousel-caption" style="background: rgba(0, 0, 0, 0.5);"> <!-- 약간의 투명 배경 추가 -->
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7 text-center">
                                    <p class="fs-4 text-white animated zoomIn">Welcome to <strong
                                            class="text-light">Highking</strong></p> <!-- 텍스트 색상을 흰색으로 변경 -->
                                    <h1 class="display-1 text-light mb-4 animated zoomIn"> &nbsp;&nbsp; &nbsp;&nbsp;
                                        &nbsp;Happy ~ing &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;Good health</h1>
                                    <!-- 텍스트 색상을 흰색으로 변경 -->
                                    <a href="" class="btn btn-light rounded-pill py-3 px-5 animated zoomIn">Explore
                                        More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Carousel End -->
        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-end">
                                <img class="img-fluid bg-white w-100 mb-3 wow fadeIn" data-wow-delay="0.1s"
                                    src="img\Fall.jpg" alt="">
                                <img class="img-fluid bg-white w-50 wow fadeIn" data-wow-delay="0.2s"
                                    src="${pageContext.request.contextPath}/img/Summer.jpg" alt="">
                            </div>
                            <div class="col-6">
                                <img class="img-fluid bg-white w-50 mb-3 wow fadeIn" data-wow-delay="0.3s"
                                    src="${pageContext.request.contextPath}/img/winter.jpg" alt="">
                                <img class="img-fluid bg-white w-100 wow fadeIn" data-wow-delay="0.4s"
                                    src="${pageContext.request.contextPath}/img/Spring.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                        <div class="section-title">
                            <p class="fs-5 fw-medium fst-italic text-primary">회원게시판</p>
                            <h1 class="display-6" style="font-size: 1.5rem;">여러분의 멋진 사진을 공유해보세요!</h1>
                        </div>
                        <div class="row g-3 mb-4">
                            <div class="col-sm-4">
                                <img class="img-fluid bg-white w-100" src="img\me.jpg" alt="">
                            </div>
                            <div class="col-sm-8">
                                <h5>오늘은 천태산에 다녀왔어요!!ㅎㅎ</h5>
                                <p class="mb-0">오늘 날씨...공기....습도.... 다 너무 좋고 사진도 잘 나오고 완전 럭키비키쟈나~☆ ....more</p>
                            </div>
                        </div>
                        <div class="border-top mb-4"></div>
                        <div class="row g-3">
                            <div class="col-sm-8">
                                <h5>광덕산에 왔쟈냥~~♡</h5>
                                <p class="mb-0">광덕산에 등산 하러 왔는데 치즈냥이들도 등산하러 왔네요.....ㅠ 근데 혼자가 아니쟈냥....
                                    솔로 분들은 오지마세요....ㅋㅋㅋㅋㅋㅋ more
                                </p>
                            </div>
                            <div class="col-sm-4">
                                <img class="img-fluid bg-white w-100" src="${pageContext.request.contextPath}/img/cat.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->
        <!-- Article Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-5 wow fadeIn" data-wow-delay="0.1s">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/img/bom.jpg" alt="">
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                        <div class="section-title">
                            <p class="fs-5 fw-medium fst-italic text-primary">Featured Acticle</p>
                            <h1 class="display-6">등산만 하기 아쉽잖아요! &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                &nbsp;&nbsp; &nbsp;&nbsp; 근처 여행도 가볼까요?</h1>
                        </div>
                        <p class="mb-4">최강록) : 오늘 저는 대전 보문산에 다녀왔어요ㅎㅎ 여기 봄에 오면 완전 나야 벚꽃!! 합니다ㅋㅋㅋㅋ 대전으로 등산하러 오셨으면 한번
                            들려보세요;)</p>
                        <p class="mb-4"> -re 안성재) : 강록님 여기 앞에 보리밥이랑 전 맛집 있어요 들러보세요!! 보리밥은 비빔비빔비빔~~ㅎ 전도 물론 이븐하게 구워졌습니다ㅎㅎ
                        </p>
                        <a href="<c:url value="/login" />" class="btn btn-primary rounded-pill py-3 px-5">로그인 하러 가기</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Article End -->
     <!-- main -->
		<!-- footer -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    </div>
</body>

</html>
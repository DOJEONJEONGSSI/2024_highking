<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>회원게시판</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- CSS 링크 추가 -->
    <link href="img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .store-item img {
            width: 100%; /* 너비를 100%로 설정 */
            height: 200px; /* 고정 높이 설정 */
            object-fit: cover; /* 비율 유지하면서 크기 조정, 손상되지 않음 */
        }
    </style>
</head>

<body>
    <!-- 상단 포함 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 메인 콘텐츠 시작 -->
    <div class="container-fluid px-0 mb-5">
        <section class="page-section" style="margin-top: 200px">
            <div class="container">
                <!-- 게시판 제목 -->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-3" style="padding-bottom: 10vh;">회원게시판</h2>
                <div class="row g-4">
                    <c:forEach items="${boardList}" var="board">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="store-item position-relative text-center">
                                <c:if test="${not empty board.boardimage}">
                                    <img src="${pageContext.request.contextPath}${board.boardimage}" alt="게시글 이미지">
                                </c:if>
                                <div class="p-4">
                                    <h4 class="mb-3">${board.boardTitle}</h4>
                                    <p>작성자: ${board.memId}</p>
                                    <p>수정일: ${board.updateDt}</p>
                                    <!-- 로그인한 사용자만 구경가기 버튼 보이기 -->
                                    <c:if test="${not empty sessionScope.login}">
                                        <a href="<c:url value='/getBoard?boardNo=${board.boardNo}' />" class="btn btn-primary rounded-pill py-2 px-4 m-2">구경가기 <i class="fa fa-arrow-right ms-2"></i></a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-12 text-center wow fadeInUp mt-5" data-wow-delay="0.1s" style="padding-bottom: 10vh;">
                    <a href="<c:url value='/boardWriteView' />" class="btn btn-primary rounded-pill py-3 px-5" style="width: 200px;">글쓰기</a>
                </div>
            </div>
        </section>
    </div>

    <!-- 하단 포함 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>

</html>

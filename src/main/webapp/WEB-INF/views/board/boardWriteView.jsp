<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>고객센터</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- 필요한 CSS 추가 -->
</head>

<body>
    <!-- 상단 포함 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 메인 콘텐츠 시작 -->
    <div class="container-fluid px-0 mb-5">
        <section class="page-section" style="margin-top: 100px;">
            <div class="container">
                <!-- 게시글 작성 제목 -->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글 작성</h2>
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>

                <!-- 게시글 작성 폼 -->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form action="/boardWriteDo" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="boardTitle">제목</label>
                                <input type="text" class="form-control" name="boardTitle" id="boardTitle" required>
                            </div>
                            <div class="mb-3">
                                <label for="boardContent">내용</label>
                                <textarea class="form-control" style="height: 20rem;" name="boardContent" id="boardContent" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="boardImage">사진 첨부</label>
                                <input type="file" class="form-control" name="fileImage" id="fileImage" accept="image/*">
                            </div>
                            <input type="hidden" name="memId" value="${sessionScope.login.memId}">
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">등록</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- 하단 포함 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

    <!-- 필요한 JS 추가 -->
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>

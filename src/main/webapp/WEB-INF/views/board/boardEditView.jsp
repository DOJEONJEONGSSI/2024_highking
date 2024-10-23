<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>게시판 편집 뷰</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
</head>
<body>
    <!-- 상단 포함 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 메인 콘텐츠 시작 -->
    <div class="container-fluid px-0 mb-5">
        <section class="page-section" style="margin-top:100px" id="contact">
            <div class="container">
                <!-- 섹션 헤딩 -->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글 수정</h2>
                <!-- 아이콘 구분선 -->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- 수정 폼 -->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form action="<c:url value='/boardEditDo' />" method="post">
                            <div class="mb-3">
                                <label>제목</label>
                                <input type="text" class="form-control" name="boardTitle" value="${board.boardTitle }">
                            </div>
                            <div class="mb-3">
                                <label>내용</label>
                                <textarea class="form-control" style="height:20rem" name="boardContent">${board.boardContent }</textarea>
                            </div>
                            <input type="hidden" name="memId" value="${sessionScope.login.memId}">
                            <input type="hidden" name="boardNo" value="${board.boardNo }">
                            <button class="btn btn-warning btn-xl" id="submitButton" type="submit">수정</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- 하단 포함 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>

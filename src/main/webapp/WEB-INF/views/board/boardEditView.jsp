<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>게시글 수정</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Bootstrap CSS 추가 -->
    <style>
        #myImage {
            max-width: 100%; /* 이미지의 최대 너비를 부모 요소의 100%로 설정 */
            height: auto; /* 비율 유지 */
            margin-bottom: 20px; /* 이미지 아래 여백 추가 */
        }
        .form-section {
            margin-bottom: 30px; /* 폼 아래 여백 추가 */
        }
    </style>
</head>
<body>
    <!-- 상단 포함 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 메인 콘텐츠 시작 -->
    <section class="page-section" style="margin-top: 100px" id="contact">
        <div class="container">
            <!-- 섹션 헤딩 -->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0" style="padding: 5vh;">게시글 수정</h2>
            <!-- 아이콘 구분선 -->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- 수정 폼 -->
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <!-- 이미지 출력 -->
                            <c:choose>
                                <c:when test="${not empty board.boardimage}">
                                    <img src="${pageContext.request.contextPath}${board.boardimage}"
                                         id="myImage" class="img-thumbnail shadow-sm" alt="게시글 이미지">
                                </c:when>
                                <c:otherwise>
                                    <p>이미지가 없습니다.</p>
                                </c:otherwise>
                            </c:choose>
                            <form action="/boardEditDo" method="post" enctype="multipart/form-data">
                                <div class="mb-3 form-section">
                                    <label>제목</label>
                                    <input type="text" class="form-control" name="boardTitle" value="${board.boardTitle}" required>
                                </div>
                                <div class="mb-3 form-section">
                                    <label>내용</label>
                                    <textarea class="form-control" style="height: 20rem" name="boardContent" required>${board.boardContent}</textarea>
                                </div>
                                <div class="mb-3 form-section">
                                    <label>사진 첨부</label>
                                    <input type="file" class="form-control" name="fileImage" id="fileImage" accept="image/*">
                                </div>
                                <input type="hidden" name="memId" value="${sessionScope.login.memId}">
                                <input type="hidden" name="boardNo" value="${board.boardNo}">
                                <button class="btn btn-warning" id="submitButton" type="submit" style="margin-bottom: 15vh;">수정</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 하단 포함 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>
	
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>고객센터</title>
</head>
<body>
    <!-- 상단 포함 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 메인 콘텐츠 시작 -->
    <div class="container-fluid px-0 mb-5">
        <section class="page-section" style="margin-top:100px">
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
                        <form action="/boardWriteDo" method="post">
                            <div class="mb-3">
                                <label>제목</label>
                                <input type="text" class="form-control" name="boardTitle">
                            </div>
                            <div class="mb-3">
                                <label>내용</label>
                                <textarea class="form-control" style="height:20rem" name="boardContent"></textarea>
                            </div>
                            <input type="hidden" name="memId" value="${sessionScope.login.memId}">
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">등록</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- 게시판 목록 섹션 추가 -->
        <section class="page-section">
            <div class="container">
                <!-- 게시판 제목 -->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원 게시판</h2>
                <div class="d-flex justify-content-end"></div>
                <!-- 게시판 목록 테이블 -->
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>번호</td>
                            <td>제목</td>
                            <td>작성자</td>
                            <td>수정일</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${boardList}" var="board">
                            <tr>
                                <td>${board.boardNo}</td>
                                <td>
                                    <a href="<c:url value='/getBoard?boardNo=${board.boardNo}' />"> 
                                       ${board.boardTitle}
                                    </a>
                                </td>
                                <td>${board.memNm}</td>
                                <td>${board.updateDt}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- 글쓰기 버튼 -->
                <a href="<c:url value='/boardWriteView' />">
                    <button type="button" class="btn btn-primary">글쓰기</button>
                </a>
            </div>
        </section>
    </div>

    <!-- 하단 포함 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>

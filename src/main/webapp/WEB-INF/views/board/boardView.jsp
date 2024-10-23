<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>게시판</title>
</head>
<body>
    <!-- 상단 포함 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 메인 콘텐츠 시작 -->
    <div class="container-fluid px-0 mb-5">
        <section class="page-section" style="margin-top:100px">
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

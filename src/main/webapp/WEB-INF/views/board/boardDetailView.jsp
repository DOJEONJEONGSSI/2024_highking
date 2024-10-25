<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>게시판 디테일 뷰</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <style>
        .post-container {
            display: flex;
            margin-bottom: 20px; /* 게시글과 댓글 간격 */
        }
        .post-image {
            flex: 0 0 60%; /* 이미지 영역 비율 */
            margin-right: 20px; /* 이미지와 내용 사이 여백 */
        }
        .post-image img {
        	border: 1px solid #ddd; /* 테두리 추가 */
            width: 100%; /* 이미지 크기 조정 */
            height: auto; /* 비율 유지 */
            max-height: 600px; /* 최대 높이 설정 */
            object-fit: cover; /* 비율 유지하며 크기 조정 */
        }
        .post-content {
            flex: 3; /* 내용 영역 비율 */
        }
        .border {
            border: 1px solid #ddd; /* 테두리 추가 */
            border-radius: 7px; /* 테두리 둥글게 */
            background-color: #f9f9f9; /* 배경색 추가 */
            min-height: 400px; /* 최소 높이 설정 */
            margin-top: 30px; /* 이미지와 내용 사이 여백 */
        }
        .reply-container {
            margin-top: 20px; /* 댓글 입력란과 내용 사이 여백 */
            display: flex; /* 댓글 입력란과 버튼을 수평 배치 */
        }
        .reply-input {
            flex: 1; /* 댓글 입력란이 가능한 공간을 차지하도록 */
            margin-right: 10px; /* 버튼과의 여백 */
        }
    </style>
</head>
<body>
    <!-- 상단 포함 -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 게시글 섹션 시작 -->
    <div class="container-fluid px-0 mb-5">
        <section class="page-section" style="margin-top: 100px" id="contact">
            <div class="container">
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0" style="padding-bottom: 5vh;">게시글</h2>
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"></div>
                    <div class="divider-custom-line"></div>
                </div>

                <!-- 게시글 내용 -->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <div class="post-container">
                            <div class="post-image">
                                <div class="author-id">ID : ${board.memId}</div> <!-- 작성자 아이디 추가 -->
                                <c:if test="${not empty board.boardimage}">
                                    <img src="${pageContext.request.contextPath}${board.boardimage}" alt="게시글 이미지">
                                </c:if>
                            </div>
                            <div class="post-content">
                                <div class="border">
                                    <p>${board.boardContent}</p>
                                </div>
                                <c:if test="${sessionScope.login.memId == board.memId}">
                                    <form action="<c:url value='/boardEditView' />" method="post" style="display: inline-block;">
                                        <input type="hidden" name="boardNo" value="${board.boardNo}">
                                        <button class="btn btn-warning btn-xl" type="submit">수정</button>
                                    </form>
                                    <form action="<c:url value='/boardDelete' />" method="post" style="display: inline-block;">
                                        <input type="hidden" name="boardNo" value="${board.boardNo}">
                                        <button class="btn btn-danger btn-xl" type="submit">삭제</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>

                        <div class="divider-custom divider-light">
                            <div class="divider-custom-line"></div>
                            <div class="divider-custom-icon"></div>
                            <div class="divider-custom-line"></div>
                        </div>

                        <!-- 댓글 입력란 -->
                        <div class="reply-container">
                            <input type="text" id="replyInput" class="form-control reply-input" placeholder="댓글을 입력하세요.">
                            <button type="button" onclick="fn_write()" class="btn btn-info">등록</button>
                        </div>

                        <!-- 댓글 출력 -->
                        <div class="row justify-content-center pt-1">
                            <div class="col-lg-12">
                                <table class="table">
                                    <tbody id="replyBody">
                                        <c:forEach items="${replyList}" var="reply">
                                            <tr id="${reply.replyNo}">
                                                <td>${reply.replyContent}</td>
                                                <td>${reply.memId}</td>
                                                <td>${reply.replyDate}</td>
                                                <c:if test="${sessionScope.login.memId == reply.memId}">
                                                    <td><a onclick="fn_del('${reply.replyNo}')">X</a></td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- 하단 포함 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

    <script type="text/javascript">
        // 댓글 작성 및 삭제 관련 스크립트
        function fn_write() {
            let memId = '${sessionScope.login.memId}';
            let boardNo = '${board.boardNo}';
            let msg = $("#replyInput").val();
            if (memId == '') {
                alert("댓글은 로그인 해야함!!!");
                return;
            }
            if (msg == '') {
                alert("내용을 작성해주세요!!!");
                return;
            }
            let sendData = JSON.stringify({
                "memId": memId,
                "boardNo": boardNo,
                "replyContent": msg
            });
            $.ajax({
                url: '<c:url value="/writeReplyDo" />',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: sendData,
                success: function (res) {
                    let str = "<tr id='" + res.replyNo + "'>";
                    str += "<td>" + res.replyContent + "</td>";
                    str += "<td>" + res.memId + "</td>";
                    str += "<td>" + res.replyDate + "</td>";
                    str += "<td><a onclick='fn_del(\"" + res.replyNo + "\")'>X</a></td>";
                    str += "</tr>";
                    $("#replyBody").append(str);
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }

        function fn_del(p_replyNo) {
            if (confirm("정말로 삭제 하시겠습니까?!")) {
                $.ajax({
                    url: '<c:url value="/delReplyDo" />',
                    type: 'POST',
                    data: JSON.stringify({ "replyNo": p_replyNo }),
                    contentType: 'application/json',
                    dataType: "text",
                    success: function (res) {
                        if (res == 'success') {
                            $("#" + p_replyNo).remove();
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }
        }
    </script>
</body>
</html>

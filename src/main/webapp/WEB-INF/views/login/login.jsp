<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>로그인 및 회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="img/favicon.ico" rel="icon">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet"> <!-- 추가된 CSS 파일 -->
</head>

<body id="main-body">
    <!-- top -->
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <div id="container" class="right-panel-active" style="margin-bottom: 200px;"> <!-- 푸터와 간격 조정 -->
        <!-- Sign Up -->
        <div class="container__form container--signup">
            <form action="/registDo" method="post" class="form" id="form1">
                <h2 id="form-title" class="form__title">회원가입</h2>
                <input type="text" name="memId" placeholder="User" class="input" />
                <input type="email" name="memEmail" placeholder="Email" class="input" />
                <input type="password" name="memPw" placeholder="Password" class="input" />
                
                <button type="submit" class="btn">가입하기</button>
            </form>
        </div>

        <!-- Sign In -->
        <div class="container__form container--signin">
            <form action="/loginDo" method="post" class="form" id="form2">
                <h2 id="form-title" class="form__title">로그인</h2>
                <input type="text" name="memId" placeholder="id" class="input" />
                <input type="password" name="memPw" placeholder="Password" class="input" />
                <div class="form-floating mb-3">
                    <input ${ cookie.rememberId.value ==null ? "" : "checked" } type="checkbox" class="form-check-input" name="remember"> 아이디 기억하기
                </div>
                <a href="#" class="link">비밀번호를 잊어버리셨나요?</a>
                <button type="submit" class="btn">확인</button>
            </form>
        </div>

        <!-- Overlay -->
        <div class="container__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <button class="btn" id="signIn">로그인</button>
                </div>
                <div class="overlay__panel overlay--right">
                    <button class="btn" id="signUp">회원가입</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        const signInBtn = document.getElementById("signIn");
        const signUpBtn = document.getElementById("signUp");
        const firstForm = document.getElementById("form1");
        const secondForm = document.getElementById("form2");
        const container = document.getElementById("container");

        // Sign In 버튼 클릭 시 패널 전환
        signInBtn.addEventListener("click", () => {
            container.classList.remove("right-panel-active");
        });

        // Sign Up 버튼 클릭 시 패널 전환
        signUpBtn.addEventListener("click", () => {
            container.classList.add("right-panel-active");
        });
    </script>

    <!-- footer -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>

</html>

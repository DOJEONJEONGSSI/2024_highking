<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    <div class="container-fluid px-0 mb-5">
        <section class="page-section" id="contact" style="margin-top: 150px">
            <div class="container">
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0" style="padding-bottom: 3vh;">mypage</h2>
                <div class="divider-custom text-center">
                    <c:if test="${sessionScope.login.profileImg == null}">
                        <img src="${pageContext.request.contextPath}/assets/img/non.png" id="myImage" class="rounded-circle img-thumbnail shadow-sm" width="200" style="cursor: pointer;">
                    </c:if>
                    <c:if test="${sessionScope.login.profileImg != null}">
                        <img src="${pageContext.request.contextPath}${sessionScope.login.profileImg}" id="myImage" class="rounded-circle img-thumbnail shadow-sm" width="200" style="cursor: pointer;">
                    </c:if>
                    <form id="profileForm" enctype="multipart/form-data">
                        <input type="file" name="uploadImage" id="uploadImage" accept="image/*" style="display: none;">
                    </form>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form method="post" action="<c:url value='/registDo' />">
                            <div class="form-floating mb-3">
                                <input class="form-control" name="memId" type="text" disabled value="${sessionScope.login.memId}" placeholder="아이디를 입력해주세요 ">
                                <label>아이디</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" name="memPw" type="password" placeholder="비밀번호를 입력해주세요 ">
                                <label>비밀번호</label>
                            </div>
                            <button class="btn btn-primary btn-xl" type="submit">저장하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    </div>
	<script>
		$(document).ready(function(){
			$("#myImage").click(function(){
				$("#uploadImage").click();
			});
			//이미지 업로드
			$("#uploadImage").on("change", function(){
				let file = $(this)[0].files[0];
				if(file){
					let fileType= file['type'];
					let valTypes = ['image/gif','image/jpeg','image/jpg','image/png'];
					if(!valTypes.includes(fileType)){
						alert("유효한 이미지 타입이 아닙니다.!!");
						$(this).val(''); //선택파일 초기화
					}else{
						// FormData HTML 폼 데이터를 쉽게 가져오도록 하는 
						// submit이 아닌 비동기로 폼데이터를 전송하기 위해 
						let formData = new FormData($("#profileForm")[0]);
						$.ajax({
							 url : '<c:url value="/files/upload" />'
							,type:'POST'
							,data:formData
							,dataType:'json'
							,processData:false //formData객체를 URL인코딩하지 않도록
							,contentType:false //디폴트 전송인 application/x-www-form-urlencoded 로 전송하지 않도록
							                   // 파일은 multipart/form-data 이진 데이터 형태로 전송
							,success:function(res){
								console.log(res);
								if(res.message == 'success'){
									$("#myImage").attr("src", "${pageContext.request.contextPath}" + res.imagePath);
								}
							},error:function(e){
								console.log(e)
							}
						});
					}
				}
				
			});
			
		});
	</script>
</body>
</html>

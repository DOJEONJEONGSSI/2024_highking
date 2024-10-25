<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc51724d1a8a9addcd58a164ec012348"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/PapaParse/5.3.0/papaparse.min.js"></script>
<style>
body {
	margin: 0;
	display: flex;
	flex-direction: column;
	height: 100vh;
}

#container {
	display: flex;
	flex: 1;
}

#map {
	width: 60%;
	height: 800px;
}

#sidebar {
	background: white;
	width: 40%;
	padding: 20px;
	box-sizing: border-box;
}

.menu {
	display: flex;
	flex-direction: column;
	height: 100%;
}

.menu ul {
	list-style: none;
	padding: 0;
	display: flex;
	justify-content: space-around;
	margin: 0;
}

.menu li {
	padding: 10px;
	cursor: pointer;
	transition: background 0.3s, color 0.3s;
}

.menu li:hover {
	background: #f0f0f0;
	color: #007bff;
}

.sidebar-image {
	width: 100%;
	height: auto;
	margin-top: 10px;
	max-height: 400px;
	overflow-y: auto;
	border: 1px solid #ddd;
	border-radius: 5px;
	display: none; /* 처음에 이미지를 숨김 */
}

#mountainName {
	margin-top: 10px;
	font-weight: bold;
	text-align: center;
}

.dashboard-header {
	text-align: center;
	margin-bottom: 20px;
}

#infoContent, #reviewSection {
	display: none;
	margin-top: 10px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
}

#reviewInput {
	width: 100%;
	padding: 5px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

#submitReview {
	padding: 5px 10px;
	cursor: pointer;
}

#imagePreview {
	margin-top: 10px;
	max-height: 400px;
	overflow-y: auto;
	display: flex;
}

#imagePreview img {
	max-width: 100px;
	height: auto;
	margin-right: 10px;
	cursor: pointer; /* 클릭 가능하도록 */
}

#reviewsList {
	margin-top: 10px;
	border-top: 1px solid #ddd;
	padding-top: 10px;
	max-height: 200px; /* 최대 높이 설정 */
	overflow-y: auto; /* 스크롤 가능하도록 설정 */
}

.reviewItem {
	margin-bottom: 10px;
	padding: 5px;
	border: 1px solid #ddd;
	border-radius: 5px;
	display: flex; /* 이미지와 텍스트를 가로로 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
}

.reviewText {
	margin-left: 10px; /* 이미지와 리뷰 텍스트 사이의 간격 */
	display: inline-block; /* 텍스트가 오른쪽에 나오도록 설정 */
	flex-grow: 1; /* 공간을 차지하게 설정 */
}

/* 모달 스타일 */
#imageModal {
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000; /* 모달을 최상위로 */
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
}

#imageModal img {
	max-width: 90%;
	max-height: 90%;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<div id="container">
		<div id="sidebar">
			<nav class="menu">
				<div class="dashboard-header">
					<h3 id="mountainName">산을 클릭해주세요</h3> <!-- 텍스트 변경 -->
					<img id="sidebarImage" class="sidebar-image" src="" alt="" />
				</div>

				<ul>
					<li tabindex="0" class="icon-dashboard"><span id="infoButton">소개</span>
					</li>
					<li tabindex="0" class="icon-users"><span id="reviewButton">리뷰</span>
					</li>
				</ul>

				<div id="infoContent"></div>
				<div id="reviewSection">
					<textarea id="reviewInput" rows="4" placeholder="리뷰를 작성하세요..."></textarea>
					<input type="file" id="imageInput" accept="image/*" multiple />
					<div id="imagePreview"></div>
					<button id="submitReview">제출</button>
				</div>
				<div id="reviewsList"></div>
				<!-- 리뷰 목록 추가 -->
			</nav>
		</div>
		<div id="map"></div>
	</div>

	<!-- 모달 창 -->
	<div id="imageModal" style="display: none;">
		<img id="modalImage" src="" />
	</div>

	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<script>
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(35.5734, 126.8736),
            level: 10
        };
        var map = new kakao.maps.Map(container, options);

        let nameImageMap = {};
        let markers = [];

        // CSV 데이터 가져오기
        fetch('resources/csv/image_titles.csv')
            .then(response => response.text())
            .then(data => {
                Papa.parse(data, {
                    delimiter: ';',
                    complete: function(results) {
                        results.data.forEach(row => {
                            const parts = row[0].split('|');
                            if (parts.length === 2) {
                                const imageUrl = parts[0].trim();
                                const name = parts[1].trim();
                                nameImageMap[name] = imageUrl;
                            }
                        });
                    }
                });
            });

        // API 데이터 가져오기
        const apiUrl = 'https://api.odcloud.kr/api/15112801/v1/uddi:72bf80fc-1a93-4193-a6db-8a547d7c3333?page=1&perPage=100&serviceKey=hQr0vlEv%2BIctiiV4HU3SrjvwzDkaTDXS32Jpg4yjp9P7ursEW7Bg5TDNdG5NdrAqU%2BxycsqUvliYYjvN9Yz2VA%3D%3D';

        fetch(apiUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                const locations = data.data;
                initMap(locations);
            })
            .catch(error => {
                console.error('Error:', error);
            });

        function initMap(locations) {
            locations.forEach(location => {
                const markerPosition = new kakao.maps.LatLng(location.X좌표, location.Y좌표);
                const marker = new kakao.maps.Marker({
                    position: markerPosition,
                    map: map,
                    title: location.명산_이름
                });

                kakao.maps.event.addListener(marker, 'click', function() {
                    const sidebarImage = document.getElementById('sidebarImage');
                    const mountainNameElement = document.getElementById('mountainName');
                    const infoElement = document.getElementById('infoContent');
                    const clickedName = location.명산_이름;
                    const clickInfo = location.산_개요;

                    // HTML 엔티티 제거
                    const cleanInfo = clickInfo.replace(/&#91;/g, '').replace(/&#93;/g, ''); // 대괄호 제거

                    if (nameImageMap[clickedName]) {
                        sidebarImage.src = nameImageMap[clickedName];
                        sidebarImage.style.display = 'block'; // 이미지 보이기
                    } else {
                        sidebarImage.src = '';
                        sidebarImage.style.display = 'none'; // 이미지 숨기기
                    }

                    mountainNameElement.textContent = clickedName;
                    infoElement.textContent = cleanInfo; // 정리된 정보 표시
                    infoElement.style.display = 'block'; // 정보 내용을 보이기
                    document.getElementById('reviewSection').style.display = 'none'; // 리뷰 내용 숨기기
                });

                markers.push(marker);
            });

            if (locations.length > 0) {
                map.setCenter(new kakao.maps.LatLng(locations[0].X좌표, locations[0].Y좌표));
            }

            // 정보 버튼 클릭 이벤트
            document.getElementById('infoButton').addEventListener('click', function() {
                const infoContent = document.getElementById('infoContent');
                infoContent.style.display = 'block'; // 정보 내용 보이기
                document.getElementById('reviewSection').style.display = 'none'; // 리뷰 내용 숨기기
            });

            // 리뷰 버튼 클릭 이벤트
            document.getElementById('reviewButton').addEventListener('click', function() {
                const reviewSection = document.getElementById('reviewSection');
                reviewSection.style.display = (reviewSection.style.display === 'none') ? 'block' : 'none'; // 리뷰 내용 보이기/숨기기
                document.getElementById('infoContent').style.display = 'none'; // 정보 내용 숨기기
            });

            // 리뷰 제출 이벤트
            document.getElementById('submitReview').addEventListener('click', function() {
                const reviewInput = document.getElementById('reviewInput').value;
                const imageInput = document.getElementById('imageInput');
                const reviewsList = document.getElementById('reviewsList');

                if (reviewInput) {
                    const reviewItem = document.createElement('div');
                    reviewItem.classList.add('reviewItem');

                    // 이미지 미리보기 추가
                    const imagePreview = document.createElement('div');
                    imagePreview.id = 'imagePreview';
                    imagePreview.style.display = 'flex'; // 이미지 미리보기 보이기

                    const files = imageInput.files;
                    if (files.length > 0) {
                        for (let i = 0; i < files.length; i++) {
                            const file = files[i];
                            const reader = new FileReader();
                            reader.onload = function(e) {
                                const img = document.createElement('img');
                                img.src = e.target.result;
                                // 클릭 시 모달 열기
                                img.onclick = function() {
                                    const modal = document.getElementById('imageModal');
                                    const modalImage = document.getElementById('modalImage');
                                    modalImage.src = img.src; // 클릭한 이미지의 src 설정
                                    modal.style.display = 'flex'; // 모달 보이기
                                };
                                imagePreview.appendChild(img);
                            };
                            reader.readAsDataURL(file);
                        }
                    }

                    // 리뷰 텍스트 추가
                    const reviewText = document.createElement('div');
                    reviewText.classList.add('reviewText');
                    reviewText.textContent = reviewInput;

                    reviewItem.appendChild(imagePreview);
                    reviewItem.appendChild(reviewText);
                    reviewsList.appendChild(reviewItem);
                    document.getElementById('reviewInput').value = ''; // 리뷰 입력 초기화
                    imageInput.value = ''; // 파일 입력 초기화
                } else {
                    alert('리뷰를 입력하세요.');
                }
            });
        }

        // 모달 클릭 시 닫기
        const modal = document.getElementById('imageModal');
        modal.onclick = function() {
            this.style.display = 'none'; // 모달 숨기기
        };
    </script>
</body>

</html>

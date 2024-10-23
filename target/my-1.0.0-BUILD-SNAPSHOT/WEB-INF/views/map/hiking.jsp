<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <title>Kakao 지도 시작하기</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc51724d1a8a9addcd58a164ec012348"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/PapaParse/5.3.0/papaparse.min.js"></script>
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
            display: flex; /* 요소를 한 줄로 배치 */
            justify-content: space-around; /* 요소 간 간격 조정 */
            margin: 0; /* 기본 마진 제거 */
        }

        .menu li {
            padding: 10px;
            cursor: pointer;
            transition: background 0.3s, color 0.3s; /* 배경과 글자 색상 변화에 부드러운 전환 효과 추가 */
        }

        .menu li:hover {
            background: #f0f0f0; /* hover 시 배경색 변경 */
            color: #007bff; /* hover 시 글자 색상 변경 */
        }

        .sidebar-image {
            width: 100%;
            height: auto;
            margin-top: 10px;
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
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    <div id="container">
        <div id="sidebar">
            <nav class="menu">
                <div class="dashboard-header">
                    <h3 id="mountainName"></h3>
                    <img id="sidebarImage" class="sidebar-image" src="" alt="Clicked Location" />
                </div>

                <ul>
                    <li tabindex="0" class="icon-dashboard"><span>정보</span></li>
                    <li tabindex="0" class="icon-customers"><span>사진</span></li>
                    <li tabindex="0" class="icon-users"><span>리뷰</span></li>
                </ul>
            </nav>
        </div>
        <div id="map"></div>
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
                    const clickedName = location.명산_이름;

                    if (nameImageMap[clickedName]) {
                        sidebarImage.src = nameImageMap[clickedName];
                    } else {
                        sidebarImage.src = '';
                    }

                    mountainNameElement.textContent = clickedName;
                });

                markers.push(marker);
            });

            if (locations.length > 0) {
                map.setCenter(new kakao.maps.LatLng(locations[0].X좌표, locations[0].Y좌표));
            }
        }
    </script>
</body>

</html>

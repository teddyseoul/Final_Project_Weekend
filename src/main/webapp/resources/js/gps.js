/* GPS */
	function getLocation() {
		if (navigator.geolocation) { // window.navigator 객체 안에 GPS 정보 존재
		    navigator.geolocation.getCurrentPosition(function(position) { // getCurrentPosition 메소드 : 현재 위치 정보 가져오기
		      console.log('현재 위도 :' + position.coords.latitude);
		      console.log('현재 경도 :' + position.coords.longitude);
		      
		      /* $.ajax({
				    url: 'https://apis.kakao.net/local/geo/coord2addr?apikey=bc046e4f4893e653801de407847c4b15&longitude=' + position.coords.longitude + '&latitude=' + position.coords.latitude + '&inputCoordSystem=WGS84&output=json',
				    type: 'GET',
				    cache: false,
				    context: {},
				    crossOrigin: true,
				    success: function(data) {
				        var jsonObj = $.parseJSON(data);
				        var contentText = document.getElementById('content');
				            contentText.innerHTML += "<br>동네 이름 : " + jsonObj.name + " / 전체 주소 : " + jsonObj.fullName + " / 나라 : " + jsonObj.name0;
				    },error:function(request,status,error){
				        alert("다시 시도해주세요.\n" + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				}); */
		      
		    }, function(error) { // 위치값 찾기 에러가 났을 때의 콜백
		      console.error(error);
		    }, { // 옵션
		      enableHighAccuracy: false, // 베터리를 더 소모해서 더 정확한 위치를 찾음
		      maximumAge: 0, // 한번 찾은 위치 정보를 해당 초만큼 캐싱
		      timeout: Infinity // 주어진 초 안에 찾지 못하면 에러 발생
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
		}
	getLocation();
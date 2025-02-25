<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${boardTitle} Update</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div id="container">
      	<div class="conta">
  	      	
      		 <form action="./${board}Update" method="post" enctype="multipart/form-data" id="frm">
				<c:if test="${board eq 'after'}">
					<div>
						<p>${originTitle} 후기</p>
					</div>
      		 	</c:if>
				<div>
					<label for="title">제목<span>*</span></label>
					<input type="text" name="title" value="${dto.title}">
				</div>
				<div>
					<label for="writer">작성자<span>*</span></label>
					<input type="text" name="writer" value="${dto.writer}" readonly="readonly">
				</div>
				<c:if test="${board eq 'festi'}">
					<label for="files">썸네일</label>
						<div id="thumbnailDiv">
							<div>
								<input type="file" class="filelist" id="thumbnail" name="filelist" style="display: inline-block" accept=".jpg, .png, .gif, .jpeg">
								<p> &nbsp; &nbsp; ※  jpg, png, gif, jpeg 확장자만 업로드 가능합니다.</p>
							</div>
							<!-- 이미지 미리보기 -->
							<div id="preview">
								<img id="preview-img" src="#">
							</div>
						</div>
				</c:if>
				<div>
					<label for="contents">내용<span>*</span></label>
					<textarea rows="" cols="" name="contents" id="contents">${dto.contents}</textarea>
				</div>
				<div>
					<label for="files">첨부파일</label>
					<a id="addFiles">파일추가</a>
					<div id="files">
						<div>
							<input type="file" class="filelist" name="filelist" style="display: inline-block">
							<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>
						</div>
					</div>
				</div>
				
				<c:if test="${board eq 'notice' or member.grade eq 3}">
					<div>
						<label for="top">상단에 등록 하기</label>
						<input type="checkbox" id="top" name="top" value="${dto.top}">
					</div>
				</c:if>
				
				<!-- 축제/공연 작성시에만 보이게 -->
				<c:if test="${board eq 'festi'}">
					<div>
						<div>
							<label for="category">대분류<span>*</span></label>
								<input type="radio" name="firstCategory"> 축제							
								<input type="radio" name="firstCategory"> 공연
									<div id="">
										<label for="writer">소분류<span>*</span></label>
										<input type="radio" name="category" value="1"> 전시
										<input type="radio" name="category" value="2"> 행사	
										<input type="radio" name="category" value="3"> 레저
									</div>

									<div>
										<label for="writer">소분류<span>*</span></label>
										<input type="radio" name="category" value="4"> 지방 연극
										<input type="radio" name="category" value="5"> 대학로 연극
										<input type="radio" name="category" value="6"> 콘서트
									</div>
						</div>
						<div>
							<label for="startDate">시작일<span>*</span></label>
							<input type="date" name="startDate" class="date" value="${dto.startDate}">  
						</div>
						<div>
							<label for="endDate">종료일<span>*</span></label>
							<input type="date" name="endDate" class="date" value="${dto.endDate}">
						</div>
						<div>
							<label for="price">가격</label>
							
							<input type="number" name="price" value="${dto.price}"><span>원</span>
						</div>
						<div>
							<label for="total">좌석 </label>
							<input type="number" name="total" value="${dto.total}"><span>개</span>
						</div>
						<div>
							<label for="local">지역<span>*</span></label>
							<input type="text" name="local" id="local" onclick="openMap()" value="${dto.local}">
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none">
							</div>
						</div>
					</div>
				</c:if>
      		 	<c:if test="${board eq 'after'}">
					<div>anum = ${originNum}
	      		 		<input type="hidden" name="anum" value="${originNum}">
					</div>
					<div>
						<label for="point">별점</label>
						<input type="radio" name="point" value="1"> 1점
						<input type="radio" name="point" value="2"> 2점
						<input type="radio" name="point" value="3"> 3점
						<input type="radio" name="point" value="4"> 4점
						<input type="radio" name="point" value="5"> 5점
					</div>
      		 	</c:if>
			
				<input type="button" id="write" value="등록">
			</form> 
			
      	</div>
      </div>
      <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
   </div>
   
<!-- script -->
<script src="../resources/js/summernote.js"></script>
<script type="text/javascript">
	if($('#top').val() == 1){
		$('#top').prop('checked',true);
	}
	
	//상단 배치 체크박스에 값 주기 ( 1: 등록하기 / 0: 등록안함)
	$('#top').click(function(){
		if($(this).is(':checked')){
			$(this).val(1);
		} else {
			$(this).val(0);
		}
	});
	
	/* 첨부 파일 관리 */
	// 개수 제한. 최대 5개까지.
	var limit = 1;
	// 파일 추가
	$('#addFiles').click(function() {
		var addFiles = '<div>'
							+'<input type="file" class="filelist" name="filelist" style="display: inline-block"> '
							+'<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>'
						+'</div>';
		if(limit<5){
			$('#files').append(addFiles);
			limit++
		} else {
			alert("최대 5개까지 첨부가능합니다.");
		}
	});
	
	// 정적인 input 파일 제거
	$('.deleteFile').click(function() {
		$(this).parent().remove();
		limit--
	});
	
	// 동적으로 그려진 input file 제거
	$('#files').on('click','.deleteFile',function(){
		$(this).parent().remove();
		limit--
	});
	/* 첨부 파일 관리 끝 */
	
	// 주소API
// kakao javascript 키 : a0490863a01534a71d43148be8c27866
// kakao rest api 키 :  1fed67e3c9e7106ca669a3f4c7350837
 //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = {
      center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
      level: 5 // 지도의 확대 레벨
  };
  
  //지도를 미리 생성
  var map = new daum.maps.Map(mapContainer, mapOption);
  //주소-좌표 변환 객체를 생성
  var geocoder = new daum.maps.services.Geocoder();
  //마커를 미리 생성
  var marker = new daum.maps.Marker({
      position: new daum.maps.LatLng(37.537187, 127.005476),
      map: map
  });
  
  function openMap() {
      new daum.Postcode({
          oncomplete: function(data) {
              var addr = data.address; // 최종 주소 변수

              // 주소 정보를 해당 필드에 넣는다.
              document.getElementById("local").value = addr;
              // 주소로 상세 정보를 검색
              geocoder.addressSearch(data.address, function(results, status) {
                  // 정상적으로 검색이 완료됐으면
                  if (status === daum.maps.services.Status.OK) {

                      var result = results[0]; //첫번째 결과의 값을 활용

                      // 해당 주소에 대한 좌표를 받아서
                      var coords = new daum.maps.LatLng(result.y, result.x);
                      // 지도를 보여준다.
                      mapContainer.style.display = "block";
                      map.relayout();
                      // 지도 중심을 변경한다.
                      map.setCenter(coords);
                      // 마커를 결과값으로 받은 위치로 옮긴다.
                      marker.setPosition(coords)
                  }
              });
          }
      }).open();
  }
</script>
</body>
</html>
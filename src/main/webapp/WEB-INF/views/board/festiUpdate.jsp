<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${boardTitle} Write</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiWrite.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0490863a01534a71d43148be8c27866&libraries=services"></script>	
<!-- date picker -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- date picker -->
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div id="container">
      	<div class="conta">
  	      	<div class="fwrite_wrap">
  	      		<div class="fwrite_title">
  	      			<img alt="" src="${pageContext.request.contextPath}/resources/images/festi1.png" class="titleimg"><h3>${board}글수정</h3>
  	      		</div>
      		 <form action="./festiUpdate" method="post" enctype="multipart/form-data" id="frm">
      		 	<table class="table table-bordered">
      		 	<tbody>
					<tr>
						<td class="td1"><label for="title">제목<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="title" id="title" style="width: 96%" value="${dto.title }"></td>
					</tr>
					<tr>
						<td class="td1"><label for="writer">작성자<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${member.nickname}" readonly="readonly" id="writer" style="width: 40%"></td>
					</tr>
					<tr>
						<td class="td1"><label for="contents">내용<span class="r">*</span></label></td>
						<td><textarea rows="" cols="" name="contents" id="contents">${dto.contents }</textarea></td>
					</tr>
					<tr>
						<td class="td1"><label for="category">카테고리<span class="r">*</span></label></td>
						<td>
								<input type="radio" name="category" class="category" id="show" value="1">
								<label for="show">공연</label>
								<input type="radio" name="category" class="category" id="festival" value="2">
								<label for="festival">축제</label>						
								<input type="radio" name="category" class="category" id="daehakro" value="3">
								<label for="daehakro">대학로 연극</label>
						</td>
					</tr>
					<tr id="ageDiv">
						<td class="td1"><label for="age">연령제한<span class="r">*</span></label></td>
						<td>
							<input type="radio" name="ageSel" class="age" id="all" value="1"> 
							<label for="all">전연령</label>
							<input type="radio" name="ageSel" class="age" id="teen" value="2">
							<label for="teen">청소년 이상</label>
							<input type="radio" name="ageSel" class="age" id="adult" value="3">
							<label for="adult">성인 이상</label>
							<input type="radio" name="ageSel" class="age" id="etc" value="4">
							<label for="etc">기타</label>
							<input type="text" class="age" id="age" name="age" value="1">
						</td>
					</tr>
					<tr>
						<td class="td1"><label for="startDate">시작일<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/calendar.png">
						<input type="date" name="startDate" class="date" value="${dto.startDate}"></td>
					</tr>
					<tr>
						<td class="td1"><label for="endDate">종료일<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/calendar.png">
						<input type="date" name="endDate" class="date" value="${dto.endDate}"></td>
					</tr>
					<tr>
						<td class="td1"><label for="price">가격</label></td>
						<td><input type="number" name="price" value="${dto.price}"><span>&nbsp; &nbsp;원</span></td>
					</tr>
					<tr class="daehakDiv">
						<td class="td1"><label for="total">좌석 </label></td>
						<td><input type="number" name="total" value="${dto.total}"><span>&nbsp; &nbsp;석</span></td>
					</tr>
					<tr>
						<td class="td1"><label for="local">지역<span class="r">*</span></label></td>
						<td>
							<img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/location.png">
							<input type="text" name="local1" id="local1" onclick="openMap()" style="width: 50%;">
							<input type="text" name="local2" id="local2" placeholder="상세주소를 입력해주세요" readonly="readonly"  style="width: 45%;" >
							<br>
							<img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/location.png">								
							<input type="text" name="local" id="local" readonly="readonly"  style="width: 73%;" value="${dto.local}">
							<input type="checkbox" id="localConfirm" checked="checked">
							<label for="localConfirm" class="localConfirm">이 주소가 맞습니다.</label>
							<input type="hidden" name="region" id="region" value="${dto.region}">
							<div id="map" style="width:100%;height:500px;margin-top:10px;display:none"></div>
						</td>
					</tr>
					<tr>
						<td class="td1"><label for="files">썸네일</label><span class="r">*</span></td>
						<td>
							<div id="thumbnailDiv">
								<div id="thumbnailSelectDiv">
									<input type="file" class="filelist" id="thumbnail" name="filelist" style="display: inline-block" accept=".jpg, .png, .gif, .jpeg">
									<span style="color: red">※  jpg, png, gif, jpeg 확장자만 업로드 가능합니다.</span>
								</div>
								<!-- 이미지 미리보기 -->
							
								<div id="preview">
									<img id="preview-img" src="${pageContext.request.contextPath}/resources/images/board/${dto.fileDTOs[0].fname}">
								</div>
							</div>
						</td>
					</tr>
					<%-- <tr>
						<td class="td1"><label for="files">첨부파일</label></td>
						<td>
							<a id="addFiles"><img alt="" src="${pageContext.request.contextPath}/resources/images/cloud-computing.png">파일추가</a>
							<div id="files">
								<input type="file" class="filelist" name="filelist" style="display: inline-block">
							</div>
						</td>
					</tr> --%>
					
				</tbody>
				</table>
				<input type="hidden" name="num" value="${dto.num}">
				</form> 
				
				<div id="datesOptionDiv"> <!-- 카테고리 3 -->				
				<table class="table table">
					<tr>
						<td><label for="dates">날짜 </label></td>
						<td><label for="time">시작시간</label></td>
						<td><label for="seat">좌석</label></td>
						<td><label for="price">가격</label></td>
						<td><input type="text" name="num" value="${dto.num}" id="num"></td>
					</tr>
					<tr>
						<td><div class="dateDiv">
								<input type="date" name="reg_date" class="dates" id="dates">
							</div>
						</td>
						<td><div class="timeDiv">
								<input type="text" name="time" class="time" id="time">
							</div>
						</td>
						<td><div class="seatDiv">
								<input type="number" name="seat" class="seat" id="seat"><span> 석</span>
							</div>
						</td>
						<td><div class="priceDiv">
								<input type="number" name="price" class="price" id="price"><span> 원</span>
							</div>
						</td>
						<td><a id="writeOption">옵션등록</a></td>
					</tr>
				</table>
					<div id="optionsDiv">
						
					</div>		
				</div>

      		 	<a id="write" class="festiWrite_btn">등록</a>

				
			
  	      	</div>
			
      	</div>
      </div>
      <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
   </div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
<!-- 지도 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 	
<!-- 썸머노트 -->
<script src="../resources/js/summernote.js"></script>
<!-- script -->
<script type="text/javascript">
	
	var category = '${dto.category}';
	$('.category').each(function(){
		if($(this).val() == category){
			$(this).attr('checked','checked');
		}
	});
	
	var age = '${dto.age}';
	$('.age').each(function(){
		if($(this).val() == age){
			$(this).attr('checked','checked');
		}
	});
	
	$('#local1').click(function(){
		$('#local').val('');
		$('#localConfirm').removeAttr('checked');
	}) 
	
	$('.daehakDiv').hide();
	
	if('${dto.category}' == '3'){
		$('#datesOptionDiv').show();
	} else {
		$('#datesOptionDiv').hide();
	}
	
	$('.category').click(function() {
		if($(this).val() != 3){
			$('#datesOptionDiv').hide();
		} else {
			$('#datesOptionDiv').show();
			$('#optionsDiv').empty();
		}
	});
	
	getOptionsList();
	$('#writeOption').click(function(){
		var num = $('#num').val();
		var reg_date = $('#dates').val();
		var time = $('#time').val();
		var seat = $('#seat').val();
		var price = $('#price').val();
		$.ajax({
			url:'./optionWrite',
			type:'POST',
			data:{
				num:num,
				reg_date:reg_date,
				time:time,
				seat:seat,
				price:price
			},
			success:function(data){
				if(data == '1'){
					getOptionsList();
					$('#dates').val('');
					$('#time').val('');
					$('#seat').val('');
					$('#price').val('');
				} else {
					alert('실패');
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	});
	
	function getOptionsList(){
		jQuery.ajaxSettings.traditional = true;
		$.ajaxSettings.traditional = true;
		var num = "${dto.num}";
		$.ajax({
			type:'GET',
			url:'./optionList',
			data:{
				num:num
			},
			success:function(data){
				console.log(data);
				data = data.trim();    	
				$('#optionsDiv').html(data);	
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	
	
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
	
	
	//상단 배치 체크박스에 값 주기 ( 1: 등록하기 / 0: 등록안함)
	$('#top').click(function(){
		if($(this).is(':checked')){
			$(this).val(1);
		} else {
			$(this).val(0);
		}
	});
	
	/* 첨부 파일 관리 끝 */
	
	
	//썸네일
	//$("#preview").hide();
	function readURL(input) {
		 
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	 
	        reader.onload = function (e) {
	            $('#preview-img').attr('src', e.target.result);
	        }
	 
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	 
	$("#thumbnail").change(function(){
		$("#preview").show();
	    readURL(this);
	});
// 썸네일 끝

// date picker

/* date picker 끝 */

// 주소API
// kakao javascript 키 : a0490863a01534a71d43148be8c27866
// kakao rest api 키 :  1fed67e3c9e7106ca669a3f4c7350837
 //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = {
      center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
      level: 7 // 지도의 확대 레벨
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
              document.getElementById("local1").value = addr;
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
                      marker.setPosition(coords);
                  }
              });
          }
      }).open();
  }
  
  $('#local1').blur(function() {
	  $('#local2').val('')
	  $('#local').val('');
	  if($('#local1').val() != ''){
		  $('#local2').removeAttr('readonly');
		  $('#local').val($('#local1').val());
		  $('#region').val($('#local').val().substr(0,2));	  
	  } else {
		  $('#local2').attr('readonly','readonly');
	  }
  });
  
  $('#local2').blur(function() {
	$('#local').val('');
	if($('#local2').val() != ''){
		var local = $('#local1').val()+"  "+$('#local2').val();
		$('#local').val(local);
	}
  });
 
// 주소API 끝-----------------


	/* category */
	$('#daehakDiv').hide();
	$('.category').click(function() {
		if ($(this).val() == '3') {
			$('#daehakDiv').show();
		} else {
			$('#daehakDiv').hide();
		}
	});

	$('.t').change(function() {
		$('#category').val($(this).val());
	});
	
	/* 연령제한 */
	$('#age').hide();
	$('.age').click(function() {
		$('#age').val($(this).val());
		if($('#etc').prop('checked')){
			$('#age').show();
			$('#age').val('');
		} else {
			$('#age').hide();
		}
	});
	
	/* 가격상세 */
	

	$('#write').click(function() {
		var title = $('#title').val() != '';
		var writer = $('#writer').val() != '';
		var contents = $('#contents').val() != '';
		var category = $('#category').val() != '';
		var age = $('#age').val() != '';
		var local = $('#local').val()!== '' && $('#localConfirm').is(':checked');
		if(title && writer && contents && category && age && local){
			$('#frm').submit();
		} else {
			alert('필수(*)를 모두 입력해주세요');
		}
	});
</script>
</body>
</html>
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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiWrite.css">
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
  	      				<h3>${board}글쓰기</h3>
  	      			</div>
      		 <form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
      		 	<table class="table table-bordered">
      		 		<tbody>
					<tr>
						<td class="td1"><label for="title">제목<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png">
							<input type="text" name="title" id="title" style="width: 95.6%"></td>							
					</tr>
      		 		<tr>
						<td class="td1"><label for="writer">작성자<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${member.nickname}" readonly="readonly" id="writer" style="width: 40%"></td>
					</tr>
					<tr>
						<td class="td1"><label for="contents">내용<span class="r">*</span></label></td>
						<td><textarea rows="" cols="" name="contents" id="contents">
						</textarea></td>
					</tr>
					<tr>
						<td class="td1"><label for="files">첨부파일</label></td>
						<td>
							<a id="addFiles"><img alt="" src="${pageContext.request.contextPath}/resources/images/cloud-computing.png">파일추가</a>
							<div id="files">
								<input type="file" class="filelist" name="filelist" style="display: inline-block">
								<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>
							</div>
						</td>
					</tr>
				
	      		 		<input type="hidden" name="num" value="${originNum}">
					<tr>
						<td class="td1">
							<label for="point">별점<span class="r">*</span></label>
						</td>
						<td>
							<input type="radio" name="point" value="1" class="point" id="p1"> 
							<label for="p1">싫어요</label>
							<input type="radio" name="point" value="2" class="point" id="p2"> 
							<label for="p2">별로에요</label>
							<input type="radio" name="point" value="3" class="point" id="p3">
							<label for="p3">보통이에요</label>
							<input type="radio" name="point" value="4" class="point" id="p4"> 
							<label for="p4">재미있어요</label>
							<input type="radio" name="point" value="5" class="point" id="p5"> 
							<label for="p5">훌륭해요</label>
						</td>
      		 		</tr>
      		 		</tbody>
      		 		</table>
				<a id="write" class="festiWrite_btn">등록</a>
			</form> 
			</div>
      	</div>
      </div>
      <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
   </div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a> 

<!-- 썸머노트 -->
<script src="../resources/js/summernote.js"></script>
<!-- script -->
<script type="text/javascript">

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
	
	$('#write').click(function() {
		var pointCheck=false;
		$('.point').each(function() {
			var point = $(this).is(':checked');
			if(point){
				pointCheck = true;
			}
		});
		
		if($('#title').val() != '' && $('#writer').val() != '' && $('#contents').val() != '' && pointCheck){
			$('#frm').submit();
		} else {
			alert('필수(*)가 비었어요');
		}
	});
	

</script>
</body>
</html>
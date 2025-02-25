<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> W 추천 게시판 </title>
<c:import url="../temp/boot.jsp"></c:import>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardSelect.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<style type="text/css">
	#replyContents{
		resize: none;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				<div class="fqna_wrap">
					<div class="fqna_title">
  	      				<img alt="" src="${pageContext.request.contextPath}/resources/images/chat.png" class="titleimg"><h3> W 추천 게시판 </h3>
  	      			</div>
				<div class="tableDiv">
						<table class="table" style="width: 100%">
							<thead class="table_head">
								<tr>
									<th class="td1">
										<div>${list.num}</div>
									</th>
									<th class="td2">
										<div>${list.title}</div>
									</th>
									<th class="td1">
										<div>${list.writer}</div>
									</th>
									<th class="td1">
										<div>${list.reg_date}</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">
										<div class="dt1">								
											${list.contents}
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
				
				<a id="list" title="${board}" class="${list.num} fqnaSelect_btn">목록</a>
				<c:if test="${member.grade eq 3 }">
				<a id="update" class="${board} fqnaSelect_btn">수정</a> 
				<a id="delete" class="${board} fqnaSelect_btn">삭제</a>
				</c:if>
				<form action="./WeekRecoDelete" id="deleteFrm" method="post">
				
					<input type="hidden" class="num" id = "${list.num}" name="num" value="${list.num}">
				
				</form>
				
			</div>
		</div>
   </div>
   <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
   </div>
</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
	
	<!-- script -->
	<script type="text/javascript">
	/* 글 삭제 */
	$('#delete').click(function() {
			var check = confirm('삭제하시겠습니까?');		
			if(check){
				$('#deleteFrm').submit();
			}
	});
	
	/* 글 수정 */
	$('#update').click(function() {
		var board = $(this).attr('class');
		var num = $('.num').attr('id');
		location.href="./WeekRecoUpdate?num="+num;
	});

	
	/* 목록 */
	$('#list').click(function() {
		location.href = "./WeekRecoList";
	});
	
	
</script>
</body>
</html>
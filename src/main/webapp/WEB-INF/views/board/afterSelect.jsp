<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${boardTitle}]${dto.title}</title>
<c:import url="../temp/boot.jsp"></c:import>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardSelect.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<style type="text/css">
	#commentsContents{
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
  	      				<h3> 후기보기 </h3>
  	      			</div>
				<div class="tableDiv">
					<table class="table" style="width: 100%">
							<thead class="table_head">
								<tr>
									<th class="td1">
										<div>${dto.num}</div>
									</th>
									<th class="td2">
										<div>${dto.title}</div>
									</th>
									<th class="td1">
										<div>${dto.writer}</div>
									</th>
									<th class="td1">
										<div>${dto.reg_date}</div>
									</th>
									<th class="td1">
										<div>${dto.hit}</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">
										<div class="dt1">								
											${dto.contents}
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				
				<c:forEach items="${dto.fileDTOs}" var="f">
					<input type="button" title="${f.fname}" class="down" value="${f.oname}" style="display: none;"> 
				</c:forEach>
				
				<div style="display:none;">
					<form action="../ajax/fileDownload" method="post" id="downForm">
						<input type="text" name="fname" id="fname">
						<input type="text" name="oname" id="oname">
						<input type="text" name="board" value="board">
					</form>
				</div>			

				<form action="./${board}Delete" id="deleteFrm" method="post">
						<input type="hidden" class="anum" id = "${dto.anum}" name="anum" value="${dto.anum}">
				</form>
				<!-- ------------------------------------------ 댓글 ------------------------------------------ -->
				
				
				<div id="commentsList">
					
				</div>
				<div id="commentsWriteDiv">
					<form action="./${board}commentsWrite" method="post" id="commentsFrm">
						<input type="hidden" id="num" name="num" value="${dto.anum}">
						<strong><span>댓글(</span><span id="cCnt">${cCnt}</span>)</strong>
						<div class="comments_name">				
							<input type="text" name="writer" id="writer" value="${member.nickname}" readonly="readonly" style="border: 0;background-color:transparent;">
						</div>
						<div style="display: inline-block;">
							<textarea rows="3" cols="120" id="commentsContents" style="resize: none;"></textarea>
						</div>
						<div style="display: inline-block;">
							<a class="btn" id="commentsWrite">댓글등록</a>
						</div>
					</form>
				</div>
				<a id="list" title="${board}" class="${dto.num} fqnaSelect_btn">목록</a>
				<a id="update" class="${board} fqnaSelect_btn">수정</a> 
				<a id="delete" class="${board} fqnaSelect_btn">삭제</a>
			</div>
		</div>
   </div>
   <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
   </div>
</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
	
<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/afterSelect">	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> W추천 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/weekRecoList.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardList.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
      		<div class="conta">
  	      		<div class="week_wrap">
  	      			<div class="week_title">
  	      				<strong> W 추천 </strong>
  	      			</div>
  	      			<div class="week_box">
  	      				<ul>
  	      					<li>
  	      						<strong>W 추천 게시판</strong>
  	      					</li>
  	      					<li>
  	      						<p>
  	      							▷ &nbsp;&nbsp;관리자 및  전문가들이 직접 다녀오고 추천 및 소개하는 게시판입니다.
  	      						</p>
  	      					</li>
  	      				</ul>
  	      			</div>
  	      			
  	      			<div id="tableDiv">
					<!-- notice list 테이블 -->
					<table class="table">
						<thead class="table_head">
							<th class="td10">번호</th>
							<th class="td60">제목</th>
							<th class="td10">작성자</th>
							<th class="td10">작성일</th>
							<th class="td10">조회수</th>
						</thead>
  	      				<c:forEach items="${list}" var="list">
							<tr class="select">
								<td class="selectRow td10" id="${list.num}"><p></p></td>
								<td>${list.title}</td>
								<td class="td10">${list.writer}</td>
								<td class="td10">${list.reg_date}</td>
								<td class="td10">${list.hit}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="paging">
					<c:if test="${list[0].reg_date ne null}">
						<ul class="pagination">
							<c:choose>
								<c:when test="${pager.curBlock>1}">
									<li class="pagingClick"><a href="${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="pagingo"><a>이전</a></li>
								</c:otherwise>
							</c:choose>
	
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
								var="i">
								<li class="pagingClick"><a href="${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
							</c:forEach>
	
							<c:choose>
								<c:when test="${pager.curBlock < pager.totalBlock}">
									<li class="pagingClick"><a href="${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="pagingo"><a>다음</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:if>
				</div>
  	      						<!-- 검색창 -->
				<form action="./${board}List" class="search_form">
					<select name="kind" class="search_select">
						<option value="0">전체</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select> 
					<input type="text" placeholder="" name="search" class="search_input">
					<button id="searchButton">검색</button>
				</form>
				<div class="boardwrite">
						<button id="boardWrite" href="./WeekRecoWrite">${boardTitle} 글쓰기</button>
						<a href = "./WeekRecoWrite">글쓰기</a>
				</div>
  	  	     	 </div>
      		</div>
    	</div>
		<div id="footer">
    		<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
<script type="text/javascript">

		/* 테이블의 num 앞에 구분 문자 안보이게 */
		$('.selectRow').each(function() {
			var num = $(this).attr('id');
			num = num.substring(1);
			$(this).children('p').append(num);
		});
		
	</script>
</body>
</html>
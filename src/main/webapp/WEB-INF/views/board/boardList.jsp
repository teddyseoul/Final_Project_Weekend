<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title>${boardTitle} 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/images/logo/logo.png" />
<style type="text/css">
	/* css 할거*/
	/* 3. 글쓰기 버튼$('#boardWrite'), 검색버튼 디자인 */
	/* 4. 검색 form, 글쓰기 버튼 위치 잡기  */
	/* 6. 테이블 위에 어떻게 할지 */
	
	/* 2. 페이징 처리 가운데로 */
	
	#paging{
	
	}
	
	.pagingClick{
		color: green;
		cursor: pointer;
	}
	
	/* 5. 검색버튼 */
	#searchButton{
		width: 30px;
	}
	
	/* 7. 각 행 cursor: pointer */
	.select{
		cursor: pointer;
	}
	.select:hover{
		/* 제목에만 underline주는 법 찾아보기 */
		text-decoration: underline;
	}
	/* 8. 중요한 공지사항 색깔 다시 정하기 */
	.mark{
		background-color: #41b40a17;
	}

	/* 9. 테이블 행이 적을 때 페이징 ul 안올라가게 */
	#tableDiv{
		min-height: 30vh; 
	}
	.td10 {
		/* 1. 제목 빼고 가운데 정렬 */
		text-align:center;
		/* 10. 각 열 크기 조절 */
		width: 10%;
	}
	
	.td60 {
		width: 60%;
	}

}

</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="inner">
				<!-- 검색창 -->
				<form action="./${board}List">
					<select name="kind">
						<option value="0">전체</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<c:if test="${board eq 'after' or board eq 'qna'}">
							<option value="3">작성자</option>
						</c:if>
					</select> 
					<input type="text" placeholder="검색어를 입력하세요" name="search">
					<button id="searchButton">검색</button>
				</form>
				<%-- <c:if test="${member.grade eq 3}"> --%>
					<div>
						<button id="boardWrite" value="${board}">${boardTitle} 글쓰기</button>
					</div>
				<%-- </c:if> --%>
				<div id="tableDiv">
					<!-- notice list 테이블 -->
					<table class="table">
						<thead>
							<th class="td10">번호</th>
							<th class="td60">제목</th>
							<th class="td10">작성자</th>
							<th class="td10">작성일</th>
							<th class="td10">조회수</th>
						</thead>

						<!-- 관리자가 상단에 배치할 공지. pageMaker의 perPage에 영향 X. 밑에 중복. -->
						<c:if test="${board eq 'notice'}">
							<c:forEach items="${top}" var="top">
								<tr title="${top.num}" class="select mark">
									<td class="td10 selectRow" id="${top.num}">중요</td>
									<td>${top.title}</td>
									<td class="td10">${top.writer}</td>
									<td class="td10">${top.reg_date}</td>
									<td class="td10">${top.hit}</td>
								</tr>
							</c:forEach>
						</c:if>


						<!-- 일반 공지 리스트 -->
						<c:forEach items="${list}" var="list">
							<tr class="select">
								<c:if test="${board eq 'notice' or board eq 'qna'}">
									<td class="selectRow td10" id="${list.num}"><p></p></td>
								</c:if>
								<c:if test="${board eq 'after' or board eq 'afterAll'}">
									<td class="selectRow" id="${list.anum}"></td>
								</c:if>
								<td>${list.title}</td>
								<td class="td10">${list.writer}</td>
								<td class="td10">${list.reg_date}</td>
								<td class="td10">${list.hit}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="paging">
					<c:if test="${list[0].reg_date eq null}">
						<ul class="pagination">
							<li class="pagingClick"><a href="${board}List">검색결과가 없습니다</a></li>
						</ul>
					</c:if>
					<c:if test="${list[0].reg_date ne null}">
						<ul class="pagination">
							<c:choose>
								<c:when test="${pager.curBlock>1}">
									<li class="pagingClick"><a href="${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
								</c:when>
								<c:otherwise>
									<li><a>이전</a></li>
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
									<li><a>다음</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:if>
				</div>

			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>

	<!-- ------script---------- -->
	<script type="text/javascript">
		/* 각 행 선택 시 select 페이지 이동 */
		$('.select').click(function() {
			var num = $(this).children('.selectRow').attr('id');
			location.href = "./${board}Select?num=" + num;
		});

		/* board 글쓰기 이동 */
		$('#boardWrite').click(function() {
			var board = $(this).val();
			location.href = "./" + board + "Write"
		});

		/* 테이블의 num 앞에 구분 문자 안보이게 */
		$('.selectRow').each(function() {
			var num = $(this).attr('id');
			num = num.substring(1);
			$(this).children('p').append(num);
		});
		
	</script>

</body>
</html>
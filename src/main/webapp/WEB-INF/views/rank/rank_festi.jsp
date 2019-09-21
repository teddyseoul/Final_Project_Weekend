<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 주말뭐해 Top100 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rank.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
      		<div class="conta">
  	      		<div class="rank_wrap">
  	      			<div class="rank_title">
  	      				<img alt="" src="${pageContext.request.contextPath}/resources/images/rank.png"><strong> 주말뭐해 Top100</strong>
  	      			</div>
  	      			<div class="rank_box">
  	      				<ul>
  	      					<li>
  	      						<strong>집계기간</strong>
  	      						<p>
  	      							<span class="color_black">실시간 집계</span>
  	      							(자동 업데이트 됩니다.)	
  	      						</p>
  	      					</li>
  	      					<li>
  	      						<strong>집계대상</strong>
  	      						<p>
  	      							<span class="color_black">주말뭐해 별점 후기 기준</span>
  	      							(후기 등록 완료 기준)
  	      						</p>
  	      					</li>
  	      				</ul>
  	      			</div>
  	      				<ul class="rank_menu">
  	      					<c:choose>
  	      						<c:when test="${param.category eq 1}">
									<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=1" class="tab1 on">공연</a></li>
									<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=2" class="tab2">축제</a></li>
									<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=3" class="tab3">대학로</a></li>
  	      						</c:when>
  	      						<c:when test="${param.category eq 2}">
  	      							<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=1" class="tab1">공연</a></li>
									<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=2" class="tab2 on">축제</a></li>
									<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=3" class="tab3">대학로</a></li>
  	      						</c:when>
  	      						<c:otherwise>
  	      							<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=1" class="tab1">공연</a></li>
									<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=2" class="tab2">축제</a></li>
									<li><a href="${pageContext.request.contextPath}/rank/rank_festi?category=3" class="tab3 on">대학로</a></li>
  	      						</c:otherwise>
  	      					</c:choose>
						</ul>
  	      			<div class="rank_info">
  	      			<table class="table">
  	      				<thead class="table_head">
							<th class="td10">순위</th>
							<th class="td60">공연명</th>
							<th class="td10">평점</th>
							<th class="td10">공연기간</th>
							<th class="td10">장소</th>
						</thead>
						<c:forEach items="${list}" var="list" varStatus="status">
							<tr class="select">
								<td class="td10"><p class="color_green">${status.count}</p></td>
								<td class="td30">
										<img alt="" src="${pageContext.request.contextPath}/resources/images/board/${list.fileDTOs[0].fname}">
									<div class="rank_tt">${list.title}</div>
								</td>
								<td class="td10">아직 구현안됨</td>
								<td class="td10">${list.startDate} ~	${list.endDate}</td>
								<td class="td20">${list.local}</td>
							</tr>
						</c:forEach>
  	      			</table>
  	      			</div>
  	  	     	 </div>
      		</div>
    	</div>
		<div id="footer">
    		<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
</body>
</html>
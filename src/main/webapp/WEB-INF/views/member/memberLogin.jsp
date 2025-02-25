<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Weekend - 로그인 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberLogin.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberLogin.js?ver=2"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
   <div id="wrap">
      <div id="container">
      	<div class="conta">
				<div class="login_wrap">
					<div class="login_logo">
						<a href="${pageContext.request.contextPath}/."><img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo111.png"></a>
					</div>
					<form action="./memberLogin" id="frm" method="POST">
						<div class="ps_box">
							<input id="id" class="idbtn" name="id" type="text" placeholder="아이디" value="">
						</div>
						<div class="ps_box">
							<input id="pw" class="pwbtn" name="pw" type="password" placeholder="비밀번호" value="">
						</div>
						<button type="submit" id="Login" class="lgbtn">로그인</button>
					</form>
					
				
					
					
					<div class="login_bot">
						<a href="./memberAgree" class="lob">회원가입</a> <span class="log lob">|</span>
						<a href="#" onclick="window.open('${pageContext.request.contextPath}/search/idSearch','아이디 찾기','width=700, height=500')" class="lob">아이디 찾기</a> <span class="log lob">|</span>
						<a href="#" onclick="window.open('${pageContext.request.contextPath}/search/pwSearch','아이디 찾기','width=700, height=500')" class="lob">비밀번호 찾기</a>
					</div>
					<div class="login_footer">
						<div class="login_menu">
							<a href="${pageContext.request.contextPath}/footer/personalInformation">개인정보처리방침</a>
							<span>|</span>
							<a href="${pageContext.request.contextPath}/footer/youth">청소년보호정책</a>
							<span>|</span>
							<a href="${pageContext.request.contextPath}/footer/use">이용약관</a>
							<span>|</span>
							<a href="${pageContext.request.contextPath}/callcenter/main">고객센터</a>
					</div>
				</div>
			</div>
      	</div>
    </div>	
</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title> Weekend - ${title} </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPageMain.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
<script type="text/javascript">
	$(function () {
		$("#gBtn").on("click",function(){
			var check = confirm("변경사항을 모두 취소하고 돌아가시겠습니까?")
			if(check){
				location.href = "./myMain";
			}else{
				alert("정보 수정을 계속 진행합니다.");
			}
		})// #Btn 끝;
	})// 밖 function 끝;
</script>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<!-- body 전부를 감쌈  -->
		<div id="container">
			<div class="conta">
				<div class="call_quick mypage_quick">
					<form>
						<div class="form-group">
		      				<label>아이디:</label>
		      				<input type="text" class="form-control" readonly="readonly" id="id" name="id" value="${member.id}">
		    			</div>
			    		<div class="form-group">
			      			<label>현재 비밀번호:</label>
			      			<input type="password" class="form-control" placeholder="현재 비밀번호를 입력해 주세요." id="pw" name="pw">
		    			</div>
			    		<div class="form-group">
			      			<label>변경할 비밀번호:</label>
			    	  		<input type="password" class="form-control" placeholder="변경할 비밀번호를 입력해 주세요." id="npw" name="npw">
		    			</div>
			    		<div class="form-group">
			      			<label>변경할 비밀번호 재입력:</label>
			      			<input type="password" class="form-control" placeholder="변경할 비밀번호를 다시 입력해 주세요." id="cnpw" name="cnpw">
		    			</div>
		    			<button type="button" class="btn btn-default" id ="uBtn">수정 완료</button>
		  				<button type="button" class="btn btn-default" id ="gBtn">되돌아 가기</button>
					</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>

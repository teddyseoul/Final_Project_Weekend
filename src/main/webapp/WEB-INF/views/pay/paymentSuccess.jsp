<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
<script type="text/javascript">
		$().ready(function () {
			var cWindow = window.parent;
			var pWindow = cWindow.parent;
			var gpWindow = pWindow.opener;
			var token = "${token}";
			gpWindow.location.href = "./approval";
			pWindow.close();
		});
</script>
</head>
<body>
</body>
</html>
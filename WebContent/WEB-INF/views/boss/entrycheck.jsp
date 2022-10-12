<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script>
	window.onload = function() {
	  	alert('${msg }');
	  	location.href = 'mypage?uno=${uno}';
	};
</script>
<body>

</body>
</html>
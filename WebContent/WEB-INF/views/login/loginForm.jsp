<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
section{
	font-family: 'Noto Sans KR', sans-serif;
	display : flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	/*background: url("../image/bg_login.jpg") no-repeat center;*/
	/*background-size: cover;*/
}

.login-form h1{
	font-size: 32px;
	color: #000;
	text-align: center;
	margin-bottom: 60px;
}

.int-area:first-child{ /*int-area클래스의 첫번째 자식인 id textfield의 선택자*/
	margin-top:0;
}

.int-area{
	width:400px;
	position : relative;
	margin-top: 20px;
}

.int-area input{
	width: 100%;
	padding: 20px 10px 10px;
	background-color: transparent;
	border : none;
	border-bottom: 1px solid #999;
	font-size: 18px; color: #000;
	outline : none;
}

.int-area label{
	position : absolute;
	left : 10px; top: 15px;
	font-size: 18px; color: #999;
	transition : all .5s ease;
}

.int-area label.warning{/**/
	color: red !important;
	animation: warning .3s ease;	/*3초동안 warning클래스 애니메이션을 ease(부드럽게) 실행*/
	animation-iteration-count: 3;	/*애니매이션 반복횟수 3회*/
}

@keyframes warning{/*warning클래스 실행시 애니매이션*/
	0% {transform: translateX(-4px);}
	25% {transform: translateX(4px);}
	50% {transform: translateX(-4px);}
	75% {transform: translateX(4px);}
}

.int-area input:focus + label,
.int-area input:valid + label{	/*input이 focus됐을때 라벨의 */
	top : -2px;
	font-size: 13px; color: #166cea;
}

.btn-area{
	margin-top: 30px;
}

.btn-area button{
	width : 100%; height: 50px;
	background: #166cea;
	color: #fff;
	font-size: 20px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
}

.caption{
	margin-top: 20px;
	text-align: center;
}

.caption a{
	font-size: 15px;
	color: #999;
	text-decoration: none;
}
</style>
</head>
<body>

<section class="login-form">
	<form action="loginProcess" method="post">
		<h1>로그인</h1>
		<div class="int-area">
			<input type="text" name="id" id="id" autocomplete="off"
				required="required"> <label for="id">USER NAME</label>
		</div>

		<div class="int-area">
			<input type="password" name="pwd" id="pwd" autocomplete="off"
				required="required"> <label for="id">PASSWORD</label>
		</div>
		<div class="caption">
			<a href="${pageContext.request.contextPath}/user/userForm">SIGN UP</a>
		</div>
		
		<div class="btn-area">
			<button id="btn" type="submit">LOGIN</button>
		</div>
	</form>
</section>
</body>
<script src="${pageContext.request.contextPath}/resources/js/login-main.js"></script>
</html>
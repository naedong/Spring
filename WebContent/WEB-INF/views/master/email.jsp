<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>이메일 폼</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
   <main class="form-signin">
   	<form action="emailsend" method="post">
   		<h1 class="h3 mb-3 fw-normal">이메일</h1>
   		
   		<div class="form-floating">
   			<input type="email" class="form-control" name="mymail" id="mymail" value="dhwlee@naver.com" readonly="readonly">
   			<label for="mymail">보내는 이</label>
   		</div>
   		
   		<div class="form-floating">
   			<input type="email" class="form-control" name="youmail" id="youmail" placeholder="받을 사람의 이메일 입력">
   			<label for="youmail">받는 이</label>
   		</div>
   		
   			<div class="form-floating">
   			<input type="text" class="form-control" name="title" id="title" placeholder="제목">
   			<label for="title">제목</label>
   		</div>
   		
   		<div class="form-floating">
   			<input type="text" class="form-control" name="cont" id="cont" placeholder="내용을 입력">
   			<label for="cont">내용</label>
   		</div>
   		
   		<button class="w-100 btn btn-lg btn-primary" type="submit">전송</button>
   		<p class="mt-5 mb-3 text-muted">&copy; 2022-2022</p>
   	</form>
   </main>
</body>
</html>
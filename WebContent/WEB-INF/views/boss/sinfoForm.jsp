<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.btn-space {
	margin-right: 5px;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<article class="container" style="width:100%;">

		<div class="page-header">
			<center>
				<h1>
					<a onclick="return false; location.reload()"
						style="cursor: pointer;"><b>재고등록</b></a>
				</h1>
			</center>
			<div class="col-md-6 col-md-offset-3"></div>
		</div>

		<hr>
		<form action="uploadpro" method="post" enctype="multipart/form-data" id="upform">
			<div class="col-sm-6 col-md-offset-3">

				<input type="hidden" value="${sessionScope.sessionNum}" id="uno" name="uno">
				<div class="form-group">
					<label for="iname">상품명</label> <input type="text"
						class="form-control" id="iname" name="iname" placeholder="상품명 입력"
						maxlength="30" required="required" pattern=".{2,30}">
				</div>

				<div class="form-group">
					<label for="iprice">가격</label> <input type="text"
						class="form-control" id="iprice" name="iprice"
						placeholder="상품가격 입력 (단위: 원)" maxlength="20" required="required"
						pattern=".{2,20}"> <span id="id-check-warn"></span>
				</div>

				<div class="form-group">
					<label for="istoke">수량</label> <input type="text"
						class="form-control" id="istoke" name="istoke"
						placeholder="재고입력 (단위: 개)" maxlength="3" required="required"
						pattern=".{1,3}">
				</div>

				<div class="mb-3">
					<label for="imgx" class="form-label">*상품 이미지</label> 
					<input type="file" class="form-control form-control-sm mb-2" id="mfile" name="mfile"> 
					<a href="" download><img class="mt-2" src="${pageContext.request.contextPath}/resources/image/noimage.jpg" id="imgx"></a>
				</div>

				<div class="form-group text-center">
					<button type="submit" id="join-submit"
						class="btn btn-primary btn-space">
						등록<i class="fa fa-check spaceLeft"></i>
					</button>

					<button type="button" class="btn btn-danger"
						onClick="location.href='mypage'">
						취소<i class="fa fa-check spaceLeft"></i>
					</button>

				</div>
			</div>
		</form>
	</article>
	<hr>
</body>
<script>
	//upfrom.jsp에서 이미지 미리보기 기능
	function readURL(input) {
		if (input.files && input.files[0]) {
			// 자바스크립트 I/O 
			var reader = new FileReader();
			reader.onload = function(e) {
				//e.target.result
				console.log("Path :"+e.target.result);
				$('#imgx').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$(function(){
		$('#wbtn').click(function(){
			location = "boardform";
		});
		//upfrom.jsp에서 이미지 미리보기 기능
		$('#mfile').change(function() {
			//console.log($(this).val())
			readURL(this);
		});
	});

</script>
</html>
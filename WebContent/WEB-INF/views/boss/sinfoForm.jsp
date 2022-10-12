<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ȸ������</title>
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
						style="cursor: pointer;"><b>�����</b></a>
				</h1>
			</center>
			<div class="col-md-6 col-md-offset-3"></div>
		</div>

		<hr>
		<form action="uploadpro" method="post" enctype="multipart/form-data" id="upform">
			<div class="col-sm-6 col-md-offset-3">

				<input type="hidden" value="${sessionScope.sessionNum}" id="uno" name="uno">
				<div class="form-group">
					<label for="iname">��ǰ��</label> <input type="text"
						class="form-control" id="iname" name="iname" placeholder="��ǰ�� �Է�"
						maxlength="30" required="required" pattern=".{2,30}">
				</div>

				<div class="form-group">
					<label for="iprice">����</label> <input type="text"
						class="form-control" id="iprice" name="iprice"
						placeholder="��ǰ���� �Է� (����: ��)" maxlength="20" required="required"
						pattern=".{2,20}"> <span id="id-check-warn"></span>
				</div>

				<div class="form-group">
					<label for="istoke">����</label> <input type="text"
						class="form-control" id="istoke" name="istoke"
						placeholder="����Է� (����: ��)" maxlength="3" required="required"
						pattern=".{1,3}">
				</div>

				<div class="mb-3">
					<label for="imgx" class="form-label">*��ǰ �̹���</label> 
					<input type="file" class="form-control form-control-sm mb-2" id="mfile" name="mfile"> 
					<a href="" download><img class="mt-2" src="${pageContext.request.contextPath}/resources/image/noimage.jpg" id="imgx"></a>
				</div>

				<div class="form-group text-center">
					<button type="submit" id="join-submit"
						class="btn btn-primary btn-space">
						���<i class="fa fa-check spaceLeft"></i>
					</button>

					<button type="button" class="btn btn-danger"
						onClick="location.href='mypage'">
						���<i class="fa fa-check spaceLeft"></i>
					</button>

				</div>
			</div>
		</form>
	</article>
	<hr>
</body>
<script>
	//upfrom.jsp���� �̹��� �̸����� ���
	function readURL(input) {
		if (input.files && input.files[0]) {
			// �ڹٽ�ũ��Ʈ I/O 
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
		//upfrom.jsp���� �̹��� �̸����� ���
		$('#mfile').change(function() {
			//console.log($(this).val())
			readURL(this);
		});
	});

</script>
</html>
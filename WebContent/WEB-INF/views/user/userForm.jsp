<%@page import="java.sql.Date"%>
<%@page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ȸ������</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.btn-space {
	margin-right: 5px;
}
</style>
</head>

<body>
	<article class="container w-100">
	<div class="page-header">
		<center>
			<h1>
				<a onclick="return false; location.reload()"
					style="cursor: pointer;"><b>ȸ������</b></a>
			</h1>
		</center>
		<div class="col-md-6 col-md-offset-3"></div>
	</div>

	<hr>
<form id="formsign" action="userSign" method="post" onsubmit="return showmsg()">
		<div class="col-sm-6 col-md-offset-3">
			
			<div class="form-group">
				<label for="scate">�̸�</label> 
				<input type="text" class="form-control" id="name" 
					name="name" placeholder="INPUT YOUR NAME" 
					maxlength="10" required="required" pattern=".{2,10}">
			</div>
			
			<div class="form-group">
					<label for="id">���̵�</label> 
					<input type="text" class="form-control" id="id" name="id" placeholder="INPUT YOUR ID"
					maxlength="10" required="required" pattern=".{2,10}">
					<button class="btn btn-default" type="button" id="id-check"> �ߺ�Ȯ��</button>
					<span id="id-check-warn"></span>
			</div>

			<div class="form-group">
				<label for="snum">��й�ȣ</label> 
				<input type="password"
					class="form-control" id="pwd" name="pwd" placeholder="YOUR PASSWORD"
					maxlength="20" required="required" pattern=".{2,20}">
			</div>

			<div class="form-group">
				<label>���Ժз�</label> 
				<div class="form-control">
					<label class="radio-inline"> 
						<input type="radio" name="ckradio" value="user"> �Ϲݰ���
					</label> 
					<label class="radio-inline"> 
						<input type="radio" name="ckradio" value="boss"> �����
					</label>
				</div>
			</div>

			<div class="form-group">
				<label>EMAIL</label> 
					<input type="email" class="form-control" id="email" name="email" placeholder="name@example.com"
					required="required">
				<button class="btn btn-default" type="button" id="mail-check">
					<i class="fa fa-search"></i>��������</button>
			</div>

			<div class="form-group">
				<input type="text" class="form-control" id="certi-input" name="certi-input" 
					placeholder="������ȣ 6�ڸ�" disabled="disabled" maxlength="6"/>
				<span id="mail-check-warn" class="mb-2"></span>
			</div>

			<div class="form-group text-center">
				<button type="submit" id="join-submit"
					class="btn btn-primary btn-space" disabled="disabled">
					ȸ������<i class="fa fa-check spaceLeft"></i>
				</button>

				<button type="button" class="btn btn-danger"
					onClick="location.href='/bteam2/main'">
					���<i class="fa fa-check spaceLeft"></i>
				</button>

			</div>
		</div>
	</form>
	</article>
	<hr>

<script>
	var $js = jQuery.noConflict()
	
	//Email Ajax
	$js('#mail-check').click(function() {
		const eamil = $js('#email').val(); // �̸��� �ּҰ� ������!
		console.log('�ϼ��� �̸��� : ' + eamil); // �̸��� ������ Ȯ��
		const checkInput = $js('#certi-input') // ������ȣ �Է��ϴ°� 
		
		$js.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/mailCheck?email='+eamil,
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('������ȣ�� ���۵Ǿ����ϴ�.')
			}
		}); // end ajax
	}); // end send eamil

	// ������ȣ ��
	// blur -> focus�� ��� ��� �߻�
	$js('#certi-input').blur(function() {
		const inputCode = $js(this).val();
		const $resultMsg = $js('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('������ȣ�� ��ġ�մϴ�.');
			$resultMsg.css('color','green');
			$js('#mail-check').attr('disabled', true);
			$js('#email').attr('readonly', true);
			$js('#certi-input').attr('readonly', true);
			$js('#join-submit').attr('disabled', false);
		}else{
			$resultMsg.html('������ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ�����ּ���!');
			$resultMsg.css('color', 'red');
		}
	});
	
	//radio ���� ���� �ٸ� controller
	$js('input:radio[name=ckradio]').change(function() {
		if (this.checked) {
			console.log($js(this).val());
			if($js(this).val() == 'user'){
				$js('#formsign').attr('action', 'userSign');
				console.log($js('#formsign').attr('action'));
			}else if($js(this).val() == 'boss'){
				$js('#formsign').attr('action', 'bossSign');
				console.log($js('#formsign').attr('action'));
			}
		}
	});
	
	//
	$js('#id-check').click(function() {
		let param = $js('#id').val();
		$js.ajax({
			url: "idcheck?id="+param,
			success:function(data){
				console.log(data);
				if(data == 1){
					$js('#id-check-warn').css('color','red').html('�̹� ������� ���̵��Դϴ�.');
				}else{
					$js('#id-check-warn').css('color','green').html('��� ������ ���̵��Դϴ�.');
				}
			}
		});
	});
	function showmsg() {
		alert('ȸ�����Կ� �����ϼ̽��ϴ�.');
	}
</script>
</body>
</html>
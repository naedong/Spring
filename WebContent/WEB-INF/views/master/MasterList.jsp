<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>������-�������</title>
</head>
<body>
	 			
<table class="table table-bordered" id="ajaxdata">

</table>
        
<script type="text/javascript">
   	function checkconfirm() {
		if(confirm('�ش� ���Ը� �����Ͻðڽ��ϱ�?')){
			return true;
		}else{
			return false;
		}
	}
		
	function checkreject() {
		if(confirm('�ش� ���Ը� ���ΰź��Ͻðڽ��ϱ�?')){
			return true;
		}else{
			return false;
		}
	}
	
  	$.ajax({
  		url: "schedule?cPage=${cPage}",
  		success:function(data){
  			console.log(data);
  			$('#ajaxdata').html(data);
  		}
  	});
</script>   
</body>
</html>
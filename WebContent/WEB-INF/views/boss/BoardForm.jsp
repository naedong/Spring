<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
   <!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table class="table table-bordered">
<thead>
   <tr>
		<th >���� ��ȣ</th>
		<th >���� ��ȣ</th>
		<th >���� �̸�</th>
		<th >���� ����</th>
		<th >ī�װ�</th>	
		<th >�¶��� �������� ����</th>
		<th> ���� ���� �� ��</th>
		<th >���� ��û����</th>
		<th >���� ��� ��</th>
		<th >���� ���� ��</th>
	</tr>
</thead>
<tbody>
	
			<tr>
				<td class="align-middle text-center" id="snum" name="snum"> ${shop.snum }</td>
				<td class="align-middle text-center"id="bnum" name="bnum"> ${shop.bnum }</td>
				<td class="align-middle text-center"> ${shop.sname }</td>
				<td class="align-middle text-center">${shop.sloc }</td>
				<td class="align-middle text-center"> ${shop.scate }</td>
				<td class="align-middle text-center">${shop.onoff }</td>	
				<td class="align-middle text-center">${shop.ctf }</td>
				<td class="text-center"> ${shop.sdate }</td>
				<td class="align-middle">${shop.edate }</td>
			</tr>
	
</tbody>
</table>




</body>
</html>
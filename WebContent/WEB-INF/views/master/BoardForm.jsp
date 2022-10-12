<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=������ ��Ű"></script>
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
			<td class="align-middle text-center" id="id"> ${shop.snum }</td>
			<td class="align-middle text-center" id="id"> ${shop.bnum }</td>
			<td class="align-middle text-center" id="id"> ${shop.sname }</td>
			<td class="align-middle text-center" id="id">${shop.sloc }</td>
			<td class="align-middle text-center" id="id"> ${shop.scate }</td>
			<td class="align-middle text-center" id="id">${shop.onoff }</td>
			<form action="#" method="post">
				<c:choose>
			  	<c:when test="${shop.ctf == '���'}">
				  	<td class="admin_board_content_nm">
		                <input data-user-id ="${shop.sname}" type="submit" value="����" class="appro">
		                <input data-user-id ="${shop.sname}" type="submit" value="�ź�" class="deni">
	                </td>
			  	</c:when>
			  	<c:when test="${shop.ctf != '���'}">
				  	<td class="admin_board_content_nm">
		            	<input data-user-id ="${shop.sname}" type="text" value="ó���Ϸ�" class="fin">
		            </td>
			  	</c:when>
			  </c:choose>
		  </form>
			<td class="align-middle text-center" id="id">${shop.ctf }</td>
			<td class="text-center" id="id"> ${shop.sdate  }</td>
			<td class="align-middle" id="id">${shop.edate }</td>
		</tr>
</tbody>
</table>
	<input type="button" id="update" value="����" onclick="location='${pageContext.request.contextPath}/master/UpdateForm'">
	<input type="button" id="delete" value="����" onclick="location='${pageContext.request.contextPath}/master/deleteForm'">

</body>
</html>
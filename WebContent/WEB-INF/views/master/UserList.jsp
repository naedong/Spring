<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>	
<div class="p-2 bg-primary"><a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/shopList" class="nav-link text-white" id="item3">���� ����Ʈ</a></div>
					
<table class="table table-bordered">
<thead>
   <tr>
		<th >ȸ�� ��ȣ</th>
		<th >ȸ�� ���̵�</th>
		<th >ȸ�� ��й�ȣ</th>
		<th >ȸ�� ��</th>
		<th >ȸ�� �̸���</th>	
		<th >ȸ�� ���� ��¥</th>
	</tr>
</thead>
<tbody>
		<c:forEach var="e" items="${list }">
			<tr>
				<td class="align-middle text-center"><a href="delete?cPage=${nowPage }&nu=${e.num}" style="color: black;">${e.num }</a></td>
				<td class="align-middle text-center" id="de">${e.id }</td>
				<td class="align-middle text-center"> ${e.pwd }</td>
				<td class="align-middle text-center"> ${e.name }</td>
				<td class="align-middle text-center">${e.email }</td>
				<td class="align-middle text-center">${e.udate }</td>
			</tr>
		</c:forEach>
</tbody>

<tfoot>
<tr>
<td colspan="5" >${startPage}/${endPage }
<ol class="paging" >
	<c:choose>
		<c:when test="${startPage < 6}">
			<li class="disable">��������</li>
		</c:when>
	<c:otherwise>
		<li><a href="${pageContext.request.contextPath}/user/userList?cPage=${nowPage-pagePerBlock}">��������</a></li>
	</c:otherwise>
	</c:choose>

 	<c:forEach varStatus="i" begin="${startPage}" end="${endPage }" step="1" >
		<c:choose>
			<c:when test="${i.index == nowPage}">
	 			<li class="now">${i.index}</li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/user/userList?cPage=${i.index}">${i.index}</a></li>
			</c:otherwise>
		</c:choose> 
 	</c:forEach>
 	<c:choose>
		<c:when test="${endPage >= totalPage }">
			<li class="disable">��������</li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li><li><a href="${pageContext.request.contextPath}/user/userList?cPage=${nowPage+pagePerBlock }">��������</a></li>
		</c:when>
		<c:otherwise>
     		<li><li><a href="${pageContext.request.contextPath}/user/userList?cPage=${totalPage }">��������</a></li>
		</c:otherwise>
 	</c:choose>
</ol>
</td>
</tr>
</tfoot>
</table>
  
</body>
</html>
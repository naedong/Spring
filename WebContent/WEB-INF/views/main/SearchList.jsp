<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	</tr>
</thead>
<tbody>
		<c:forEach var="e" items="${list }">
			<tr>
				<td class="align-middle text-center"> ${e.snum }</td>
				<td class="align-middle text-center"> ${e.bnum }</td>
				<td class="align-middle text-center"> ${e.sname }</td>
				<td class="align-middle text-center"> ${e.sloc }</td>
				<td class="align-middle text-center"> ${e.scate }</td>
				<td class="align-middle text-center"> ${e.onoff }</td>
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
		<li><a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/shopList?cPage=${nowPage-pagePerBlock}">��������</a></li>
	</c:otherwise>
	</c:choose>

 	<c:forEach varStatus="i" begin="${startPage}" end="${endPage }" step="1" >
		<c:choose>
			<c:when test="${i.index == nowPage}">
	 			<li class="now">${i.index}</li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/shopList?cPage=${i.index}">${i.index}</a></li>
			</c:otherwise>
		</c:choose> 
 	</c:forEach>
 	<c:choose>
		<c:when test="${endPage >= totalPage }">
			<li class="disable">��������</li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li><li><a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/shopList?cPage=${nowPage+pagePerBlock }">��������</a></li>
		</c:when>
		<c:otherwise>
     		<li><li><a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/shopList?cPage=${totalPage }">��������</a></li>
		</c:otherwise>
 	</c:choose>
</ol>
</td>
</tr>
</tfoot>
</table>
        

        
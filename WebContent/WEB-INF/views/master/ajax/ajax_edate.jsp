<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<thead>
   <tr>
		<th >���� ��ȣ</th>
		<th >���� ��ȣ</th>
		<th >���� �̸�</th>
		<th >���� ����</th>
		<th >ī�װ�</th>	
		<th >��/��������</th>
		<th> ���Խ���</th>
		<th >���Խ�û����</th>
		<th >���� ��� ��</th>
		<th >���� ���� ��</th>
	</tr>
</thead>
<tbody>
		<c:forEach var="e" items="${list }" step="1" varStatus="status">
			<tr>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.snum }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.bnum }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.sname }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.sloc }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.scate }</a></td>
				
				<c:choose>
					<c:when test="${e.onoff == 'on'}">
						<td class="align-middle text-center">�¶���</td>
					</c:when>
					<c:when test="${e.onoff == 'off'}">
						<td class="align-middle text-center">��������</td>
					</c:when>
					<c:otherwise>
						<td class="align-middle text-center">�¶���/��������</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${e.ctf == '����'}">
			  			<td class="admin_board_content_nm">���οϷ�</td>
			  		</c:when>
			  		
			  		<c:when test="${e.ctf == '�ź�'}">
			  			<td class="admin_board_content_nm">�źοϷ�</td>
			  		</c:when>
			  		
			  		<c:otherwise>
			  			<td class="admin_board_content_nm">
				  			<form action="confirm" method="post" onsubmit="return checkconfirm()">
				  				<input type="hidden" id='upsnum' name='snum' value='${e.snum }'>
		                		<input id="yes" name="yes" type="submit" value="����" class="appro">
		                	</form>
		                	<form action="reject" method="post" onsubmit="return checkreject()">
		                		<input type="hidden" id='delsnum' name='snum' value='${e.snum }'>
			                	<input id="no" name="no" type="submit" value="�ź�" class="deni">
			                </form>
	                	</td>
			  		</c:otherwise>
		  		</c:choose>
				
				<td class="align-middle text-center">${e.ctf }</td>
				<td class="text-center"> ${e.sdate }</td>
				<td class="text-center" id="remain-time${status.index }"></td>
			</tr>
		</c:forEach>
</tbody>

<tfoot >
<tr>
<td colspan="10">${startPage}/${endPage }
<ol class="paging" >
	<c:choose>
		<c:when test="${startPage < 6}">
			<li class="disable">��������</li>
		</c:when>
	<c:otherwise>
		<li><a href="${pageContext.request.contextPath}/master/shopList?cPage=${nowPage-pagePerBlock}">��������</a></li>
	</c:otherwise>
	</c:choose>

 	<c:forEach varStatus="i" begin="${startPage}" end="${endPage }" step="1" >
		<c:choose>
			<c:when test="${i.index == nowPage}">
	 			<li class="now">${i.index}</li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/master/shopList?cPage=${i.index}">${i.index}</a></li>
			</c:otherwise>
		</c:choose> 
 	</c:forEach>
 	<c:choose>
		<c:when test="${endPage >= totalPage }">
			<li class="disable">��������</li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li><li><a href="${pageContext.request.contextPath}/master/shopList?cPage=${nowPage+pagePerBlock }">��������</a></li>
		</c:when>
		<c:otherwise>
     		<li><li><a href="${pageContext.request.contextPath}/master/shopList?cPage=${totalPage }">��������</a></li>
		</c:otherwise>
 	</c:choose>
</ol>
</td>
</tr>
</tfoot>
<script>
	var selen = ${fn:length(list)};
	var selend = [];
	
	let idx = 0;
	<c:forEach items="${list}" var="list" step="1">
		selend[idx] = "${list.edate}";
		idx++;
	</c:forEach>
</script>

<script src="${pageContext.request.contextPath}/resources/js/schedule.js?after"></script>
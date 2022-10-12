<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<thead>
   <tr>
		<th >가게 번호</th>
		<th >사장 번호</th>
		<th >가게 이름</th>
		<th >가게 지역</th>
		<th >카테고리</th>	
		<th >온/오프라인</th>
		<th> 가입승인</th>
		<th >가입신청상태</th>
		<th >가입 등록 일</th>
		<th >가입 마감 일</th>
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
						<td class="align-middle text-center">온라인</td>
					</c:when>
					<c:when test="${e.onoff == 'off'}">
						<td class="align-middle text-center">오프라인</td>
					</c:when>
					<c:otherwise>
						<td class="align-middle text-center">온라인/오프라인</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${e.ctf == '승인'}">
			  			<td class="admin_board_content_nm">승인완료</td>
			  		</c:when>
			  		
			  		<c:when test="${e.ctf == '거부'}">
			  			<td class="admin_board_content_nm">거부완료</td>
			  		</c:when>
			  		
			  		<c:otherwise>
			  			<td class="admin_board_content_nm">
				  			<form action="confirm" method="post" onsubmit="return checkconfirm()">
				  				<input type="hidden" id='upsnum' name='snum' value='${e.snum }'>
		                		<input id="yes" name="yes" type="submit" value="승인" class="appro">
		                	</form>
		                	<form action="reject" method="post" onsubmit="return checkreject()">
		                		<input type="hidden" id='delsnum' name='snum' value='${e.snum }'>
			                	<input id="no" name="no" type="submit" value="거부" class="deni">
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
			<li class="disable">이전으로</li>
		</c:when>
	<c:otherwise>
		<li><a href="${pageContext.request.contextPath}/master/shopList?cPage=${nowPage-pagePerBlock}">이전으로</a></li>
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
			<li class="disable">다음으로</li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li><li><a href="${pageContext.request.contextPath}/master/shopList?cPage=${nowPage+pagePerBlock }">다음으로</a></li>
		</c:when>
		<c:otherwise>
     		<li><li><a href="${pageContext.request.contextPath}/master/shopList?cPage=${totalPage }">다음으로</a></li>
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
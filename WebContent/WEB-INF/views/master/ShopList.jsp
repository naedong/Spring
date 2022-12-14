<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="EUC-KR">
</head>
<body>
<table class="table table-bordered">
<thead>
   <tr>
		<th >가게 번호</th>
		<th >사장 번호</th>
		<th >가게 이름</th>
		<th >가게 지역</th>
		<th >카테고리</th>	
		<th >온라인 오프라인 유무</th>
		<th> 가입 승인 유 무</th>
		<th >가입 신청상태</th>
		<th >가입 등록 일</th>
		<th >가입 마감 일</th>
	</tr>
</thead>
<tbody>
		<c:forEach var="e" items="${list }">
			<tr>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.snum }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.bnum }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.sname }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.sloc }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/boss/BoardForm/${e.bnum }"> ${e.scate }</a></td>
				<td class="align-middle text-center">${e.onoff }</td>
						
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
				<td class="align-middle">${e.edate }</td>
			</tr>
		</c:forEach>
</tbody>

<tfoot>
<tr>
<td colspan="5" >${startPage}/${endPage}
<ol class="paging" >
	<c:choose>
		<c:when test="${startPage < 6}">
			<li class="disable">이전으로</li>
		</c:when>
	<c:otherwise>
		<li><a  accept-charset="utf-8" href="${pageContext.request.contextPath}/master/mastercShop?name=${name }&cPage=${nowPage-pagePerBlock}">이전으로</a></li>
	</c:otherwise>
	</c:choose>

 	<c:forEach varStatus="i" begin="${startPage}" end="${endPage }" step="1" >
		<c:choose>
			<c:when test="${i.index == nowPage}">
	 			<li class="now">${i.index}</li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/master/mastercShop?name=${name }&cPage=${i.index}">${i.index}</a></li>
			</c:otherwise>
		</c:choose> 
 	</c:forEach>
 	<c:choose>
		<c:when test="${endPage >= totalPage }">
			<li class="disable">다음으로</li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li><li><a href="${pageContext.request.contextPath}/master/mastercShop?name=${name }&cPage=${nowPage+pagePerBlock }">다음으로</a></li>
		</c:when>
		<c:otherwise>
     		<li><li><a href="${pageContext.request.contextPath}/master/mastercShop?name=${name }&cPage=${totalPage }">다음으로</a></li>
		</c:otherwise>
 	</c:choose>
</ol>
</td>
</tr>
</tfoot>
</table>
<script type="text/javascript">
   	function checkconfirm() {
		if(confirm('해당 가게를 승인하시겠습니까?')){
			return true;
		}else{
			return false;
		}
	}
		
	function checkreject() {
		if(confirm('해당 가게를 승인거부하시겠습니까?')){
			return true;
		}else{
			return false;
		}
	}
</script>
	
        
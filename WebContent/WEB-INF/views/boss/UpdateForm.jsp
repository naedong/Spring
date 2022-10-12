<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="upset" method="get">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th colspan="2"  class="text-center">가게정보</th>
			<tr>
			<tr>
				<th>사업자등록번호</th>
				<td> ${sho.snum }</td>
			</tr>
			<tr>
				<th>매장명</th>
				<td> ${sho.sname }</td>
				<td style="visibility: hidden;" colspan="2" id="target1">
					<input type="text"  id="sname" name="sname"/>
				</td>
			</tr>
			<tr>
				<th>매장위치</th>
				<td id="target2"> ${sho.sloc }</td>
				<td style="visibility: hidden;" colspan="2" id="target2">
					<input type="text"  id="sloc" name="sloc"/>
				</td>
			</tr>
			<tr>
				<th>매장분류</th>
				<td id="target3"> ${sho.scate }</td>
				<td style="visibility: hidden;" colspan="2" id="target3">
					<input type="text"  id="scate" name="scate"/>
				</td>
			</tr>	
			<tr>
				<th>관리구분</th>
				<td id="target4">	
					<c:if test="${sho.onoff == 'on'}">온라인</c:if>
					<c:if test="${sho.onoff == 'off'}">오프라인</c:if>
					<c:if test="${sho.onoff == 'on/off'}">온라인/오프라인</c:if>
				</td>
			</tr>
			<tr>
				<th>관리자 승인상태</th>
				<td>${sho.ctf}</td>
			</tr>		
			<tr>
				<th>가입신청일</th>
				<td>${sho.sdate}</td>
			</tr>
						
		</thead>
		<tfoot>
			<tr>
				<td colspan="3" class="text-right">
					<input type="submit" class="btn btn-primary" value="수정완료">
				</td>
			</tr>
		</tfoot>
	</table>
</form>

</body>
<script>
	
</script>
</html>
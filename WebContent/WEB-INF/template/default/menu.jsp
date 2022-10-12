<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mycontext" value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-expand-sm mybgColor">
<div>
		<form method="get" action="${pageContext.request.contextPath}/main/searchf" accept-charset="utf-8">
			
			<select name="type" style="color: black;" >
				<option selected value="sname">검색 내용</option>
				<option value="sname">상호명</option>
				<option value="sloc">지역명</option>
			</select> 
			
				<input type="text" id="keyword" name="keyword" style="color:#000;">
			<input type="submit" class="btn btn-outline-primary mr-2" value="검색"></input>
		</form>
	</div>

</nav>

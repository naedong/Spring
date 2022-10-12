<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
  color: map-get($colors, white);
  font: 100 100%/1.6 "Heebo", sans-serif;
  overflow-x: hidden;
  width: 100%;
}
</style>
<c:set var="mycontext" value="${pageContext.request.contextPath}" />

	<c:choose>
		<c:when test="${sessionScope.sessionId == null }">
			<div class="p-2 bg-warning">
				<a href="${mycontext}/login/loginForm"
					class="nav-link text-white" id="item2">Login</a>
			</div>
			<div class="p-2 bg-primary">
				<a href="${mycontext}/user/userForm"
					class="nav-link text-white" id="item3">회원가입</a>
			</div>
		</c:when>
		<c:when test="${sessionScope.sessionId != null }">
			<div class="p-2 bg-warning">
				<a href="${mycontext}/login/logout"
					class="nav-link text-white" id="item2">Logout</a>
			</div>
			<div class="p-2 bg-primary">
			<c:choose>
				<c:when test="${sessionScope.sessionTier == 'boss'}">
					<a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/mypage?uno=${sessionScope.sessionNum}" class="nav-link text-white" id="item3">MyPage</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/mypage" class="nav-link text-white" id="item3">MyPage</a>
				</c:otherwise>
			</c:choose>
			</div>
		</c:when>
	</c:choose>
	
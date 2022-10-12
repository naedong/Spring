<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	${sessionScope.sessionId }님의 MYPAGE에 오신걸 환영합니다. 사업장관리 회원이십니다.

	<c:choose>
		<c:when test="${sho.ctf == null }">
				<div class="p-2 bg-warning"><a href="${pageContext.request.contextPath}/boss/entry?uno=${sessionScope.sessionNum }" class="nav-link text-white" id="item2">가게 등록</a></div>
			</div>
		</c:when>
		<c:when test="${sho.ctf == '승인'}">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="2" class="text-center">가게정보</th>
					<tr>
					<tr>
						<th>사업자등록번호</th>
						<td>${sho.snum }</td>
					</tr>
					<tr>
						<th>매장명</th>
						<td id="td1">${sho.sname }
							<form action="upSname" method="post" style="display: none;" id="snameform" accept-charset="EUC-KR">
							<input type="hidden" id="uno" name="uno" value="${sessionScope.sessionNum }">
							<input type="hidden" id="snum" name="snum" value="${sho.snum }">
								<div class="input-group w-75 h-75 ">
									<input type="text" id="sname" name="sname" class="form-control" placeholder="매장명 수정"
										aria-label="매장명 수정" aria-describedby="upbtn1">
									<button class="btn btn-outline-secondary" type="submit" id="upbtn1">수정</button>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<th>매장위치</th>
						<td id="td2">${sho.sloc }
						
						<form action="upSloc" method="post" style="display: none;" id="slocform" accept-charset="EUC-KR">
							<input type="hidden" id="uno" name="uno" value="${sessionScope.sessionNum }">
							<input type="hidden" id="snum" name="snum" value="${sho.snum }">
							<input type="hidden" id="sloc" name="sloc" value=""/>
							<div class="input-group w-75 h-75 ">
								<input type="text" id="zipNo" name="post" class="form-control" placeholder="우편번호"
										aria-label="우편번호" aria-describedby="upbtn2">
								<button class="btn btn-outline-secondary" type="button" id="upbtn2" onClick="goPopup();">
								<i class="fa fa-search"></i>주소검색</button>						
							
							</div>
			
							<div class="input-group mt-0 w-75 h-75">
								<input type="text" id="roadFullAddr" name="address" class="form-control" placeholder="상세주소"
											aria-label="상세주소" aria-describedby="upbtn3">
								<button class="btn btn-outline-secondary" type="submit" id="upbtn3">수      정</button>
							</div>
						</form>
						</td>
					</tr>
					<tr>
						<th>매장분류</th>
						<td id="td3">${sho.scate }
							<form action="upScate" method="post" style="display: none;" id="scateform" accept-charset="EUC-KR">
							<input type="hidden" id="uno" name="uno" value="${sessionScope.sessionNum }">
							<input type="hidden" id="snum" name="snum" value="${sho.snum }">
								<div class="input-group w-75 h-75 ">
									<input type="text" id="scate" name="scate" class="form-control" placeholder="매장분류 수정"
										aria-label="매장분류 수정" aria-describedby="upbtn4">
									<button class="btn btn-outline-secondary" type="submit" id="upbtn4">수정</button>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<th>관리구분</th>
						<td><c:if test="${sho.onoff == 'on'}">온라인</c:if> <c:if
								test="${sho.onoff == 'off'}">오프라인</c:if> <c:if
								test="${sho.onoff == 'on/off'}">온라인/오프라인</c:if></td>
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
						<td colspan="2" class="text-center">
							<h3>*매장정보를 수정하려면 해당하는 컬럼을 클릭*</h3>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="p-2 bg-warning">
				<a
					href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/sinfoList?snum=${sho.snum}"
					class="nav-link text-white" id="item2">재고관리</a>
			</div>
			<div class="p-2 bg-primary">
				<a
					href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/sinfoForm"
					class="nav-link text-white" id="item3">재고등록</a>
			</div>
		</c:when>
		
		<c:when test="${sho.ctf == '대기'}">
			<h2>현재 회원님이 등록하신 매장은 신청대기중입니다.</h2>
		</c:when>
	</c:choose>
</body>

<script type="text/javascript">
	function alert() {
		alert('수정되었습니다.');
	}
	
	$('#td1').click(function() {
		$('#snameform').css('display', 'inline');
	});
	$('#td2').click(function() {
		$('#slocform').css('display', 'inline');
	});
	$('#td3').click(function() {
		$('#scateform').css('display', 'inline');
	});
	
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(addressAPIPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("adressPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(addressAPIPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/addressAPIPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
			bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm,
			rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

		var address1 = document.querySelector("#zipNo");
		address1.value = zipNo;

		var address2 = document.querySelector("#roadFullAddr");
		address2.value = roadFullAddr;

		var address3 = document.querySelector('#sloc');
		address3.value = zipNo + ", " + roadFullAddr;
	}
</script>
</html>
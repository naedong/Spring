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
	${sessionScope.sessionId }���� MYPAGE�� ���Ű� ȯ���մϴ�. �������� ȸ���̽ʴϴ�.

	<c:choose>
		<c:when test="${sho.ctf == null }">
				<div class="p-2 bg-warning"><a href="${pageContext.request.contextPath}/boss/entry?uno=${sessionScope.sessionNum }" class="nav-link text-white" id="item2">���� ���</a></div>
			</div>
		</c:when>
		<c:when test="${sho.ctf == '����'}">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="2" class="text-center">��������</th>
					<tr>
					<tr>
						<th>����ڵ�Ϲ�ȣ</th>
						<td>${sho.snum }</td>
					</tr>
					<tr>
						<th>�����</th>
						<td id="td1">${sho.sname }
							<form action="upSname" method="post" style="display: none;" id="snameform" accept-charset="EUC-KR">
							<input type="hidden" id="uno" name="uno" value="${sessionScope.sessionNum }">
							<input type="hidden" id="snum" name="snum" value="${sho.snum }">
								<div class="input-group w-75 h-75 ">
									<input type="text" id="sname" name="sname" class="form-control" placeholder="����� ����"
										aria-label="����� ����" aria-describedby="upbtn1">
									<button class="btn btn-outline-secondary" type="submit" id="upbtn1">����</button>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<th>������ġ</th>
						<td id="td2">${sho.sloc }
						
						<form action="upSloc" method="post" style="display: none;" id="slocform" accept-charset="EUC-KR">
							<input type="hidden" id="uno" name="uno" value="${sessionScope.sessionNum }">
							<input type="hidden" id="snum" name="snum" value="${sho.snum }">
							<input type="hidden" id="sloc" name="sloc" value=""/>
							<div class="input-group w-75 h-75 ">
								<input type="text" id="zipNo" name="post" class="form-control" placeholder="�����ȣ"
										aria-label="�����ȣ" aria-describedby="upbtn2">
								<button class="btn btn-outline-secondary" type="button" id="upbtn2" onClick="goPopup();">
								<i class="fa fa-search"></i>�ּҰ˻�</button>						
							
							</div>
			
							<div class="input-group mt-0 w-75 h-75">
								<input type="text" id="roadFullAddr" name="address" class="form-control" placeholder="���ּ�"
											aria-label="���ּ�" aria-describedby="upbtn3">
								<button class="btn btn-outline-secondary" type="submit" id="upbtn3">��      ��</button>
							</div>
						</form>
						</td>
					</tr>
					<tr>
						<th>����з�</th>
						<td id="td3">${sho.scate }
							<form action="upScate" method="post" style="display: none;" id="scateform" accept-charset="EUC-KR">
							<input type="hidden" id="uno" name="uno" value="${sessionScope.sessionNum }">
							<input type="hidden" id="snum" name="snum" value="${sho.snum }">
								<div class="input-group w-75 h-75 ">
									<input type="text" id="scate" name="scate" class="form-control" placeholder="����з� ����"
										aria-label="����з� ����" aria-describedby="upbtn4">
									<button class="btn btn-outline-secondary" type="submit" id="upbtn4">����</button>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<th>��������</th>
						<td><c:if test="${sho.onoff == 'on'}">�¶���</c:if> <c:if
								test="${sho.onoff == 'off'}">��������</c:if> <c:if
								test="${sho.onoff == 'on/off'}">�¶���/��������</c:if></td>
					</tr>
					<tr>
						<th>������ ���λ���</th>
						<td>${sho.ctf}</td>
					</tr>
					<tr>
						<th>���Խ�û��</th>
						<td>${sho.sdate}</td>
					</tr>

				</thead>
				<tfoot>
					<tr>
						<td colspan="2" class="text-center">
							<h3>*���������� �����Ϸ��� �ش��ϴ� �÷��� Ŭ��*</h3>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="p-2 bg-warning">
				<a
					href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/sinfoList?snum=${sho.snum}"
					class="nav-link text-white" id="item2">������</a>
			</div>
			<div class="p-2 bg-primary">
				<a
					href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/sinfoForm"
					class="nav-link text-white" id="item3">�����</a>
			</div>
		</c:when>
		
		<c:when test="${sho.ctf == '���'}">
			<h2>���� ȸ������ ����Ͻ� ������ ��û������Դϴ�.</h2>
		</c:when>
	</c:choose>
</body>

<script type="text/javascript">
	function alert() {
		alert('�����Ǿ����ϴ�.');
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
		// �ּҰ˻��� ������ �˾� �������� ȣ���մϴ�.
		// ȣ��� ������(addressAPIPopup.jsp)���� ���� �ּҰ˻�URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)�� ȣ���ϰ� �˴ϴ�.
		var pop = window.open("adressPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// ����� ���� ���, ȣ��� ������(addressAPIPopup.jsp)���� ���� �ּҰ˻�URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)�� ȣ���ϰ� �˴ϴ�.
		//var pop = window.open("/popup/addressAPIPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
			bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm,
			rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// �˾����������� �ּ��Է��� ������ �޾Ƽ�, �� �������� ������ ����մϴ�.

		var address1 = document.querySelector("#zipNo");
		address1.value = zipNo;

		var address2 = document.querySelector("#roadFullAddr");
		address2.value = roadFullAddr;

		var address3 = document.querySelector('#sloc');
		address3.value = zipNo + ", " + roadFullAddr;
	}
</script>
</html>
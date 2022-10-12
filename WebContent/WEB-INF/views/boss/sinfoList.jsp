<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
	td img{
		width : 80px;
	}
</style>
<head>
<meta charset="EUC-KR">
<title>�����Ʈ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>��ǰ�̹���</th>
				<th>�� ǰ ��</th>
				<th>����</th>
				<th>���</th>
				<th>����հ�</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${list }" varStatus="state">
				<tr>
					<td><a href="#"><img src="${pageContext.request.contextPath}/resources/imagefile/${e.imgn }"></a></td>
					
					<td class="align-middle text-center td1">${e.iname }
						<form action="upIname" method="post" style="display: none;" class="upiname" accept-charset="EUC-KR">
						<input type="hidden" id="snum" name="snum" value="${snum }">
						<input type="hidden" name="inum" value="${e.inum }">
							<div class="input-group">
								<input type="text" id="iname" name="iname" class="form-control" placeholder="��ǰ�� ����" aria-label="��ǰ�� ����" aria-describedby="upbtn1">
								<button class="btn btn-outline-secondary" type="submit" id="upbtn1">����</button>
							</div>
						</form>
					</td>
					
					<td class="align-middle text-center td2">${e.iprice }��
						<form action="upIprice" method="post" style="display: none;" class="upiprice" accept-charset="EUC-KR">
						<input type="hidden" id="snum" name="snum" value="${snum }">
						<input type="hidden" name="inum" value="${e.inum }">
							<div class="input-group">
								<input type="text" id="iprice" name="iprice" class="form-control" placeholder="���� ����(����:��)" aria-label="���� ����(����:��)" aria-describedby="upbtn2">
								<button class="btn btn-outline-secondary" type="submit" id="upbtn2">����</button>
							</div>
						</form>
					</td>
					
					<td class="align-middle text-center td3">X ${e.istoke }
						<form action="upIstoke" method="post" style="display: none;" class="upistoke" accept-charset="EUC-KR">
						<input type="hidden" id="snum" name="snum" value="${snum }">
						<input type="hidden" name="inum" value="${e.inum }">
							<div class="input-group">
							<input class="form-control" type="number" id="istoke" name="istoke" spinner ng-model="$scope.someNumber" step="1" min="1" max="300" 
							aria-describedby="upbtn3" value="1"/>
								<button class="btn btn-outline-secondary" type="submit" id="upbtn3">����</button>
							</div>
						</form>
					</td>
					<td class="align-middle text-center"><c:out value="${e.iprice * e.istoke }"/>��</td>
				</tr>
			</c:forEach>
		</tbody>

		<tfoot>
			<tr>
				<td colspan="5">${startPage}/${endPage }
					<ol class="paging">
						<c:choose>
							<c:when test="${startPage < 6}">
								<li class="disable">��������</li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/master/masterList?cPage=${nowPage-pagePerBlock}">��������</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach varStatus="i" begin="${startPage}" end="${endPage }" step="1">
							<c:choose>
								<c:when test="${i.index == nowPage}">
									<li class="now">${i.index}</li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/master/masterList?cPage=${i.index}">${i.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${endPage >= totalPage }">
								<li class="disable">��������</li>
							</c:when>
							<c:when test="${totalPage > (nowPage+pagePerBlock)}">
								<li>
								<li><a href="${pageContext.request.contextPath}/master/masterList?cPage=${nowPage+pagePerBlock }">��������</a></li>
							</c:when>
							<c:otherwise>
								<li>
								<li><a
									href="${pageContext.request.contextPath}/master/masterList?cPage=${totalPage }">��������</a></li>
							</c:otherwise>
						</c:choose>
					</ol>
				</td>
			</tr>
		</tfoot>
	</table>

</body>
<script>
	$('.td1').click(function() {
		$(this).children('.upiname').css('display', 'inline');
	});
	$('.td2').click(function() {
		$(this).children('.upiprice').css('display', 'inline');
	});
	$('.td3').click(function() {
		$(this).children('.upistoke').css('display', 'inline');
	});
</script>
</html>
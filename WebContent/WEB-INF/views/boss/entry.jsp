<%@page import="java.sql.Date"%>
<%@page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ȸ������</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.btn-space {
	margin-right: 5px;
}
</style>
</head>

<body>
	<article class="container w-100">
	<div class="page-header">
		<center>
			<h1>
				<a onclick="return false; location.reload()"
					style="cursor: pointer;"><b>������</b></a>
			</h1>
		</center>
		<div class="col-md-6 col-md-offset-3"></div>
	</div>

	<hr>
	<form action="entryShop" method="post">
		<div class="col-sm-6 col-md-offset-3">


		
			<div class="form-group">
				<label for="uno">ȸ�� ��ȣ</label> <input type="text"
					class="form-control" id="uno" name="uno"
					readonly="readonly"	placeholder="${uno }" value="${uno }">

			</div>


			<div class="form-group">
				<label for="sname">���Ը�</label> <input type="text"
					class="form-control" id="sname" name="sname"
					placeholder="�̸��� �Է��� �ּ���">

			</div>

			<div class="form-group">
				<label for="snum">����ڵ�Ϲ�ȣ</label> <input type="text"
					class="form-control" id="snum" name="snum" placeholder="����ڵ�Ϲ�ȣ �Է�">
			</div>

			<div class="form-group">
				<label for="scate">ī�װ�</label> <input type="text"
					class="form-control" id="scate" name="scate" placeholder="ī�װ�">
			</div>

			<div class="form-group">
				<label>���� ���</label> <input type="hidden" id="onoff" name="onoff"
					value="">
				<%-- onoff --%>
				<div class="form-control">
					<label class="radio-inline"> <input type="radio"
						name="ck_onoff" value="on"> �¶���
					</label> <label class="radio-inline"> <input type="radio"
						name="ck_onoff" value="off"> ��������
					</label> <label class="radio-inline"> <input type="radio"
						name="ck_onoff" value="on/off"> ���
					</label>
				</div>
			</div>

			<div class="form-group">
				<input type="hidden" id="sloc" name="sloc" value="" />
				<%-- sloc --%>
				<label>�ּ�</label> <input type="text" class="form-control" id="zipNo"
					name="post" placeholder="�����ȣ">
				<button class="btn btn-default" type="button" onClick="goPopup();">
					<i class="fa fa-search"></i>�ּҰ˻�
				</button>
			</div>

			<div class="form-group" style="margin-top: 0px;">
				<input type="text" class="form-control" id="roadFullAddr"
					name="address" placeholder="���ּ�" />
			</div>


			<div class="form-group text-center">
				<button type="submit" id="join-submit"
					class="btn btn-primary btn-space">
					������<i class="fa fa-check spaceLeft"></i>
				</button>

				<button type="button" class="btn btn-danger"
					onClick="location.href='mypage'">
					���<i class="fa fa-check spaceLeft"></i>
				</button>

			</div>
		</div>
	</form>
	</article>
	<hr>

	<script>
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

		$('input:radio[name=ck_onoff]').change(function() {

			if (this.checked) {
				$('#onoff').attr('value', $(this).val());
			}
		});
	</script>
</body>
</html>
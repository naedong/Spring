<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="imgUrl" value="${pageContext.request.contextPath}/resources/image"/>
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <TITLE> New Document </TITLE>
  <meta charset="euc-kr">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${mycontext}/resources/css/style.css"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
		<script
    	 src="//d3js.org/d3.v3.min.js"></script>
        <meta charset="euc-kr" />
        <title>koreaMap</title>
        <link 
        rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/korea.css" />
    </head>
      
    <script
     type="text/javascript" src="${pageContext.request.contextPath}/resources/js/d3.js"></script>
     

 <style>
select.btn-mini {
    height: auto;
    width : 200px;
    line-height: 14px;
}
.card {
    
    border: none;
    box-shadow: 5px 6px 6px 2px #e9ecef;
    border-radius: 4px;
}
.dots{
  height: 4px;
  width: 4px;
  margin-bottom: 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}

.badge{
    padding: 7px;
    padding-right: 9px;
    padding-left: 16px;
    box-shadow: 5px 6px 6px 2px #e9ecef;
}

.user-img{
    margin-top: 4px;
}

.check-icon{
    font-size: 17px;
    color: #c3bfbf;
    top: 1px;
    position: relative;
    margin-left: 3px;
}
.form-check-input{
    margin-top: 6px;
    margin-left: -24px !important;
    cursor: pointer;
}
.form-check-input:focus{
    box-shadow: none;
}


.icons i{
    margin-left: 8px;
}
.reply{
    margin-left: 12px;
}

.reply small{
    color: #b7b4b4;
}
.reply small:hover{
    color: green;
    cursor: pointer;
}
.bgGr1 {
	background-color: #0d6efd
}
.bgGr2 {
	background-color: #ffc107
}
.bgGr3 {
	background-color: #0dcaf0
}
#colTitle{
	background-color: #000000;
}

.mytable-condensed{
  font-size: 11px;
}

a:link{text-decoration: none;}
    table img { width: 80px;}
        /* paging */

    table tfoot ol.paging {
        margin-left:30%;
        list-style:none;
    }

    table tfoot ol.paging li {
        float:left;
        margin-right:8px;
    }

    table tfoot ol.paging li a {
        display:block;
        padding:3px 7px;
        border:1px solid #00B3DC;
        color:#2f313e;
        font-weight:bold;
    }

    table tfoot ol.paging li a:hover {
        background:#00B3DC;
        color:white;
        font-weight:bold;
    }

    .disable {
        padding:3px 7px;
        border:1px solid silver;
        color:silver;
    }

    .now {
       padding:3px 7px;
        border:1px solid #ff4aa5;
        background:#ff4aa5;
        color:white;
        font-weight:bold;
    }
 </style>
<script>
$(function(){
	$('#searchv').focusin(function() {
		$(this).val("�˻��� �Է�")
	});
	
	$('#searchv').focusout(function() {
		$(this).val("")
	});
});
</script>
 </head>
 <body>
<header class="text-white text-center">
	<%-- header �ȿ� ��� �޴� ��Ʈ�� : template�� header.jsp�� ����ǵ��� �̸��� ���� --%>
	<tiles:insertAttribute name="header"/>
	<%-- Carousel --%>
	<tiles:insertAttribute name="carousel"/>
</header>
	
	<%-- menu ���� --%>
	<tiles:insertAttribute name="menu"/>
	<%-- menu ���� --%>
	<tiles:insertAttribute name="body" />	
	<%-- footer ���� --%>
	<tiles:insertAttribute name="footer"/>
</body>
</html>
	
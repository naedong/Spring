<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예상매출그래프</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/expectsales.css?after"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="abc" style="display:flex; justify-content: center;">
        <div id="container" >
        </div>  
    </div>

	<p class="highcharts-description">
	Chart showing a combination of a
	column and a line chart, using multiple y-axes. Using multiple axes
	allows for data within different ranges to be visualized together.
	</p>
</body>

<script>
	var sname = [];
	var idx = 0;
	<c:forEach items="${list}" var="e" step="1">
		sname[idx] = '${e.sname}';
		idx++;
	</c:forEach>
	
	Highcharts.chart('container', {
		  chart: {
		    zoomType: 'xy'
		  },
		  title: {
		    text: '<b>매출 및 평균가</b>'
		  },
		  subtitle: {
		    text: '매장별 예상매출액과 상품평균가를 명시합니다.'
		  },
		  xAxis: [{
		    categories: sname,
		    crosshair: true
		  }],
		  yAxis: [{ // Primary yAxis
		    labels: {
		      format: '￦ {value}',
		      style: {
		        color: Highcharts.getOptions().colors[1]
		      }
		    },
		    title: {
		      text: '상품평균가',
		      style: {
		        color: Highcharts.getOptions().colors[1]
		      }
		    }
		  }, { // Secondary yAxis
		    title: {
		      text: '예상매출액',
		      style: {
		        color: Highcharts.getOptions().colors[0]
		      }
		    },
		    labels: {
		      format: '￦ {value}',
		      style: {
		        color: Highcharts.getOptions().colors[0]
		      }
		    },
		    opposite: true
		  }],
		  tooltip: {
		    shared: true
		  },
		  legend: {
		    layout: 'vertical',
		    align: 'left',
		    x: 120,
		    verticalAlign: 'top',
		    y: 100,
		    floating: true,
		    backgroundColor:
		      Highcharts.defaultOptions.legend.backgroundColor || // theme
		      'rgba(255,255,255,0.25)'
		  },
		  series: [{
		    name: '예상매출',
		    type: 'column',
		    yAxis: 1,
		    data: 
		    [<c:forEach items="${list}" var="e" step="1">
		    	${e.expect/10000},
		    </c:forEach>],
		    tooltip: {
		      valueSuffix: '만원'
		    }
	
		  }, {
		    name: '상품평균',
		    type: 'spline',
		    data: 
		    [<c:forEach items="${list}" var="e" step="1">
		    	${e.avg/10000},
		    </c:forEach>],
		    tooltip: {
		      valueSuffix: '만원'
		    }
		  }]
		});
	
<%--
$('.highcharts-point').click(function() {
	<c:forEach items="${list}" var="e" step="1">
		${e.snum}
	</c:forEach>]
	window.location = 'boss/sinfoList?snum=${list.snum}';
})--%>
</script>
</html>
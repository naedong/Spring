<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/piechart.css" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<figure class="highcharts-figure">
		<div id="container"></div>
		<p class="highcharts-description">
			Variable radius pie charts can
			be used to visualize a second dimension in a pie chart. In this
			chart, the more densely populated countries are drawn further out,
			while the slice width is determined by the size of the country.
		</p>
	</figure>
</body>

<script>
Highcharts.chart('container', {
	  chart: {
	    type: 'variablepie'
	  },
	  title: {
	    text: '<b>전국 유동인구</b>'
	  },
	  tooltip: {
	    headerFormat: '',
	    pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
	      'Area (square km): <b>{point.y}</b><br/>' +
	      'Population density (people per square km): <b>{point.z}</b><br/>'
	  },
	  series: [{
	    minPointSize: 10,
	    innerSize: '20%',
	    zMin: 0,
	    name: 'countries',
	    data: [{
		  name: '제주',
		  y: 1414,
		  z: 100.6
		},{
	      name: '세종',
	      y: 1616,
	      z: 108.6
	    }, {
	      name: '울산',
	      y: 2121,
	      z: 111.6
	    }, {
	      name: '경기도',
	      y: 2727,
	      z: 119.6
	    }, {
	      name: '강원도',
	      y: 3131,
	      z: 122.6
	    }, {
	      name: '충청북도',
	      y: 3333,
	      z: 125.6
	    }, {
	      name: '전라북도',
	      y: 3636,
	      z: 133.6
	    }, {
	      name: '전라남도',
	      y: 3636,
	      z: 136.6
	    },{
		  name: '충청남도',
		  y: 4444,
		  z: 139.6	
	    },{
		  name: '경상북도',
		  y: 5353,
		  z: 147.6
	    },{
	      name: '대구',
		  y: 5454,
		  z: 150.6
	    },{
	      name: '광주',
		  y: 5555,
		  z: 158.6
	    },{
	      name: '인천',
		  y: 5555,
		  z: 161.6
	    },{
      	  name: '대전',
		  y: 5656,
		  z: 164.6
	    },{
	   	  name: '경상남도',
		  y: 6767,
		  z: 172.6
	    },{
	      name: '부산',
		  y: 8787,
		  z: 190.6
	    },{
	      name: '서울',
		  y: 140140,
		  z: 92.6
	    }]
	  }]
	});
</script>
</html>
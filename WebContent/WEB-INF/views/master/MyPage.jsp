<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
 <link 
        rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/korea.css" />
    </head>
    <script
     type="text/javascript" src="${pageContext.request.contextPath}/resources/js/d3.js"></script>
     			  <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	<script
    	 src="//d3js.org/d3.v3.min.js"></script>
<title>관리자페이지</title>
</heed>
<body>

${sessionScope.sessionId }님의  MYPAGE에 오신걸 환영합니다.
현재 등록된 자영업자 입니다.  
${totalRecord } 명입니다.
	
	<div class="p-2 bg-primary"><a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/shopList" class="nav-link text-white" id="item3">매장 리스트</a></div>
	<div class="p-2 bg-primary"><a href="${pageContext.request.contextPath}/${sessionScope.sessionTier}/expect" class="nav-link text-white" id="item3">매장별 매출</a></div>
	<div class="p-2 bg-primary"><a href="${pageContext.request.contextPath}/user/userList" class="nav-link text-white" id="item3">가입자 리스트</a></div>
	<div class="p-2 bg-primary"><a href="${pageContext.request.contextPath}/log/logList" class="nav-link text-white" id="item3">로그 기록</a></div>		    
	<div class="p-2 bg-primary"><a href="${pageContext.request.contextPath}/master/email" class="nav-link text-white" id="item3">이메일 작성</a></div>	
     
       
<script type="text/javascript">
    window.onload = function() {
        drawMap('#container');
    };

    function drawMap(target) {
        var width = 700; 
        var height = 700; 
        var initialScale = 5500; 
        var initialX = -11900; 
        var initialY = 4050; 
        var labels;

        var projection = d3.geo
            .mercator()
            .scale(initialScale)
            .translate([initialX, initialY]);
        var path = d3.geo.path().projection(projection);
        var zoom = d3.behavior
            .zoom()
            .translate(projection.translate())
            .scale(projection.scale())
            .scaleExtent([height, 800 * height])
            .on('zoom', zoom);

        var svg = d3
            .select(target)
            .append('svg')
            .attr('width', width + 'px')
            .attr('height', height + 'px')
            .attr('id', 'map')
            .attr('class', 'map');

        var states = svg
            .append('g')
            .attr('id', 'states')
            .call(zoom);

        states
            .append('rect')
            .attr('class', 'background')
            .attr('width', width + 'px')
            .attr('height', height + 'px');

        d3.json('${pageContext.request.contextPath}/resources/json/korea.json', function(json) {
            states
                .selectAll('path') //지역 설정
                .data(json.features)
                .enter()
                .append('path')
                .attr('d', path)
                .attr('id', function(d) {
                    return 'path-' + d.properties.name_eng;
                });
            labels = states
                .selectAll('text')
                .data(json.features) //라벨표시
                .enter()
                .append('text')
                .attr('transform', translateTolabel)
                .attr('id', function(d) {
                    return 'label-' + d.properties.name_eng;
                })
                .attr('text-anchor', 'middle')
                .attr('dy', '.35em')
                .on('click', d => {
                	console.log(d)
                	location="mastercShop?cPage=1&name="+d.properties.name_eng;
                })
                .text(function(d) {
                    return d.properties.name_eng;
                });
            
            
        });
  		
        
      

        function translateTolabel(d) {
            var arr = path.centroid(d);
            if (d.properties.code == 31) {
                arr[1] +=
                    d3.event && d3.event.scale
                        ? d3.event.scale / height + 20
                        : initialScale / height + 20;
            } else if (d.properties.code == 34) {

                arr[1] +=
                    d3.event && d3.event.scale
                        ? d3.event.scale / height + 10
                        : initialScale / height + 10;
            }
            return 'translate(' + arr + ')';
        }

        function zoom() {
            projection.translate(d3.event.translate).scale(d3.event.scale);
            states.selectAll('path').attr('d', path);
            labels.attr('transform', translateTolabel);
        }
    }
    
   
    </script>

    
    

	<div style="display:flex; justify-content: center;">
        <div id="container">
    	</div>
	</div>
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
	    
	    data: [
	    <c:forEach items="${list}" var="e" step="1">{ 
	      name: '${e.ploc}',
		  y: ${e.ydata},
		  z: ${e.xdata}
		  },</c:forEach>
	    ]
	  }]
	});
</script>
	
</body>
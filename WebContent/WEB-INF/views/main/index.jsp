<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>Bteam핵심 메인</title>
</head>
<body>

	<%-- 여기까지 헤더 --%>
	<h1>${sessionScope.sessionId }님환영합니다.</h1>
	<h1>회원번호는 ${sessionScope.sessionNum }</h1>
	<h1>등급은 ${sessionScope.sessionTier }입니다</h1>

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
                	location="user/usercShop?name="+d.properties.name_eng;
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
	<script>
		var apiURI = "https://api.openweathermap.org/data/2.5/weather?id=1835848&appid=f86baf9bddf3c35d74d50679068c6c86";
		$.ajax({
					url : apiURI,
					dataType : "json",
					type : "GET",
					async : "false",
					success : function(data) {
						console.log(data);
						console.log("현재온도 : " + (data.main.temp - 273.15));
						console.log("현재습도 : " + data.main.humidity);
						console.log("날씨 : " + data.weather[0].main);
						console.log("상세날씨설명 : " + data.weather[0].description);
						console.log("날씨 이미지 : " + data.weather[0].icon);
						console.log("바람   : " + data.wind.speed);
						console.log("나라   : " + data.sys.country);
						console.log("도시이름  : " + data.name);
						console.log("구름  : " + (data.clouds.all) + "%");
						var weather = Math.ceil((data.main.temp - 273.15));
						
						
							$('#1').html("오늘의 날씨는 "+data.weather[0].main+", 현재습도 : "+data.main.humidity
									+", 현재 온도는 "+weather+"도 , 상세 날씨 설명 "+data.weather[0].description
									+", 바람의 속도는 "+data.wind.speed+", 구름 량은"+ (data.clouds.all)+"%");
					}
				});
	</script>
	
	<br>
		<div id="test2">
			<h1 class="bg-primary text-center" style="color: white;">실시간 날씨 정보</h1>
	        <h3 id="1" class="bg-primary text-center" style="color: white;"></h3>
	
		</div>
	<br>

	<div id="container"></div>
</body>

</html>
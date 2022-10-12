<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style type="text/css">
#icon2{
    max-width : 100px;
    max-height : 100px;
}

#city{
    color : #efefef;
}

#temp{
    color : #efefef;
    margin-bottom : 24px;
}
</style>
</head>
<c:set var="imgUrl" value="${pageContext.request.contextPath}/resources/image"/>
<div id="demo" class="carousel slide" data-bs-ride="carousel">
	<!-- Indicators/dots -->
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
			class="active"></button>
		<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
	</div>
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
						var weather = data.weather[0].main;
						var temperature = Math.ceil((data.main.temp - 273.15));
						if (weather == 'Clear sky') {
							 $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						} else if(weather == 'Rain'){
							 $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						} else if(weather == 'Broken Clouds'){
							 $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						}else if(weather == 'Overcast Clouds'){
							 $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						}else if(weather == 'Shower Rain'){
							 $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						}else if(weather == 'Few Clouds'){
							 $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						}else if(weather == 'Scattered Clouds'){
							 $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						}else if(weather == 'Clouds'){
							 $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						} else if(weather == 'Mist'){
				             $('#city').html(data.name);
				             $('#city').css("color","#232323"); 
				             $('#img2').attr('src','${pageContext.request.contextPath}/resources/image/mist_bg.jpg');
				             $('#icon2').attr('src','${pageContext.request.contextPath}/resources/image/mist_icon.png');
				             $('#temp2').html(temperature);
				             $('#temp').css("color","#232323"); 
						}

					}
				});
	</script>
	<!-- The slideshow/carousel -->
	<div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/resources/image/d1.jpg" alt="Kosmo113" class="d-block" style="width:100%">
      <div class="carousel-caption">
        <h3><c:if test="${sessionScope.sessionName !=null}">${sessionScope.sessionName }님 반갑습니다 </c:if> </h3>
        <h3 >여기는  BT 홈페이지 입니다. </h3>
        <p>jQuery 를 이용하여 제공받은 샘플파일에서 아래 요구사항대로 구현합니다.</p>
      </div>
    </div>
    <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/resources/image/clearsky_bg.jpg"
                alt="JSP" class="d-block" style="width: 100%" id="img2">
            <div class="carousel-caption weather1">
                <h3 id="city"></h3>
                <img src="" id="icon2">
                <p> </p>
                <h5 id="temp"><span id= "temp2"></span> 33.6°C</h4>
            </div>
        </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/image/d3.jpg" alt="JSP" class="d-block" style="width:100%">
      <div class="carousel-caption">
        <h3><c:if test="${sessionScope.sessionName !=null}">${sessionScope.sessionName }님 반갑습니다</c:if> </h3>
        <h3>여기는  BT 홈페이지 입니다.</h3>
        <p>jQuery 를 이용하여 제공받은 샘플파일에서 아래 요구사항대로 구현합니다.</p>
      </div>  
    </div>
  </div>

	<!-- Left and right controls/icons -->
	<button class="carousel-control-prev" type="button"
		data-bs-target="#demo" data-bs-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#demo" data-bs-slide="next">
		<span class="carousel-control-next-icon"></span>
	</button>
</div>
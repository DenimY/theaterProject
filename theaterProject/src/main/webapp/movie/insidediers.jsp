<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/data/201010/IJ12875323685154/style.css" />
<script type="text/javascript" src="/data/201010/IJ12875323685154/packed.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
$(function() {
	  var inWrap = $('.inner-wrapper');
	  $('.prev').on('click', function() {
	    inWrap.animate({left: '0%'}, 300, function(){
	      inWrap.css('left', '-100%');
	      $('.slide').first().before($('.slide').last());
	    });
	  });
	  $('.next').on('click', function() {
	    inWrap.animate({left: '-200%'}, 300, function(){
	      inWrap.css('left', '-100%');
	      $('.slide').last().after($('.slide').first());
	    });
	  });
	})
</script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Montserrat');
::-moz-selection {
  background: transparent;
}
::selection {
  background: transparent;
}
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 60vh;
}
.slider-wrapper {
  width: 600px;
  height: 300px;
  overflow: hidden;
}
.inner-wrapper {
  width: 500%;
  height: 100%;
  position: relative;
  left: -100%;
}
.slide {
  width: calc(100% / 5);
  height: 100%;
  float: left;
  font-size: 100px;
  color: black;
  display: flex;
  justify-content: center;
  align-items: center;
}
.button {
  width: 30px;
  height: 30px;
  border-top: 2px solid black;
  position: absolute;
  cursor: pointer;
}
.prev {
  border-left: 2px solid black;
  left: 10%;
  transform: rotate(-45deg);
}
.next {
  border-right: 2px solid black;
  right: 10%;
  transform: rotate(45deg);
}
#header {
	width:30%;
	height:340px;
	float:left;
	padding-left:50px;
	padding-right:50px;
}
#header2 {
	height:340px;
}
#story {
	width: 100%;
	height:100px;
}
#stillcut{
	width:100%;
	height:200px; 
}
#movie {
	width:100%;
	height:100px;
}
</style>
</head>
<body>
	<div id="header"> <img src="./reservation/인시디어스.jpg" alt="사진엑박"></div>
	<div id="header2"><img alt="엑박" src="./logo/15.png" ><h2>인시디어스</h2><br>
	<strong>타입 :</strong> 디지털(자막)<br>
	<strong>개봉일 :</strong>  2018.01.31<br>	
	<strong>감독 :</strong> 애덤 로비텔<br>
	<strong>출연진 :</strong> 린 샤예, 스펜서 로크, 하비에르 보텟, 조시 스튜어트<br>
	<strong>장르 :</strong> 스릴러, 공포(호러), 미스터리 / 103 분<br><br><br>
	<input type=button style="width:60pt;height:30pt;" value="예매하기"></center>
	</div><br><br><br>
	
	<div id="story">
	<h2>줄거리</h2>
	자신의 집에서 기이한 일들이 일어난다는 한 남자의 전화를 받게 된 영매 엘리스(린 샤예). 
	찾아간 그 곳은 다름 아닌 자신이 어린 시절 살았던, 뉴멕시코의 고향집이다. 
	수십 년 만에 다시 찾은 집에서 벌어지는 정체불명의 사건을 파악하기 위해 나선 엘리스. 
	어린 시절 자신이 겪었던 기억하고 싶지 않은 공포와 마주하게 되는데… ‘인시디어스’ 시리즈가 시작된 그 집, 드디어 공포의 비밀이 밝혀진다! </div><br>
	<div id="stillcut">
	<div class="container">
    <div class="slider-wrapper">
    <div class="inner-wrapper">
        <div class="slide"><img src="./stillcut/인시디어스1.jpg"></div>
        <div class="slide"><img src="./stillcut/인시디어스2.jpg"></div>
        <div class="slide"><img src="./stillcut/인시디어스3.jpg"></div>
        <div class="slide"><img src="./stillcut/인시디어스4.jpg"></div>
        <div class="slide"><img src="./stillcut/인시디어스5.jpg"></div>
    </div>
    </div>
    <div class="button prev"></div>
    <div class="button next"></div>
  </div></div><br><br>
	<div id="movie">
		<center><video width="800" height="900" controls autoplay>
			<source src="./teaser/인시디어스.mp4" type='video/mp4'>
			<source src="./teaser/인시디어스.ogg" type="video/ogg">
		</video></center>
	</div>
</body>
</html>
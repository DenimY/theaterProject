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
	<div id="header"> <img src="./reservation/커뮤터.jpg" alt="사진엑박"></div>
	<div id="header2"><img alt="엑박" src="./logo/15.png" ><h2>커뮤터</h2><br>
	<strong>타입 :</strong> 디지털(자막), ATMOS(자막)<br>
	<strong>개봉일 :</strong> 2018.01.24<br>	
	<strong>감독 :</strong> 자움 콜렛 세라<br>
	<strong>출연진 :</strong> 리암 니슨, 베라 파미가, 패트릭 윌슨, 샘 닐<br>
	<strong>장르 :</strong> 액션 / 105 분<br><br><br>
	<input type=button style="width:60pt;height:30pt;" value="예매하기"></center>
	</div><br><br><br>
	
	<div id="story">
	<h2>줄거리</h2>
	제한 시간 30분, 가족이 인질로 잡힌 전직 경찰 마이클(리암 니슨)이 사상 최악의 열차 테러범들에게 맞서는 초대형 액션 블록버스터</div><br>
	<div id="stillcut">
	<div class="container">
    <div class="slider-wrapper">
    <div class="inner-wrapper">
        <div class="slide"><img src="./stillcut/커뮤터1.jpg"></div>
        <div class="slide"><img src="./stillcut/커뮤터2.jpg"></div>
        <div class="slide"><img src="./stillcut/커뮤터3.jpg"></div>
        <div class="slide"><img src="./stillcut/커뮤터4.jpg"></div>
        <div class="slide"><img src="./stillcut/커뮤터5.jpg"></div>
    </div>
    </div>
    <div class="button prev"></div>
    <div class="button next"></div>
  </div></div><br><br>
	<div id="movie">
		<center><video width="800" height="900" controls autoplay>
			<source src="./teaser/커뮤터.mp4" type='video/mp4'>
			<source src="./teaser/커뮤터.ogg" type="video/ogg">
		</video></center>
	</div>
</body>
</html>
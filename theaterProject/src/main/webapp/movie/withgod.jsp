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
	<div id="header"> <img src="./reservation/신과함께.jpg" alt="사진엑박"></div>
	<div id="header2"><img alt="엑박" src="./logo/all.png" ><h2>신과함께</h2><br>
	<strong>타입 :</strong> 디지털, 디지털배리어프리, 영문자막<br>
	<strong>개봉일 :</strong> 2017.12.20<br>	
	<strong>감독 :</strong> 김용화<br>
	<strong>출연진 :</strong> 하정우, 차태현,주지훈,김향기,마동석<br>
	<strong>장르 :</strong> 드라마, 판타지 / 139 분<br><br><br>
	<input type=button style="width:60pt;height:30pt;" value="예매하기"></center>
	</div><br><br><br>
	
	<div id="story">
	<h2>줄거리</h2>
	저승 법에 의하면, 모든 인간은 사후 49일 동안 7번의 재판을 거쳐야만 한다.살인, 나태, 거짓, 불의, 배신, 폭력, 천륜7개의 지옥에서 7번의 재판을 무사히 통과한 망자만이 환생하여 새로운 삶을 시작할 수 있다. 
	“김자홍 씨께선, 오늘 예정 대로 무사히 사망하셨습니다”화재 사고 현장에서 여자아이를 구하고 죽음을 맞이한 소방관 자홍, 그의 앞에 저승차사 해원맥과 덕춘이 나타난다. 자신의 죽음이 아직 믿기지도 않는데 덕춘은 정의로운 망자이자 귀인이라며 그를 치켜세운다. 
	저승으로 가는 입구, 초군문에서 그를 기다리는 또 한 명의 차사 강림, 그는 차사들의 리더이자 앞으로 자홍이 겪어야 할 7번의 재판에서 변호를 맡아줄 변호사이기도 하다.  
	누구나 가지만 아무도 본 적 없는 곳,2017년 새로운 세계의 문이 열린다!</div><br>
	<div id="stillcut">
	<div class="container">
    <div class="slider-wrapper">
    <div class="inner-wrapper">
        <div class="slide"><img src="./stillcut/신과함께1.jpg"></div>
        <div class="slide"><img src="./stillcut/신과함께2.jpg"></div>
        <div class="slide"><img src="./stillcut/신과함께3.jpg"></div>
        <div class="slide"><img src="./stillcut/신과함께4.jpg"></div>
        <div class="slide"><img src="./stillcut/신과함께5.jpg"></div>
    </div>
    </div>
    <div class="button prev"></div>
    <div class="button next"></div>
  </div></div><br><br>
	<div id="movie">
		<center><video width="800" height="900" controls autoplay>
			<source src="./teaser/신과함께.mp4" type='video/mp4'>
			<source src="./teaser/신과함께.ogg" type="video/ogg">
		</video></center>
	</div>
</body>
</html>
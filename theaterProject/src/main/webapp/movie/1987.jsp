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
	<div id="header"> <img src="./reservation/1987.jpg" alt="사진엑박"></div>
	<div id="header2"><img alt="엑박" src="./logo/15.png" ><h2>1987</h2><br>
	<strong>타입 :</strong> 디지털, 디지털배리어프리, 영문자막<br>
	<strong>개봉일 :</strong> 2017.12.27<br>	
	<strong>감독 :</strong> 장준환<br>
	<strong>출연진 :</strong> 김윤석, 유해진, 하정우, 김태리<br>
	<strong>장르 :</strong> 드라마 / 129 분<br><br><br>
	<input type=button style="width:60pt;height:30pt;" value="예매하기"></center>
	</div><br><br><br>
	
	<div id="story">
	<h2>줄거리</h2>
	“책상을 탁! 치니 억! 하고 죽었습니다” 1987년 1월, 경찰 조사를 받던 스물두 살 대학생이 사망한다.
	증거인멸을 위해 박처장(김윤석)의 주도 하에 경찰은 시신 화장을 요청하지만, 사망 당일 당직이었던 최검사(하정우)는 이를 거부하고 부검을 밀어붙인다.
	단순 쇼크사인 것처럼 거짓 발표를 이어가는 경찰. 그러나 현장에 남은 흔적들과 부검 소견은 고문에 의한 사망을 가리키고, 사건을 취재하던 윤기자(이희준)는 ‘물고문 도중 질식사’를 보도한다. 
	이에 박처장은 조반장(박희순)등 형사 둘만 구속시키며 사건을 축소하려 한다. 한편, 교도소에 수감된 조반장을 통해 사건의 진상을 알게 된 교도관 한병용(유해진)은
	이 사실을 수배 중인 재야인사에게 전달하기 위해 조카인 연희(김태리)에게 위험한 부탁을 하게 되는데… 한 사람이 죽고, 모든 것이 변화하기 시작했다.
	모두가 뜨거웠던 1987년의 이야기. </div><br>
	<div id="stillcut">
	<div class="container">
    <div class="slider-wrapper">
    <div class="inner-wrapper">
        <div class="slide"><img src="./stillcut/1987(1).jpg"></div>
        <div class="slide"><img src="./stillcut/1987(2).jpg"></div>
        <div class="slide"><img src="./stillcut/1987(3).jpg"></div>
        <div class="slide"><img src="./stillcut/1987(4).jpg"></div>
        <div class="slide"><img src="./stillcut/1987(5).jpg"></div>
    </div>
    </div>
    <div class="button prev"></div>
    <div class="button next"></div>
  </div></div><br><br>
	<div id="movie">
		<center><video width="800" height="900" controls autoplay>
			<source src="./teaser/1987.mp4" type='video/mp4'>
			<source src="./teaser/1987.ogg" type="video/ogg">
		</video></center>
	</div>
</body>
</html>
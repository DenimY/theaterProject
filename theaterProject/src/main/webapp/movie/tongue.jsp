<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<div id="header"> <img src="./reservation/염력.jpg" alt="사진엑박"></div>
	<div id="header2"><img alt="엑박" src="./logo/all.png" ><h2>염력</h2><br>
	<strong>타입 :</strong> 디지털<br>
	<strong>개봉일 :</strong>  2018.01.31<br>	
	<strong>감독 :</strong> 연상호<br>
	<strong>출연진 :</strong> 류승룡, 심은경<br>
	<strong>장르 :</strong> 코미디 / 101 분<br><br><br>
	<input type=button style="width:60pt;height:30pt;" value="예매하기"></center>
	</div><br><br><br>
	
	<div id="story">
	<h2>줄거리</h2>
	<부산행> 연상호 감독 
	이번엔 초능력이다!평범한 은행 경비원 ‘석헌’(류승룡).어느 날 갑자기 그의 몸에 이상한 변화가 찾아온다. 생각만으로 물건을 움직이는 놀라운 능력, 바로 염력이 생긴 것. 	
	한편, ‘민사장’(김민재)과 ‘홍상무’(정유미)에 의해 ‘석헌’의 딸, 청년 사장 ‘루미’(심은경)와 이웃들이 위기에 처하게 되고...‘석헌’과 ‘루미’, 그리고 변호사 ‘정현’(박정민)이 그들에 맞서며 놀라운 일이 펼쳐지는데...!
	어제까진 초평범, 하루아침에 초능력이제 그의 염력이 폭발한다!</div><br>
	<div id="stillcut">
	<div class="container">
    <div class="slider-wrapper">
    <div class="inner-wrapper">
        <div class="slide"><img src="./stillcut/염력1.jpg"></div>
        <div class="slide"><img src="./stillcut/염력2.jpg"></div>
        <div class="slide"><img src="./stillcut/염력3.jpg"></div>
        <div class="slide"><img src="./stillcut/염력4.jpg"></div>
        <div class="slide"><img src="./stillcut/염력5.jpg"></div>
    </div>
    </div>
    <div class="button prev"></div>
    <div class="button next"></div>
  </div></div><br><br>
	<div id="movie">
		<center><video width="800" height="900" controls autoplay>
			<source src="./teaser/염력.mp4" type='video/mp4'>
			<source src="./teaser/염력.ogg" type="video/ogg">
		</video></center>
	</div>
</body>
</html>
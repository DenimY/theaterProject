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
	<div id="header"> <img src="./reservation/내 세상.jpg" alt="사진엑박"></div>
	<div id="header2"><img alt="엑박" src="./logo/all.png" ><h2>그것만이 내 세상</h2><br>
	<strong>타입 :</strong> 디지털<br>
	<strong>개봉일 :</strong> 2018.01.17<br>	
	<strong>감독 :</strong> 최성현<br>
	<strong>출연진 :</strong> 이병헌, 윤여정, 박정민<br>
	<strong>장르 :</strong> 코미디, 드라마 / 120 분<br><br><br>
	<input type=button style="width:60pt;height:30pt;" value="예매하기"></center>
	</div><br><br><br>
	
	<div id="story">
	<h2>줄거리</h2>
	한때는 WBC 웰터급 동양 챔피언이었지만 지금은 오갈 데 없어진 한물간 전직 복서 '조하'(이병헌).우연히 17년 만에<br>
	 헤어진 엄마 '인숙'(윤여정)과 재회하고,숙식을 해결하기 위해 따라간 집에서듣지도 보지도 못했던 뜻밖의 동생 <br>
	'진태'(박정민)와 마주한다. 난생처음 봤는데… 동생이라고?라면 끓이기, 게임도 최고로 잘하지만 무엇보다 피아노에 천재적 재능을 지닌 서번트증후군 진태.
	조하는 입만 열면 "네~" 타령인 심상치 않은 동생을 보자 한숨부터 나온다.하지만 캐나다로 가기 위한 경비를 마련하기 전까지만 꾹 참기로 결심한 조하는
	결코 만만치 않은 불편한 동거생활을 하기 시작하는데… 살아온 곳도, 잘하는 일도, 좋아하는 것도 다른 두 형제가 만났다!</div><br>
	<div id="stillcut">
	<div class="container">
    <div class="slider-wrapper">
      <div class="inner-wrapper">
        <div class="slide"><img src="./stillcut/world1.jpg"></div>
        <div class="slide"><img src="./stillcut/world2.jpg"></div>
        <div class="slide"><img src="./stillcut/world3.jpg"></div>
        <div class="slide"><img src="./stillcut/world4.jpg"></div>
        <div class="slide"><img src="./stillcut/world5.jpg"></div>
      </div>
    </div>
    <div class="button prev"></div>
    <div class="button next"></div>
  </div></div><br><br>

<div id="movie">
		<center><video width="800" height="900" controls autoplay>
			<source src="./teaser/my world.mp4" type='video/mp4'>
			<source src="./teaser/my world.ogg" type="video/ogg">
		</video></center>
	</div>
	
</body>
</html>
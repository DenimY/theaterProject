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
	<div id="header"> <img src="./reservation/avatar.jpg" alt="엑박"></div>
	<div id="header2"><img alt="엑박" src="./logo/all.png" ><h2>아바타</h2><br>
	<strong>타입 :</strong> 디지털(자막), ATMOS(자막)<br>
	<strong>개봉일 :</strong> 2009 .12.17<br>	
	<strong>감독 :</strong> 제임스 카메론<br>
	<strong>출연진 :</strong> 출연샘 워싱턴,조 샐다나,시고니 위버<br>
	<strong>장르 :</strong> SF, 모험, 액션, 전쟁 / 162분<br><br><br>
	<input type=button style="width:60pt;height:30pt;" value="예매하기"></center>
	</div><br><br><br>
	
	<div id="story">
	<h2>줄거리</h2>
	가까운 미래, 지구는 에너지 고갈 문제를 해결하기 위해 머나먼 행성 판도라에서 대체 자원을 채굴하기 시작한다. 하지만 판도라의 독성을 지닌 대기로 인해 자원 획득에 어려움을 겪게 된 인류는 판도라의 토착민
	‘나비(Na’vi)’의 외형에 인간의 의식을 주입, 원격 조종이 가능한 새로운 생명체 ‘아바타’를 탄생시키는 프로그램을 개발한다. 한편, 하반신이 마비된 전직 해병대원 ‘제이크 설리(샘 워딩튼)’는 
	‘아바타 프로그램’에 참가할 것을 제안 받아 판도라에 위치한 인간 주둔 기지로 향한다. 그 곳에서 자신의 ‘아바타’를 통해 자유롭게 걸을 수 있게 된 ‘제이크’는 자원 채굴을 막으려는 
	‘나비(Na’vi)’의 무리에 침투하라는 임무를 부여 받는다. 임무 수행 중 ‘나비(Na’vi)’의 여전사 ‘네이티리(조 샐다나)’를 만난 ‘제이크’는 그녀와 함께 다채로운 모험을 경험하면서 ‘네이티리’를 사랑하게 되고, 
	‘나비(Na’vi)’들과 하나가 되어간다. 하지만 행성 판도라와 지구의 피할 수 없는 전쟁! 이 모든 운명을 손에 쥔 제이크의 선택은?</div><br>
	<div id="stillcut">
	<div class="container">
    <div class="slider-wrapper">
      <div class="inner-wrapper">
        <div class="slide"><img src="./stillcut/avatar1.jpg"></div>
        <div class="slide"><img src="./stillcut/avatar2.jpg"></div>
        <div class="slide"><img src="./stillcut/avatar3.jpg"></div>
        <div class="slide"><img src="./stillcut/avatar4.jpg"></div>
        <div class="slide"><img src="./stillcut/avatar5.jpg"></div>
      </div>
    </div>
    <div class="button prev"></div>
    <div class="button next"></div>
  </div></div><br><br>

<div id="movie">
		<center><video width="800" height="960" controls autoplay>
			<source src="./teaser/avatar.mp4" type='video/mp4'>
			<source src="./teaser/avatar.ogg" type="video/ogg">
		</video></center>
	</div>
</body>
</html>
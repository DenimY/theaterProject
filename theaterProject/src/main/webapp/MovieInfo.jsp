<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/data/201010/IJ12875323685154/style.css" />
<script type="text/javascript"
	src="/data/201010/IJ12875323685154/packed.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
	$(function() {
		var inWrap = $('.inner-wrapper');
		$('.prev').on('click', function() {
			inWrap.animate({
				left : '0%'
			}, 300, function() {
				inWrap.css('left', '-100%');
				$('.slide').first().before($('.slide').last());
			});
		});
		$('.next').on('click', function() {
			inWrap.animate({
				left : '-200%'
			}, 300, function() {
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
	width: calc(100%/ 5);
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
	width: 30%;
	height: 340px;
	float: left;
	padding-left: 50px;
	padding-right: 50px;
}

#header2 {
	height: 340px;
}

#story {
	width: 100%;
	height: 100px;
}

#stillcut {
	width: 100%;
	height: 200px;
}

#movie {
	width: 100%;
	height: 100px;
}
</style>
<script type="text/javascript">

function checkUser(){
	if('' == '${users}'){
		alert('로그인을 해주세요.');
		 
		window.close();
		opener.window.location = "login.jsp";
	}else{
		location.href = "ts.do?id=${movie.id}&title=${movie.title}";
	}
		
};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 정보</title>
</head>
<body>
	<div id="header">
		<img src="${pageContext.request.contextPath}/image/${movie.title}/${image_title.filename}" alt="사진엑박" 
			style="width: 100%; height: 340px;">
	</div>
	<div id="header2">
		<img alt="엑박" src="${pageContext.request.contextPath}/image/logo/${movie.age}.png">
		<h2>${movie.title}</h2>
		<br> <strong>타입 :</strong> 디지털<br> 
		<strong>개봉일 :</strong>${movie.openingDay}<br>
		 <strong>감독 :</strong> ${movie.director}<br>
		<strong>출연진 :</strong> ${movie.actor}<br> 
		<strong>장르 :</strong>${movie.type}/ ${movie.time}<br>
		<br>
		<br>
		 <a onclick="checkUser()"><input type=button style="width: 60pt; height: 30pt;" value="예매하기"></a>
	</div>
	<br>
	<br>
	<br>

	<div id="story">
		<h2>줄거리</h2>
		${movie.content}
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="stillcut">
		<div class="container">
			<div class="slider-wrapper">
				<div class="inner-wrapper">
				<c:forEach items="${image_content}" var = "image">
					<div class="slide">
						<img src="./image/${movie.title}/${image.filename}" width="600"height="300">
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="button prev"></div>
			<div class="button next"></div>
		</div>
	</div>
</body>
</html>
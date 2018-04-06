<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li><a href="userView.do">내 정보 수정</a></li>
				<li><a href="#">오늘의 세마디 수정</a></li>
				<li><a href="myboardList.do?name=${users.id}">내가 작성한 게시글 보기</a></li>
				<li><a href="getTicket.do?type=buying">내가 본 영화</a></li>
				<li><a href="getTicket.do?type=ticketing">나의 예매함</a></li>
				<li><a href="#">쿠폰함</a></li>
				<li><a href="#">채팅방</a></li>
				<li><a href="logout.do">로그아웃</a></li>
			</ul>
		</div>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">메뉴
					열기</a>
			</div>
		</div>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li><a href="#" onCLick="myPageUpdate('userInfo')">내 정보 수정</a></li>
		<li><a href="#">오늘의 세마디 수정</a></li>
		<li><a href="#" onClick="myPageUpdate('userBoard')">내가 작성한
				게시글 보기</a></li>
		<li><a href="UnderConstruction.do">내가 본 영화</a></li>
		<li><a href="UnderConstruction.do">나의 예매함</a></li>
		<li><a href="UnderConstruction.do">쿠폰함</a></li>
		<li><a href="logout.do">로그아웃</a></li>
		<c:choose>
			<c:when test="${users.grade=='0'}">
				<li><a href="adminPage.do">관리자페이지</a></li>
			</c:when>
		</c:choose>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
	function myPageUpdate(type) {
		var id = '${users.id}';
		var boardType = type;  
// 		alert("board type : " + boardType +", id : "+ id);
		$.ajax({
			type : "GET",
			url : "UserPage.do",
			dataType : "html",
			data: {'userId' : id,
				'type' :  boardType}, 
			error : function() {
				alert("Connect myPageUpdate error");
				return false; 
			},
			success : function(data) {
				$('#myPage').html(data);
				return false; 
			}
		});
	}
</script>
<%@include file="includ/navigation.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#jb-header {
	width: 810px;
	padding: 20px;
	margin-bottom: 20px;
	border: 1px solid #bcbcbc;
}

#jb-content-header {
	width: 810px;
	height: 180px;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#jb-content {
	width: 250px;
	height: 150px;
	padding: 5px;
	margin-right: 5px;
	float: left;
	border: 1px solid #bcbcbc;
}
.sidebar-brand-update{
color: yellow;
}

.profile {
	width: 70px;
	height: 70px;
}
</style>
<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/simple-sidebar.css" rel="stylesheet">
<link href="resources/css/half-slider.css" rel="stylesheet">
<link href="resources/css/custom.css" rel="stylesheet">

</head>
<body>
	<div id="wrapper">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li><a href="#" onCLick="myPageUpdate('userInfo')">내 정보 수정</a></li>
				<li><a href="#" onClick="myPageUpdate('userBoard')">내가 작성한
						게시글 보기</a></li>
				<li><a href="UnderConstruction.do">내가 본 영화</a></li>
				<li><a href="UnderConstruction.do">나의 예매함</a></li>
				<li><a href="UnderConstruction.do">쿠폰함</a></li>
				<li><a href="chat.jsp">채팅방</a></li>
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
		<!-- /#page-content-wrapper -->

	</div>

	<!-- 내 정보 보기 -->
	<div></div>

	<!-- Page Content -->
	<div class="container" id="myPage">

		<!-- Introduction Row -->
		<center>
			<div id="jb-header">
				<h1 class="my-4">${users.name}님 환영합니다.</h1>

				<!-- Team Members Row -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="my-4">MyProfile</h2>
					</div>
				</div>
			</div>
		</center>

		<center>
			<div id="jb-content-header">
				<div id="jb-content1">
				<h3>프로필 사진</h3>
					<div class="col-lg-4 col-sm-6 text-text-align:left mb-4">
						<form action="imgUpdate.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="id" value="${users.id}">
							<div class="profile">
								<img border="0" alt="사진이없쪙!"
									src="${pageContext.request.contextPath}/usersphoto/${users.userphoto}"
									width="70" height="70">
							</div>
							<input type="file" name="file">
					</div>
				</div>
				<div id="#jb-content">
					<br /> ${users.name}님의 프로필 사진 입니다.<br /> JAVA THEATER에서 '나'를 표현 하는
					프로필 정보 입니다.<br /> 수정을 원하실 경우 하단 '수정' 버튼을 클릭하시길 바랍니다.<br /> <br /> <input
						type="submit" value="수정">
					</form>
				</div>
				
			</div>
		</center>
			
		<center>	
			<div id="jb-content-header">
				<div id="jb-content1">
					<h3>연락처</h3>
					<table border="0">
						<tr>
							<td>전화번호 </td>
							<td>:${users.tel}</td>
						</tr>

						<tr>
							<td>이메일 </td>
							<td>:${users.email}</td>
						</tr>

						<tr>
							<td>주소 </td>
							<td>:${users.address}</td>
						</tr>
						
						<tr>
							<td>생일 </td>
							<td>:${users.birthday}</td>
						</tr>
					</table>
				</div>
				<div id="#jb-content">
							${users.name}님의 연락처 입니다.<br/>
							JAVA THEATER에서 중요 내용을 알려드릴 때 사용하는 정보입니다.<br/>
							보다 안전한 정보 보호를 위해 등록된 연락처의 일부만 보여드립니다.<br/>
							수정을 원하실 경우 좌측 메뉴바를 이용하여 수정을 하시길 바랍니다.<br/>
							</br>
				</div>
			</div>
		</center>
		<center>
			<div id="jb-content-header">
				<div id="jb-content1">
					<h3>회원등급&점수</h3>
					<table border="0">
						<tr>
							<td><c:choose>
								<c:when test="${users.grade==5}">
									<input type="image" src="./img/5등급.png" width="70" height="70" alt="사진이 필요합니다.">
									</c:when>
									<c:when test="${users.grade==4}">
										<input type="image" src="./img/4등급.png" alt="사진이 필요합니다.">
									</c:when>
									<c:when test="${users.grade==3}">
										<input type="image" src="./img/3등급.png" alt="사진이 필요합니다.">
									</c:when>
									<c:when test="${users.grade==2}">
										<input type="image" src="./img/2등급.png" alt="사진이 필요합니다.">
									</c:when>
									<c:when test="${users.grade==1}">
										<input type="image" src="./img/1등급.png" alt="사진이 필요합니다.">
									</c:when>
									<c:when test="${users.grade==0}">
										<input type="image" src="./img/관리자.jpg" alt="사진이 필요합니다.">
									</c:when>
								</c:choose>
								</td>
						</tr>
						<tr>
							<td>회원등급</td>
							<td>&nbsp;: ${users.grade}</td>
						</tr>
						
						<tr>
							<td>회원점수 </td>
							<td>&nbsp;: ${users.score}</td>
						</tr>
						<tr>	
					</table>
				</div>
				<div id="#jb-content">
							</br>
							${users.name}님의 등급&현재점수 입니다.<br/>
							JAVA THEATER에서 총 5가지 등급으로 나뉘어져 있습니다.<br/>
							[ 똥(5), 실버(4), 골드(3), 다이아(4), Master(5) ]<br/>
							등급당 2%씩 적립금이 올라가며 다양한 혜택을 받을수 있습니다. <br/>
				</div>
			</div>
		</center>
	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
		</script>
</body>
<%@include file="includ/footer.jsp"%>
</html>
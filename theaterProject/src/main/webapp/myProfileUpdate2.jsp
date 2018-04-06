<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="theater.member.board.model.users.UsersVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/simple-sidebar.css" rel="stylesheet">
<link href="resources/css/half-slider.css" rel="stylesheet">
<link href="resources/css/custom.css" rel="stylesheet">

</head>

<body>

	<div class="container">


		<%
			//관리자 페이지를 거쳐서 올 경우에는 용어 제거. 
			String beforeURL = "http://localhost/memberService/userInfotables.do";
			if (!request.getHeader("REFERER").equals("http://localhost/memberService/userInfotables.do")) {
		%>
		<center>

			<div class="alert alert-success">
				<h5>
					${users.name}님 의 연락처 정보입니다.<br> 회원정보는 개인정보처리방침에 따라 안전하게 보호되며,<br>
					회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.
				</h5>
			</div>
		</center>
		<%
			}
		%>
		<div id="profileUpdate">

			<center>
				<form action="Myupdate.do" method="post">
					<div class="alert alert-success">
						회원정보 수정
						<table>
							<tr>
								<td>아이디:</td>
								<td><input name="id" value="${users.id}"></td>
							</tr>

							<tr>
								<td>비밀번호:</td>
								<td><input name="pw"></td>
							</tr>

							<tr>
								<td>이름 :</td>
								<td><input name="name" value="${users.name}"></td>
							</tr>

							<tr>
								<td>이메일 :</td>
								<td><input name="email" value="${users.email}"></td>
							</tr>

							<tr>
								<td>생일 :</td>
								<td><input type="date" name="birthday"
									value="${users.birthday}"></td>
							</tr>

							<tr>
								<td>주소 :</td>
								<td><input name="address" value="${users.address}"></td>
							</tr>

							<%
								UsersVO vo = (UsersVO) request.getAttribute("users");
								if (vo.getGrade() == 0) {
							%>
							<tr>
								<td>등급 :</td>
								<td><input name="grade" value="${users.grade}"></td>
							</tr>
							<%
								}
							%>

						</table>
						<input type="submit" value="수정완료">
					</div>
				</form>
			</center>
		</div>

	</div>

	<!-- 	</div> -->
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
</html>

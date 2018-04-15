<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="theater.member.board.model.users.UsersVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="include/navigation.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
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

		<!-- Page Content -->
	
		<!-- /#page-content-wrapper -->

	</div>

	<!-- 내 정보 보기 -->
	<div></div>

	<!-- Page Content -->
	<div class="container">

		<%
			//관리자 페이지를 거쳐서 올 경우에는 용어 제거. 
			String beforeURL = "http://192.168.0.11/userInfotables.do";
			System.out.println("before URL : " + request.getHeader("REFERER")); 
			if (!(request.getHeader("REFERER").equals(beforeURL))) {
		%>
		<center>

			<div class="alert alert-dark">
				<h5>
					${users.name}님 의 연락처 정보입니다.<br> 회원정보는 개인정보처리방침에 따라 안전하게 보호되며,<br>
					회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.
				</h5>
			</div>
		</center>
		<%
			}
		%>

		<center>
			<form action="Myupdate.do" method="post">
				<div class="alert alert-dark">
					회원정보 수정
					<table>
						<tr>
							<td>아이디:</td>
							<td><input name="id" value="${users.id}"></td>
						</tr>
						
						<tr>
							<td>비밀번호:</td>
							<td><input name="pw" ></td>
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

					</table>
					<input type="submit" value="수정완료">
					
		
				</div>
			</form>
			<form>
			<%
			//관리자 페이지를 거쳐서 올 경우에는 용어 제거. 
			UsersVO vo = (UsersVO)request.getAttribute("users");
			String userId = vo.getId(); 
			System.out.println("userid" + userId); 
			if (request.getHeader("REFERER").equals(beforeURL) && vo.getId() != "admin") {
		%>
		<input type="button" value="회원탈퇴" >
		<%} %>
			</form>
		</center>
		<div class="alert alert-dark">
		<font size="6" color="gray">회원탈퇴</font>
			<form id="deleteUser" name="deleteform" method="post" action="deleteUser.do">
				<input type="hidden" name="id" id='id' value="${users.id}">
				<table>
					
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id='pw' name="pw" maxlength="50"></td>
					</tr>
				</table>
				<input type="button" value="회원탈퇴" onclick="checkValue()"/>
			</form>
		</div>
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
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
        	
        	if(!document.deleteform.pw.value){
                alert("비밀번호를 입력하지 않았습니다.");
            }
        	
			$('#pw').val()
			$('#id').val()
			
			$.ajax({
				type : 'POST',
				url : 'pwChk.do',
				data : {
					"pw" : $('#pw').val(),
					"id" : $('#id').val()
				},
				success : function(data) {
					if (data == 0) {
						alert("비밀번호가 틀리셨습니다.");
					} else if(data == 1) {
						alert("회원탈퇴를 하겠습니다.");
						document.getElementById('deleteUser').submit();
					}
					else {
						alert("data error data : " + data );
					}
				}
			});
			
        }
    </script>
    
<%-- 	<%@include file="includ/footer.jsp"%> --%>
</body>
</html>

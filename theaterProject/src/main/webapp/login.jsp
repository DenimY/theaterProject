<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



</head>
<body>


<center>

<h1>로그인을 해주세요~</h1><br>
<form  action="login.do" method="post" name ="loginput" onsubmit="return loginchk()">
아이디 <input type="text" size="30" name="id" id="id"/><br/>
비밀번호 <input type="password" size="30" name="pw" id="pw"/><br /><br>
<br><button onclick="checkValue()" type="submit">로그인</button>

</form>
</center>

	<script type="text/javascript">
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
 
		function loginchk() {

			var loginput = eval("document.loginput");

			if (loginput.id.value == "") {
				alert("아이디를 입력해 주세요.");
				return false;
			}
			if (loginput.pw.value == "") {
				alert("비밀번호를 입력해 주세요.");
				return false;
			}
		}
		</script>
</body>
</html>
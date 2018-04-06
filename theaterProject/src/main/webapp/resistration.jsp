<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>bootstrap template</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<article class="container">
		<div class="col-md-12">
			<div class="page-header">
				<center>
				<h1>
					<a href="main.jsp"><small>JAVA THEATER</small></a>
				</h1>
				</center>
			</div>
			<form class="form-horizontal" action="join.do" method="post" name="userinput" onsubmit="return checkValue()">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="id">아이디</label> <input
						type="button" value="중복확인" onclick="idChk()">
					</td>

					<div class="col-sm-6">
						<input class="form-control" id="userid" name="id"
							placeholder="아이디">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" type="password" id="pw" name="pw"
							placeholder="비밀번호">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="name">이름</label>
					<div class="col-sm-6">
						<input class="form-control" type="text" id="name" name="name"
							placeholder="이름">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="gender">성별</label>
					<div class="col-sm-6">
						<input type="radio" name="gender" id="male" >남자
						 <input type="radio" name="gender" id="female">여자
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="address">주소</label>
					<div class="col-sm-6">
						<input class="form-control" type="text" id="address"
							name="address" placeholder="자세히 입력 해주세요.">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="email">이메일</label>
					<div class="col-sm-6">
						<input class="form-control" type="email" id="email" name="email"
							placeholder="이메일">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="birthday">생일</label>
					<div class="col-sm-6">
						<input class="form-control" type="date" id="birthday"
							name="birthday">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="tel">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="tel" class="form-control" id="tel" name="tel"
								placeholder="- 없이 입력해 주세요" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-primary" onclick="checkValue()" type="submit">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
<!-- 						<input type class="btn btn-primary" type="submit" onclick="checkValue()" value="회원가입"> -->
						
					</div>
				</div>
			</form>
			<hr>
		</div>
	</article>

	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		function idChk() {

			$('#userid').val()
			$.ajax({
				type : 'POST',
				url : 'idchk.do',
				data : {
					"id" : $('#userid').val()
				},
				success : function(data) {
					if (data != 0) {
						alert("이미 가입된 아이디 입니다.");
					} else {
						alert("사용 할 수 있는 아이디 입니다.");
					}
				}
			});
		}
	</script>
	
	<script type="text/javascript">
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
 
		function checkValue() {

			var userinput = eval("document.userinput");

			if (userinput.id.value == "") {
				alert("아이디를 입력해 주세요.");
				return false;
			}
			if (userinput.pw.value == "") {
				alert("비밀번호를 입력해 주세요.");
				return false;
			}
			if (userinput.name.value == "") {
				alert("이름을 입력해 주세요.");
				return false;
			}
			if (userinput.gender.value == "") {
				alert("성별을 선택해 주세요.");
				return false;
			}
			if (userinput.address.value == "") {
				alert("주소를 입력해 주세요.");
				return false;
			}
			if (userinput.email.value == "") {
				alert("이메일을 입력해 주세요.");
				return false;
			}
			if (userinput.birthday.value == "") {
				alert("생일을 입력해 주세요.");
				return false;
			}
			if (userinput.tel.value == "") {
				alert("전화번호를 입력해 주세요.");
				return false;
			}
		}
	</script>

</body>

</html>

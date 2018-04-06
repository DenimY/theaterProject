<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<body>
<br>

<center>
		<h1></h1>
		<h3>회원가입을 해주세요~</h3>
		<form action="join.do" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" id="userid" name="id"> 
					<input type="button" value="중복확인" onclick="idChk()"></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="pw" name="pw"></td>
				</tr>

				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>

				<tr>
					<td>성별</td>
					<td><input type="radio" name="gender" id="male">남자 
					<input type="radio" name="gender" id="female">여자</td>
				</tr>

				<tr>
					<td>생일</td>
					<td><input type="date" id="birthday" name="birthday"></td>
				</tr>

				<tr>
					<td>주소</td>
					<td><input type="text" id="address" name="address"></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input type="email" id="email" name="email"></td>
				</tr>

				<tr>
					<td>전화번호</td>
					<td><input type="tel" id="tel" name="tel"></td>
				</tr>

			</table>
			<input type="submit" value="가입하기" />
		</form>
</center>




            <hr/>
            <!-- 푸터 들어가는 부분 -->
             
            <div>
                <p class="text-center">
                    <small><strong> 사거리</strong></small><br>
                    <small>대표 : 홍길동 ㆍ 주소 :  사거리 ㆍ 사업자등록번호:123-12-12345 ㆍ 전화 : 064-123-1234</small><br>
                    <small>Copyrightⓒ test.com All rights reserved.</small>
                </p>
            </div>
            
            <script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	function idChk() {

		$('#userid').val()
		$.ajax({
			type : 'POST',
			url : 'idchk.do',
			data : { "id" : $('#userid').val()},
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
</body>
</html>
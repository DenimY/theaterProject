<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
*{
   margin:0;
   padding:0;
   list-style:none;
   text-decoration:none;
   color:#9ab1bc;
}
body{
   background-color:#000;
}

h1,
ul{
   text-align:center;
}
ul li{
   display:inline-block;
   margin-right:70px;
}

ul li:last-child {
margin-right:0;
}
nav {
   margin-top:20px;
   padding: 10px 0;
   border-top: 1px solid #969696;
   border-bottom: 1px solid #969696;
}

content {
   background-color:#f4f6f7;
   float:left;
   width:100%;
   height:900px;
}
footer{
      text-align:center;
      padding:10px;
   }
p { margin-top:20px;
text-align:center;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>
<%@include file ="include/navigation.jsp" %>
</head>
<!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/half-slider.css" rel="stylesheet">
    <link href="resources/css/custom.css" rel="stylesheet">
    <link href="resources/css/loginmo.css" rel="stylesheet">

<body>
<br>
<br>
<br>
<br>
<h3>검색 결과 </h3>

	<!-- 검색 시작 -->
	<form action="searchMovie.do" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td align="right">
				<select name="searchCondition">
					<c:forEach var="prt" items="${conditionMap}" > 
					<option value="${prt.value}"${prt.value== condition?'selected="selected"' : '' }>${prt.key}</option>
					</c:forEach>
				</select>
				<input name="searchKeyword" type="text" value="${keyword}"/> 
				<input type="submit" value="검색"> 
				<a href="searchBoardList.do">초기화</a>
				</td>
			</tr>
		</table>
	</form>
	
<table border="1" cellpadding="0" cellspacing="0" width="700" align="center">
		<tr>
			<th bgcolor="orange" width="100">개봉일</th>
			<th bgcolor="orange" width="200">제목</th>
			<th bgcolor="orange" width="150">감독</th>
		</tr>

		<c:forEach items="${searchList}" var="result">
			<tr>
				<td>${result.openingDay}</td>
				<td align="left"><a href="getMovie.do?id=${result.id}&title=${result.title}" 
				onClick="window.open(this.href, '', 'width=800, height=800'); return false;">${result.title}</a></td>
				<td>${result.director}
			</tr>
		</c:forEach>
	</table>
</content>

<!-- <h1>성공</h1> -->
<%@include file="include/footer.jsp"%>
</body>
</html>
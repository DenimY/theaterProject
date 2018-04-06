<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		
			<c:forEach items="${myBoardList}" var="myboard">
			<tr height="25" align="center">
				<td>${myboard.id}</td>
				<td><a href="viewBoard.do?id=${myboard.id}">${myboard.title}</a></td>
				<td>${myboard.writer}</td>
				<td>${myboard.writedate}</td>
				<td>${myboard.hit}</td></br>
			</tr>
		</c:forEach>
</body>
</html>
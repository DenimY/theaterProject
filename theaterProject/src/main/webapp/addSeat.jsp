<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title>Insert title here</title>
</head>
<body>
<form id="seat" name="seat" method="post" action="addSeat.do">
		<table>
			<tr>
				<td><select id="id" name="id">
						<c:forEach var="prt" items="${adt}">
							<option value="${prt.id}">${prt.id}관</option>
						</c:forEach>
				</select> 
				<input type="number" name="locY" min="1" max="20">열
				 <input type="number" name="locX" min="1" max="20">행 
<!-- 					<input type="button" value="POST" onclick="addSeat()" /></td> -->
				<input type="submit" value="추가">
			</tr>
		</table>
	</form>
</body>
</html>
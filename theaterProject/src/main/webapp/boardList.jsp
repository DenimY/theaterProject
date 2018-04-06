<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<link href="resources/css/custom.css" rel="stylesheet">
</head>
<body>	
		<div class="col-md-12">
			<div class="page-header">
				<center>
				<h1>
					<a href="main.jsp"><small>JAVA THEATER</small></a>
				</h1>
				</center>
			</div>
		</div>
		<form action="boardList.do" method="post">
		<select name="searchCondition">
			<c:forEach items="${conditionMap}" var="option">
				<option value="${option.value}">${option.key}</option>
			</c:forEach>
		</select> <input name="searchKeyword" type="text"> <input type="submit"
			value="검색">
	</form>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5">
			<td width="5"></td>
		</tr>
		<tr
			style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
			<td width="73">번호</td>
			<td width="379">제목</td>
			<td width="73">작성자</td>
			<td width="164">작성일</td>
			<td width="58">조회수</td>
			<td width="7"><img src="img/table_right.gif" width="5"
				height="30" /></td>
		</tr>

		<!-- 관리자 공지사항 게시글 리스트 -->
		<c:forEach items="${adminboardList}" var="adminboard">
			<tr height="25" align="center">
				
				<td>공지글</td>
				<td><a href="viewBoard.do?id=${adminboard.id}">${adminboard.title}</a></td>
				<td>${adminboard.writer}</td>
				<td><fmt:formatDate value="${adminboard.writedate}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${adminboard.hit}</td>

			</tr>
		</c:forEach>

		<!-- 유저 게시글 리스트 -->
		<c:forEach items="${boardList}" var="board">
			<tr height="25" align="center">

				<td>${board.id}</td>
				<td><a href="viewBoard.do?id=${board.id}">${board.title}</a></td>
				<td>${board.writer}</td>
				<td><fmt:formatDate value="${board.writedate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${board.hit}</td>

			</tr>
		</c:forEach>

		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>


		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>
	
	<!-- 관리자글쓰기 -->
	<c:if test="${sessionScope.users.grade==0&&users.id!=null}">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="4" height="5"></td>
			</tr>
			<tr align="center">
				<td><a href="insertBoard.jsp"><input type=button
						value="관리자 글쓰기"></a></td>
			</tr>
		</table>
	</c:if>
	
	<!-- 유저글쓰기 -->
	<c:if test="${sessionScope.users.grade>0&&users.id!=null}">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="4" height="5"></td>
			</tr>
			<tr align="center">
				<td><a href="insertBoard.jsp"><input type=button
						value="글쓰기"></a></td>
			</tr>
		</table>
	</c:if>
	
	<table>
		<tr>
			<td>
				<form action="boardList.do" method="post">
					<input type="hidden" name ="searchPageNumber" value="1">
					<input type="submit" value="<<">
				</form>
			</td>
			<c:if test="${startPage-1 ne 0}">
				<td><form action="boardList.do" method="post">
						<input type="hidden" name ="searchPageNumber" value="${startPage-1}">
						<input type="submit" value="<">
					</form>
				</td>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var="page" varStatus="state">
				<td>
					<form action="boardList.do" method="post">
						<input type="submit" name="searchPageNumber" value="${page}">
					</form>
				</td>
			</c:forEach>
			<c:if test="${endPage ne realEndPage}">
				<td>
					<form action="boardList.do" method="post">
						<input type="hidden" name ="searchPageNumber" value="${endPage+1}">
						<input type="submit" value=">">
					</form>
				</td>
			</c:if>
			<td>
				<form action="boardList.do" method="post">
					<input type="hidden" name ="searchPageNumber" value="${realEndPage}">
					<input type="submit" value=">>">
				</form>
			</td>
		</tr>
	</table>

</body>
</html>

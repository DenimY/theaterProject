<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>게시판</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]> 
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> 
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> 
<![endif]-->
</head>
<body>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</head>
<body>


	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<h2>
				<a href="main.jsp"><small>JAVA THEATER</small></a>
			</h2>
		</div>

		<div class="panel-body">
			<div class="container">
				<form method="post" action="viewBoard.do?&modify=true">
				<input type="hidden" name="id" value="${board.id}">
					<div class="form-group">
						<label for="name">Writer</label> <input type="text"
							class="form-control" name="writer" id="name" value="${board.writer}"
							readonly>
					</div>

					<div class="form-group">

						<label for="subject">Title</label> <input type="text"
							class="form-control" name="title" placeholder="Enter title"
							value="${board.title}" readonly>
					</div>

					<div class="form-group">
						<label for="content">Comment:</label>
						<textarea readonly class="form-control" rows="10" name="contents">${board.contents}</textarea>
					</div>
					
					<!-- 내 게시글에 들어왔을경우. -->
					<c:if test="${users.id == board.writer}">
					<div class="center-block" style='width: 250px'>
						<center>
						<input type="submit" value="수정하기"> 
						<a href="deleteBoard.do?id=${board.id}">
							<input type="button" value="삭제하기"></a>
						<a href="boardList.jsp">
							<input type="button" value="목록으로"></a>
						</center>
						</div>
					</c:if>
					
					<!-- 내 게시글이 아닌경우 -->
					<c:if test="${users.id != board.writer}">
						<div class="center-block" style='width: 250px'>
						<center>
							<a href="boardList.jsp"><input type="button" value="목록으로"></a>
						</center>
					</div>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	<!--panel end-->
	<div class="panel panel-default">

		<div class="panel-body">
			<div class="container">
				<form method="post" action="insertComment.do">
					<div class="form-group">
						<input type="hidden" name="id" value="${board.id}"> <input
							type="hidden" name="writer" value="${users.id}"> <label
							for="subject">댓글쓰기</label> <input type="text"
							class="form-control" name="contents" value="${comments.contents}">
						<center>
							<input type="submit" value="댓글등록">
						</center>
					</div>
				</form>
			</div>
		</div>

	</div>
	<!--  ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->

<!-- 	<!-- 작성자가 같을경우 --> 
<%-- 	<c:forEach items="${commentList}" var="comment"> --%>
<!-- 		<form method="post" action="updateComment.do"> -->
<%-- 			<input type="hidden" value="${users.id}"> --%>
<%-- 			<input type="hidden" name="id" value="${comment.id}"> --%>
<%-- 			<input type="hidden" value="${comment.cbid}"> --%>
<%-- 			<input type="hidden" name="boardId" value="${board.id}"> --%>
<%-- 			<input type="text" value="${comment.writer}" readonly> --%>
<%-- 			<input type="text" name="contents" value="${comment.contents}"> --%>
<%-- 			<input type="text" value="${comment.wirtedate}" readonly> --%>

<%-- 			<c:if test="${sessionScope.users.id==comment.writer}"> --%>
<!-- 				<input type="submit" value="댓글수정하기"> -->
<%-- 				<a href="deleteComment.do?id=${comment.id}&boardId=${board.id}"><input --%>
<!-- 					type="button" value="삭제하기"></a> -->
<%-- 			</c:if> --%>
			
<!-- 			<hr> -->
<!-- 		</form> -->
		
<%-- 	</c:forEach> --%>
		<div class="panel-body">
			<div class="container">
				<c:forEach items="${commentList}" var="comment">
					<form method="post" action="updateComment.do">
						<div class="form-group">
							<input type="hidden" value="${users.id}">
							<input type="hidden" name="id" value="${comment.id}">
							<input type="hidden" value="${comment.cbid}">
							<input type="hidden" name="boardId" value="${board.id}">
							<label for="subject">
								${comment.writer}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</label>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writedate}" />
							
							<c:if test="${sessionScope.users.id==comment.writer}">
							<input type="text" class="form-control" name="contents" value="${comment.contents}">
							<input type="submit" value="수정하기">
								<a href="deleteComment.do?id=${comment.id}&boardId=${board.id}">
									<input type="button" value="삭제하기">
								</a>
							</c:if>
							
							<c:if test="${sessionScope.users.id!=comment.writer}">
							<input type="text" class="form-control" name="contents" value="${comment.contents}"readonly>
							</c:if>
							<hr>
						</div>
					</form>
				</c:forEach>
			</div>
		</div>
</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="includ/navigation.jsp"%>
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
<link href="resources/css/loginmo.css" rel="stylesheet">

</head>

<body>
	<!-- 내 정보 보기 -->
	<div class="maincontainer">

		<!-- Page Content -->
		<div class="container">

			<!-- Introduction Row -->
			<center>
				<div id="jb-header">
					<h1 class="my-4">${users.name}님작성한게시물입니다..</h1>

					<!-- Team Members Row -->
					<div class="row">
						<div class="col-lg-12">

							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr height="5">
									<td width="5"></td>
								</tr>
								<tr
									style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
									<td width="379">제목</td>
									<td width="73">작성자</td>
									<td width="164">작성일</td>
									<td width="58">조회수</td>
									<td width="7"><img src="img/table_right.gif" width="5"
										height="30" /></td>
								</tr>
								<c:forEach items="${myBoardList}" var="myboard">
									<tr height="25" align="center">
										<td><a href="viewBoard.do?id=${myboard.id}">${myboard.title}</a></td>
										<td>${myboard.writer}</td>
										<td><fmt:formatDate value="${myboard.writedate}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${myboard.hit}</td>
									</tr>
								</c:forEach>
							</table>

							<table>
								<tr>
									<td>
										<form action="myboardList.do" method="post">
											<input type="hidden" name="name" value="${users.id}">
											<input type="hidden" name ="searchPageNumber" value="1">
											<input type="submit" value="<<">
										</form>
									</td>
									<c:if test="${startPage-1 ne 0}">
										<td>
											<form action="myboardList.do" method="post">
												<input type="hidden" name="name" value="${users.id}">
												<input type="hidden" name ="searchPageNumber" value="${startPage-1}">
												<input type="submit" value="<">
											</form>
										</td>
									</c:if>
									<c:forEach begin="${startPage}" end="${endPage}" var="page" varStatus="state">
										<td>
											<form action="myboardList.do" method="post">
												<input type="hidden" name="name" value="${users.id}">
												<input type="submit" name="searchPageNumber" value="${page}">
											</form>
										</td>
									</c:forEach>
									<c:if test="${endPage ne realEndPage}">
										<td>
											<form action="myboardList.do" method="post">
												<input type="hidden" name="name" value="${users.id}">
												<input type="hidden" name ="searchPageNumber" value="${endPage+1}">
												<input type="submit" value=">">
											</form>
										</td>
									</c:if>
									<td>
										<form action="myboardList.do" method="post">
											<input type="hidden" name="name" value="${users.id}">
											<input type="hidden" name ="searchPageNumber" value="${realEndPage}">
											<input type="submit" value=">>">
										</form>
									</td>
								</tr>
							</table>
						</div>

					</div>
				</div>
			</center>
		</div>
	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

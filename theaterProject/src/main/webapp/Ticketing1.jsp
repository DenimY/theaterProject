<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="resources/css/custom.css?v=5" rel="stylesheet">
<link href="resources/css/loginmo.css" rel="stylesheet">

</head>

<body>



	<!-- Page Content -->
	<div class="container">
		<hr>
		<h1>${movie.title}</h1>
		<div class="">
			<c:forEach items="${theater}" var="theater">
				<button type="button" class="btn btn-dufault theater_id"
					id="${theater.name}">${theater.name}</button>
			</c:forEach>

			<hr>
			<div id="auditorium"></div>

			<div id="schedule"></div>

			<!-- Trigger/Open The Modal -->
			<!-- The Modal -->
			<div id="myModal" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<span class="close">&times;</span>
					<p>
					<div class="divright">
					</div>
					<center>
						SCREEN<br> <br>
						<table>
							<tr>
								<td></td>
								<td>통로</td>
								<!-- center sit -->
								<td>
								<div id = "seat">
								</div>
								</td>
								<td>통로</td>

							</tr>
						</table>
						<div class="divright">
						<form method="post" action="createTicket.do" id ="setResult">
						<input type="hidden" id="title" name="title" value="${movie.title}">
						<input type="hidden" id="id" name="id" value="${movie.id}">
						<input type="hidden" id="result" name="result" value="">
						<input type="hidden" id="schID" name="schID" value="">
						<input type="hidden" id="auditoriumID" name="auditoriumID" value="">
						<input type="submit" class="btn btn-info" value="예매완료">
						</form>
						<br/>
						<button class="btn btn-info cancel" >예매 취소</button>
						</div>
				</div>
			</div>

		</div>
		
	</div>
	<!-- /.container -->

</body>
<%@include file="include/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ticketing1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ticketing2.js"></script>

</html>
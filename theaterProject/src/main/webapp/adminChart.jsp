<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="theater.member.board.model.ticket.MovieVO"%>
<%@ page import="theater.member.board.model.users.UsersVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>CHART</title>

</head>

<body>
	
<!-- 	<div class="card-body"> -->
		<canvas id="myAreaChart" width="100%" height="30"></canvas>
<!-- 	</div> -->
	<script src="resources/js/sb-admin-charts.js"></script>
</body>

</html>

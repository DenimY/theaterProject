<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="theater.member.board.model.ticket.MovieVO"%>
<%@ page import="theater.member.board.model.users.UsersVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin - Start Bootstrap Template</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<!-- <script src="resources/js/sb-admin.js" type="text/javascript"></script> -->
<script src="resources/vendor/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript">

audienceList = null; 
	function adminMenu(Type) {
		var menuType = Type;
		$.ajax({
			type : 'POST',
			url : 'adminMenu.do',
			dataType : 'html',
			data : {
				'menuType' : menuType
			},
			error : function() {
				alert('Admin Menu error type :' + menuType)
			},
			success : function(data) {
				$('#adminMainBody').html(data);
			}
		});
	}

	$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "adminDashBoard.do",
			dataType : "HTML",
			error : function() {
				alert('통신실패!!');
				return false; 
			},
			success : function(data) {
				$('#adminMainBody').html(data);
				return false; 
			}
		})
	});
	

	function ChartbuttonClicked(distence) {
// 		var selectYear = $(".selectYear:eq(" + n + ")").val();
		
		if (distence == 'right') {
			console.log('ChartbuttonClicked right');

			var n = $('.bt_up').index(this);
			
			var selectYear = $(".selectYear:eq(" + n + ")").val();
			selectYear = $(".selectYear:eq(" + n + ")").val(
					selectYear * 1 + 1);

// 			$.ajax({
// 				type : "GET",
// 				dataType : "HTML",
// 				url : "chartCheck.do",
// 				data : {
// 					"year" : $(".selectYear").val()
// 				},
// 				error : function() {
// 					alert('통신실패!!');
// 					return false; 
// 				},
// 				success : function(data, audienceList) {
					
// 					$('#MonthareaChart').html(data);
// 					return false; 
// 				}
// 			});

// 			$('#MonthAreaChart').load(adminChart.jsp);

		} else if (distence == 'left') {
			console.log('ChartbuttonClicked left');

			var n = $('.bt_down').index(this);
			var selectYear = $(".selectYear:eq(" + n + ")").val();
			selectYear = $(".selectYear:eq(" + n + ")").val(selectYear * 1 - 1);

// 			$.ajax({
// 				type : "GET",
// 				dataType : "HTML",
// 				url : "chartCheck.do",
// 				data : {
// 					"year" : $(".selectYear").val()
// 				},
// 				error : function() {
// 					alert('통신실패!!');
// 					return false; 
// 				},
// 				success : function(data, audienceList) {
// 					$('#MonthareaChart').load(data);
// // 					$('#myAreaChart').html(data);
// 					return false; 
// 				} 
// 			});

		}
		else {
			alert('(ERROR) ChartbuttonClicked distence data : ' + distence);
			return false; 
			} 


		$.ajax({
			type : "GET",
			dataType : "JSON",
			url : "chartCheck.do",
			data : {
				"year" : $(".selectYear").val()
			},
			error : function() {
				alert('통신실패!!');
				return false; 
			},
			success : function(data) {
				audienceList = data; 
				ajaxAfter(); 
				return false; 

			
			} 
		});
		
// 		audienceList = request
	}
	function ajaxAfter(){
		console.log("ChartbuttonClicked audienceList : " + audienceList);
			$('#monthAreaChart').load('adminChart.jsp');
		}
</script>



<!-- Bootstrap core CSS-->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin.css" rel="stylesheet">

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<%@include file="includ/adminNavigation.jsp"%>
	<!-- Navigation-->
	<div class="content-wrapper">
		<div id='adminMainBody'>
			<div class="container-fluid">AdminPage ajax</div>
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Copyright Â© Your Website 2018</small>
				</div>
			</div>
		</footer>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>
		<!-- Logout Modal-->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">Ã</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="moiveRegistration.jsp">Logout</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
<!-- 	<script src="resources/vendor/jquery/jquery.js"></script> -->
<!-- 	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.js"></script> -->
	<!-- Core plugin JavaScript-->
<!-- 	<script src="resources/vendor/jquery-easing/jquery.easing.js"></script> -->
	<!-- Page level plugin JavaScript-->
<!-- 	<script src="resources/vendor/chart.js/Chart.js"></script> -->
<!-- 	<script src="resources/vendor/datatables/jquery.dataTables.js"></script> -->
<!-- 	<script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script> -->
	<!-- Custom scripts for all pages-->
<!-- 	<script src="resources/js/sb-admin.js"></script> -->
	<!-- Custom scripts for this page-->
<!-- 	<script src="resources/js/sb-admin-datatables.js"></script> -->
<!-- 	<script src="resources/js/sb-admin-charts.js"></script> -->
<!-- 	<script src="resources/js/sb-admin-charts.js"></script> -->
	</div>
	
</body>

</html>

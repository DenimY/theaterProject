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
<!-- <script src="js/jquery.dataTables.js" type="text/javascript"></script> -->
<script type="text/javascript">

function adminMenu(Type){
		var menuType = Type;
		$.ajax({
			type: 'GET',
			url : 'adminMenu.do',
			dataType : 'html',
			data : {'menuType' : menuType},
			error : function(){alert('Admin Menu error type :' + menuType)},
			success : function(data){
				$('#adminMainBody').html(data); 
				}
			});
		}
		
var mainGraph; 
// 	$(document).ready(function() {
// 			$.ajax({
// 				type : "GET",
// 				url : "chartCheck.do",
// 				dataType : "JSON",
// 				data : {
// 					"year" : 2017
// 				},
// 				error : function() {
// 					alert('통신실패!!');
// 				},
// 				success : function(data) {
// 				mainGraph ={audienceList : data }
// 				audienceList = data;
// 				console.log("audienceList : " + audienceList);
// 				$('#myAreaChart').load('chartUpdate.do')					
// 				}
// 			})
// 	});
	$(document).ready(function() {
		alert('start dashbaord.do');
			$.ajax({
				type : "GET",
				url : "adminDashBoard.do",
				dataType : "HTML",
				error : function() {
					alert('통신실패!!');
				},
				success : function(data) {
				$('#adminMainBody').html(data);
				}
			})
	}); 


	$(function() {
		
		$('.bt_up').click(
				function() {
					var n = $('.bt_up').index(this);
					var selectYear = $(".selectYear:eq(" + n + ")").val();
					selectYear = $(".selectYear:eq(" + n + ")").val(
							selectYear * 1 + 1);

// 					$('#chartcheckTest').load('adminPage.do')

					$.ajax({
						type : "GET",
						dataType : "JSON",
						url : "chartCheck.do",
						data : { 
							"year" : $(".selectYear").val()
						},
						error : function() {
							alert('통신실패!!');
						},
						success : function(data) {
							audienceList = data; 
							myLineChart.update(); 
							$('#myAreaChart').load('chartUpdate.do');
						}
					});
				});
		$('.bt_down').click(
				function() {
					var n = $('.bt_down').index(this);
					var selectYear = $(".selectYear:eq(" + n + ")").val();
					selectYear = $(".selectYear:eq(" + n + ")").val(
							selectYear * 1 - 1);
// 					$('#chartcheckTest').load('adminPage.do')

					$.ajax({
						type : "GET",
						dataType : "JSON",
						url : "chartCheck.do",
						data : { 
							"year" : $(".selectYear").val()
						},
						error : function() {
							alert('통신실패!!');
						},
						success : function(data) {
// 							$('#chartcheckTest').load('adminPage.do');
// 							$('#chartcheckTest').load('adminPage.do').find('#chartcheckTest');
							
// 							$('</div>').html(data).find('#chartcheckTest');
// 							$('#chartcheckTest').load(data);
// 							$('#chartcheckTest').load(data);
// 							console.log(data); 
// 							console.log("audience List JSON : "
// 									+ JSON.stringify(data));

//   						$('chartcheckTest').html(data);
							console.log('refreshTest');
							// 							$('<div />').jsp(data).find('#chartcheckTest')
							mainGraph = {
							Element : 'chartcheckTest', 
							audienceList : data,
							data : data 
							}
							audienceList = data; 
							myLineChart.update(); 
							console.log("audienceList : " + audienceList);
							$('#myAreaChart').load('chartUpdate.do');
						}
						
					});
				});
// 		setInterval(function() {Update(mainGraph) }, 1000);
	});

	function Update(mainGraph) {
        $.getJSON('Test/RealTimeData',
        function (results) {           
            mainGraph.setData(results);
        });
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
			<div class="container-fluid">
			AdminPage ajax
			</div>
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
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script src="resources/vendor/chart.js/Chart.min.js"></script>
	<script src="resources/vendor/datatables/jquery.dataTables.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin.min.js"></script>
	<!-- Custom scripts for this page-->
	<script src="resources/js/sb-admin-datatables.min.js"></script>
	<script src="resources/js/sb-admin-charts.js"></script>
</body>

</html>

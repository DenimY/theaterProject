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
<title>charts</title>
<!-- Bootstrap core CSS-->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin.css" rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
var mainGraph; 
$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "chartCheck.do",
			dataType : "JSON",
			data : {
				"year" : 2017
			},
			error : function() {
				alert('통신실패!!');
			},
			success : function(data) {
//					console.log("audience List JSON : " + JSON.stringify(data))
//					$('#chartcheckTest').load('/chartCheck.do');
			mainGraph ={audienceList : data }
			audienceList = data;
			console.log("audienceList : " + audienceList);
			$('#myAreaChart').load('chartUpdate.do')					
			}
		})
}); 

$(function() {
	
	$('.bt_up').click(
			function() {
				var n = $('.bu_up').index(this);
				var selectYear = $(".selectYear:eq(" + n + ")").val();
				selectYear = $(".selectYear:eq(" + n + ")").val(
						selectYear * 1 + 1);

//					$('#chartcheckTest').load('adminPage.do')

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
//					$('#chartcheckTest').load('adminPage.do')

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
//							$('#chartcheckTest').load('adminPage.do');
//							$('#chartcheckTest').load('adminPage.do').find('#chartcheckTest');
						
//							$('</div>').html(data).find('#chartcheckTest');
//							$('#chartcheckTest').load(data);
//							$('#chartcheckTest').load(data);
//							console.log(data); 
//							console.log("audience List JSON : "
//									+ JSON.stringify(data));

//						$('chartcheckTest').html(data);
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
//		setInterval(function() {Update(mainGraph) }, 1000);
});

</script>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<%@include file="includ/adminNavigation.jsp"%>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">Charts</li>
			</ol>
			<!-- Area Chart Example-->
			<div class="card mb-3" id="chartcheckTest2">
				<div class="card-header" >
					<i class="fa fa-area-chart"></i> 월별 매출 현황
					<%
						int selectYear;
						if (request.getAttribute("selectYear") == null) {
							System.out.println("!Error : selectYear = null");
							System.out.println("!Error : (CHANGE)selectYear = 2017");
							selectYear = 2017;
						} else {
							System.out.println("OK : selectYear is not null");
							selectYear = ((int) request.getAttribute("selectYear") / 10000);
						}
						// 						System.out.println("ErrorCheck1 " + ((int) request.getAttribute("selectYear")));

						request.setAttribute("selectYear", selectYear);
						System.out.println(request.getAttribute("selectYear"));
						System.out.println("ErrorCheck1 " + ((int) request.getAttribute("selectYear")));
					%>

					<input type="button" value="left" class="bt_down"> <input
						type="text" value="<%=selectYear%>" class="selectYear"> <input
						type="button" value="right" class="bt_up">
					<%
						selectYear = ((int) request.getAttribute("selectYear"));
						System.out.println("get selectYear : " + selectYear);
						request.setAttribute("selectYear", selectYear);
						System.out.println("set selectYear : " + selectYear);
					%>

				</div>
				<div class="card-body" id="chartcheckTest">
					<%
						System.out.println("(START JSP) chartcheckTest");
						ArrayList audienceList = new ArrayList();
						if (request.getAttribute("selectYear") == null) {
							System.out.println("Error : selectYear = null");
						} else {
							System.out.println("ErrorCheck2 " + (List<MovieVO>) request.getAttribute("audience"));

							for (MovieVO mvo : (List<MovieVO>) request.getAttribute("audience")) {
								audienceList.add(mvo.getAudience());

							}
						}
					%>
					<script type="text/javascript">
						var audienceList = new Array();
// 						audienceList =
<%-- 					<%=audienceList%> --%>
// 						;
					</script>
					<canvas id="myAreaChart" width="100%" height="30"></canvas>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM ${sessionScope.users.score}</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<!-- Example Bar Chart Card-->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-bar-chart"></i> 지점별 매출 현황
						</div>
						<div class="card-body">
							<canvas id="myBarChart" width="100" height="50"></canvas>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
				<div class="col-lg-4">
					<!-- Example Pie Chart Card-->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-pie-chart"></i> 연령별 매충 현황
							<%
								ArrayList birthDate = new ArrayList();
								ArrayList ageAvg = new ArrayList();
								Calendar cal = Calendar.getInstance();
								// 								java.sql.Date today = new java.sql.Date(new java.util.Date().getYear());
								System.out.println(request.getAttribute("users"));
								
								try{
									for (UsersVO vo : (List<UsersVO>) request.getAttribute("users")) {
										birthDate.add(cal.get(Calendar.YEAR) - (((int) vo.getBirthday().getYear()) + 1900));
										//birthDate.add(vo.getRegisterDate().getYear());
										System.out.println("birth : " + birthDate);
									}
									
								}catch(NumberFormatException e){
									e.printStackTrace(); 
								}catch(NullPointerException e){
									e.printStackTrace(); 
								}
								
								
								
								double ten = 0, twenty = 0, thity = 0, forty = 0, fifty = 0, etc = 0;
								for (int i = 0; i < birthDate.size(); i++) {
									int age = ((int) birthDate.get(i)) / 10 * 10;
									System.out.println(age);
									switch (age) {
										case 10 :
											ten++;
											break;
										case 20 :
											twenty++;
											break;
										case 30 :
											thity++;
											break;
										case 40 :
											forty++;
											break;
										case 50 :
											fifty++;
											break;
										default :
											etc++;
											break;
									}
								}
								System.out.println("etc : " + etc);
								ageAvg.add(ten / birthDate.size() * 100);
								ageAvg.add(twenty / birthDate.size() * 100);
								ageAvg.add(thity / birthDate.size() * 100);
								ageAvg.add(forty / birthDate.size() * 100);
								ageAvg.add(fifty / birthDate.size() * 100);
								ageAvg.add(etc / birthDate.size() * 100);
								System.out.println("ageAvg : " + ageAvg);
							%>

							<script type="text/javascript">
								var ageAvg = new Array();
								ageAvg =
							<%=ageAvg%>
								;
							</script>

						</div>
						<div class="card-body">
							<canvas id="myPieChart" width="100%" height="100"></canvas>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Copyright © Your Website 2018</small>
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
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>
		 <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="resources/vendor/chart.js/Chartjs"></script>
    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin.js"></script>
    <!-- Custom scripts for this page-->
    <script src="resources/js/sb-admin-charts.js"></script>
	</div>

</body>

</html>

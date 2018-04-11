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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<!-- Bootstrap core CSS-->
<!-- <link href="resources/vendor/bootstrap/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet"> -->
<!-- Custom fonts for this template-->
<!-- <link href="resources/vendor/font-awesome/css/font-awesome.min.css" -->
<!-- 	rel="stylesheet" type="text/css"> -->
<!-- Custom styles for this template-->
<!-- <link href="resources/css/sb-admin.css" rel="stylesheet"> -->

<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-3.2.0.min.js"></script> -->
<script type="text/javascript">
// 	$(document).ready(function() {
// 		$.ajax({
// 			type : "GET",
// 			url : "chartCheck.do",
// 			dataType : "JSON",
// 			data : {
// 				"year" : 2017
// 			},
// 			error : function() {
// 				alert('통신실패!!');
// 			},
// 			success : function(data) {
// 				audienceList = data;
// 			}
// 		})
// 	});

// 	function ChartbuttonClicked(distence) {

// 		if (distence == 'right') {
// 			console.log('ChartbuttonClicked right');

// 			var n = $('.bt_up').index(this);

// 			var selectYear = $(".selectYear:eq(" + n + ")").val();
// 			selectYear = $(".selectYear:eq(" + n + ")").val(selectYear * 1 + 1);

// 		} else if (distence == 'left') {
// 			console.log('ChartbuttonClicked left');

// 			var n = $('.bt_down').index(this);
// 			var selectYear = $(".selectYear:eq(" + n + ")").val();
// 			selectYear = $(".selectYear:eq(" + n + ")").val(selectYear * 1 - 1);

// 		} else {
// 			alert('(ERROR) ChartbuttonClicked distence data : ' + distence);
// 			return false;
// 		}

// 		$.ajax({
// 			type : "GET",
// 			dataType : "JSON",
// 			url : "chartCheck.do",
// 			data : {
// 				"year" : $(".selectYear").val()
// 			},
// 			error : function() {
// 				alert('통신실패!!');
// 				return false;
// 			},
// 			success : function(data) {
// 				audienceList = data;
// 				ajaxAfter();
// 				return false;

// 			}
// 		});

		//		audienceList = request
// 	}
</script>

</head>

<body>

	<!-- Navigation-->
	<div id='adminMainBody'>
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">My Dashboard</li>
			</ol>

			<%
				int selectYear;
				if (request.getAttribute("selectYear") == null) {
					System.out.println("!Error : selectYear = null");
					System.out.println("!Error : (CHANGE)selectYear = 2017");
					selectYear = 2017;
				} else {
					selectYear = ((int) request.getAttribute("selectYear"));
					System.out.println("OK : selectYear is not null, SelectYear : " + selectYear);
				}
				// 						System.out.println("ErrorCheck1 " + ((int) request.getAttribute("selectYear")));

				request.setAttribute("selectYear", selectYear);
				System.out.println(request.getAttribute("selectYear"));
				System.out.println("ErrorCheck1 " + ((int) request.getAttribute("selectYear")));
			%>
			<!-- Area Chart Example-->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-area-chart"></i> 월별 매출 현황 <input type="button"
						value="◀" class="bt_down" onClick="ChartbuttonClicked('left')">
					<input type="text" value="<%=selectYear%>" class="selectYear"
						style="text-align: center" readonly> <input type="button"
						value="▶" class="bt_up" onClick="ChartbuttonClicked('right')">
					<%
						selectYear = ((int) request.getAttribute("selectYear"));
						System.out.println("get selectYear : " + selectYear);
						request.setAttribute("selectYear", selectYear);
						System.out.println("set selectYear : " + selectYear);
					%>

				</div>
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

						System.out.println("ErrorCheck3 " + audienceList);
					}
				%>
				<script type="text/javascript">
					var audienceList = new Array();
					audienceList =
				<%=audienceList%>
					;
					// 						console.log('dashBoard audienceList = ' + audienceList);
					console
							.log('dashBoard div end and start = '
									+ audienceList);
				</script>

				<div class="card-body" id="monthAreaChart">


					<div>
						<script type="text/javascript">
							console.log('dashBoard audienceList = '
									+ audienceList);
						</script>
						<canvas width="100%" height="30" id="myAreaChart">
						</canvas>
						<!-- 						<script src="resources/js/sb-admin-charts.js"></script> -->
					</div>
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
							<div class="row">
								<div class="col-sm-8 my-auto">
									<canvas id="myBarChart" width="100" height="50"></canvas>
								</div>
								<!-- 								<div class="col-sm-4 text-center my-auto"> -->
								<!-- 									<div class="h4 mb-0 text-primary">$34,693</div> -->
								<!-- 									<div class="small text-muted">YTD Revenue</div> -->
								<!-- 									<hr> -->
								<!-- 									<div class="h4 mb-0 text-warning">$18,474</div> -->
								<!-- 									<div class="small text-muted">YTD Expenses</div> -->
								<!-- 									<hr> -->
								<!-- 									<div class="h4 mb-0 text-success">$16,219</div> -->
								<!-- 									<div class="small text-muted">YTD Margin</div> -->
								<!-- 								</div> -->
							</div>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>

					<!-- /Card Columns-->
				</div>
				<div class="col-lg-4">
					<!-- Example Pie Chart Card-->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-pie-chart"></i> 연령별 매출 현황
							<%
								ArrayList birthDate = new ArrayList();
								ArrayList ageAvg = new ArrayList();
								Calendar cal = Calendar.getInstance();
								// 								java.sql.Date today = new java.sql.Date(new java.util.Date().getYear());
								// 									System.out.println(request.getAttribute("users"));

								try {
									for (UsersVO vo : (List<UsersVO>) request.getAttribute("users")) {
										birthDate.add(cal.get(Calendar.YEAR) - (((int) vo.getBirthday().getYear()) + 1900));
										//birthDate.add(vo.getRegisterDate().getYear());
										// 											System.out.println("birth : " + birthDate);
									}

								} catch (NumberFormatException e) {
									e.printStackTrace();
								} catch (NullPointerException e) {
									e.printStackTrace();
								}

								double ten = 0, twenty = 0, thity = 0, forty = 0, fifty = 0, etc = 0;
								for (int i = 0; i < birthDate.size(); i++) {
									int age = ((int) birthDate.get(i)) / 10 * 10;
									// 										System.out.println(age);
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
								// 									System.out.println("etc : " + etc);
								ageAvg.add(ten / birthDate.size() * 100);
								ageAvg.add(twenty / birthDate.size() * 100);
								ageAvg.add(thity / birthDate.size() * 100);
								ageAvg.add(forty / birthDate.size() * 100);
								ageAvg.add(fifty / birthDate.size() * 100);
								ageAvg.add(etc / birthDate.size() * 100);
								// 									System.out.println("ageAvg : " + ageAvg);
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
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="moiveRegistration.jsp">Logout</a>
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
	<script src="resources/js/sb-admin.js"></script>
	<!-- Custom scripts for this page-->
	<script src="resources/js/sb-admin-datatables.js"></script>
	<script src="resources/js/sb-admin-charts.js"></script>

</body>

</html>

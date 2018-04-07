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

	<!-- Navigation-->
	<div class="content-wrapper" >
	<div id='adminMainBody'>
		<div class="container-fluid" >
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">My Dashboard</li>
			</ol>
			
			<!-- Area Chart Example-->
			<div class="card mb-3">
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
					<!-- Card Columns Example Social Feed-->
<!-- 					<div class="mb-0 mt-4"> -->
<!-- 						<i class="fa fa-newspaper-o"></i> News Feed -->
<!-- 					</div> -->
					<hr class="mt-2">
<!-- 					<div class="card-columns"> -->
<!-- 						Example Social Card -->
<!-- 						<div class="card mb-3"> -->
<!-- 							<a href="#"> <img class="card-img-top img-fluid w-100" -->
<!-- 								src="https://unsplash.it/700/450?image=610" alt=""> -->
<!-- 							</a> -->
<!-- 							<div class="card-body"> -->
<!-- 								<h6 class="card-title mb-1"> -->
<!-- 									<a href="#">David Miller</a> -->
<!-- 								</h6> -->
<!-- 								<p class="card-text small"> -->
<!-- 									These waves are looking pretty good today! <a href="#">#surfsup</a> -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 							<hr class="my-0"> -->
<!-- 							<div class="card-body py-2 small"> -->
<!-- 								<a class="mr-3 d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-thumbs-up"></i>Like -->
<!-- 								</a> <a class="mr-3 d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-comment"></i>Comment -->
<!-- 								</a> <a class="d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-share"></i>Share -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 							<hr class="my-0"> -->
<!-- 							<div class="card-body small bg-faded"> -->
<!-- 								<div class="media"> -->
<!-- 									<img class="d-flex mr-3" src="http://placehold.it/45x45" alt=""> -->
<!-- 									<div class="media-body"> -->
<!-- 										<h6 class="mt-0 mb-1"> -->
<!-- 											<a href="#">John Smith</a> -->
<!-- 										</h6> -->
<!-- 										Very nice! I wish I was there! That looks amazing! -->
<!-- 										<ul class="list-inline mb-0"> -->
<!-- 											<li class="list-inline-item"><a href="#">Like</a></li> -->
<!-- 											<li class="list-inline-item">Â·</li> -->
<!-- 											<li class="list-inline-item"><a href="#">Reply</a></li> -->
<!-- 										</ul> -->
<!-- 										<div class="media mt-3"> -->
<!-- 											<a class="d-flex pr-3" href="#"> <img -->
<!-- 												src="http://placehold.it/45x45" alt=""> -->
<!-- 											</a> -->
<!-- 											<div class="media-body"> -->
<!-- 												<h6 class="mt-0 mb-1"> -->
<!-- 													<a href="#">David Miller</a> -->
<!-- 												</h6> -->
<!-- 												Next time for sure! -->
<!-- 												<ul class="list-inline mb-0"> -->
<!-- 													<li class="list-inline-item"><a href="#">Like</a></li> -->
<!-- 													<li class="list-inline-item">Â·</li> -->
<!-- 													<li class="list-inline-item"><a href="#">Reply</a></li> -->
<!-- 												</ul> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-footer small text-muted">Posted 32 mins -->
<!-- 								ago</div> -->
<!-- 						</div> -->
<!-- 						Example Social Card -->
<!-- 						<div class="card mb-3"> -->
<!-- 							<a href="#"> <img class="card-img-top img-fluid w-100" -->
<!-- 								src="https://unsplash.it/700/450?image=180" alt=""> -->
<!-- 							</a> -->
<!-- 							<div class="card-body"> -->
<!-- 								<h6 class="card-title mb-1"> -->
<!-- 									<a href="#">John Smith</a> -->
<!-- 								</h6> -->
<!-- 								<p class="card-text small"> -->
<!-- 									Another day at the office... <a href="#">#workinghardorhardlyworking</a> -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 							<hr class="my-0"> -->
<!-- 							<div class="card-body py-2 small"> -->
<!-- 								<a class="mr-3 d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-thumbs-up"></i>Like -->
<!-- 								</a> <a class="mr-3 d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-comment"></i>Comment -->
<!-- 								</a> <a class="d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-share"></i>Share -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 							<hr class="my-0"> -->
<!-- 							<div class="card-body small bg-faded"> -->
<!-- 								<div class="media"> -->
<!-- 									<img class="d-flex mr-3" src="http://placehold.it/45x45" alt=""> -->
<!-- 									<div class="media-body"> -->
<!-- 										<h6 class="mt-0 mb-1"> -->
<!-- 											<a href="#">Jessy Lucas</a> -->
<!-- 										</h6> -->
<!-- 										Where did you get that camera?! I want one! -->
<!-- 										<ul class="list-inline mb-0"> -->
<!-- 											<li class="list-inline-item"><a href="#">Like</a></li> -->
<!-- 											<li class="list-inline-item">Â·</li> -->
<!-- 											<li class="list-inline-item"><a href="#">Reply</a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-footer small text-muted">Posted 46 mins -->
<!-- 								ago</div> -->
<!-- 						</div> -->
<!-- 						Example Social Card -->
<!-- 						<div class="card mb-3"> -->
<!-- 							<a href="#"> <img class="card-img-top img-fluid w-100" -->
<!-- 								src="https://unsplash.it/700/450?image=281" alt=""> -->
<!-- 							</a> -->
<!-- 							<div class="card-body"> -->
<!-- 								<h6 class="card-title mb-1"> -->
<!-- 									<a href="#">Jeffery Wellings</a> -->
<!-- 								</h6> -->
<!-- 								<p class="card-text small"> -->
<!-- 									Nice shot from the skate park! <a href="#">#kickflip</a> <a -->
<!-- 										href="#">#holdmybeer</a> <a href="#">#igotthis</a> -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 							<hr class="my-0"> -->
<!-- 							<div class="card-body py-2 small"> -->
<!-- 								<a class="mr-3 d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-thumbs-up"></i>Like -->
<!-- 								</a> <a class="mr-3 d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-comment"></i>Comment -->
<!-- 								</a> <a class="d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-share"></i>Share -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 							<div class="card-footer small text-muted">Posted 1 hr ago</div> -->
<!-- 						</div> -->
<!-- 						Example Social Card -->
<!-- 						<div class="card mb-3"> -->
<!-- 							<a href="#"> <img class="card-img-top img-fluid w-100" -->
<!-- 								src="https://unsplash.it/700/450?image=185" alt=""> -->
<!-- 							</a> -->
<!-- 							<div class="card-body"> -->
<!-- 								<h6 class="card-title mb-1"> -->
<!-- 									<a href="#">David Miller</a> -->
<!-- 								</h6> -->
<!-- 								<p class="card-text small"> -->
<!-- 									It's hot, and I might be lost... <a href="#">#desert</a> <a -->
<!-- 										href="#">#water</a> <a href="#">#anyonehavesomewater</a> <a -->
<!-- 										href="#">#noreally</a> <a href="#">#thirsty</a> <a href="#">#dehydration</a> -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 							<hr class="my-0"> -->
<!-- 							<div class="card-body py-2 small"> -->
<!-- 								<a class="mr-3 d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-thumbs-up"></i>Like -->
<!-- 								</a> <a class="mr-3 d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-comment"></i>Comment -->
<!-- 								</a> <a class="d-inline-block" href="#"> <i -->
<!-- 									class="fa fa-fw fa-share"></i>Share -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 							<hr class="my-0"> -->
<!-- 							<div class="card-body small bg-faded"> -->
<!-- 								<div class="media"> -->
<!-- 									<img class="d-flex mr-3" src="http://placehold.it/45x45" alt=""> -->
<!-- 									<div class="media-body"> -->
<!-- 										<h6 class="mt-0 mb-1"> -->
<!-- 											<a href="#">John Smith</a> -->
<!-- 										</h6> -->
<!-- 										The oasis is a mile that way, or is that just a mirage? -->
<!-- 										<ul class="list-inline mb-0"> -->
<!-- 											<li class="list-inline-item"><a href="#">Like</a></li> -->
<!-- 											<li class="list-inline-item">Â·</li> -->
<!-- 											<li class="list-inline-item"><a href="#">Reply</a></li> -->
<!-- 										</ul> -->
<!-- 										<div class="media mt-3"> -->
<!-- 											<a class="d-flex pr-3" href="#"> <img -->
<!-- 												src="http://placehold.it/45x45" alt=""> -->
<!-- 											</a> -->
<!-- 											<div class="media-body"> -->
<!-- 												<h6 class="mt-0 mb-1"> -->
<!-- 													<a href="#">David Miller</a> -->
<!-- 												</h6> -->
<!-- 												<img class="img-fluid w-100 mb-1" -->
<!-- 													src="https://unsplash.it/700/450?image=789" alt="">I'm -->
<!-- 												saved, I found a cactus. How do I open this thing? -->
<!-- 												<ul class="list-inline mb-0"> -->
<!-- 													<li class="list-inline-item"><a href="#">Like</a></li> -->
<!-- 													<li class="list-inline-item">Â·</li> -->
<!-- 													<li class="list-inline-item"><a href="#">Reply</a></li> -->
<!-- 												</ul> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-footer small text-muted">Posted yesterday</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
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
					<!-- Example Notifications Card-->
<!-- 					<div class="card mb-3"> -->
<!-- 						<div class="card-header"> -->
<!-- 							<i class="fa fa-bell-o"></i> Feed Example -->
<!-- 						</div> -->
<!-- 						<div class="list-group list-group-flush small"> -->
<!-- 							<a class="list-group-item list-group-item-action" href="#"> -->
<!-- 								<div class="media"> -->
<!-- 									<img class="d-flex mr-3 rounded-circle" -->
<!-- 										src="http://placehold.it/45x45" alt=""> -->
<!-- 									<div class="media-body"> -->
<!-- 										<strong>David Miller</strong>posted a new article to <strong>David -->
<!-- 											Miller Website</strong>. -->
<!-- 										<div class="text-muted smaller">Today at 5:43 PM - 5m -->
<!-- 											ago</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</a> <a class="list-group-item list-group-item-action" href="#"> -->
<!-- 								<div class="media"> -->
<!-- 									<img class="d-flex mr-3 rounded-circle" -->
<!-- 										src="http://placehold.it/45x45" alt=""> -->
<!-- 									<div class="media-body"> -->
<!-- 										<strong>Samantha King</strong>sent you a new message! -->
<!-- 										<div class="text-muted smaller">Today at 4:37 PM - 1hr -->
<!-- 											ago</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</a> <a class="list-group-item list-group-item-action" href="#"> -->
<!-- 								<div class="media"> -->
<!-- 									<img class="d-flex mr-3 rounded-circle" -->
<!-- 										src="http://placehold.it/45x45" alt=""> -->
<!-- 									<div class="media-body"> -->
<!-- 										<strong>Jeffery Wellings</strong>added a new photo to the -->
<!-- 										album <strong>Beach</strong>. -->
<!-- 										<div class="text-muted smaller">Today at 4:31 PM - 1hr -->
<!-- 											ago</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</a> <a class="list-group-item list-group-item-action" href="#"> -->
<!-- 								<div class="media"> -->
<!-- 									<img class="d-flex mr-3 rounded-circle" -->
<!-- 										src="http://placehold.it/45x45" alt=""> -->
<!-- 									<div class="media-body"> -->
<!-- 										<i class="fa fa-code-fork"></i> <strong>Monica Dennis</strong>forked -->
<!-- 										the <strong>startbootstrap-sb-admin</strong>repository on <strong>GitHub</strong>. -->
<!-- 										<div class="text-muted smaller">Today at 3:54 PM - 2hrs -->
<!-- 											ago</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</a> <a class="list-group-item list-group-item-action" href="#">View -->
<!-- 								all activity...</a> -->
<!-- 						</div> -->
<!-- 						<div class="card-footer small text-muted">Updated yesterday -->
<!-- 							at 11:59 PM</div> -->
<!-- 					</div> -->
				</div>
			</div>
<!-- 			<!-- Example DataTables Card--> 
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i> UserInfomation
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Date of Birth</th>
									<th>Email</th>
									<th>Tel</th>
									<th>Grade</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Date of Birth</th>
									<th>Email</th>
									<th>Tel</th>
									<th>Grade</th>
								</tr>
							</tfoot>
							<tbody>
								<%
									System.out.println("usersInfo : " + request.getAttribute("users"));
								%>
								<c:forEach items="${users}" var="user">
									<tr>
										<td>${user.id}</td>
										<td>${user.name}</td>
										<td>${user.birthday}</td>
										<td>${user.email}</td>
										<td>${user.tel}</td>
										<td>${user.grade}</td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
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

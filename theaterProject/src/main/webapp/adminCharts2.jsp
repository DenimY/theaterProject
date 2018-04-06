<!DOCTYPE html>
<html lang="en">

<head>
<!--   <meta charset="utf-8"> -->
<!--   <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<!--   <meta name="description" content=""> -->
<!--   <meta name="author" content=""> -->
<!--   <title>SB Admin - Start Bootstrap Template</title> -->
<!-- Bootstrap core CSS-->
<!--   <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Custom fonts for this template-->
<!--   <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<!-- Custom styles for this template-->
<!--   <link href="resources/css/sb-admin.css" rel="stylesheet"> -->
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->

	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
			<li class="breadcrumb-item active">Charts</li>
		</ol>
		<!-- Area Chart Example-->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fa fa-area-chart"></i> 월별 매출 현황
			</div>
			<div class="card-body">
				<canvas id="myAreaChart" width="100%" height="30"></canvas>
			</div>
			<div class="card-footer small text-muted">Updated yesterday at
				11:59 PM</div>
		</div>
		<div class="row">
			<div class="col-lg-8">
				<!-- Example Bar Chart Card-->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-bar-chart"></i> Bar Chart Example
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
						<i class="fa fa-pie-chart"></i> Pie Chart Example
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="includ/navigation.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/loginmo.css" rel="stylesheet">
    <link href="resources/css/simple-sidebar.css" rel="stylesheet">
    <link href="resources/css/half-slider.css" rel="stylesheet">
   <link href="resources/css/custom.css" rel="stylesheet">

</head>

<body>

    
    
       <!-- Page Content -->
    <div class="container">
    
	   <hr>
	   <hr>
	
	   <div class="alert alert-success">
			   <button type="button" class="btn btn-info"> 서울 </button><br /><br />
			   <button type="button" class="btn btn-success"> 서울-지역1 </button>
			   <button type="button" class="btn btn-success"> 서울-지역2 </button>
			   <button type="button" class="btn btn-success"> 서울-지역3 </button>
			   <button type="button" class="btn btn-success"> 서울-지역4 </button>
			   <button type="button" class="btn btn-success"> 서울-지역5 </button>
	   </div>
	   
	   <div class="alert alert-success">	
		  	   <button type="button" class="btn btn-info"> 경기 </button><br /><br />
			   <button type="button" class="btn btn-success"> 경기 -지역1 </button>
			   <button type="button" class="btn btn-success"> 경기 -지역2 </button>
			   <button type="button" class="btn btn-success"> 경기 -지역3 </button>
			   <button type="button" class="btn btn-success"> 경기 -지역4 </button>
			   <button type="button" class="btn btn-success"> 경기 -지역5 </button>
	   </div>
	   
	   <div class="alert alert-success">
			   <button type="button" class="btn btn-info"> 인천 </button><br /><br />
			   <button type="button" class="btn btn-success"> 인천-지역1 </button>
			   <button type="button" class="btn btn-success"> 인천-지역2 </button>
			   <button type="button" class="btn btn-success"> 인천-지역3 </button>
			   <button type="button" class="btn btn-success"> 인천-지역4 </button>
			   <button type="button" class="btn btn-success"> 인천-지역5 </button>
	   </div>
	   
	   <div class="alert alert-success">
			   <button type="button" class="btn btn-info"> 대전 </button><br /><br />
			   <button type="button" class="btn btn-success"> 대전-지역1 </button>
			   <button type="button" class="btn btn-success"> 대전-지역2 </button>
			   <button type="button" class="btn btn-success"> 대전-지역3 </button>
			   <button type="button" class="btn btn-success"> 대전-지역4 </button>
			   <button type="button" class="btn btn-success"> 대전-지역5 </button>
	   </div>
	   
	   <div class="alert alert-success">
			   <button type="button" class="btn btn-info"> 부산 </button><br /><br />
			   <button type="button" class="btn btn-success"> 부산-지역1 </button>
			   <button type="button" class="btn btn-success"> 부산-지역2 </button>
			   <button type="button" class="btn btn-success"> 부산-지역3 </button>
			   <button type="button" class="btn btn-success"> 부산-지역4 </button>
			   <button type="button" class="btn btn-success"> 부산-지역5 </button>
	   </div>
	   
	   <div class="alert alert-success">
			   <button type="button" class="btn btn-info"> 광주 </button><br /><br />
			   <button type="button" class="btn btn-success"> 광주-지역1 </button>
			   <button type="button" class="btn btn-success"> 광주-지역2 </button>
			   <button type="button" class="btn btn-success"> 광주-지역3 </button>
			   <button type="button" class="btn btn-success"> 광주-지역4 </button>
			   <button type="button" class="btn btn-success"> 광주-지역5 </button>
	   </div>
	   
	   <div class="alert alert-success">
			   <button type="button" class="btn btn-info"> 제주 </button><br /><br />
			   <button type="button" class="btn btn-success"> 제주-지역1 </button>
			   <button type="button" class="btn btn-success"> 제주-지역2 </button>
			   <button type="button" class="btn btn-success"> 제주-지역3 </button>
			   <button type="button" class="btn btn-success"> 제주-지역4 </button>
			   <button type="button" class="btn btn-success"> 제주-지역5 </button>
	   </div>
	 </div>

      </div>
    </div>
    <!-- /.container -->
   
    <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
   
   
</body>
<%@include file ="includ/footer.jsp" %>
</html>
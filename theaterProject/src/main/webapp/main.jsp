<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file ="includ/navigation.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JAVA THEATER</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WELCOME JAVA THEATER</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/half-slider.css" rel="stylesheet">
    <link href="resources/css/custom.css" rel="stylesheet">
    <link href="resources/css/loginmo.css" rel="stylesheet">
</head>
<body>

<!-- Movie Slide -->
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <c:forEach items="${movie_slide}" var="slide" varStatus ="status" begin="0" >
          <c:if test="${status.first}">
          	<div class="carousel-item active" style="background-image: url('${pageContext.request.contextPath}/image/${slide.title}/${movie_slideImage[0].filename}')">
          </c:if>
         <c:if test="${not status.first}">
			<div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/image/${slide.title}/${movie_slideImage[status.index].filename}')">         
         </c:if>
         
         
            <div class="carousel-caption d-none d-md-block">
              <h3>${slide.title}</h3>
              <p>${slide.singlePlot}</p>
            </div>
          </div>
          </c:forEach>
        </div>  
        
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>
    
<!-- Page Content -->
    <section class="py-5">
      <div class="container">
      <center>
           <h1>WELCOME JAVA THEATER</h1>
           <p>Welcome to the Java movie theater.</p>
       </center>
      </div>
    </section>

<!-- Page Content -->
    <div class="container">

<!-- Movie List -->
      <h1 class="my-4">개봉 영화
      </h1>

      <div class="row">
      <c:forEach items="${showing}" var ="movieList" varStatus ="status" begin="0" >
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="getMovie.do?id=${movieList.id}&title=${movieList.title}" onClick="window.open(this.href, '', 'width=800, height=800'); return false;" >
            <img class="card-img-top" src="${pageContext.request.contextPath}/image/${movieList.title}/${showingFile[status.index].filename}" alt="엑박"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="getMovie.do?id=${movieList.id}&title=${movieList.title}" 
                onClick="window.open(this.href, '', 'width=800, height=800'); return false;" >${movieList.title}</a>
              </h4>
              <p class="card-text">${movieList.singlePlot}</p>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
 
 	  <h1 class="my-4">개봉 예정 영화
      </h1>
      <div class="row">
      <c:forEach items="${notShowing}" var ="movieList" varStatus ="status" begin="0" >
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="getMovie.do?id=${movieList.id}&title=${movieList.title}" onClick="window.open(this.href, '', 'width=800, height=800'); return false;" >
            <img class="card-img-top" src="${pageContext.request.contextPath}/image/${movieList.title}/${notShowingFile[status.index].filename}" alt="엑박"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="getMovie.do?id=${movieList.id}&title=${movieList.title}" 
                onClick="window.open(this.href, '', 'width=800, height=800'); return false;" >${movieList.title}</a>
              </h4>
              <p class="card-text">${movieList.singlePlot}</p>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
    
    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">Event Page
        <small>(이벤트 페이지)</small>
      </h1>

      <div class="row">
        <div class="col-lg-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="./img/event1.PNG" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">이벤트 1</a>
              </h4>
              <p class="card-text">이벤트 1에 대한 설명.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="./img/event2.PNG" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">이벤트2</a>
              </h4>
              <p class="card-text">이벤트2에 대한 설명.</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </div>
    

    <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<%@include file ="includ/footer.jsp" %>
  </body>
</html>

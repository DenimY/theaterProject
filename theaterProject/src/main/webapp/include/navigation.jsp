<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../resources/css/half-slider.css" rel="stylesheet">
<link href="../resources/css/loginmo.css" rel="stylesheet">
<link href="../resources/css/custom.css" rel="stylesheet">
    <style>
		#myBtnNavi{
		    color: white;
		    float: right;
		    font-size: 15px;
		    font-weight: bold;
		    margin-right:40px;
		
		}
		
		.positionBox{
			width: 100%;
			height: 55px;
		}
    </style>
    
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>

</head>

<body>
  <div class="positionBox"></div>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="home.do">JAVA THEATER</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div>
	
   <div class="collapse navbar-collapse" id="navbarResponsive">
         <a class="menua" href="searchMovie.do">영화</a>
         <a class="menua" href="UnderConstruction.do">영화관</a>
         <a class="menua" href="UnderConstruction.do">이벤트</a>
   	<a class="menua" href="boardList.do">게시판</a>

		<!-- 로그인 후 -->
		<c:if test="${users!=null}">
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					
					<li class="nav-item"><a class="nav-link"
						href="UserMyPageIndex.jsp">${users.name}님 환영합니다.(내 정보 보기)</a></li>
				</ul>
			</div>
		</c:if>
		<!-- 로그인 전 -->
		<c:if test="${users==null}">
         <!-- Trigger/Open The loginmo -->
         <a id="myBtnNavi">로그인</a>
         <!-- The loginmo -->
         <div id="myloginmo" class="loginmo">
            <!-- loginmo content -->
            <div class="loginmo-content">
            	<div class="loginmo-header">
                  <h2>&ensp;로그인</h2>
						<span class="close">&times;</span>

					</div>
               <div class="loginmo-body">
               	<center><br/><br/><br/> 
						<form action="login.do" method="post" name ="loginput" onsubmit="return loginchk()" >
							아이디 <input type="text" size="30" name="id" id="id" /><br />
							비밀번호 <input type="password" size="30" name="pw" id="pw" /><br />
<!-- 							<br> <input type="submit" value="로그인" /> -->
							<br><button onclick="checkValue()" type="submit">로그인</button>
						</form>
                </center>
               </div><br><br><br><br><br><br><br>
               <div class="loginmo-footer">
						<p>비밀번호 찾기
						<a href="resistration.jsp" id="register">회원가입</a>
						</p>
					</div>
				</div>
			</div>
			<!-- 로그인 박스  -->
			<script type="text/javascript">
            // Get the loginmo
            var loginmo = document.getElementById('myloginmo');

            // Get the button that opens the loginmo
            var btn = document.getElementById("myBtnNavi");

            // Get the <span> element that closes the loginmo
				var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the loginmo 
				btn.onclick = function() {
               loginmo.style.display = "block";
				}

            // When the user clicks on <span> (x), close the loginmo
				span.onclick = function() {
               loginmo.style.display = "none";
				}

            // When the user clicks anywhere outside of the loginmo, close it
				window.onclick = function(event) {
               if (event.target == loginmo) {
                  loginmo.style.display = "none";
               }
				}
			</script>
		</c:if>
	</div>
	</nav>
		<script type="text/javascript">
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
 
		function loginchk() {

			var loginput = eval("document.loginput");

			if (loginput.id.value == "") {
				alert("아이디를 입력해 주세요.");
				return false;
			}
			if (loginput.pw.value == "") {
				alert("비밀번호를 입력해 주세요.");
				return false;
			}
		}
		</script>
	
</body>


<!-- Bootstrap core JavaScript -->
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>
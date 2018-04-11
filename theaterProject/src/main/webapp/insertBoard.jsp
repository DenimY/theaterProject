<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>글쓰기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>



<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]> 
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> 
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> 
<![endif]-->
</head>
<body>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>


	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<h2><a href="main.jsp"><small>JAVA THEATER</small></a></h2>
		</div>

		<div class="panel-body">

			<div class="container">
				<form action="insertBoard.do" method="post">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="writer">NAME</label> <input type="text"
										class="form-control" name="writer" id="name"
										value="${users.id}"readonly>
								</div>
							</div>


							<div class="col-md-6">
								<div class="form-group">
									<label for="pass">Password</label> <input type="password"
										class="form-control" name="password" id="pass"
										placeholder="Enter password">
								</div>
							</div>

						</div>

						<div class="form-group">
							<label for="subject">Title</label> <input type="text"
								class="form-control" name="title" 
								placeholder="Enter title">
						</div>

						<div class="form-group">
							<label for="content">Comment:</label>
							<textarea class="form-control" rows="10" name="contents"
								></textarea>
						</div>

						<div class="center-block" style='width: 200px'>
							<input type="submit" value="등록하기">
							 <input type="reset" value="다시쓰기">
						</div>
				</form>
			</div>
		</div>
		<!--panel end-->
	</div>

</body>
 </html>



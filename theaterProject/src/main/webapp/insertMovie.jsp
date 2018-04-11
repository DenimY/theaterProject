<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>삽입</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>

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


<script type="text/javascript">
attachFile = {
              idx:0,
              add:function(){ // 파일필드 추가
                  var o = this;
                  var idx = o.idx;
       
                  var div = document.createElement('div');
                  div.style.marginTop = '3px';
                  div.id = 'file' + o.idx;
       
                  var file = document.all ? document.createElement('<input name="file">') : document.createElement('input');
                  file.type = 'file';
                  file.name = 'movie_image'+o.idx;
                                                
                  var btn = document.createElement('input');
                  btn.type = 'button';
                  btn.value = '삭제';
                  btn.onclick = function(){o.del(idx)}
                  btn.style.marginLeft = '5px';
       
                  div.appendChild(file);
                  div.appendChild(btn);
                  document.getElementById('attachFileDiv').appendChild(div);
       
                  o.idx++;
              },
              del:function(idx){ // 파일필드 삭제
                  document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
              }
          }
</script>
</head>
<body>
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
			<li class="breadcrumb-item active">Add Movie</li>
		</ol>
		<div class="card mb-3">
			<div class="card-header">
				<i class="fa fa-table"></i> UserInfomation
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<center>
						<!--       <h1>영화 추가</h1> -->
						<hr>
						<form action="fileUpload.do" method="post"
							enctype="multipart/form-data">
							<table border="1" cellpadding="0" cellspacing="0">
								<tr>
									<td bgcolor="orange" width="70">제목</td>
									<td align="left"><input name="title" type="text"></td>
								</tr>
								<tr>
									<td bgcolor="orange">연령대</td>
									<td align="left"><select name="age">
											<option value="15">15세</option>
											<option value="19">19세</option>
											<option value="all">전체연령가</option>
									</select>
								</tr>
								<tr>
									<td bgcolor="orange">장르</td>
									<td align="left"><input type="checkbox" name="checkType"
										value="멜로">멜로 <input type="checkbox" name="checkType"
										value="액션">액션 <input type="checkbox" name="checkType"
										value="공포">공포 <input type="checkbox" name="checkType"
										value="코미디">코미디 <input type="checkbox"
										name="checkType" value="스릴러">스릴러 <input
										type="checkbox" name="checkType" value="SF">SF <input
										type="checkbox" name="checkType" value="드라마">드라마 <input
										type="checkbox" name="checkType" value="판타지">판타지 <input
										type="checkbox" name="checkType" value="미스터리">미스터리
								</tr>
								<tr>
									<td bgcolor="orange">줄거리</td>
									<td align="left"><input name="singlePlot" type="text">
								</tr>
								<tr>
									<td bgcolor="orange">상영 시간</td>
									<td align="left"><input name="time" type="number" min="1"
										max="300">
								</tr>
								<tr>
									<td bgcolor="orange">개봉일</td>
									<td align="left"><input type="date" name="openingDay"
										min="2000-01-01" max="2019-12-31">
								</tr>
								<tr>
									<td bgcolor="orange">감독</td>
									<td align="left"><input name="director" type="text"
										value="123">
								</tr>
								<tr>
									<td bgcolor="orange">배우</td>
									<td align="left"><input name="actor" type="text"
										value="qwe">
								</tr>
								<tr>
									<td bgcolor="orange">내용</td>
									<td align="left"><textarea name="content" cols="40"
											rows="10" value="123"></textarea>
								</tr>
								<tr>
									<td bgcolor="orange">타이틀 사진</td>
									<td align="left"><input type="file"
										name="movie_title_image" /></td>
								</tr>

								<tr>
									<td bgcolor="orange">내용 사진</td>
									<td align="left">
										<div id="attachFileDiv">
											<input type="file" name="movie_image" /> <input
												type="button" value="추가" onclick="attachFile.add()"
												style="margin-left: 5px">
										</div>
									</td>
								</tr>

								<tr>
									<td bgcolor="orange">내용 동영상</td>
									<td align="left"><input type="file" name="movie_video" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										value="영화 추가"></td>
								</tr>
							</table>
						</form>
						<hr>
						<a href="deleteMovie.do">삭제</a> <a href="searchMovie.do">돌아가기</a>
					</center>
				</div>
			</div>
		</div>
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
<!-- 		<script src="resources/vendor/jquery/jquery.min.js"></script> -->
<!-- 		<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
		<!-- Core plugin JavaScript-->
<!-- 		<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script> -->
		<!-- Page level plugin JavaScript-->
<!-- 		<script src="resources/vendor/chart.js/Chart.min.js"></script> -->
<!-- 		<script src="resources/vendor/datatables/jquery.dataTables.js"></script> -->
<!-- 		<script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script> -->
		<!-- Custom scripts for all pages-->
<!-- 		<script src="resources/js/sb-admin.min.js"></script> -->
		<!-- Custom scripts for this page-->
<!-- 		<script src="resources/js/sb-admin-datatables.min.js"></script> -->
<!-- 		<script src="resources/js/sb-admin-charts.js"></script> -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>bootstrap template</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<article class="container">
		<div class="col-md-12">
			<div class="page-header">
				<center>
				<h1>
				</h1>
				</center>
			</div>
			<form class="form-horizontal" action="join.do" method="post" name="userinput" onsubmit="return checkValue()">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="id">아이디</label> <input
						type="button" value="중복확인" onclick="idChk()">
					</td>

					<div class="col-sm-6">
						<input class="form-control" id="userid" name="id"
							placeholder="아이디">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" type="password" id="pw" name="pw"
							placeholder="비밀번호">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="name">이름</label>
					<div class="col-sm-6">
						<input class="form-control" type="text" id="name" name="name"
							placeholder="이름">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="gender">성별</label>
					<div class="col-sm-6">
						<input type="radio" name="gender" id="male" >남자
						 <input type="radio" name="gender" id="female">여자
					</div>
				</div>

				<div class="form-group">		
							<label class="col-sm-3 control-label" for="address">주소</label>
					<div class="col-sm-6">
						<table width=520px>
							<th>
								<div class="input-group">
									<table>
										<th> <input class="form-control" type="text" id="postcode" name="postcode" placeholder="우편번호" readonly />  </th>
										<th> <input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" /><br> </th>
									</table>
								</div>
								<input class="form-control"  type="text" id="address" name="address" placeholder="한글주소" readonly />
								<input class="form-control" type="text" id="addressdetail" name="addressdetail" placeholder="자세히 입력 해주세요." />
							</th>
						</table>
					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none; position:absolute; overflow:hidden; z-index:1; -webkit-overflow-scrolling:touch;">
						
							<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" 
							style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
					</div>
				</div>
				
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script>
				    // 우편번호 찾기 화면을 넣을 element
				    var element_layer = document.getElementById('layer');
				
				    function closeDaumPostcode() {
				        // iframe을 넣은 element를 안보이게 한다.
				        element_layer.style.display = 'none';
				    }
				
				    function sample2_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullAddr = data.address; // 최종 주소 변수
				                var extraAddr = ''; // 조합형 주소 변수
				
				                // 기본 주소가 도로명 타입일때 조합한다.
				                if(data.addressType === 'R'){
				                    //법정동명이 있을 경우 추가한다.
				                    if(data.bname !== ''){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있을 경우 추가한다.
				                    if(data.buildingName !== ''){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
				                document.getElementById('address').value = fullAddr;
				                document.getElementById('sample2_addressEnglish').value = data.addressEnglish;
				
				                // iframe을 넣은 element를 안보이게 한다.
				                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				                element_layer.style.display = 'none';
				            },
				            width : '100%',
				            height : '100%',
				            maxSuggestItems : 5
				        }).embed(element_layer);
				
				        // iframe을 넣은 element를 보이게 한다.
				        element_layer.style.display = 'block';
				
				        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
				        initLayerPosition();
				    }
				
				    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
				    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
				    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
				    function initLayerPosition(){
				        var width = 300; //우편번호서비스가 들어갈 element의 width
				        var height = 400; //우편번호서비스가 들어갈 element의 height
				        var borderWidth = 5; //샘플에서 사용하는 border의 두께
				
				        // 위에서 선언한 값들을 실제 element에 넣는다.
				        element_layer.style.width = width + 'px';
				        element_layer.style.height = height + 'px';
				        element_layer.style.border = borderWidth + 'px solid';
				        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
				        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
				        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
				    }
				</script>

				
				
				

				<div class="form-group">
					<label class="col-sm-3 control-label" for="email">이메일</label>
					<div class="col-sm-6">
						<input class="form-control" type="email" id="email" name="email"
							placeholder="이메일">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="birthday">생일</label>
					<div class="col-sm-6">
						<input class="form-control" type="date" id="birthday"
							name="birthday">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="tel">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<table><th>
							<select name="tel-num">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
							</select></th>
							<th>
							<input type="tel" class="form-control" id="tel" name="tel"
								placeholder="- 없이 입력해 주세요" />
								</th>
							</table>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-primary" onclick="checkValue()" type="submit">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
<!-- 						<input type class="btn btn-primary" type="submit" onclick="checkValue()" value="회원가입"> -->
						
					</div>
				</div>
			</form>
			<hr>
		</div>
	</article>

	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		function idChk() {

			$('#userid').val()
			$.ajax({
				type : 'POST',
				url : 'idchk.do',
				data : {
					"id" : $('#userid').val()
				},
				success : function(data) {
					if (data != 0) {
						alert("이미 가입된 아이디 입니다.");
					} else {
						alert("사용 할 수 있는 아이디 입니다.");
					}
				}
			});
		}
	</script>
	
	<script type="text/javascript">
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
 
		function checkValue() {

			var userinput = eval("document.userinput");

			if (userinput.id.value == "") {
				alert("아이디를 입력해 주세요.");
				return false;
			}
			if (userinput.pw.value == "") {
				alert("비밀번호를 입력해 주세요.");
				return false;
			}
			if (userinput.name.value == "") {
				alert("이름을 입력해 주세요.");
				return false;
			}
			if (userinput.gender.value == "") {
				alert("성별을 선택해 주세요.");
				return false;
			}
			if (userinput.address.value == "") {
				alert("주소를 입력해 주세요.");
				return false;
			}
			if (userinput.email.value == "") {
				alert("이메일을 입력해 주세요.");
				return false;
			}
			if (userinput.birthday.value == "") {
				alert("생일을 입력해 주세요.");
				return false;
			}
			if (userinput.tel.value == "") {
				alert("전화번호를 입력해 주세요.");
				return false;
			}
		}
	</script>

</body>

</html>

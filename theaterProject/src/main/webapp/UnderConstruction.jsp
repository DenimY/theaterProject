<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
</body>
<script type="text/javascript">
var message1 = '${msg1}';
var message2 = '${msg2}';
var returnUrl = '${url}'; 
alert(message1);
alert(message2);
window.close();
document.location.href = returnUrl; 
</script>
</html>
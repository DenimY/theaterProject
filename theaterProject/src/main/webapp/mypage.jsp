<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
        <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                 <!-- id는 수정이 불가능하도록 readonly속성 추가 -->
                <td><input name="id" value="${users.id}" readonly="readonly"></td>
            </tr>
        
            <tr>
                <td>이름</td>
                <td><input name="name" value="${users.name}" readonly></td>
            </tr>
            <!-- 누락된 부분 -->
            <tr>
                <td>이메일주소</td>
                <td><input name="email" value="${users.email}" readonly></td>
            </tr>
            <!-- 누락된 부분 -->
            <tr>
                <td>생일</td>
                   <td><input name="birthday" value="${users.birthday}" readonly></td>
            </tr>
     
            <tr>
                <td colspan="2" align="center">
                    <a href="mypageUpdage.jsp"><input type="button" value="수정"></a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

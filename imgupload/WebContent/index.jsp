<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라이브러리 x</title>
</head>
<body>

<form action="ex01.jsp" method="post" enctype="multipart/form-data">
	이름: <input type="text" name="name" value="홍길동"/>
	파일: <input type="file" name="upload"/>
	<input type="submit" />
</form>

<form action="libo.jsp" method="post" enctype="multipart/form-data">
	이름: <input type="text" name="name" value="라이브러리"/>
	파일: <input type="file" name="upload"/>
	<input type="submit" />
</form>

</body>
</html>
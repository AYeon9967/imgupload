<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라이브러리 x</title>
</head>
<body>

<%
   request.setCharacterEncoding("UTF-8");  
   // String contentType = request.getContentType();
   Enumeration<String> en = request.getHeaderNames();
   out.println("> 전송받은 헤더 정보 출력<br>");
   while( en.hasMoreElements() ){
	   String key = en.nextElement();
	   String value = request.getHeader(key);
	   out.println(key+" : "+ value + "<br>");
   }
   
   out.println("<br> > 전송받은 데이터 출력<br>");
   ServletInputStream sis= request.getInputStream();
   DataInputStream dis = new DataInputStream(sis);
   String line = "";
   while( ( line = dis.readLine() ) != null ){
	   out.println( new String( 
			   line.getBytes("ISO-8859-1"), "UTF-8" ) +"<br>" );
   }
%>

</body>
</html>
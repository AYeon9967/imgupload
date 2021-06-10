<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라이브러리 o</title>
</head>
<body>

<%
	// 1. upload 폴더 생성이 안되어 있으면 생성
	String saveDirectory = pageContext.getServletContext().getRealPath("/days23/upload");
	System.out.println(saveDirectory);

	File saveDir = new File(saveDirectory);
	if (!saveDir.exists())
		saveDir.mkdirs();

	// 2. 최대크기 설정
	int maxPostSize = 1024 * 1024 * 5; // 5MB  단위 byte

	//3. 인코딩 방식 설정
	String encoding = "UTF-8";

	//4. 파일정책, 파일이름 충동시 덮어씌어짐으로 파일이름 뒤에 인덱스를 붙인다.
    //a.txt
	//a1.txt 와 같은 형식으로 저장된다.
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest mrequest 
	= new MultipartRequest(request //MultipartRequest를 만들기 위한 request
			, saveDirectory //저장 위치
			, maxPostSize //최대크기
			, encoding //인코딩 타입
			, policy); //파일 정책
	
	String name = mrequest.getParameter("name");
	File uploadFile = mrequest.getFile("upload");
  //input type="file" 태그의 name속성값을 이용해 파일객체를 생성
	long uploadFile_length = uploadFile.length();
	String originalFileName = mrequest.getOriginalFileName("upload"); //기존 이름
	String filesystemName = mrequest.getFilesystemName("upload"); //기존
%>

> 이름 :
<%=name%><br>
> 첨부된 파일명 :
<%=uploadFile.getName()%><br>
>>> originalFileName :
<%=originalFileName%>
<br>
>>> filesystemName :
<%=filesystemName%>
<br>
> 첨부된 파일 크기 :
<%=uploadFile_length%>
bytes
<br>

<br>
</body>
</html>
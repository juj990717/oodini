<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기 왜 안되냐</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

int count=1;

String saveFolder=application.getRealPath(".")+"\\sourceCode\\Files";
String encType="EUC-KR";
int maxSize=5*1024*1024;
String filename=null;

Connection conn=null; Statement stmt=null;
try{
	MultipartRequest multi=null;
	multi = new MultipartRequest(request, saveFolder,maxSize,encType, new DefaultFileRenamePolicy());
	String id = multi.getParameter("id");
	String passwd = multi.getParameter("passwd");
	String title=multi.getParameter("title");
	String contents=multi.getParameter("contents");
	Enumeration files=multi.getFileNames();
	
	while(files.hasMoreElements()){
		String name=(String)files.nextElement();
		
		filename=multi.getFilesystemName(name);
		
	}

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/smart2019?serverTimezone=UTC&characterEncoding=euckr&user=root&password=1234");
	stmt=conn.createStatement();
	String sql="insert into board(w_name, w_pass, w_title, w_contents, w_file) values('" + id + "','" + passwd + "','" + title + "','" + contents + "','" + filename + "')";
	stmt.executeUpdate(sql);
	response.sendRedirect("boardList.jsp");


}catch(Exception e){	
	System.out.println(e.toString());
}finally{
	if(stmt!=null){
		try{stmt.close();}
		catch(SQLException ex){}
	}
	if(conn!=null){
		try{conn.close();}
		catch(Exception ex){}
		}
	}
%>
</body>
</html>
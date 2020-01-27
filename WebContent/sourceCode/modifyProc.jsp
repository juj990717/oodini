
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정프록</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

int count=1;

String file=request.getParameter("file");
String saveFolder=application.getRealPath(".")+"\\sourceCode\\Files";
String encType="EUC-KR";
int maxSize=5*1024*1024;
String filename=null;
int idx = Integer.parseInt(request.getParameter("id"));

Connection conn=null; Statement stmt=null;	ResultSet rs = null;

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
	rs=stmt.executeQuery("SELECT*FROM board where w_id="+idx);
	stmt.executeUpdate("update board set w_name='" + id + "',w_pass='" + passwd + "', w_title='" + title + "',w_contents='" + contents + "',w_file='" + filename + "' where w_id="+idx);
	
	response.sendRedirect("read.jsp?id="+ idx);


}catch(Exception e){	
	System.out.println(e.toString());
}finally{
	if(rs!=null){
		try{rs.close();}
		catch(SQLException ex){}
	}
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
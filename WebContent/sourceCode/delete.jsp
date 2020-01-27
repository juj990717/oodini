<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>삭제</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

int count=1;

String encType="EUC-KR";
String filename=null;
int idx = Integer.parseInt(request.getParameter("id"));
System.out.println(idx);
Connection conn=null; Statement stmt=null;	ResultSet rs = null;

try{

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/smart2019?serverTimezone=UTC&characterEncoding=euckr&user=root&password=1234");
	stmt=conn.createStatement();System.out.println(idx);

	rs=stmt.executeQuery("SELECT*FROM board where w_id="+idx);
	stmt.executeUpdate("delete from board where w_id="+idx);
	response.sendRedirect("boardList.jsp?id="+ idx);


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
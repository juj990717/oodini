g<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone =request.getParameter("phone");
Connection conn=null; Statement stmt=null;
Class.forName("com.mysql.cj.jdbc.Driver");
try {
conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/smart2019?serverTimezone=UTC&characterEncoding=euckr&user=root&password=1234");
stmt=conn.createStatement();
String sql="insert into tblMember values('"+id+"','"+passwd+"','"+name+"','"+email+"','"+phone+"')";
stmt.executeUpdate(sql);
response.sendRedirect("loginForm.jsp");
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
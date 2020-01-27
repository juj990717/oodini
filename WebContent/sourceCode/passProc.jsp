<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
String passwd = request.getParameter("passwd");

String mode = request.getParameter("mode");
int idx= Integer.parseInt( request.getParameter("id"));
String name = request.getParameter("name");
Connection conn=null; Statement stmt=null; ResultSet rs=null;
Class.forName("com.mysql.cj.jdbc.Driver");

try{
conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/smart2019?serverTimezone=UTC&characterEncoding=euckr&user=root&password=1234");
stmt=conn.createStatement();
request.setCharacterEncoding("euc-kr");

String sql="SELECT*FROM board where w_id="+idx;


rs=stmt.executeQuery(sql);
if(rs!=null){
	while(rs.next()){
		if(passwd.equals(rs.getString("w_pass"))){
			if(mode.equals("modify"))
				response.sendRedirect("modifyForm.jsp?id="+ idx);
			if(mode.equals("delete"))
				response.sendRedirect("delete.jsp?id="+idx+"");
			}
		else{
			%>
			<script>alert("비밀번호 틀렸응께 글 읽기로 넘어가겠다우!!");
			location.href="read.jsp?id=<%=idx%>";
			</script>
			<% 
            
		}
		}
}else
	response.sendRedirect("register.jsp");
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
		catch(SQLException ex){}
	}
	
}
%>

}
</body>
</html>
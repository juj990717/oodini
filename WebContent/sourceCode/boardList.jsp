<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("euc-kr");
Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=null; 
	Statement stmt=null; 
	ResultSet rs=null;
	String w_id="", w_name="", w_pass="", w_title="", w_contents="",w_count="", w_file="";
	int counter=0;
	try{
		conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/smart2019?serverTimezone=UTC&characterEncoding=euckr&user=root&password=1234");
		stmt=conn.createStatement();
		rs = stmt.executeQuery("SELECT*FROM board");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP���� �����ͺ��̽� ����</title>
<link href="style.css" rel="stylesheet" type="test/css">
</script>
</head>
<body bgcolor="#FFFFCC">
	<h2>Board List</h2>
	<h3>�� ����</h3>
	<table bordercolor="#0000af" border="1">
		<tr>
			<td><string>�� ��ȣ</string></td>
			<td><string>�� ����</string></td>
			<td><string>�ۼ���</string></td>
			<td><string>��ȸ��</string></td>
		</tr>
		<%
			if(rs!=null){
				while(rs.next()){
					w_id=rs.getString("w_id");
					w_name=rs.getString("w_name");
					w_title=rs.getString("w_title");
					w_count=rs.getString("w_count");

		%>
		<tr>
			<td><%=w_id %></td>
			<td><a href="read.jsp?id=<%=w_id%>"><%=w_title%></a></td>
			<td><%=w_name %></td>
			<td><%=w_count %></td>
			
			<%
				counter++;
							}
					}
			%>
		</tr>
	</table>
	
	<br>
	<a href="writeForm.jsp">�۾��� </a>&nbsp;&nbsp; &nbsp;
	<a href="logOut.jsp">�α׾ƿ�</a>
	<%
		}catch(SQLException sqlExceptoin){
			System.out.println(sqlExceptoin.toString());
		}catch(Exception sqlExceptoin){
			System.out.println("exception");
		}
		finally{
			if(rs!=null)
				try{rs.close();}
				catch(SQLException ex){}
			if(stmt!=null)
				try{stmt.close();}
				catch(SQLException ex){}
			if(conn!=null)
				try{conn.close();}
				catch(Exception ex){}
		}
	%>


</body>
</html>
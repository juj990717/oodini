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
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String autoLogin="";
if(request.getParameter("autoLogin")!=null) //�ڵ��α��� üũ ���� �� ����ó���� ���ش�. üũ���ϸ� null�� ���⶧���� �� ���� ���� ó���� �ʿ��ϴ�
	autoLogin = request.getParameter("autoLogin");

Connection conn=null; Statement stmt=null; ResultSet rs=null;
Class.forName("com.mysql.cj.jdbc.Driver");

try{
conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/smart2019?serverTimezone=UTC&characterEncoding=euckr&user=root&password=1234");
stmt=conn.createStatement();
String sql="select passwd from tblMember where id='"+id+"'";
rs=stmt.executeQuery(sql);
if(rs!=null){
	while(rs.next()){
		if(passwd.equals(rs.getString("passwd"))){
			if(autoLogin.equals("true")){ //�ڵ��α��� üũ �� 
				Cookie mycookie=new Cookie("id",id);
				Cookie mycookie2=new Cookie("pass",passwd); //��Ű����
				response.addCookie(mycookie); //��Ű �߰� �� ����
				response.addCookie(mycookie2);
			}
			session.setAttribute("id",id);//�ڵ��α��� ���ο� ������� �α��ο� �����ϸ� ���ǼӼ�����
			response.sendRedirect("boardList.jsp");
		}
		else
			out.println("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
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
</body>
</html>
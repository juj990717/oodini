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
if(request.getParameter("autoLogin")!=null) //자동로그인 체크 안할 시 예외처리를 해준다. 체크안하면 null이 오기때문에 그 값에 대한 처리가 필요하다
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
			if(autoLogin.equals("true")){ //자동로그인 체크 시 
				Cookie mycookie=new Cookie("id",id);
				Cookie mycookie2=new Cookie("pass",passwd); //쿠키생성
				response.addCookie(mycookie); //쿠키 추가 및 전달
				response.addCookie(mycookie2);
			}
			session.setAttribute("id",id);//자동로그인 여부와 상관없이 로그인에 성공하면 세션속성생성
			response.sendRedirect("boardList.jsp");
		}
		else
			out.println("비밀번호가 틀렸습니다.");
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
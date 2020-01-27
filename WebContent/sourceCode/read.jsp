
<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.sql.*" 
	pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs = null;
	String title="", name="", contents="", file=null;
	int id;
	
	int idx = Integer.parseInt(request.getParameter("id"));
	int count,counter=0;
	try{
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smart2019?serverTimezone=UTC&charcterEncoding=euckr","root","1234");
		stmt=conn.createStatement();
		stmt.executeUpdate("update board set w_count=w_count+1 where w_id="+idx);
		rs=stmt.executeQuery("SELECT*FROM board where w_id="+idx);
		if(rs.next()){
			id = rs.getInt("w_id");
			title=rs.getString("w_title");
			contents=rs.getString("w_contents");
			count=rs.getInt("w_count");
			name=rs.getString("w_name");
			file=rs.getString("w_file");
		}
%>
<html>
<head>
<title>게시판 만들기</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#996600">
<table width="800" align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="2"><font color="#FFFFFF"><b>글 읽기</b></font></td>
          </tr>
          <tr> 
            <td width="24%">작성자</td>
            <td width="60%"> <%=name %></td>
          </tr>
          <tr> 
            <td>글 제목</td> 
            <td><%=title %> </td>
          </tr>
          <tr> 
            <td>첨부파일</td><td><a href="Files/<%=file %>"><%=file %></a></td></tr>
            <tr><td>내용</td><td><%=contents %></td></tr>
            </table>
            </td></tr>
            <tr><td colspan=2><a href="boardList.jsp">글 목록보기</a>&nbsp;&nbsp;
            <a href="pass.jsp?id=<%=idx %>&mode=modify">수정하기</a>&nbsp;&nbsp;
            <a href="pass.jsp?id=<%=idx %>&mode=delete">삭제하기</a></td></tr>
            
            </table></body></html>
            
<%
	}catch(SQLException sqlException){	
		System.out.println(sqlException.toString());
	}catch(Exception exception){	
		System.out.println(exception.toString());
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
          
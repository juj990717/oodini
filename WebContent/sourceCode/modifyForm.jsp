
<%@ page contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@page import="java.sql.*"  %>
<html>
<head>
<title>글 쓰기</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%

	request.setCharacterEncoding("euc-kr");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs = null;
	String title="", name="", contents="", file=null, pass="";
	String id="";
	int idx = Integer.parseInt(request.getParameter("id"));

	if(session.getAttribute("id")!=null){
		id = (String)session.getAttribute("id");
	}
	try{
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smart2019?serverTimezone=UTC&charcterEncoding=euckr","root","1234");
		stmt=conn.createStatement();
		rs=stmt.executeQuery("SELECT*FROM board where w_id="+idx);
		if(rs.next()){
			title=rs.getString("w_title");
			contents=rs.getString("w_contents");
			name=rs.getString("w_name");
			file=rs.getString("w_file");
			pass=rs.getString("w_pass");
		}
		

%>
<body bgcolor="#996600">
<table width="800" align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" enctype="multipart/form-data" action="modifyProc.jsp?id=<%=idx %>&file=<%=file%>">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="2"><font color="#FFFFFF"><b>글 수정하기</b></font></td>
          </tr>
          <tr> 
            <td width="24%">작성자</td>
            <td width="60%"> <input type="text" name="id" size="15" value="<%=name %>"> </td>
          </tr>
          <tr> 
            <td>글 비밀번호</td> 
            <td> <input type="password" name="passwd" size="15" value="<%=pass%>"> </td>
          </tr>
          <tr> 
            <td>글 제목</td> 
            <td> <input type="text" name="title" size="50" value="<%=title %>"> </td>
          </tr>
          <tr>  
            <td>내용</td>
            <td> <textarea name="contents" rows="10" cols="50"><%=contents %> </textarea></td>
          </tr>
          <tr> 
            <td>첨부파일</td> 
            <td> <input type="file" name="uploadFile" size="5"> <%=file %> </td>
          </tr>
          <tr> 
            <td colspan="2" align="center"> 
             <input type="submit" value="글 수정하기"> 
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
             <input type="reset" value="다시쓰기"> 
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>

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
          
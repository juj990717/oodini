<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("euc-kr");
	
	String mode = request.getParameter("mode");
	String idx = request.getParameter("id");

%>

<body bgcolor="#996600">
<table width="800" align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="passProc.jsp?id=<%=idx %>&mode=<%=mode %>">
          <tr align="center" bgcolor="#996600"> 
          </tr>
          
          <tr> 
            <td>패스워드</td> 
            <td> <input type="password" name="passwd" size="15" > </td>
          </tr>
          <tr> 
             <td colspan="3" align="center"> 
             <input type="submit" value="보내기"> 
              &nbsp; &nbsp;
             <input type="reset" value="다시쓰기"> 
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</html>
<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>로그인
</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	Cookie[] cookies=request.getCookies();
	String id="", passwd="";
	if(cookies!=null){
		for(int i=0; i<cookies.length;i++){
			if(cookies[i].getName().equals("id"))
				id=cookies[i].getValue();
			if(cookies[i].getName().equals("pass"))	
				passwd=cookies[i].getValue();
		}
	}
%>
<body bgcolor="#996600">
<table width="800" align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="loginProc.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b>로그인</b></font></td>
          </tr>
          <tr> 
            <td width="24%">아이디</td>
            <td width="35%"> <input type="text" name="id" size="15" value="<%=id %>"> </td>
          </tr>
          <tr> 
            <td>패스워드</td> 
            <td> <input type="password" name="passwd" size="15" value="<%=passwd %>"> </td>
          </tr>
          <tr> 
            
          </tr>
          <tr> 
             <td colspan="3" align="center"> 
             <input type="checkbox" name="autoLogin" value="true">자동로그인
              &nbsp;&nbsp; &nbsp;
             <input type="submit" value="로그인"> 
              &nbsp; &nbsp;
             <input type="reset" value="다시쓰기"> 
             &nbsp; &nbsp;
             <a href="register.jsp"><input type="button" value="회원가입"> </a>
             
            	</td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>

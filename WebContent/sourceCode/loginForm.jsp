<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>�α���
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
            <td colspan="3"><font color="#FFFFFF"><b>�α���</b></font></td>
          </tr>
          <tr> 
            <td width="24%">���̵�</td>
            <td width="35%"> <input type="text" name="id" size="15" value="<%=id %>"> </td>
          </tr>
          <tr> 
            <td>�н�����</td> 
            <td> <input type="password" name="passwd" size="15" value="<%=passwd %>"> </td>
          </tr>
          <tr> 
            
          </tr>
          <tr> 
             <td colspan="3" align="center"> 
             <input type="checkbox" name="autoLogin" value="true">�ڵ��α���
              &nbsp;&nbsp; &nbsp;
             <input type="submit" value="�α���"> 
              &nbsp; &nbsp;
             <input type="reset" value="�ٽþ���"> 
             &nbsp; &nbsp;
             <a href="register.jsp"><input type="button" value="ȸ������"> </a>
             
            	</td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>

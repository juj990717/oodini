
<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>�� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	String id="";
	if(session.getAttribute("id")!=null){
		id = (String)session.getAttribute("id");
	}
%>
<body bgcolor="#996600">
<table width="800" align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" enctype="multipart/form-data" action="writeProc.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="2"><font color="#FFFFFF"><b>�� ����</b></font></td>
          </tr>
          <tr> 
            <td width="24%">�ۼ���</td>
            <td width="60%"> <input type="text" name="id" size="15" value="<%=id %>"> </td>
          </tr>
          <tr> 
            <td>�� ��й�ȣ</td> 
            <td> <input type="password" name="passwd" size="15"> </td>
          </tr>
          <tr> 
            <td>�� ����</td> 
            <td> <input type="text" name="title" size="50"> </td>
          </tr>
          <tr>  
            <td>����</td>
            <td> <textarea name="contents" rows="10" cols="50"></textarea> </td>
          </tr>
          <tr> 
            <td>÷������</td> 
            <td> <input type="file" name="uploadFile" size="50"> </td>
          </tr>
          <tr> 
            <td colspan="2" align="center"> 
             <input type="submit" value="�۾���"> 
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
             <input type="reset" value="�ٽþ���"> 
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>

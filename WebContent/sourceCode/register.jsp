<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#996600">
<table width="800" align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="registerProc.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b>ȸ�� ����</b></font></td>
          </tr>
          <tr> 
            <td width="24%">���̵�</td>
            <td width="35%"> <input type="text" name="id" size="15"> </td>
            <td width="41%">���̵� ���� �ּ���.</td>
          </tr>
          <tr> 
            <td>�н�����</td> 
            
            <td> <input type="password" name="passwd" size="15"> </td>
            <td>�н����带 �����ּ���.</td>
          </tr>
          <tr>  
            <td>�̸�</td>
            <td> <input type="text" name="name" size="15"> </td>
            <td>���Ǹ��� �����ּ���.</td>
            
          </tr>

          
          <tr> 
            <td>�̸���</td>
            <td> <input type="text" name="email" size="27"> </td>
            <td>�̸����� �����ּ���</td>
          </tr>
          <tr>  
            <td>��ȭ��ȣ</td>
            
            <td> <input type="text" name="phone" size="20"> </td>
            <td>����ó�� �����ּ���</td>
          </tr>

          <tr> 
            <td colspan="3" align="center"> 
             <input type="submit" value="ȸ������"> 
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

<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#996600">
<table width="800" align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="registerProc.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
          </tr>
          <tr> 
            <td width="24%">아이디</td>
            <td width="35%"> <input type="text" name="id" size="15"> </td>
            <td width="41%">아이디를 적어 주세요.</td>
          </tr>
          <tr> 
            <td>패스워드</td> 
            
            <td> <input type="password" name="passwd" size="15"> </td>
            <td>패스워드를 적어주세요.</td>
          </tr>
          <tr>  
            <td>이름</td>
            <td> <input type="text" name="name" size="15"> </td>
            <td>고객실명을 적어주세요.</td>
            
          </tr>

          
          <tr> 
            <td>이메일</td>
            <td> <input type="text" name="email" size="27"> </td>
            <td>이메일을 적어주세요</td>
          </tr>
          <tr>  
            <td>전화번호</td>
            
            <td> <input type="text" name="phone" size="20"> </td>
            <td>연락처를 적어주세요</td>
          </tr>

          <tr> 
            <td colspan="3" align="center"> 
             <input type="submit" value="회원가입"> 
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

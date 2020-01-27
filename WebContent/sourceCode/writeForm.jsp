
<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>글 쓰기</title>
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
            <td colspan="2"><font color="#FFFFFF"><b>글 쓰기</b></font></td>
          </tr>
          <tr> 
            <td width="24%">작성자</td>
            <td width="60%"> <input type="text" name="id" size="15" value="<%=id %>"> </td>
          </tr>
          <tr> 
            <td>글 비밀번호</td> 
            <td> <input type="password" name="passwd" size="15"> </td>
          </tr>
          <tr> 
            <td>글 제목</td> 
            <td> <input type="text" name="title" size="50"> </td>
          </tr>
          <tr>  
            <td>내용</td>
            <td> <textarea name="contents" rows="10" cols="50"></textarea> </td>
          </tr>
          <tr> 
            <td>첨부파일</td> 
            <td> <input type="file" name="uploadFile" size="50"> </td>
          </tr>
          <tr> 
            <td colspan="2" align="center"> 
             <input type="submit" value="글쓰기"> 
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

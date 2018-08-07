<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--解决中文插入到数据库乱码问题-->
<%@   page   contentType="text/html;charset=utf-8"   %>      
<%request.setCharacterEncoding("utf-8");%>
<!--解决中文插入到数据库乱码问题-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>回复页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <% response.setContentType("text/html;charset=utf-8");
 	request.setCharacterEncoding("utf-8");
 	response.setCharacterEncoding("UTF-8");
    String subject=(String)request.getParameter("subject");
    //session.setAttribute("subject",subject); 
    String time=(String)request.getParameter("time");
   %>
     <center>
        时间更改:<%=time %>
           <form action="genggai.jsp?time=<%=time %>" method=post>
             <table border=1> 
<tr> 
<td bgcolor=yellow>新主题：</td> 
<td><input type=text size=60 name="subject"></td> 
</tr> 
<tr> 
<td valign=top bgcolor=yellow>新留言:</td> 
<td><textarea name="memo" rows=4 cols=60></textarea></td> 
</tr> 
<tr align=center><td colspan=2><input type=submit method=send value=更改留言> 
<input type=reset value=我要重写></td> 

</tr> 
</table> 
           </form>
     </center>
  </body>
</html>
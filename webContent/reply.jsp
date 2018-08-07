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
        时间回复:<%=time %>
           <form action="replyaction.jsp?time=<%=time %>" method=post>
             <textarea  name="reply" rows="4" cols="50"></textarea><br/>
             <input type="submit" value="回复"/>
           </form>
     </center>
  </body>
</html>
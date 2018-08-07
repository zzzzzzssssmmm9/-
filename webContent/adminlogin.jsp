<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminlogin.jsp' starting page</title>
    
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
    <center>
       管理员登陆
      <form action="admincheck.jsp" bgcolor=yellow>
    ID：<input type="text" name="id"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      姓名：<input type="text" name="name"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      密码：<input type="password" name="password"/><input type="submit" value="登陆"/>
    </form>
    </center>
   
  </body>
</html>
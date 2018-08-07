<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--解决中文插入到数据库乱码问题-->
<%@   page   contentType="text/html;charset=utf-8"   %>      
<%request.setCharacterEncoding("utf-8");%>
<!--解决中文插入到数据库乱码问题-->
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理留言</title>
    
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
    <%
      String name,email,subject,memo,time;
    Class.forName("com.mysql.jdbc.Driver");	// 加载数据库驱动，注册到驱动管理器
   	String url = "jdbc:mysql://localhost:3306/liuyan?serverTimezone=GMT&useUnicode=true&characterEncoding=utf-8";	// 数据库连接字符串，test为数据库名称
   	String username = "root";	// 数据库用户名
   	String password = "123456";	// 数据库密码，填写自己的数据库密码
   	Connection conn = DriverManager.getConnection(url,username,password);	// 创建Connection连接
   	response.setContentType("text/html;charset=utf-8");
   	request.setCharacterEncoding("utf-8");
   	response.setCharacterEncoding("UTF-8");
      Statement smt=conn.createStatement();
      ResultSet rs;
      String sql;
      sql="select * from messa";
      rs=smt.executeQuery(sql); 
      out.print("<center>"); 
      out.print("<table border=1>");
      out.print("<tr>");
      out.print("<td bgcolor=yellow>姓名</td>");
      out.print("<td bgcolor=yellow>主题</td>");
      out.print("<td bgcolor=yellow>内容</td>");
      out.print("<td bgcolor=yellow>时间</td>");
      out.print("<td bgcolor=yellow>删除</td>");
      out.print("<td bgcolor=yellow>更改</td>");
      out.print("<td><a href='liuyan.jsp'>增加留言</a></td>");
      while(rs.next()) 
{ 
name=rs.getString(1); 
//email=rs.getString(2); 
subject=rs.getString(2);  
memo=rs.getString(3); 
time=rs.getString(4); 
//out.print("<center>"); 
//out.print("<table border=1>"); 
out.print("<tr>");
out.print("<td>"+name+"</td>"); 
out.print("<td>"+subject+"</td>"); 
out.print("<td>"+memo+"</td>"); 
out.print("<td>"+time+"</td>"); 
out.print("<td><a href='delete.jsp?time="+time+"'>删除</a></td>");
out.print("<td><a href='geng.jsp?time="+time+"'>更改</a></td>");
out.print("</tr>");
//out.print("<tr>");
//out.print("<td><a href='liuyan.jsp'>增加留言</a></td>");
//out.print("</tr>");
//out.print("</table><p>"); 
} 
out.print("</table><p>"); 
 %>
  </body>
</html>
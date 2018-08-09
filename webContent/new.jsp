<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<!--解决中文插入到数据库乱码问题-->
<%@   page   contentType="text/html;charset=utf-8"   %>      
<%request.setCharacterEncoding("utf-8");%>
<!--解决中文插入到数据库乱码问题-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看留言</title>
    
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
      String name,time,subject,memo,zhan,zhan1="yes";
    
    Class.forName("com.mysql.jdbc.Driver");	// 加载数据库驱动，注册到驱动管理器
   	String url = "jdbc:mysql://localhost:3306/liuyan?serverTimezone=GMT&useUnicode=true&characterEncoding=utf-8";	// 数据库连接字符串，test为数据库名称
   	String username = "root";	// 数据库用户名
   	String password = "123456";	// 数据库密码，填写自己的数据库密码
   	response.setContentType("text/html;charset=utf-8");
   	request.setCharacterEncoding("utf-8");
   	response.setCharacterEncoding("UTF-8");
   	Connection conn = DriverManager.getConnection(url,username,password);	// 创建Connection连接
      Statement smt=conn.createStatement();
      ResultSet rs;
      String sql;
      sql="select * from messa where zhan = 'yes'";
      rs=smt.executeQuery(sql); 
      out.print("<center>"); 
      out.print("<table border=1>");
      out.print("<tr>");
      out.print("<td bgcolor=yellow>姓名</td>");
     //out.print("<td bgcolor=yellow>E-Mail</td>");
      out.print("<td bgcolor=yellow>主题</td>");
      out.print("<td bgcolor=yellow>内容</td>");
      out.print("<td bgcolor=yellow>时间</td>");
      //out.print("<td bgcolor=yellow>回复</td>");
      //out.print("<td bgcolor=yellow>查看所有回复</td>");
      while(rs.next()) 
{ 
name=rs.getString(1); 
//email=rs.getString(2); 
subject=rs.getString(2);  
memo=rs.getString(3); 
time=rs.getString(4);
zhan=(String)rs.getString(5);
//if(zhan.equals("yes")){
//out.print("<center>"); 
//out.print("<table border=1>"); 
out.print("<tr>");
out.print("<td>"+name+"</td>"); 
//out.print("<td>"+email+"</td>"); 
out.print("<td>"+subject+"</td>"); 
out.print("<td>"+memo+"</td>");
out.print("<td>"+time+"</td>");
//out.print("<td>"+zhan+"</td>");
//out.print("<td><a href='reply.jsp?time="+time+"'>回复</a></td>");
//out.print("<td><a href='showallreply.jsp?time="+time+"'>查看回复</a></td>"); 
out.print("</tr>");
//out.print("</table><p>"); 
//}
} 
out.print("</table><p>"); 
//out.print("<a href='liuyan.jsp'>返回留言页面</a>");
 %>
  </body>
</html>
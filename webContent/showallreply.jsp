<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看所有回复</title>
    
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
      String name,subject,reply,time,time1;
    time1=(String)request.getParameter("time");
      //subject=(String)request.getParameter("subject");
      Class.forName("com.mysql.jdbc.Driver");	// 加载数据库驱动，注册到驱动管理器
  	String url = "jdbc:mysql://localhost:3306/liuyan?serverTimezone=GMT";	// 数据库连接字符串，test为数据库名称
  	String username = "root";	// 数据库用户名
  	String password = "123456";	// 数据库密码，填写自己的数据库密码
  	Connection conn = DriverManager.getConnection(url,username,password);	// 创建Connection连接
      Statement smt=conn.createStatement();
       String sql="select * from replytable where subject=?";
      PreparedStatement pst=conn.prepareStatement(sql);
      pst.setString(1,time1);
      ResultSet rs;
      rs=pst.executeQuery();
      out.print("<center>"); 
      out.print("<table border=1>");
      out.print("<tr>");
      out.print("<td bgcolor=yellow>回复人姓名</td>");
      out.print("<td bgcolor=yellow>留言时间</td>");
      out.print("<td bgcolor=yellow>回复内容</td>");
      out.print("<td bgcolor=yellow>回复时间</td>");  
      while(rs.next()) 
    { 
    name=rs.getString(1); 
    subject=rs.getString(2); 
    reply=rs.getString(3);  
    time=rs.getString(4); 
//out.print("<center>"); 
//out.print("<table border=1>"); 
out.print("<tr>");
out.print("<td>"+name+"</td>"); 
out.print("<td>"+subject+"</td>"); 
out.print("<td>"+reply+"</td>"); 
out.print("<td>"+time+"</td>");
out.print("</tr>");
//out.print("</table><p>"); 
} 

out.print("</table><p>"); 
out.print("<a href='showall.jsp'>返回查看留言页面</a>");
 %>
  </body>
</html>
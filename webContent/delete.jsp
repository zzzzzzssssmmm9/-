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
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除留言</title>
    
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
     try{
    	 Class.forName("com.mysql.jdbc.Driver");	// 加载数据库驱动，注册到驱动管理器
    	   	String url = "jdbc:mysql://localhost:3306/liuyan?serverTimezone=GMT&useUnicode=true&characterEncoding=utf-8";	// 数据库连接字符串，test为数据库名称
    	   	String username = "root";	// 数据库用户名
    	   	String password = "123456";	// 数据库密码，填写自己的数据库密码
    	   	Connection conn = DriverManager.getConnection(url,username,password);	// 创建Connection连接
    	   	response.setContentType("text/html;charset=utf-8");
    	   	request.setCharacterEncoding("utf-8");
    	   	response.setCharacterEncoding("UTF-8");
      String time=request.getParameter("time");
      String sql="delete from messa where time=?";
      PreparedStatement pst=conn.prepareStatement(sql);
      pst.setString(1,time);
      int result=pst.executeUpdate();
      if(result>0)
      {
        out.print("留言删除成功！");
        out.println("<a href='opendata.jsp'>返回管理页面</a>");
      }
      else
      {
         out.print("留言删除失败！");
         out.println("<a href='opendata.jsp'>返回管理页面</a>");
      }
      }catch(Exception ex){
        ex.printStackTrace();
       }
      
     %>
  </body>
</html>
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
  </head>
  
  <body>
    <%
   String name,email,subject,memo,sex,zhan;
  // name=request.getParameter("name");
   name=(String)session.getAttribute("username");
   //sex=request.getParameter("sex");
  // email=request.getParameter("email");
  zhan=request.getParameter("zhan");
   subject=request.getParameter("subject");
   memo=request.getParameter("memo");
   try{
	Class.forName("com.mysql.jdbc.Driver");	// 加载数据库驱动，注册到驱动管理器
   	String url = "jdbc:mysql://localhost:3306/liuyan?serverTimezone=GMT&useUnicode=true&characterEncoding=utf-8";	// 数据库连接字符串，test为数据库名称
   	String username = "root";	// 数据库用户名
   	String password = "123456";	// 数据库密码，填写自己的数据库密码
   	response.setContentType("text/html;charset=utf-8");
   	request.setCharacterEncoding("utf-8");
   	response.setCharacterEncoding("UTF-8");
   	Connection conn = DriverManager.getConnection(url,username,password);	// 创建Connection连接
   String sql="insert into messa(name,subject,memo,time,zhan) values(?,?,?,NOW(),?)";
   PreparedStatement pst=conn.prepareStatement(sql);
    pst.setString(1,name);
    pst.setString(2,subject);
    pst.setString(3,memo);
    pst.setString(4,zhan);
    int result =pst.executeUpdate();
     if(result>0)
       {
        out.println("留言发表成功！");
        out.println("<a href='liuyan.jsp'>继续留言</a>");
       }else{
          out.println("留言发表失败！");
          }
   }catch(Exception ex){
     ex.printStackTrace();
    }
    %>
  </body>
</html>
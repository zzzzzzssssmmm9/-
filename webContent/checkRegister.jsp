<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Feilong_chechRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

 
  </head>
  <body>
    <%      
            String user = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");  
            String pwd = request.getParameter("password");
 
            Class.forName("com.mysql.jdbc.Driver");	// 加载数据库驱动，注册到驱动管理器
            String url = "jdbc:mysql://localhost:3306/liuyan?serverTimezone=GMT";	// 数据库连接字符串，test为数据库名称
            String username = "root";	// 数据库用户名
            String password = "123456";	// 数据库密码，填写自己的数据库密码
            Connection conn = DriverManager.getConnection(url,username,password);	// 创建Connection连接
            PreparedStatement pStmt = conn.prepareStatement("select * from yonghu where name = '" + user + "'");
              ResultSet rs = pStmt.executeQuery();
                if(rs.next()){
                    out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='register.jsp';</script>");
                }else{
                    PreparedStatement tmt = conn.prepareStatement("Insert into yonghu values('" + user + "','" + pwd + "')");
                        int rst = tmt.executeUpdate();
                        if (rst != 0){
                              out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='index.jsp';</script>");  
                        }else{
                           out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='register.jsp';</script>");  
                        }
                }
     %>
  </body>

</html>
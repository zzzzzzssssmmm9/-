<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加留言</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <style type="text/css">
	 <!-- 
	 a.bigone1{ 
	      color:#66ffcc; 
	      font-size: 36px;
	      font-weight: bold;
	      font-family: "楷体GB_2312";
	      background-position: center;
	  }
	  a.bigone2{
	      color: #ffccff;
	      font-family: monospace;
	      font-size: 16px;
	      font-weight: bold;
	      background-position: center;
	  }
	  -->
	  </style>

  </head>
  
  <body style="background-color: gray"><br><br><br><br><br>
    <% 
        Connection con=null;
		PreparedStatement pre=null;
		ResultSet re=null;
		
		int id=Integer.parseInt(request.getParameter("id"));
		String title=null;
		String auther=null;
		String content=null;
	%>
		
    <center><form style="background-position: center;width: 400px;padding-top: 20px;padding-bottom:15px;background-color: purple;">
    <a class="bigone1"><marquee>11级Java(1)班留言板</marquee></a><hr>
    <a class="bigone2">修改留言板</a>
    </form></center>
    <%  request.setCharacterEncoding("gbk");
	    try {
	       	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con=DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;databaseName=liuyan","sa","123");
			pre=con.prepareStatement("select* from note where N_id='"+id+"'");
			
			re=pre.executeQuery();
			if(re.next()){
			  id=re.getInt(1);
			  title=re.getString(2);
			  auther=re.getString(3);
			  content=re.getString(4);
			}
			%>
	<center><form action="updata_do.jsp" style="background-position: center;width: 400px;padding-top: 20px;padding-bottom:15px;background-color: yellow;">
	<input type="hidden" name="id" value="<%=id %>">
    <table border="1">
    <tr>
    <td width="60">标&nbsp;题：</td>
    <td width="340"><input type="text" name="title" id="title" value="<%=title %>" size="40" maxlength="40"></td>
    </tr>
    <tr>
    <td width="60">作&nbsp;者：</td>
    <td width="340"><input type="text" name="auther" value="<%=auther %>" maxlength="500"></td>
    </tr>
    <tr>
    <td width="60">内&nbsp;容：</td>
    <td width="340"><textarea cols="43" rows="7" name="content"><%=content %></textarea></td>
    </tr>
    <tr>
    <td><input type="submit" value="提交"></td>
    <td><input type="reset" value="清除"></td>
    </tr>
    <tr>
    <td colspan="2" style="padding-left: 50px;"><a href="list_note.jsp">回到留言板管理列表</a></td>
    </tr>
    </table>
    </form></center>
    <% 
			} catch (Exception e) {
			// TODO: handle exception
		}finally{
			try {
				if(con!=null){
					con.close();
					}
				if(pre!=null){
					pre.close();
				}
				if(re!=null){
					re.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}		
		%>
    
  </body>
</html>
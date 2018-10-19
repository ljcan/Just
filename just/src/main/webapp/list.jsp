<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
     <table width"80%" align="center">
     <tr><td column="4" align="right"><a href="add.jsp">添加</a></td></tr>
     <tr>
       <td>编号</td>
       <td>姓名</td>
       <td>密码</td>
       <td>操作</td>
     </tr>
     <c:forEach items="${user}" var="bean">
     <tr>
       <td>${bean.id}</td>
       <td>${bean.username}</td>
       <td>${bean.pwd}</td>
       <td><a href="delete.spring?id=${bean.id}">删除</a><a href="update.jsp?id=${bean.id}">更新</a>
       </td>
     </tr>
    </c:forEach>
    </table>
  </body>
</html>

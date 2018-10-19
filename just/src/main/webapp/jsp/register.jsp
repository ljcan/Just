<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>义工注册</title>
    
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
    <form action="../register.spring" method="post">
    	
    	用户名：<input name="v_username" type="text"/></br>
    	密  码：<input name="v_password" type="password"></br>
    	学  号：<input name="v_number" type="text"/></br>
    	性  别：<select name="v_sex">
    		<option selected="selected">男</option>
    		<option>女</option>
    		</select></br>
    	联系电话：<input name="v_phone" type="text"></br>
    	家庭住址:<input name="v_address" type="text"/></br>
    	身份证:<input name="v_identity_card" type="text"/></br>
    	<input type="submit" value="注册"/><input type="reset" value="重置"/>
    </form>
  </body>
</html>

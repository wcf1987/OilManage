<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<title>Login Page</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../css/login.css" />
	<script src="../js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	
	<script src="../js/jquery/jquery.form.js" type="text/javascript"></script>
	
	<script type="text/javascript">

	</script>
</head>

<body>

	<form id="login-form" action="login.action" method="post">
		<fieldset>
		
			<legend>登陆</legend>
			
			<label for="login">邮箱</label>
			<input type="text" id="login" name="username"/>
			<div class="clear"></div>
			
			<label for="password">密码</label>
			<input type="password" id="password" name="password"/>
			<div class="clear"></div>
			
			<label for="remember_me" style="padding: 0;">记住我?</label>
			<input type="checkbox" id="remember_me" style="position: relative; top: 3px; margin: 0; " name="remember_me"/>
			<div class="clear"></div>
			
			<br />
			
			<input type="submit" style="margin: -20px 0 0 287px;" class="button" name="commit" value="登陆"/>	
		</fieldset>
	</form>

<br /><br />
<br />
<br />
<br />
<br />


<div style="width:550px;margin:20px auto;clear:both;">

</div>

<div style="margin-top:200px;margin-left:450px;" class="footer">
	        	<p> &copy; 2013 中国石油大学</p>
</div>

  		
</body>

</html>
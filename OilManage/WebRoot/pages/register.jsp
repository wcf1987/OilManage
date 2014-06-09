<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<title>Login Page</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../css/login.css" />
	<script src="../js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	
	<script src="../js/jquery/jquery.form.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$("#login-form").validate({
			debug:true,
			onsubmit:true,
			onfocusout:false,
			onkeyup:true,
			rules:{
				email:{
					required:true,
					email:true
				},
				password:{
					required:true
				}
			},
			messages:{
				email:{
					required:"算法描述不能为空！",
					email:"请输入正确的邮箱类型"
				},
				password:{
					required:"请选择作者！"
				}
			},
			submitHandler:function(){
				add_algorithm();
			}
		});
	
		
		$("#email").focus(function(){
			var txt_value=$(this).val();
			if(txt_value=="请输入邮箱地址"){
				$(this).val("");
			}
		});
		$("#email").blur(function(){
			var txt_value=$(this).val();
			if(txt_value==""){
				$(this).val("请输入邮箱地址");
			}
		});
	
	});
	
	</script>
</head>

<body>

	<form id="register-form" action="register.action" method="post">
		<fieldset>
		
			<legend>注册</legend>
			
			<!-- <label for="register">邮箱</label>
			<input type="text" id="email" name="email" value="请输入邮箱地址"/>
			<div class="clear"></div> -->
			
			<label for="password">密码</label>
			<input type="password" id="password" name="password" />
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
	        	<div id="footer">
		          <%@ include file="commons/footer.jsp" %>
		        </div>
</div>

  		
</body>

</html>
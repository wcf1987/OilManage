<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	 <base href="<%=basePath%>">
    
    <title>登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="登录">
	
	
	<!-- Bootstrap -->
   
	<!--  <link rel="stylesheet" href="css/justified-nav.css">
	-->
	<link rel="stylesheet" href="js/upload/uploadify.css">
	 
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	 
	
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/overcast/jquery.ui.theme.css" />  
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/black-tie/jquery.ui.theme.css" />
	 
	 
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	<!-- 自定义 -->
	
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	<link rel="stylesheet" type="text/css" href="css/login.css" />  
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/holder.min.js"></script>
	 
	<script src="js/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	
	
	<script type="text/javascript" src="js/upload/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/jquery/jquery.message.js"></script>
	<!-- 自定义 -->
	<script src="js/global.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	
	
	
	
	
	
	<!--  
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<title>Login Page</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	<link rel="stylesheet" type="text/css" media="screen" href="../js/jqueryUI/css/jquery-ui-1.10.3.custom.css" >
	
	<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" > 
	
	<link rel="stylesheet" type="text/css" href="../css/login.css" />
	<script src="../js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script type="text/javascript" src="../js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="../js/jquery/jquery.message.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>-->
	<script type="text/javascript">
	$(document).ready(function(){
		
		 $("#conpassword").blur(function() {
	       var reg_password = $("#reg_password").val();
	       if (reg_password != $("#conpassword").val()) {
	           alert("确认密码与密码不一致.");
	           return;
	       } else {
	           //$(this).next("span").html(img_rigth);
	       }
   	 	});
   	 	
		$("#registerForm").validate({
			debug:true,
			onsubmit:true,
			onfocusout:false,
			onkeyup:true,
			rules:{
				username:{
					required:true
				},
				email:{
					required:true,
					email:true
				},
				reg_password:{
					required:true
				},
				conpassword:{
					required:true
				}	
			},
			messages:{
				username:{
					required:"用户名不能为空！",
				},
				email:{
					required:"邮箱不能为空！",
					email:"邮箱格式不正确！"
				},
				reg_password:{
					required:"密码不能为空！"
				},
				conpassword:{
					required:"请输入确认密码！"
				}
			},
			submitHandler:function(){
				
				register();
			}
		});
		
	 
	    
	});		
	function register(){
		//confirmPassword();
		$.ajax({
			type : 'POST',
			url : 'register.action',
			data : {
				username:$("#username").val(),
				email:$("#email").val(),
				regpassword:$("#reg_password").val(),
				conpassword:$("#conpassword").val()
			},
			dataType:'json',
			success : function(data) {
				if(data.success==true){
					alert("注册成功！");
					window.location.reload();
					//location.href="pages/data.jsp";
				}else{
					alert("注册失败！"+data.errorMessage);
					//$('#register_modal').modal('hide');
				}
			},
			error:function(msg){
				alert("通信失败！");
				//$('#register_modal').modal('hide');				
			}
		});
	}
	
	function confirmPassword(){
       var reg_password = $("#reg_password").val();
       if (reg_password != $(this).val()) {
           alert("确认密码与密码不一致.");
           return;
       } else {
	           //$(this).next("span").html(img_rigth);
       }
	}
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
			
			<div style="margin-top:-20px;" ><input type="submit" style="float:right" class="button" name="commit" value="登陆"/>	
			<input type="button" style="float:right" class="button" name="commit" value="注册" onclick="$('#register_modal').modal()"/>	
			</div>
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


		<!-- 注册模态框 -->   	
		<div class="modal fade" id="register_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">注册</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="registerForm" action="register.action" method="post" style="margin-top:-10px;"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table" >
		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >用户名：</label></td>
				            <td><input id="username" type="text" class="input2" name="username" maxlength="30"/><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >邮箱：</label></td>
		      				<td><input id="email" type="text" class="input2" name="email" maxlength="10" /><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >密码：</label></td>
		      				<td><input id="reg_password" type="text" class="input2" name="reg_password" maxlength="10" /><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >密码确认：</label></td>
		      				<td><input id="conpassword" type="text" class="input2" name="conpassword" maxlength="10" /><em style="color:red">*</em></td>
		      			</tr>
		      			<!--
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">角色：</label></td>
		      				<td>
      							<select id="role" name="role">		                  
			                	</select>
		      					<em style="color:red">*</em>
		      				</td>
		      			</tr> 
		      			 -->		    				
				   </table>
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >提交</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
  		
</body>

</html>
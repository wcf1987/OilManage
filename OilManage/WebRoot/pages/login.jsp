<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>欢迎登陆 - 煤层气集输系统</title>
<base href="<%=basePath%>">
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/font-awesome.min.css" />

<!-- text fonts -->
<link rel="stylesheet" href="./css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="./css/ace.min.css" />

<!--[if lte IE 9]>
	<link rel="stylesheet" href="./css/ace-part2.min.css" />
<![endif]-->
<link rel="stylesheet" href="./css/ace-rtl.min.css" />

<!--[if lte IE 9]>
  <link rel="stylesheet" href="./css/ace-ie.min.css" />
<![endif]-->
<link rel="stylesheet" href="./css/ace.onpage-help.css" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="./js/html5shiv.js"></script>
<script src="./js/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="./css/art_default.css" />
<link rel="stylesheet" href="./css/oilstyles.css" />
</head>

<body class="login-layout blur-login">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="login_logo"></i>
								<span class="red">CBM</span>
								<span class="white" id="id-text2">煤层气集输系统</span>
							</h1>
							<h4 class="blue" id="id-company-text">&copy; 中国石油大学（北京）</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i>
											请输入您的账号信息
										</h4>

										<div class="space-6"></div>

										<form action="login.action" method="post">
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" name="username" class="form-control" placeholder="用户名" />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" name="password" class="form-control" placeholder="密码" />
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<label class="inline">
														<input type="checkbox" class="ace" />
														<span class="lbl"> 记住密码</span>
													</label>

													<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
														<i class="ace-icon fa fa-key"></i>
														<span class="bigger-110">登 录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

										
									</div><!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div class="hidden">
											<a href="#" data-target="#forgot-box" class="forgot-password-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												I forgot my password
											</a>
										</div>

										<div>
											<a href="#" data-target="#signup-box" class="user-signup-link">
												注册账号
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i>
											Retrieve Password
										</h4>

										<div class="space-6"></div>
										<p>
											Enter your email and to receive instructions
										</p>

										<form>
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>

												<div class="clearfix">
													<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i>
														<span class="bigger-110">Send Me!</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div><!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box" class="back-to-login-link">
											Back to login
											<i class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i>
											注册新用户
										</h4>

										<div class="space-6"></div>
										<p> 请输入您的真实信息： </p>

										<form id="regform">
											<fieldset>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" name="username" class="form-control" placeholder="用户名" />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" name="reg_password" class="form-control" placeholder="密码" />
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" name="conpassword" class="form-control" placeholder="确认密码" />
														<i class="ace-icon fa fa-retweet"></i>
													</span>
												</label>

												<label class="block">
													<input type="checkbox" class="ace" />
													<span class="lbl">
														我接受
														<a href="#">用户协议</a>
													</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i>
														<span class="bigger-110">重置</span>
													</button>

													<button onclick="doReg(this.form);" type="button" class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">注册</span>

														<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box" class="back-to-login-link">
											<i class="ace-icon fa fa-arrow-left"></i>
											返回登录
										</a>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.signup-box -->
						</div><!-- /.position-relative -->

					</div>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.main-content -->
	</div><!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='./js/jquery.min.js'>"+"<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='./js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='./js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
	<script src="./js/jquery.artDialog.js"></script>
	<script src="./js/iframeTools.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		jQuery(function($) {
		 $(document).on('click', '.toolbar a[data-target]', function(e) {
			e.preventDefault();
			var target = $(this).data('target');
			$('.widget-box.visible').removeClass('visible');//hide others
			$(target).addClass('visible');//show target
		 });
		});
		function doReg(form){
			var $form = $(form);
			var verify = 0;
			if($form.find("input[name='username']").val()==''){
				$row = $form.find("input[name='username']").parent();
				$row.next().remove();
				$row.after("<span class='smaller-80 red'>用户名不能为空！</span>");
				verify++;
			}
			else{
				$form.find("input[name='username']").parent().next().remove();
				verify--;
			}
			if($form.find("input[name='reg_password']").val()==''){
				$row = $form.find("input[name='reg_password']").parent();
				$row.next().remove();
				$row.after("<span class='smaller-80 red'>密码不能为空！</span>");
				verify++;
			}
			else{
				$form.find("input[name='reg_password']").parent().next().remove();
				verify--;
			}
			if($form.find("input[name='conpassword']").val()==''){
				$row = $form.find("input[name='conpassword']").parent();
				$row.next().remove();
				$row.after("<span class='smaller-80 red'>确认密码不能为空！</span>");
				verify++;
			}
			else{
				$form.find("input[name='conpassword']").parent().next().remove();
				verify--;
			}
			
			if(verify){//验证失败
				return false;
			}
			else{//验证ok
				$form.find("span.smaller-80").remove();
				$.post("register.action",$form.serialize(),function(data){
					if(data.success==true){
						$.dialog.alert('注册成功！');
						window.location.reload();
					}else{
						$.dialog.alert('注册失败！'+data.errorMessage);
					}
				},'json');
			}
		}
	</script>
</body>
</html>

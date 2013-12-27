<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib uri="/struts-tags" prefix="s"%> 
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 

<html>
<head>
<meta charset="utf-8">
   <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">


	
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	<link rel="stylesheet" type="text/css" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css"/>
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="js/jqueryUI/js/jquery-ui-1.10.3.custom.js"></script>
	<script type="text/javascript" src="js/jquerymb/inc/jquery.metadata.js"></script>
	<script type="text/javascript" src="js/jquerymb/inc/jquery.hoverIntent.js"></script>
	<script type="text/javascript" src="js/jquerymb/inc/mbMenu.js"></script>

	<link rel="stylesheet" type="text/css" href="js/jquerymb/css/menu_black.css" media="screen" />
<title>jQuery File Upload Example</title>

  <style>
  

  </style>


<style type="text/css">

	body  a.style{
		color:#AF3002;
		font-family:sans-serif;
		font-size:13px;
		text-decoration:none;
	}

	.wrapper{
		font-family:Arial, Helvetica, sans-serif;
		margin-top:50px;
		margin-left:50px;
	}

	.wrapper h1{
		font-family:Arial, Helvetica, sans-serif;
		font-size:26px;
	}
	button{
		padding:4px;
		display:inline-block;
		cursor:pointer;
		font:12px/14px Arial, Helvetica, sans-serif;
		color:#666;
		border:1px solid #999;
		background-color:#eee;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		-moz-box-shadow:#999 2px 0px 3px;
		-webkit-box-shadow:#999 2px 0px 3px;
		margin-bottom:4px;
	}
	button:hover{
		color:#aaa;
		background-color:#000;
	}
	:focus {
		outline: 0;
	}

	span.btn{
		padding:10px;
		display:inline-block;
		cursor:pointer;
		font:12px/14px Arial, Helvetica, sans-serif;
		color:#aaa;
		background-color:#eee;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		-moz-box-shadow:#999 2px 0px 3px;
		-webkit-box-shadow:#999 2px 0px 3px;
	}
	span.btn:hover{
		background-color:#000;
	}



</style>

<script type="text/javascript">

	$(function(){
		$(".myMenu").buildMenu(
				{
					template:"menuVoices.html",
					additionalData:"pippo=1",
					menuWidth:200,
					openOnRight:false,
					menuSelector: ".menuContainer",
					iconPath:"ico/",
					hasImages:true,
					fadeInTime:100,
					fadeOutTime:300,
					adjustLeft:2,
					minZindex:"auto",
					adjustTop:10,
					opacity:.95,
					shadow:false,
					shadowColor:"#ccc",
					hoverIntent:0,
					openOnClick:true,
					closeOnMouseOut:true,
					closeAfter:1000,
					submenuHoverIntent:200
				});

		
	

	});







</script>
</head>
<body> 
<div class="wrapper">
	<table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#EDEDED">
		<tr>
			<td width="180" height="33" style="padding:10px" class="style">
			</td>
			<td valign="bottom">
				<table  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="container" >
					<tr>
						<td class="">

							<!-- start horizontal menu -->

							<table class="myMenu rootVoices" cellspacing='0' cellpadding='0' border='0'><tr>							
							
								<td class="rootVoice {menu: 'menu_1'}" >集气站设置</td>
								<td class="rootVoice {menu: 'menu_2'}" >组阀设置</td>
								<td class="rootVoice {menu: 'menu_3'}" >井口设置</td>
								
							</tr></table>

							<!-- end horizontal menu -->

						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>


		<div id="menu_1" class="mbmenu" id="checkMenu">
		<a data-type="text">
		
				线宽<select id="JQZwinthsel" name="JQZwinthsel">
		<option value="9">粗</option>
		<option value="7">较粗</option>
		<option value="5">中等</option>				
		<option value="3">较细</option>		
		<option value="1">细</option>					
			</select>
		</a>
		<a data-type="separator"> </a>
		<a data-type="text">
			
				线色<select id="JQZcolorsel" name="JQZcolorsel">
		<option value="blue">蓝色</option>
		<option value="red">红色</option>
		<option value="black">黑色</option>

</select>
				
				
				
				
			</form>
		</a>
		<a data-type="separator"> </a>
		<a data-type="text">
			<form>
				
				图标大小<select id="JQZiconsel" name="JQZiconsel">
					<option value="1">大(50*50)</option>
					<option value="2">中（40*40）</option>
					<option value="3">小（30*30）</option>

					</select>
				
				
			</form>
		</a>
		</div>

	<div id="menu_2" class="mbmenu" id="checkMenu">
		<a data-type="text">
		
				线宽<select id="FZwinthsel" name="FZwinthsel">
		<option value="9">粗</option>
		<option value="7">较粗</option>
		<option value="5">中等</option>				
		<option value="3">较细</option>		
		<option value="1">细</option>					
			</select>
		</a>
		<a data-type="separator"> </a>
		<a data-type="text">
			
				线色<select id="FZcolorsel" name="FZcolorsel">
		<option value="blue">蓝色</option>
		<option value="red">红色</option>
		<option value="black">黑色</option>

</select>
				
				
				
				
			</form>
		</a>
		<a data-type="separator"> </a>
		<a data-type="text">
			<form>
				
				图标大小<select id="FZiconsel" name="jingkouiconsel">
					<option value="1">大(50*50)</option>
					<option value="2">中（40*40）</option>
					<option value="3">小（30*30）</option>

					</select>
				
				
			</form>
		</a>
		</div>



	<div id="menu_3" class="mbmenu" id="checkMenu">
		<a data-type="text">
		
				线宽<select id="jingkouwinthsel" name="jingkouwinthsel">
		<option value="9">粗</option>
		<option value="7">较粗</option>
		<option value="5">中等</option>				
		<option value="3">较细</option>		
		<option value="1">细</option>					
			</select>
		</a>
		<a data-type="separator"> </a>
		<a data-type="text">
			
				线色<select id="jingkoucolorsel" name="jingkoucolorsel">
		<option value="blue">蓝色</option>
		<option value="red">红色</option>
		<option value="black">黑色</option>

</select>
				
				
				
				
			</form>
		</a>
		<a data-type="separator"> </a>
		<a data-type="text">
			<form>
				
				图标大小<select id="jingkouiconsel" name="jingkouiconsel">
					<option value="1">大(50*50)</option>
					<option value="2">中（40*40）</option>
					<option value="3">小（30*30）</option>

					</select>
				
				
			</form>
		</a>
		</div>

	



	

</div></body> 
</html>
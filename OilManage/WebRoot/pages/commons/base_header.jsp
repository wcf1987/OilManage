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
<title>煤层气集输系统</title>
<base href="<%=basePath%>">
<meta name="description" content="煤层气集输系统" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/font-awesome.min.css" />

<!-- page specific plugin styles -->
<link rel="stylesheet" href="./css/jquery-ui.min.css" />
<link rel="stylesheet" href="./css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="./css/datepicker.css" />
<link rel="stylesheet" href="./css/ui.jqgrid.css" />

<!-- text fonts -->
<link rel="stylesheet" href="./css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="./css/ace.min.css" />

<!--[if lte IE 9]>
	<link rel="stylesheet" href="./css/ace-part2.min.css" />
<![endif]-->
<link rel="stylesheet" href="./css/ace-skins.min.css" />
<link rel="stylesheet" href="./css/ace-rtl.min.css" />

<!--[if lte IE 9]>
  <link rel="stylesheet" href="./css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="./js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="./js/html5shiv.js"></script>
<script src="./js/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="./css/art_default.css" />
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
<script src="./js/global.js"></script>
</head>

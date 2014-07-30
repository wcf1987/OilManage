<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />  
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	 
    	<script type="text/javascript" src="editor/assets/javascript/jquery-1.11.0.min.js"></script>
    	<script src="js/navgoco/highlight.pack.js"></script>


		<!-- Add JQuery cookie plugin (optional) -->
		<script src="js/navgoco/jquery.cookie.js"></script>
		<!-- Add navgoco main js and css files  -->
		<script type="text/javascript" src="js/navgoco/jquery.navgoco.js"></script>
		<link rel="stylesheet" type="text/css" href="js/navgoco/jquery.navgoco.css" media="screen" />
<title>管理菜单</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<script>
$(document).ready(function() {
    // Initialize navgoco with default options
    $("#leftmenu").navgoco({
        caretHtml: '',
        accordion: false,
        openClass: 'open',
        save: true,
        cookie: {
            name: 'navgoco',
            expires: false,
            path: '/'
        },
        slide: {
            duration: 400,
            easing: 'swing'
        },
        // Add Active class to clicked menu item
      //  onClickAfter: active_menu_cb,
    });
   });
</script>


</head>

<body>
<ul id="leftmenu" class="nav">   
    <li class="active"><a href="#">地图建模</a>
        <ul>
            <li><a href="#" target="I2"> 上传新地图</a></li>
            
            <li><a href="#">打开地图</a></li>
        </ul>
    </li>
    <li class="active"><a href="#">工程管理</a>
        <ul>               
            <li><a href="#">新建工程</a></li>
            <li><a href="#">打开工程</a></li>
            <li><a href="#">运行</a></li>
         
          
        </ul>
    </li>
    <li class="active"><a href="#">系统建模</a>
        <ul>
            <li><a href="#">打开</a></li>
            <li><a href="#">新建</a></li>
        </ul>
    </li>
        <li class="active"><a href="#">系统优化</a>
    </li>
        <li class="active"><a href="#">数据管理</a>
        <ul>
            <li><a href="#">物理量管理</a></li>
            <li><a href="#">物理单位管理</a></li>
            <li><a href="#">物理量管理</a></li>
            <li><a href="#">物理量管理</a></li>
        </ul>
    </li>
            <li class="active"><a href="#">算法管理</a>
        <ul>
         	<li><a href="#">添加算法</a></li>
            <li><a href="#">算法列表</a></li>
        </ul>
    </li>
    <li class="active"><a href="#">后台管理</a>
        <ul>
        	<li><a href="#">用户管理</a></li>
            <li><a href="#">角色管理</a></li>
            
        </ul>
    </li>

    
</ul>




</body>
</html>

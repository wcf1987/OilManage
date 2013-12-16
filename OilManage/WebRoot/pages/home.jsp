<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="首页">
	
	
	<!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap/css/justified-nav.css">
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- 自定义 -->
	<script src="js/global.js"></script>
  </head>
  
  <body >
	  <div class="container">
	  
	    <div id="header">
	    	<!--  <div id="banner"><a href="#" ><img src="images/banner.jpg" alt="主页" title="" /></a></div>-->
	    	<div id="nav" class="masthead">
	    			<h3 class="text-muted" style="color:#4AA4EB;margin-left:20px;">煤层气集输系统</h3>
	    		    <ul class="nav nav-justified navbar navbar-inverse">
			          <li><a href="pages/home.jsp">首页</a></li>
			          <li><a href="pages/map.jsp">地图建模</a></li>
			          <li><a href="pages/home.jsp">系统模拟</a></li>
			          <li><a href="pages/home.jsp">系统优化</a></li>
			          <li><a href="pages/home.jsp">关于</a></li>
			          <li><a href="pages/home.jsp">联系方式</a></li>
			        </ul>
	    	</div>
	    </div>
	    
	    <div class="jumbotron">
		  <h1>系统说明</h1>
		  <p>煤层气模拟软件集管网，井筒，煤层气藏的储运输送的模拟软件，该软件将能够处理复杂的煤层气集输系统，可轻松使用屏幕拖放技术来创建模型，并且可以加载GIS铺垫SHAPEFILE地图文件，能够模拟单相、气液两相（或三相管流），识别系统瓶颈，模拟新井对系统的影响，可以加载CBM地下开产，对全气田进行模拟和预测。</p>
		  <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>
		</div>

	    <div id="content"></div>
	    
    	<div class="footer"><p>&copy; 中国石油大学 2013</p></div>
	    
	</div>
	   
	
  </body>
</html>

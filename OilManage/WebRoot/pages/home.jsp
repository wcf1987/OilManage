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
	
	<!-- jquery、bootstrap基本库 -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- 导航nav -->
	<link rel="stylesheet" href="css/justified-nav.css">
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	<script src="js/global.js"></script>
	

  </head>
	
  <body>
 	<div id="head">
	    <%@ include file="commons/header.jsp" %>
  	</div>
		<div class="container marketing condiv" style="width:1200px;margin-top:30px;">
			<div class="container-fluid">
				<div class="row-fluid row-fluid2">
				    <div class="jumbotron" style="">
					  <h1>系统说明</h1>
					  <p>煤层气模拟软件集管网，井筒，煤层气藏的储运输送的模拟软件，该软件将能够处理复杂的煤层气集输系统，可轻松使用屏幕拖放技术来创建模型，并且可以加载GIS铺垫SHAPEFILE地图文件，能够模拟单相、气液两相（或三相管流），识别系统瓶颈，模拟新井对系统的影响，可以加载CBM地下开产，对全气田进行模拟和预测。</p>
					  <!-- <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="featurette-divider">
     <div id="footer">
        <%@ include file="commons/footer.jsp" %>
    </div>   
	
  </body>
</html>
	
						
	
							

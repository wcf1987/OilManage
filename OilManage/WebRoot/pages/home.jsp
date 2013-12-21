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
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- 导航nav -->
	<link rel="stylesheet" href="css/justified-nav.css">
	<!-- 表格 -->
	<script type="text/javascript" src="js/table/jquery.dataTables.js"></script>
	<script type="text/javascript" src="js/table/dataTables.bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="js/table/dataTables.bootstra.css">
	<link rel="stylesheet" type="text/css" href="js/table/bootstrap-responsiv.css">
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	<script src="js/global.js"></script>
	
	<style>body{
						margin-top: 20px;
					}</style>
	<script>
	$(document).ready(function() {
	  			$('.datatable').dataTable( {        				
	      		
				});
	} );
	
	</script>
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
	    
	    
	    
	    		 	<div class="container-fluid">
						<div class="row-fluid">
							<h1>煤层气管网模型列表</h1>
							<div>
								<ul class="breadcrumb">
									<li>
										基本功能：
									</li>
									<li>
										分页 <span class="divider">/</span>
									</li>
									<li>
										排序 <span class="divider">/</span>
									</li>
									<li>
										过滤
									</li>
								</ul>
							</div>
						</div>
						<div class="row-fluid">
				
							<table class="table table-striped table-bordered table-hover datatable">
								<thead>
									<tr>
										<th>Rendering engine</th>
										<th>Browser</th>
										<th>Platform(s)</th>
										<th>Engine version</th>
										<th>CSS grade</th>
									</tr>
								</thead>
								<tbody>
									<tr class="odd gradeX">
										<td>Trident</td>
										<td>
											Internet
										 Explorer 4.0
										</td>
										<td>Win 95+</td>
										<td class="center">4</td>
										<td class="center">X</td>
									</tr>
						
				
							
								</tbody>
							</table>
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
	
						
	
							

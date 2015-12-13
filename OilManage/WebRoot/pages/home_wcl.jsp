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
	    <%@ include file="commons/header_wcl.jsp" %>
  	</div>
		<div class="container marketing condiv" style="width:1200px;margin-top:30px;">
			<div class="container-fluid">
				<div class="row-fluid row-fluid2">
				    <div class="jumbotron" style="">
					  <h2>系统说明</h2>
					  <p style="text-align:left">系统模拟，能够处理复杂的煤层气集输系统，可轻松使用屏幕拖放技术来创建模型，模拟单相、多相流，从而对全气田进行模拟。</p>
					  <p style="text-align:left">系统优化，以系统模拟为基础，处理复杂大规模的煤层气系统，进行多种结构下的布局设计和参数设计，优选系统集输方式</p>
					</div>
					<div style="margin-left:50px;">
						<div  style="float:left;">
							<img  style="width:480px;height:400px;margin-top:0px;border:2px solid"  src="images/moni.jpg" />
							<p style="text-align:center">系统模拟</p>
						</div>
						<div  style="float:left;margin-left:30px;">
							<img  style="width:480px;height:400px;margin-top:0px;border:2px solid"  src="images/youhua.jpg" />
							<p style="text-align:center">系统优化</p>
						</div>
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
	
						
	
							

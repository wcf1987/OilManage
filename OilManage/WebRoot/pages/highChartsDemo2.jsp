<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <base href="<%=basePath%>">
    
    <title>highcharts</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="highcharts">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	
	
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="js/Highcharts-4.0.1/js/modules/exporting.js"></script>
	
	<script type="text/javascript" src="js/Highcharts-4.0.1/js/themes/gray.js"></script>
	<script type="text/javascript" src="js/GraphiCharts.js"></script>
	
  </head>
  
  <body style="background-color:#CCCCCC;">
  <div id="graphiDraw" style="width:100%; height:auto;margin-left:200px;" onclick="graphiDraw();"></div> 		
  </body>
  
</html>
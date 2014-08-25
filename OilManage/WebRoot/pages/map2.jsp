<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <%
  //User userlogin=(User)(session.getAttribute("user")); 
  %>
    <base href="<%=basePath%>">

    <title>地图建模</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="地图建模">
	
	
	<!-- Bootstrap -->
   
	<!--  <link rel="stylesheet" href="css/justified-nav.css">
	-->
	<link rel="stylesheet" href="js/upload/uploadify.css">
	 
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	 
	
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/overcast/jquery.ui.theme.css" />  
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />
	 
	 
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	<!-- 自定义 -->
	
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	  
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/holder.min.js"></script>
	 
	<script src="js/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	
	
	<script type="text/javascript" src="js/upload/jquery.uploadify.min.js"></script>
	<!-- 自定义 -->
	<script src="js/global.js"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4bfe7b8632739c89a1b8e95529da1d97"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
<script type="text/javascript" src="js/map2.js"></script>
<style type="text/css">
#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin-top:20px;
}



</style>


  </head>
  
  
  <body ><!-- background-image:url(images/background.jpg); -->
 
 	
		<div id="head">
		   <%@ include file="commons/header.jsp" %>
		</div>  	
    	 <!-- Marketing messaging and featurettes
	    ================================================== -->
	    <!-- Wrap the rest of the page in another container to center all the content. -->
	    
		<div class="container marketing condiv" style="width:1200px;">
	    <a href="javascript:showMap(44,0,'In')">输入文件地图</a>
	      <a href="javascript:showMap(44,0,'Out')">输出文件地图</a>
	    	<hr class="featurette-divider" style="margin-top:10px;margin-bottom:10px;">
	    	
	      	<!-- Three columns of text below the carousel -->
	      	<div class="row" style="margin-bottom:-50px;">
	      		<!-- 地图 -->
	      		<div id="allmap" class="img-rounded" style="border:3px solid #333300;box-shadow:12px 12px 10px #333300;border-radius: 11px"></div>
	      	</div><!-- /.row -->
	
	
	    </div><!-- /.container -->
	    <hr class="featurette-divider">
      	
    
    
    
    
    
    
    
    
	
	
	
	
  </body>
  
</html>

<script type="text/javascript">


	var map = new BMap.Map("allmap",{mapType: BMAP_HYBRID_MAP});            // 创建Map实例
	var point = new BMap.Point(116.404, 39.915);    // 创建点坐标
	map.centerAndZoom(point,8);                     // 初始化地图,设置中心点坐标和地图级别。
	map.enableScrollWheelZoom();                            //启用滚轮放大缩小


map.addControl(new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));    //左上角，默认地图控件
map.setCurrentCity("北京");   //由于有3D图，需要设置城市哦
map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT}));  //添加默认缩放平移控件

map.addControl(new BMap.ScaleControl()); 
var marker1 = new BMap.Marker(new BMap.Point(116.384, 39.925));  // 创建标注
map.addOverlay(marker1);
var point = new BMap.Point(116.404, 39.915);


</script>


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
	<link rel="stylesheet" href="css/justified-nav.css">
	<link rel="stylesheet" href="js/upload/uploadify.css">
	
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/upload/jquery.uploadify.min.js"></script>
	<!-- 自定义 -->
	<script src="js/global.js"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4bfe7b8632739c89a1b8e95529da1d97"></script>
<script type="text/javascript" src="js/map.js"></script>
<style type="text/css">
#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 5;
}
</style>


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
	    
		 	<div id="fileQueue">

		 	</div>
	        <input type="file" name="xxx" id="mapfile" />
	        <p>
	        <a href="javascript:jQuery('#mapfile').uploadify('upload','*')">开始上传</a>&nbsp;
	        
	        </p>
			 <div id="allmap"></div>
			 
		</div>

	    <div id="content"></div>
	    
    	<div class="footer"><p>&copy; 中国石油大学 2013</p></div>
	    
	</div>
	   
	
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

  /*
  var plist; 
  $.ajax({ 
          type : "post", 
          url : "map.action", 
          data : "point=test", 
          async : false, 
          success : function(data){ 
             plist=data.points ;  
          } 
          }); 
          var pointArray=new Array();
for (i=0;i<plist.length;i++){
	p=plist[i];
	pointArray[i]=new BMap.Point(p['longitude'], p['latitude'])
	var markertemp = new BMap.Marker(pointArray[i]);
	var s=Array();
	s[i]="阀组编号:"+p['groupNO']+"<br>"
	s[i]=s[i]+"所辖气井号:"+p['wellNO']+"<br>"
	s[i]=s[i]+"井口大地坐标X:"+p['geodeticCoordinatesX']+"<br>"
	s[i]=s[i]+"井口大地坐标Y:"+p['geodeticCoordinatesY']+"<br>"
	s[i]=s[i]+"井口经度:"+p['longitude']+"<br>"
	s[i]=s[i]+"井口纬度:"+p['latitude']+"<br>"
	
	var opts = {
  	width : 200,     // 信息窗口宽度
  	height: 200,     // 信息窗口高度
  	title : "井口坐标" , // 信息窗口标题
  	enableMessage:true,//设置允许信息窗发送短息
  	message:""
	}
	var infoWindow = new BMap.InfoWindow(s[i], opts);  // 创建信息窗口对象
	//map.openInfoWindow(infoWindow,pointArray[i]); //开启信息窗口
	markertemp.setTitle(s[i])
	markertemp.addEventListener("click",function(data){ 
			 temp=this.getTitle()
			 var infoWindow = new BMap.InfoWindow(temp, opts);
             this.openInfoWindow(infoWindow);  
          });
	map.addOverlay(markertemp);
}
map.centerAndZoom(pointArray[0], 15);
var polyline = new BMap.Polyline(pointArray, {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});
map.addOverlay(polyline);
      */    

	
    
</script>
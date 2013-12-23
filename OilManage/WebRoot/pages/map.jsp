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
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	
	
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
	    	<table id="list2"></table>
	    	<div id="pager2"></div>
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
	   
	<div id="uploadModal" class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title">添加新的地图文件</h4>
	      </div>
	      <div class="modal-body">
	        <p> 
	        <!-- 上传文件选择 -->
	        <input type="file" name="xxx" id="mapfile" />
	       
	        </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <!--  <button type="button" class="btn btn-primary"> &nbsp;</button> -->
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div id="consoleDlg">  
            <div id="formContainer">  
                <form id="consoleForm">  
                    <input type="hidden" id="selectId"/>  
                    <table class="formTable">  
                        
                        <tr>  
                            <th>项目名称</th>  
                            <td>  
                                <input type="text" class="textField" id="proname" name="proname" />  
                            </td>  
                        </tr>                          
                        <tr>  
                            <th></th>  
                            <td>  
                                 <input type="file" name="xxx" id="mapfile" />
                            </td>  
                        </tr>                       
                    </table>  
                </form>  
            </div>  
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
</script>
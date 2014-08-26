<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
 <!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
   
<div class="container marketing" style="width:1050px;">
<button id="showInputMap" type="button">工程输入地图展示</button>
<button id="showOutputMap" type="button">工程输出地图展示</button>
<!-- <a href="javascript:showMap(44,0,'In')">è¾å¥æä»¶å°å¾</a>
  <a href="javascript:showMap(44,0,'Out')">è¾åºæä»¶å°å¾å±ç¤º</a> -->
  	<!-- Three columns of text below the carousel -->
  	<div class="row" style="margin-bottom:0px;">
  		<!-- å°å¾ -->
  		<div id="allmap" class="img-rounded" style="border:3px solid #333300;box-shadow:12px 12px 10px #333300;border-radius: 11px"></div>
  	</div><!-- /.row -->


</div><!-- /.container -->

<style type="text/css">
#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin-top:0px;
}
</style>
<script type="text/javascript">
$(function(){
	$("#showInputMap").bind("click",function(){
		  var proID=$("#proID").val();
		  var algID=$("#curAlgID").val();
		  showMap(proID,algID,'In');
		});
	$("#showOutputMap").bind("click",function(){
		  var proID=$("#proID").val();
		  var algID=$("#curAlgID").val();
		  showMap(proID,algID,'Out');
		});
	var map = new BMap.Map("allmap",{mapType: BMAP_HYBRID_MAP});            // åå»ºMapå®ä¾
	var point = new BMap.Point(116.404, 39.915);    // åå»ºç¹åæ 
	map.centerAndZoom(point,8);                     // åå§åå°å¾,è®¾ç½®ä¸­å¿ç¹åæ åå°å¾çº§å«ã
	map.enableScrollWheelZoom();                            //å¯ç¨æ»è½®æ¾å¤§ç¼©å°

	map.addControl(new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));    //å·¦ä¸è§ï¼é»è®¤å°å¾æ§ä»¶
	map.setCurrentCity("åäº¬");   //ç±äºæ3Då¾ï¼éè¦è®¾ç½®åå¸å¦
	map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT}));  //æ·»å é»è®¤ç¼©æ¾å¹³ç§»æ§ä»¶

	map.addControl(new BMap.ScaleControl()); 
	var marker1 = new BMap.Marker(new BMap.Point(116.384, 39.925));  // åå»ºæ æ³¨
	map.addOverlay(marker1);
	var point = new BMap.Point(116.404, 39.915);
});


</script>


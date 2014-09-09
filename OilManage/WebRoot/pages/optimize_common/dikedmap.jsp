<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>

<script type="text/javascript" src="js/map_diked.js"></script>
	
<div id="dikedAreaMap"  class="popdiv" style="display:None;width:700px;height:600px;">

<button id="dikedMove" style='margin:2px;border-radius:5px;float:left;font-size:12px;background-color:#A5CEA5;height:3em;line-height:2em;overflow: hidden;'>点我拖动</button>

	<div class="container marketing" style="width:600px;">	
		<a href="javascript:showObstacle(44,0,'In')">更新障碍区地图</a> 
	<!-- 	<hr class="featurette-divider"
			style="margin-top:10px;margin-bottom:10px;">
 -->
		<!-- Three columns of text below the carousel -->
		<div class="row" style="height:500px;">
			<!-- 地图 -->
			<div id="dikedmap" class="img-rounded"
				style="border:3px solid #333300;box-shadow:12px 12px 10px #333300;border-radius: 11px">
				<div id="map"
					style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
				<div id="showPanelBtn"
					style="position:absolute;font-size:14px;top:50%;margin-top:-95px;right:0px;width:20px;padding:10px 10px;color:#999;cursor:pointer;text-align:center;height:170px;background:rgba(255,255,255,0.9);-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;font-family:'微软雅黑';font-weight:bold;">
					显示检索结果面板<br />&lt;
				</div>
				<div id="panelWrap"
					style="width:0px;position:absolute;top:0px;right:0px;height:100%;overflow:auto;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;">
					<div
						style="width:20px;height:200px;margin:-100px 0 0 -10px;color:#999;position:absolute;opacity:0.5;top:50%;left:50%;"
						id="showOverlayInfo">此处用于展示覆盖物信息</div>
					<div id="panel" style="position:absolute;"></div>
				</div>


			</div>

		</div>
		<!-- /.row -->
	</div>
</div>
<script type="text/javascript">
initdiked();
</script>
<style type="text/css">
#dikedmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin-top: 20px;
}
</style>

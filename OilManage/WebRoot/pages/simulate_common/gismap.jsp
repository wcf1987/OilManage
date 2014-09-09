<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
 <!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
   
<div class="container marketing" style="width:1050px;">
<div style="background-color:white;width:1050px;"><button id="showInputMap" type="button">工程输入地图展示</button>
<button id="showOutputMap" type="button">工程输出地图展示</button></div>
  	<div class="row" style="margin-bottom:0px;">
  		<!-- å°å¾ -->
  		<div id="mapgis" class="img-rounded" style="border:3px solid #333300;box-shadow:12px 12px 10px #333300;border-radius: 11px"></div>
  	</div><!-- /.row -->


</div><!-- /.container -->

<div id="lineAttr" class="popdivMapAttr" style="display:none;width:325px;line-height:30px;height:300px;">
	<a id="close_lineAttr" class="close">x</a>	
	<div id="lineAttrContent"></div>
</div>
<style type="text/css">
#mapgis {
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
	initMap();
});


</script>


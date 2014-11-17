<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('inputBase')">输入数据</button></div>
	<div style="float:left;height:30px;width:120px;margin-right:10px;"><input type="file" name="importExcel" id="importExcel"/></div> 
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="saveExcel()">保存数据</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="runAlg(0)">运行</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportInputExcel()">导出输入数据</button></div>
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('inputDcMap')">笛卡尔建模</button></div>	
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('inputGisMap')">输入地图建模</button></div>						
</div>
<div id="inputBase"  class="inputDataDiv">
	<!-- <div class="tab-title">基础数据</div> -->
	<div id="input_base_div">
	</div>
</div>
<div id="inputCondition" class="inputDataDiv" style="display:none">
	<div class="tab-title">约束条件</div>
	<div id="input_condition_div">
	</div>
</div>

<div id="inputFunction" class="inputDataDiv"  style="display:none">
	<div class="tab-title">问题描述</div>
	<div id="input_function_div">
	</div>
</div>
<div id="inputGisMap" class="inputDataDiv" style="display:none">
	<%@ include file="gismap.jsp" %>
</div>
<div id="inputDcMap" class="inputDataDiv" style="display:none">
	<%@ include file="dcmodel.jsp" %>
</div>

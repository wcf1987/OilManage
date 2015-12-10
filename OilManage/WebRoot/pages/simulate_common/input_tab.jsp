<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div class="pd10">
	<div class="btn-group">
		<div class="btn-group"><input type="file" name="importExcel" id="importExcel"/></div>
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('inputBase')">输入数据</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="saveExcel()">保存数据</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="exportInputExcel()">导出输入数据</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('inputDcMap')">笛卡尔建模</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('inputGisMap')">输入地图建模</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="runAlg(0)">运行</button>
	</div>					
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
	<%@ include file="gismapIn.jsp" %>
</div>
<div id="inputDcMap" class="inputDataDiv" style="display:none">
<%@ include file="dcmodel.jsp" %>
</div>

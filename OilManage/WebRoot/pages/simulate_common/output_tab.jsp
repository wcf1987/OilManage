<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div class="pd10">
	<div class="btn-group">
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('outputBase')">查看输出</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="exportOutputExcel()">导出计算结果</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('outputGisMap')">输出地图显示</button>
	</div>						
</div>
<div id="outputBase" class="outputDataDiv" style="display:block">
	<div id="output_base_div">
	</div>
</div>
<div id="outputGisMap" class="outputDataDiv" style="display:none">
	<%@ include file="gismapOut.jsp" %>
</div>


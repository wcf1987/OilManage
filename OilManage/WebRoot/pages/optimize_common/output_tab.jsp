<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div class="pd10">
	<div class="btn-group">
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('outputBase')">查看系统结构数据</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('outputPosition')">查看站点</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('outputFee')">查看费用报告</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="exportOutputExcel()">导出计算结果</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="showData('outputGisMap')">输出地图显示</button>
	</div>						
</div>

<div id="outputBase" class="outputDataDiv" style="display:block">
<!-- 	<div class="tab-title">系统结构</div> -->
	<div id="output_base_div">
	</div>
</div>
<div id="outputPosition" class="outputDataDiv"  style="display:none">
<!-- 	<div class="tab-title">站点</div> -->
	<div id="output_position_div">
	</div>
</div>
<div id="outputFee" class="outputDataDiv" style="display:none">
<!-- 	<div class="tab-title">费用数据</div> -->
	<div id="output_fee_div">
	</div>
</div>

<div id="outputGisMap" class="outputDataDiv" style="display:none">
	<%@ include file="gismapOut.jsp" %>
</div>

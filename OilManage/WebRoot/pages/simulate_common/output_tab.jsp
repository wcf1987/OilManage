<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportOutputExcel()">导出计算结果</button></div>						
</div>

<div id="outputBase" class="outputDataDiv" style="display:block">
	<div class="tab-title">计算结果</div>
	<div id="output_base_div">
	</div>
</div>
<div id="outputFee" class="outputDataDiv" style="display:none">
	<div class="tab-title">费用数据</div>
	<div id="output_fee_div">
	</div>
</div>
<div id="outputPosition" class="outputDataDiv"  style="display:none">
	<div class="tab-title">站点</div>
	<div id="output_position_div">
	</div>
</div>

<!-- <div id="output-container">
 <div class="panel-container">
  
  <div id="output-table-tab0">
  	<table id="output_sheet0" class="table table-striped table-bordered table-hover datatable" style="width:1230px" ></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px" >
		<div id="output_pager0" ></div>
	</div>
  </div>

 </div>
 
 <ul>
	<li><a href="#output-table-tab0">井底流压</a></li>
 </ul>
</div> -->

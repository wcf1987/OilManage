<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
	<div style="float:left;height:30px;width:120px;margin-right:10px;"><input type="file" name="importExcel" id="importExcel"/></div> 
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="saveExcel()">保存数据</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="runAlg()">运行</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportInputExcel()">导出输入数据</button></div>						
</div>
<!-- <div id="input-container">
 <div class="panel-container">
 </div>
 <ul>
	<li><a href="#input-table-tab0">老井数据</a></li>
	<li><a href="#input-table-tab1">新井数据</a></li>	
	<li><a href="#input-table-tab2">老井区井组</a></li>
	<li><a href="#input-table-tab3">布局约束</a></li>	
 </ul>
</div> -->

<div style="background-color:#fff;padding:5px;height:40px;">基础数据</div>
<div id="input-base-container" class="tabs-container ">
 <div id="input-base-tabs" class="panel-container">
 </div>
 <ul>
	<li><a href="#input-base-tab0">老井数据</a></li>	
	<li><a href="#input-base-tab1">新井数据</a></li>
	<li><a href="#input-base-tab2">老井区井组</a></li>	
 </ul>
</div>

<div style="background-color:#fff;padding:5px;height:40px;margin-top:40px;">约束条件</div>
<div id="input-condition-container" class="tabs-container ">
 <div id="input-condition-tabs" class="panel-container">
 </div>
 <ul>
	<li><a href="#input-condition-tab0">布局约束</a></li>	
 </ul>
</div>


<%@ include file="../optimize_common/dikedmap.jsp" %>


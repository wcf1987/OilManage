<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>

<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
	<div style="float:left;height:30px;width:120px;margin-right:10px;"><input type="file" name="importExcel" id="importExcel"/></div> 
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="saveExcel()">保存数据</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="runAlg()">运行</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportInputExcel()">导出输入数据</button></div>						
</div>

<div style="background-color:#fff;padding:5px;height:40px;">基础数据</div>
<div id="input_base_div">
</div>

<div style="background-color:#fff;padding:5px;height:40px;margin-top:40px;">约束条件</div>
<div id="input-condition-container" class="tabs-container ">
 <div id="input-condition-tabs" class="panel-container">
 </div>
 <ul>
	<li><a href="#input-condition-tab0">预设站点位置</a></li>	
	<li><a href="#input-condition-tab1">布局约束</a></li>
	<li><a href="#input-condition-tab2">管径优化约束</a></li>	
	<li><a href="#input-condition-tab3">主动增压约束</a></li>
 </ul>
</div>

<div style="background-color:#fff;padding:5px;height:40px;margin-top:40px;">问题描述</div>
<div id="input-function-container" class="tabs-container ">
 <div id="input-function-tabs" class="panel-container">
 </div>
 <ul>
	<li><a href="#input-function-tab0"></a></li>	
 </ul>
</div>

<%@ include file="../optimize_common/dikedmap.jsp" %>


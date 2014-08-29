<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
	<div style="float:left;height:30px;width:120px;margin-right:10px;"><input type="file" name="importExcel" id="importExcel"/></div> 
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="saveExcel()">保存数据</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="runAlg()">运行</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportInputExcel()">导出输入数据</button></div>						
</div>
<!-- <div id="input-container">
 <div id="input-tabs" class="panel-container">
 </div>
 <ul>
	<li><a href="#input-table-tab0">井数据</a></li>	
	<li><a href="#input-table-tab1">管道数据</a></li>
	<li><a href="#input-table-tab2">经济数据</a></li>	
	<li><a href="#input-table-tab3">障碍区</a></li>
	<li><a href="#input-table-tab4">流体</a></li>	
	<li><a href="#input-table-tab5">问题描述</a></li>
	<li><a href="#input-table-tab6">预设站点位置</a></li>	
	<li><a href="#input-table-tab7">布局约束</a></li>
 </ul>
</div> -->

<div style="background-color:#fff;padding:5px;height:40px;">基础数据</div>
<div id="input_base_div">
	<div id="input-base-container" class="tabs-container ">
	 <div id="input-base-tabs" class="panel-container">
	 </div>
	 <ul>
		<li><a href="#input-base-tab0">井数据</a></li>	
		<li><a href="#input-base-tab1">阀组数据</a></li>
		<li><a href="#input-base-tab2">集气站数据</a></li>	
		<li><a href="#input-base-tab3">中央处理厂数据</a></li>
		<li><a href="#input-base-tab4">管道数据</a></li>	
		<li><a href="#input-base-tab5">流体</a></li>	
		<li><a href="#input-base-tab6">经济参数</a></li>
		<li><a href="#input-base-tab7">井阀组隶属</a></li>	
		<li><a href="#input-base-tab8">阀组集气站隶属</a></li>
		<li><a href="#input-base-tab9">集气站中央处理厂隶属</a></li>
		<li><a href="#input-base-tab10">井阀组连接</a></li>	
		<li><a href="#input-base-tab11">阀组集气站连接</a></li>
		<li><a href="#input-base-tab12">集气站中央处理厂连接</a></li>	
	 </ul>
	</div>
</div>

<div style="background-color:#fff;padding:5px;height:40px;margin-top:40px;">约束条件</div>
<div id="input-condition-container" class="tabs-container ">
 <div id="input-condition-tabs" class="panel-container">
 </div>
 <ul>
	<li><a href="#input-condition-tab0">管径优化约束</a></li>	
	<li><a href="#input-condition-tab1">主动增压约束</a></li>
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

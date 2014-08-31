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

<style>
/* Styles for Tabs on Bottom */
#input-container { width: 100%; padding: 0; clear: both; }
#input-container ul { list-style: none; margin: 0; padding: 0; width: 100%; }
#input-container ul li { border:1px solid;background-color:#ccc;float: left; width:12.5%; margin: 0; padding: 0; text-align: center; border-top: solid 1px; }
#input-container ul li a { color:#000;display: block; padding: 8px 0; outline: none; }
#input-container ul li a:hover { text-decoration: underline; }
#input-container ul li.active { width: 12.5%; background: #fff; border: solid 1px; border-top: none; }
#input-container ul li a.active { font-weight: bold; text-decoration: none; }
#input-container .panel-container { background: #fff; border: solid 1px; border-bottom: none; padding: 10px; margin-bottom: 0; }
</style>
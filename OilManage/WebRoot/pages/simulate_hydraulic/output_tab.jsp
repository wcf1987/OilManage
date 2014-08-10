<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportOutputExcel()">导出计算结果</button></div>						
</div>
<div id="output-container">
 <div class="panel-container">
  
  <div id="output-tab0">
  	<table id="output_sheet0" class="table table-striped table-bordered table-hover datatable" style="width:1230px" ></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px" >
		<div id="output_pager0" ></div>
	</div>
  </div>
  
  <div id="output-tab1">
   	<table id="output_sheet1" class="table table-striped table-bordered table-hover datatable " style="width:1230px;"></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px">
		<div id="output_pager1"></div>
	</div>
  </div>
  
  <div id="output-tab2">
   	<!-- 表格 -->
	<table id="output_sheet2"
		class="table table-striped table-bordered table-hover datatable " style="width:1230px"></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
		<div id="output_pager2"></div>
	</div> 
  </div>
  
  <div id="output-tab3">
	<!-- 表格 -->
	<table id="output_sheet3"
		class="table table-striped table-bordered table-hover datatable " style="width:1230px"></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
		<div id="output_pager3"></div>
	</div> 
  </div>
    
 </div>
 
 <ul>
	<li><a href="#output-tab0">节点参数</a></li>
	<li><a href="#output-tab1">管段参数</a></li>
	<li><a href="#output-tab2">离心压缩机参数</a></li>
	<li><a href="#output-tab3">往复式压缩机参数</a></li>
 </ul>
</div>

<script type="text/javascript">
$('#output-container').easytabs({
	animate: false
  //animationSpeed: 2000,
  //defaultTab: "li#the-second-tab"
});
</script>
<style>
/* Styles for Tabs on Bottom */
#output-container { width: 100%; padding: 0; clear: both; }
#output-container ul { list-style: none; margin: 0; padding: 0; width: 100%; }
#output-container ul li { border:1px solid;background-color:#ccc;float: left; width:25%; margin: 0; padding: 0; text-align: center; border-top: solid 1px; }
#output-container ul li a { color:#000;display: block; padding: 15px 0; outline: none; }
#output-container ul li a:hover { text-decoration: underline; }
#output-container ul li.active { width: 25%; background: #fff; border: solid 1px; border-top: none; }
#output-container ul li a.active { font-weight: bold; text-decoration: none; }
#output-container .panel-container { background: #fff; border: solid 1px; border-bottom: none; padding: 10px; margin-bottom: 0; }
</style>
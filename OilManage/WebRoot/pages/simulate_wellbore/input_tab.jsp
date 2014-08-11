<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
	<div style="float:left;height:30px;width:120px;margin-right:10px;"><input type="file" name="importExcel" id="importExcel"/></div> 
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="saveExcel()">保存数据</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="runAlg()">运行</button></div>						
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportInputExcel()">导出输入数据</button></div>						
</div>
<div id="input-container">
 <div class="panel-container">
  <div id="input-table-tab0">
  	<table id="sheet0" class="table table-striped table-bordered table-hover datatable" style="width:1230px" ></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px" >
		<div id="pager0" ></div>
	</div>
  </div>
  
  <div id="input-table-tab1">
   	<table id="sheet1" class="table table-striped table-bordered table-hover datatable " style="width:1230px;"></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px">
		<div id="pager1"></div>
	</div>
  </div>   
 </div>
 <ul>
	<li><a href="#input-table-tab0">气井参数</a></li>
	<li><a href="#input-table-tab1">流体参数</a></li>	
 </ul>
</div>

<script type="text/javascript">
/* $('#input-container').easytabs({
	animate: false
  //animationSpeed: 2000,
  //defaultTab: "li#the-second-tab"
}); */
</script>
<style>
/* Styles for Tabs on Bottom */
#input-container { width: 100%; padding: 0; clear: both; }
#input-container ul { list-style: none; margin: 0; padding: 0; width: 100%; }
#input-container ul li { border:1px solid;background-color:#ccc;float: left; width:20%; margin: 0; padding: 0; text-align: center; border-top: solid 1px; }
#input-container ul li a { color:#000;display: block; padding: 8px 0; outline: none; }
#input-container ul li a:hover { text-decoration: underline; }
#input-container ul li.active { width: 20%; background: #fff; border: solid 1px; border-top: none; }
#input-container ul li a.active { font-weight: bold; text-decoration: none; }
#input-container .panel-container { background: #fff; border: solid 1px; border-bottom: none; padding: 10px; margin-bottom: 0; }
</style>
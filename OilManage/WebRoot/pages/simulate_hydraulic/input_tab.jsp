<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div id="input-container">
 <div class="panel-container">
  
  <div id="bottom-tab0">
  	<table id="sheet0" class="table table-striped table-bordered table-hover datatable" style="width:1230px" ></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px" >
		<div id="pager0" ></div>
	</div>
  </div>
  
  <div id="bottom-tab1">
   	<table id="sheet1" class="table table-striped table-bordered table-hover datatable " style="width:1230px;"></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px">
		<div id="pager1"></div>
	</div>
  </div>
  
  <div id="bottom-tab2">
   	<!-- 表格 -->
	<table id="sheet2"
		class="table table-striped table-bordered table-hover datatable " style="width:1230px"></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
		<div id="pager2"></div>
	</div> 
  </div>
  
  <div id="bottom-tab3">
	<!-- 表格 -->
	<table id="sheet3"
		class="table table-striped table-bordered table-hover datatable " style="width:1230px"></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
		<div id="pager3"></div>
	</div> 
  </div>
  
  <div id="bottom-tab4">
	<!-- 表格 -->
	<table id="sheet4"
		class="table table-striped table-bordered table-hover datatable " style="width:1230px"></table>
	<div style="box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
		<div id="pager4"></div>
	</div> 
  </div>
    
 </div>
 
 <ul>
	<li><a href="#bottom-tab0">流体参数</a></li>
	<li><a href="#bottom-tab1">节点数据</a></li>
	<li><a href="#bottom-tab2">管段数据</a></li>
	<li><a href="#bottom-tab3">离心压缩机</a></li>
	<li><a href="#bottom-tab4">往复式压缩机</a></li>
 </ul>
</div>

<script type="text/javascript">
$('#input-container').easytabs({
  //animationSpeed: 2000,
  //defaultTab: "li#the-second-tab"
});
</script>
<style>
/* Styles for Tabs on Bottom */
#input-container { width: 100%; padding: 0; clear: both; }
#input-container ul { list-style: none; margin: 0; padding: 0; width: 100%; }
#input-container ul li { border:1px solid;background-color:#ccc;float: left; width:20%; margin: 0; padding: 0; text-align: center; border-top: solid 1px; }
#input-container ul li a { color:#000;display: block; padding: 15px 0; outline: none; }
#input-container ul li a:hover { text-decoration: underline; }
#input-container ul li.active { width: 20%; background: #fff; border: solid 1px; border-top: none; }
#input-container ul li a.active { font-weight: bold; text-decoration: none; }
#input-container .panel-container { background: #fff; border: solid 1px; border-bottom: none; padding: 10px; margin-bottom: 0; }
</style>
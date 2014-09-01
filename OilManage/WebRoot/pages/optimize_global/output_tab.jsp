<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportOutputExcel()">导出计算结果</button>
	</div>
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('outputBase')">查看系统结构数据</button>
	</div>	
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('outputFee')">查看费用报告</button>
	</div>	
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('outputPosition')">查看站点</button>
	</div>							
</div>
<div id="outputBase" class="outputDataDiv" style="display:block">
	<div class="tab-title">基础数据</div>
	<div id="output_base_div">
	<!-- <div id="output-container">
	 <div id="output-tabs" class="panel-container">
	 </div>
	 <ul>
		<li><a href="#output-table-tab0">井阀组隶属</a></li>
		<li><a href="#output-table-tab1">阀组集气站隶属</a></li>
		<li><a href="#output-table-tab2">集气站中央处理厂隶属</a></li>
		<li><a href="#output-table-tab3">井阀组连接管段</a></li>
		<li><a href="#output-table-tab4">阀组集气站连接管段</a></li>
		<li><a href="#output-table-tab5">集气站中央处理厂连接管段</a></li>
		<li><a href="#output-table-tab6">路径</a></li>
		<li><a href="#output-table-tab7">管道费用</a></li>
		<li><a href="#output-table-tab8">总费用</a></li>
		<li><a href="#output-table-tab9">井位置</a></li>
		<li><a href="#output-table-tab10">阀组位置</a></li>
		<li><a href="#output-table-tab11">集气站位置</a></li>
		<li><a href="#output-table-tab12">中央处理厂位置</a></li>
		<li><a href="#output-table-tab13">主动增压点位置</a></li>
		<li><a href="#output-table-tab14">撬装液化点位置</a></li>
		<li><a href="#output-table-tab15">井流动参数</a></li>
		<li><a href="#output-table-tab16">阀组流动参数</a></li>
		<li><a href="#output-table-tab17">集气站流动参数</a></li>
		<li><a href="#output-table-tab18">中央处理厂流动参数</a></li>
	 </ul>
	</div> -->
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
<script type="text/javascript">
/* $(function(){
	var outputSheetNum=$("#outputSheetNum").val();
	var tabs="";
	for(var i=0;i<outputSheetNum;i++){
		tabs+="<div id='output-table-tab"+i+"'>"+
		  	"<table id='output_sheet"+i+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
			"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
				"<div id='output_pager"+i+"' ></div></div></div>";
	}
	$("#output-tabs").html(tabs);
	//$("#output-container ul li").css("width",1/3);
	//$("#output-container ul li.active").css("width",1/3);
});  */
</script>
<style>
/* Styles for Tabs on Bottom */
#output-container { width: 100%; padding: 0; clear: both; }
#output-container ul { list-style: none; margin: 0; padding: 0; width: 100%; }
#output-container ul li { border:1px solid;background-color:#ccc;float: left; width:5.26%; margin: 0; padding: 0; text-align: center; border-top: solid 1px; }
#output-container ul li a { color:#000;display: block; padding: 8px 0; outline: none; }
#output-container ul li a:hover { text-decoration: underline; }
#output-container ul li.active { width: 5.26%; background: #fff; border: solid 1px; border-top: none; }
#output-container ul li a.active { font-weight: bold; text-decoration: none; }
#output-container .panel-container { background: #fff; border: solid 1px; border-bottom: none; padding: 10px; margin-bottom: 0; }
</style>
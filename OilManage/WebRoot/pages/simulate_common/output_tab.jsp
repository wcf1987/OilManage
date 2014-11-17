<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">	
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('outputBase')">查看输出</button>
	</div>	
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportOutputExcel()">导出计算结果</button>
	</div>	
	<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('outputGisMap')">输出地图显示</button>
	</div>						
</div>
<div id="outputBase" class="outputDataDiv" style="display:block">
	<div id="output_base_div">
	</div>
</div>
<div id="outputGisMap" class="outputDataDiv" style="display:none">
	<%@ include file="gismap.jsp" %>
</div>


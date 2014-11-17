<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <%
//User userlogin=(User)(session.getAttribute("user"));
%> 
    <base href="<%=basePath%>">
    
    <title>系统模拟</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	
	<script type="text/javascript" src="editor/lib/kinetic-v5.1.0.min.js"></script>
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />  
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	<link rel="stylesheet" href="js/upload/uploadify.css">
	<link rel="stylesheet" media="screen" type="text/css"
		href="editor/assets/css/style.css" />
	<link rel="stylesheet" media="screen" type="text/css"
		href="editor/assets/css/minimap.css" />

	<script type="text/javascript" src="editor/assets/javascript/json2.js"></script>
	<script type="text/javascript" src="editor/assets/javascript/jquery-1.11.0.min.js"></script>
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	<script type="text/javascript" src="editor/assets/javascript/ajaxfileupload.js"></script>
	<script src="js/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/holder.min.js"></script>
	
	<script type="text/javascript" src="js/upload/jquery.uploadify.min.js"></script>
	
	<script type="text/javascript" src="js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
	<script src="js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
	<script src="js/easytabs/jquery.easytabs.js" type="text/javascript"></script>
	<script src="js/jqueryPlug/jquery.mousewheel.min.js" type="text/javascript"></script>
	
	<script defer="defer" type="text/javascript" src="editor/lib/init2.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/platform.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/leftpoly.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/Paintings.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/tools.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/kinecttab.js"></script>
	<script  type="text/javascript" src="editor/lib/pipe.js"></script>
		
	
	<script defer="defer" type="text/javascript" src="js/global.js"></script>
	<script defer="defer" type="text/javascript" src="js/diagram.js"></script>
	<script defer="defer" type="text/javascript" src="js/dynamicSheet.js"></script>
	<script defer="defer" type="text/javascript" src="js/project.js"></script>	
	<script defer="defer" type="text/javascript" src="js/simulate_optimize.js"></script>
	<script defer="defer" type="text/javascript" src="js/PipeCharts.js"></script>	
	<link type='text/css' href='editor/assets/simplemodal/css/diagramo.css' rel='stylesheet' media='screen' />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/colorPicker_new.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>	
	<link rel="stylesheet" type="text/css" href="css/diagram.css"/>		
	<link rel="stylesheet" type="text/css" href="css/simulate_optimize.css"/>
	<link rel="stylesheet" type="text/css" href="css/dynamicSheet.css" />
	
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4bfe7b8632739c89a1b8e95529da1d97"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MapWrapper/1.2/src/MapWrapper.min.js"></script>  
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/changeMore.js"></script>
	<script type="text/javascript" src="js/map_gis.js"></script>
	
  </head>
    
  
  <body  id="body"  onload="initLight();">

	<div id="head">
		    <%@ include file="commons/header.jsp" %>
	</div>  
		<div class="container marketing condiv" style="width:1200px;margin-top:30px;">
	    	
	    	<div class="container-fluid">
				<div class="row-fluid row-fluid2">
					<div class="span12">
					<div class="head">
						<h2>井底流压计算</h2>
						
						<input id="tempStr1" style="display:none" value=""/>
						<input id="tempStr2" style="display:none" value=""/>
						<input id="curAlgID" style="display:none" value="0"/>
						<input id="proID" style="display:none" value=""/>
						<input id="inputSheetNum" style="display:none" value="2"/>
						<input id="input_base_sheetNum" style="display:none" value="2"/>
						<input id="input_function_sheetNum" style="display:none" value="0"/>
						<input id="input_condition_sheetNum" style="display:none" value="0"/>
						
						<input id="outputSheetNum" style="display:none" value="1"/>
						<input id="output_base_sheetNum" style="display:none" value="1"/>
						<input id="output_fee_sheetNum" style="display:none" value="0"/>
						<input id="output_position_sheetNum" style="display:none" value="0"/>
						<!-- 
						if (id = 0)，井底流压计算；if (id = 1)，单气相管网水力计算；if (id = 2)，单气相管网热力计算；if (id = 3)，气固两相管网水力计算；if (id = 4)，气液两相管网水力计算
						 -->
					</div>
					
				
					<div id="father_tab" class="tab-container" >
					<!-- 	<ul class='etabs'>
						    <li class='tab'><button id="input_tab_button" onclick="showTab('input_tab')">输入</button></li>
						    <li class='tab'><button id="run_tab_button" onclick="showTab('run_tab')">查看运行</button></li>
						    <li class='tab'><button id="output_tab_button" onclick="showTab('output_tab')">输出</button></li>						    
					    </ul>  --> 
				<!-- 	    <div  style="float:left;">
							<img  style="width:100px"  src="images/jingtong.png" />
						</div> -->
						<div>
						<div id="input_tab" class="father_tab">				
							<div style="background-color:#fff;padding:5px;border:2px solid;height:40px;">
								<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="showData('inputBase')">输入数据</button></div>
								<div style="float:left;height:30px;width:120px;margin-right:10px;"><input type="file" name="importExcel" id="importExcel"/></div> 
								<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="saveExcel()">保存数据</button></div>						
								<div style="float:left"><button style="font-size:12px;height:22px;margin-right:10px;margin-top:5px;" onclick="exportInputExcel()">导出输入数据</button></div>
							</div>
							<div id="inputBase"  class="inputDataDiv">
								<!-- <div class="tab-title">基础数据</div> -->
								<div id="input_base_div">
								</div>
							</div>
							<div id="inputCondition" class="inputDataDiv" style="display:none">
								<div class="tab-title">约束条件</div>
								<div id="input_condition_div">
								</div>
							</div>
							
							<div id="inputFunction" class="inputDataDiv"  style="display:none">
								<div class="tab-title">问题描述</div>
								<div id="input_function_div">
								</div>
							</div>
							<div id="inputGisMap" class="inputDataDiv" style="display:none">
								<%@ include file="simulate_common/gismap.jsp" %>
							</div>
							<div id="inputDcMap" class="inputDataDiv" style="display:none">
								<%@ include file="simulate_common/dcmodel.jsp" %>
							</div>
			    		</div>
			    		<div id="run_tab" class="father_tab" style="margin-top:42px;">
			    			
			    			<button onclick="run_load_output()" style="margin-top:20px;margin-left:20px">计算井底流压</button>
						<%-- 	<%@ include file="simulate_common/run_tab.jsp" %> --%>
			    		</div>
			    		<div id="output_tab" class="father_tab">
							<div id="outputBase" class="outputDataDiv" style="display:block">
								<div id="output_base_div">
								</div>
							</div>				
			    		</div>
			    		</div>
					</div>	            			
										
					</div>
				</div>
			</div> 
	    </div><!-- /.container -->		
	    </div>
  
	<hr> 
    <div id="footer">
        <%@ include file="commons/footer.jsp" %>
    </div>
	 
		<%@ include file="simulate_common/modal.jsp" %>
	<div id="isRunning" style="display:none;padding:90px 120px;width:400px;height:100px;border:10px solid;border-radius:10px;background-color:white;">
		<span>正在计算......</span>
	</div> 
	<script type="text/javascript" src="js/optimize.js"></script>	
		   
  </body>
  
</html>
<script>
function run_load_output(){
	$.ajax({
		type:'post',
		async: false,  
		url:'runAlgPro.action',
		data:{
			ID:$("#proID").val()
		},
		dataType:'json',
	    beforeSend:function(XMLHttpRequest){
	    	$("#outputarea").text("");
	    	intervalID=setInterval ("listLog()", 5000);//每隔一段时间去请求日志信息
	    	//$("#isRunning").css({display:"block",top:"15%",left:"55%",position:"absolute"});
	    
	    },
		success:function(data){				
			//$("#isRunning").hide();		
			if(data.msg==null||data.msg==""){
				//alert("运行结束！")
			}else{
				alert(data.msg);
			}					
		},
		error:function(msg){						
			alert(msg);	
		}
	});
	
	var proid=$("#proID").val();
	var sid = 1;
	var algid = $("#curAlgID").val();
	var outputSheetNum=$("#outputSheetNum").val();
	var inOrOut="Out";
	var sheetDiv = "#output-sheet";
	var pageDiv = "#output-pager";
	var delID="output-delsheet";
	for(var i=0;i<outputSheetNum;i++){
		var sheetgrid = new SheetGrid();
		sheetgrid.GetDynamicCols(i, algid,inOrOut);
		sheetgrid.creategrid(proid, sheetDiv+i, pageDiv+i,delID+i);		
	}
	var sheetGrid=new SheetGrid();
	sheetGrid.reloadGrid();
}



</script>
	

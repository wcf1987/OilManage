<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="commons/base_header.jsp" %>

<body class="no-skin" onload="initLight();">
	<script type="text/javascript" src="editor/lib/kinetic-v5.1.0.min.js"></script>
	<!--link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" /-->
	<!--link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" /-->
	<!--link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" /-->  
	<!--link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" /-->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css" />
	<link rel="stylesheet" href="js/upload/uploadify.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/style.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/minimap.css" />

	<script type="text/javascript" src="editor/assets/javascript/json2.js"></script>
	<!--script type="text/javascript" src="editor/assets/javascript/jquery-1.11.0.min.js"></script-->
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	<script type="text/javascript" src="editor/assets/javascript/ajaxfileupload.js"></script>
	<script src="js/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	<!--script src="bootstrap/js/bootstrap.min.js"></script-->
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
		
	
	<!--script defer="defer" type="text/javascript" src="js/global.js"></script-->
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
	
	<%@ include file="commons/header.jsp" %>
		<!-- /section:basics/sidebar.horizontal -->
		<div class="main-content">
			<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="pages/home.jsp">首页</a>
					</li>
					<li class="active">井底流压计算</li>
					<li><span id="project_name_show"></span></li>
				</ul>
			</div>
			<div class="page-content">
				<!-- /section:settings.box -->
				<div class="page-header">
					<h1>
						井底流压计算
					</h1>
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
				</div><!-- /.page-header -->

				<div class="row">
					<div class="col-xs-12">
						<div id="father_tab" class="tab-container">
							<ul class='etabs'>
								<li class='tab active'><a id="project_tab_button" onclick="showTab('project_tab')">工程管理</a></li>
							    <li class='tab'><a id="input_tab_button" onclick="showTab('input_tab')">输入</a></li>						  					    
						    </ul>  
						     <div id="project_tab" class="father_tab">				
								<%@ include file="simulate_common/project_tab.jsp" %>
				    		</div>
							<div id="input_tab" class="father_tab" style="display:none">
								<div class="pd10">
									<div class="btn-group">
										<div class="btn-group"><input type="file" name="importExcel" id="importExcel"/></div>
										<button class="btn btn-sm" type="button" onclick="saveExcel()">保存数据</button>
										<button class="btn btn-sm" type="button" onclick="exportInputExcel()">导出输入数据</button>
									</div>					
								</div>
								<div class="row">
									<div class="col-xs-3"><img style="width:400px;margin-top:60px" src="images/jingtong.png" /></div>
									<div class="col-xs-6">
										<!-- <div class="tab-title">基础数据</div> -->
										<div id="input_base_div"></div>
									</div>
									<div class="col-xs-3">
										<button class="btn btn-sm btn-primary" onclick="runAlgWell()">计算井底流压 <i class="ace-icon fa fa-arrow-right icon-on-right"></i></button>
				    					<input type="text" id="wellbore_res" readonly="readonly" size="10" style="vertical-align:middle;" />(MPa)
									</div>
								</div>				
								<div id="inputGisMap" class="inputDataDiv" style="display:none">
										
								</div>
								<div id="inputDcMap" class="inputDataDiv" style="display:none">
									
								</div>
				    		</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div><!-- /.main-content -->

		<%@ include file="commons/footer.jsp" %>
		<%@ include file="simulate_common/modal.jsp" %>
		<div id="isRunning" style="display:none;padding:90px 120px;width:400px;height:100px;border:10px solid;border-radius:10px;background-color:white;">
			<span>正在计算......</span>
		</div> 
		<script type="text/javascript" src="js/optimize.js"></script>
	</div><!-- /.main-container -->
	<script type="text/javascript">
		function listLogWell()
		{	
			$("#outputarea").text("");
			$.ajax({
				type:'post',
				url:'listLog.action',
				data:{
					ID:$("#proID").val()
				},
				dataType:'json',
				success:function(data){
					if(data.status!=1){//如果算法运行结束，则停止日志刷新程序
						window.clearInterval(intervalID);
						$("#isRunning").hide();	
						loadOutputWell();
						alert("计算结束！");
					}			
			/* 		$.each(data.loginfo,function(index,log){
						if(log!=null&&log!=""){
							$("#outputarea").append(log.logTime.replace("T"," ")+" "+log.info+"\n");
							
						}	 	
					});	
					var d = $("#outputarea")[0].scrollHeight;
					$("#outputarea").scrollTop(d); */
				},
				error:function(msg){
					//$("#outputarea").append("通信失败！\n\r");
					alert("通信失败！");
					window.clearInterval(intervalID);
				}
			});
		
		}
		function runAlgWell(){
			$.ajax({
				type:'post',
				url:'runAlgPro.action',
				data:{
					ID:$("#proID").val()
				},
				dataType:'json',
			    beforeSend:function(XMLHttpRequest){
			    	$("#outputarea").text("");
			    	intervalID=setInterval ("listLogWell()", 5000);//每隔一段时间去请求日志信息
			    	$("#isRunning").css({display:"block",top:"30%",left:"40%",position:"absolute"});
			    
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
		}
		function loadOutputWell(){
			//location.href=window.location.pathname+"#output_tab";
		
			var proid=$("#proID").val();
			var sid = 0;
			var algid = $("#curAlgID").val();
			//var outputSheetNum=$("#outputSheetNum").val();
			var inOrOut="Out";
		/* 	var sheetDiv = "#output-sheet";
			var pageDiv = "#output-pager";
			var delID="output-delsheet";
			 */
			$.ajax({
				url : 'listSheetContent.action',
				type : 'post',
				dataType : 'json',
				data : {
					sheetID : sid,
					algID : algid,
					InOrOut:inOrOut,
					proID : proid
				},
				async:false,
				success : function(data) {
					if(data.msg!=""){
						alert(data.msg);
					}else{
					var res=data.JDLY;
					$("#wellbore_res").val(res);
					}
		
				}
				
		
			});
			
		}
	</script>
</body>
</html>

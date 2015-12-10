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
		
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4bfe7b8632739c89a1b8e95529da1d97"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MapWrapper/1.2/src/MapWrapper.min.js"></script>  
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/changeMore.js"></script>
	<script type="text/javascript" src="js/map_gis.js"></script>
	
	<!--script defer="defer" type="text/javascript" src="js/global.js"></script-->
	<script defer="defer" type="text/javascript" src="js/diagram.js"></script>
	<script defer="defer" type="text/javascript" src="js/simulate_optimize.js"></script>
	<script defer="defer" type="text/javascript" src="js/dynamicSheet.js"></script>
	<script defer="defer" type="text/javascript" src="js/project.js"></script>	
	<script defer="defer" type="text/javascript" src="js/PipeCharts.js"></script>	
	<link type='text/css' href='editor/assets/simplemodal/css/diagramo.css' rel='stylesheet' media='screen' />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/colorPicker_new.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
	<!-- <link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/processui.css" />  -->
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>	
	<link rel="stylesheet" type="text/css" href="css/diagram.css"/>		
	<link rel="stylesheet" type="text/css" href="css/simulate_optimize.css"/>
	<link rel="stylesheet" type="text/css" href="css/dynamicSheet.css" />
	
	<%@ include file="commons/header.jsp" %>
		<!-- /section:basics/sidebar.horizontal -->
		<div class="main-content">
			<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="pages/home.jsp">首页</a>
					</li>
					<li>
						<a href="javascript:;">系统模拟</a>
					</li>
					<li class="active">气固两相管网水力计算</li>
				</ul>
			</div>
			<div class="page-content">
				<!-- /section:settings.box -->
				<div class="page-header">
					<h1>
						气固两相管网水力计算
					</h1>
					<input id="tempStr1" style="display:none" value=""/>
					<input id="tempStr2" style="display:none" value=""/>
					<input id="curAlgID" style="display:none" value="3"/>
					<input id="proID" style="display:none" value=""/>
					<input id="inputSheetNum" style="display:none" value="7"/>
					<input id="input_base_sheetNum" style="display:none" value="7"/>
					<input id="input_function_sheetNum" style="display:none" value="0"/>
					<input id="input_condition_sheetNum" style="display:none" value="0"/>
					
					<input id="outputSheetNum" style="display:none" value="12"/>
					<input id="output_base_sheetNum" style="display:none" value="12"/>
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
							    <li class='tab'><a id="run_tab_button" onclick="showTab('run_tab')">查看运行</a></li>
							    <li class='tab'><a id="output_tab_button" onclick="showTab('output_tab')">输出</a></li>						    
						    </ul>  
						     <div id="project_tab" class="father_tab">				
								<%@ include file="simulate_common/project_tab.jsp" %>
				    		</div>
							<div id="input_tab" class="father_tab" style="display:none">				
								<%@ include file="simulate_common/input_tab.jsp" %>
				    		</div>
				    		<div id="run_tab" class="father_tab" style="display:none">
								<%@ include file="simulate_common/run_tab.jsp" %>
				    		</div>
				    		<div id="output_tab" class="father_tab" style="display:none">
								<%@ include file="simulate_common/output_tab.jsp" %>
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

</body>
</html>

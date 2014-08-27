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
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />  
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	<link rel="stylesheet" href="js/upload/uploadify.css">
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/style.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/minimap.css" />

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
	
		
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4bfe7b8632739c89a1b8e95529da1d97"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
	<script type="text/javascript" src="js/map_gis.js"></script>
	
	<script defer="defer" type="text/javascript" src="js/global.js"></script>
	<script defer="defer" type="text/javascript" src="js/diagram.js"></script>
	<script defer="defer" type="text/javascript" src="js/dynamicSheet.js"></script>
	<script defer="defer" type="text/javascript" src="js/project.js"></script>	
	<script defer="defer" type="text/javascript" src="js/simulate.js"></script>
	
	<link type='text/css' href='editor/assets/simplemodal/css/diagramo.css' rel='stylesheet' media='screen' />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/colorPicker_new.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
	<!-- <link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/processui.css" />  -->
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>	
	<link rel="stylesheet" type="text/css" href="css/diagram.css"/>		
	<link rel="stylesheet" type="text/css" href="css/simulate_hydraulic.css"/>
	<link rel="stylesheet" type="text/css" href="css/dynamicSheet.css" />
	

  </head>
    
  
  <body  id="body">

	<div id="head">
		    <%@ include file="commons/header.jsp" %>
	</div>  
		<div class="container marketing condiv" style="width:1200px;margin-top:30px;">
	    	
	    	<div class="container-fluid">
				<div class="row-fluid row-fluid2">
					<div class="span12">
					<div class="page-header">
						<h2>布局设计&nbsp;<small>整装区块设计</small></h2>
						<input id="curAlgID" style="display:none" value="8"/>
						<input id="proID" style="display:none" value=""/>
						<input id="inputSheetNum" style="display:none" value="8"/>
						<input id="outputSheetNum" style="display:none" value="12"/>
						
						<!-- 
						if (id = 0)，井底流压计算；if (id = 1)，单气相管网水力计算；if (id = 2)，单气相管网热力计算；if (id = 3)，气固两相管网水力计算；if (id = 4)，气液两相管网水力计算
						 -->
					</div>
					
					
					<div id="hydraulic_tab" class="tab-container">
						<ul class='etabs'>
						    <li class='tab'><a href="#input_tab">输入</a></li>
						    <li class='tab'><a href="#run_tab">运行</a></li>
						    <li class='tab'><a href="#output_tab">输出</a></li>					    
					    </ul>  
						<div id="input_tab"><!-- 节点数据 -->					
							<%@ include file="optimize_layout/input_tab.jsp" %>
			    		</div>
			    		<div id="run_tab"><!-- 节点数据 -->
							<%@ include file="optimize_common/run_tab.jsp" %>
			    		</div>
			    		<div id="output_tab"><!-- 节点数据 -->	
							<%@ include file="optimize_layout/output_tab.jsp" %>
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
	 
	<%@ include file="optimize_common/modal.jsp" %>
	<div id="isRunning" style="display:none;padding:90px 120px;width:400px;height:100px;border:10px solid;border-radius:10px;background-color:white;">
		<span>正在计算......</span>
	</div> 

		<script type="text/javascript">
	$('#load_modal').modal({
		     backdrop:'static',
		     keyboard:false,
		     show:true
		 });
	</script>		   
  </body>
  
</html>

	

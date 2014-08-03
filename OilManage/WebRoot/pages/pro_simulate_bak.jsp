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
	<script type="text/javascript" src="js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
	<script src="js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
	<script src="js/easytabs/jquery.easytabs.js" type="text/javascript"></script>
	<script src="js/jqueryPlug/jquery.mousewheel.min.js" type="text/javascript"></script>
	
	<!-- <script defer="defer" type="text/javascript" src="editor/lib/init2.js"></script> -->
	<script defer="defer" type="text/javascript" src="editor/lib/platform.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/leftpoly.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/Paintings.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/tools.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/kinecttab.js"></script>
	
	<link type='text/css' href='editor/assets/simplemodal/css/diagramo.css' rel='stylesheet' media='screen' />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/colorPicker_new.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
	<!-- <link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/processui.css" />  -->
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	<link rel="stylesheet" type="text/css" href="css/pro_simulate.css"/>
	
	<style type="text/css">
		body { font-family: "HelveticaNeue", "Helvetica-Neue", "Helvetica", "Arial", sans-serif;background: linear-gradient(45deg, #020031 0%, #6d3353 100%); }
		.big-link { display: block; margin-top: 100px; text-align: center; font-size: 70px; color: #06f; }
		#contextmenu {
			border: 1px solid #aaa;
			border-bottom: 0;
			background: #eee;
			position: absolute;
			list-style: none;
			margin: 0;
			padding: 0;
			display: none;
		}
																				   
		#contextmenu li a {
			display: block;
			padding: 10px;
			border-bottom: 1px solid #aaa;
			cursor: pointer;
		}
																				   
		#contextmenu li a:hover {
			background: #fff;
		}
		
		
		.etabs { margin: 0; padding: 0; }
		.tab { display: inline-block; zoom:1; *display:inline; background: #eee; border: solid 1px #999; border-bottom: none; -moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; }
		.tab a { font-size: 14px; line-height: 2em; display: block; padding: 0 10px; outline: none; }
		.tab a:hover { text-decoration: underline; }
		.tab.active { background: #fff; padding-top: 6px; position: relative; top: 1px; border-color: #666; }
		.tab a.active { font-weight: bold; }
		.tab-container .panel-container { background: #fff; border: solid #666 1px; padding: 10px; -moz-border-radius: 0 4px 4px 4px; -webkit-border-radius: 0 4px 4px 4px; }
	</style>

  </head>
    
  <body  style="background-color:#CCCCCC;" id="body"  onload="initLight();"><!-- background-image:url(images/background.jpg); -->
 

	<div id="head">
		    <%@ include file="commons/header.jsp" %>
	</div>  

	
	
	
	<div class="container-fluid" style="width:1100px;margin-top:55px;font-size:20px;">
		<div class="row-fluid">
			<div class="span12">
				<div class="tab-container" id="outer-container">
						 <ul class='etabs'>
						  <li class='tab'><a href="#nested-tab-1">井筒模拟</a></li>
						  <li class='tab'><a href="#nested-tab-2">管网模拟</a></li>						  
						 </ul>
						 <div class="panel-container">
						  <div id="nested-tab-1">						
						   <p>井筒模拟.</p>
						  </div>		
						  <div id="nested-tab-2">						  
							<div id="tab-side-container" style="width:100%;">
									 <ul style="background:#F1EAEA;height:auto">
									 	<li style="width:200px;"><a href="#side-tab1">单相管网水力计算</a></li>
									 	<li style="width:200px;"><a href="#side-tab2">单相管网热力计算</a></li>
									 	<li style="width:200px;"><a href="#side-tab3">气固两相管网计算</a></li>
									 	<li style="width:200px;"><a href="#side-tab4">气液两相管网计算</a></li>
									 	<li style="width:200px;"><a href="#side-tab5">自动计算</a></li>
									 </ul>		
									 <div class="panel-container"  >				
										<div id="side-tab1" style="margin-left:120px;">
									       <h2>单相管网水力计算</h2>
										   <div>
										   		<table id="RoleList" class="table table-striped table-bordered table-hover datatable " ></table>
									      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
									      			<div id="RolePager" ></div>
									      		</div>     
									     	 			  
									        </div>
										</div>
										<div id="side-tab2" style="margin-left:120px;">
									       <h2>单相管网热力计算</h2>
										   <div>
										   		<table id="UserList" class="table table-striped table-bordered table-hover datatable " ></table>
									      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
									      			<div id="UserPager" ></div>
									      		</div>      
									     	 			  
									        </div>
										</div>	
											<div id="side-tab3" style="margin-left:120px;">
									       <h2>气固两相管网计算</h2>
										   <div>
										   		<table id="UserList" class="table table-striped table-bordered table-hover datatable " ></table>
									      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
									      			<div id="UserPager" ></div>
									      		</div>      
									     	 			  
									        </div>
										</div>	
										<div id="side-tab4" style="margin-left:120px;">
									       <h2>气液两相管网计算</h2>
										   <div>
										   		<table id="UserList" class="table table-striped table-bordered table-hover datatable " ></table>
									      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
									      			<div id="UserPager" ></div>
									      		</div>      
									     	 			  
									        </div>
										</div>	
										<div id="side-tab5" style="margin-left:120px;">
									       <h2>自动计算</h2>
										   <div>
										   		<table id="UserList" class="table table-striped table-bordered table-hover datatable " ></table>
									      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
									      			<div id="UserPager" ></div>
									      		</div>      
									     	 			  
									        </div>
										</div>
										
									 </div>
								</div>
	   
						  	</div>
						  </div>
					 </div>
			</div>  
		</div>
	</div>
	    	  
		<hr class="featurette-divider">
      	<div id="footer">
	        <%@ include file="commons/footer.jsp" %>
	    </div>
	    
	

		
		  <script type="text/javascript">

				$('#outer-container, #tab-side-container').easytabs({
					 animate: false,
					  tabActiveClass: "selected-tab",
					  panelActiveClass: "displayed"
				});
		  </script>


  </body>
  
</html>




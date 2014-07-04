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
    
    <title>图形建模</title>
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
	
	<script defer="defer" type="text/javascript" src="editor/lib/init2.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/platform.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/leftpoly.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/Paintings.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/tools.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/kinecttab.js"></script>
	
	<link type='text/css' href='editor/assets/simplemodal/css/diagramo.css' rel='stylesheet' media='screen' />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/colorPicker_new.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/processui.css" /> 
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	  
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
	  <%-- <div class="navbar-wrapper" style="position:static">
	      <div class="container">
	        <div class="navbar navbar-inverse navbar-static-top" role="navigation">
	          <div class="container">
	            <div class="navbar-header">
	              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	              </button>
	              <a class="navbar-brand" href="#"><div style="font-color:#99CCFF;font-weight:bold;font-family:Georgia, serif;">煤层气集输系统后台管理</div></a>
	            </div>
	            <div class="navbar-collapse collapse">
	           		<ul class="nav navbar-nav">
		                <li><a href="pages/home.jsp">首页</a></li>
		                <li><a href="pages/map.jsp">地图建模</a></li>
		                <li><a href="pages/project.jsp">工程管理</a></li>
		                <li class="active"><a href="#">系统建模</a></li>
		                <li><a href="pages/home.jsp">系统优化</a></li>
				        <li><a href="pages/home.jsp">关于</a></li>
				        <li><a href="pages/home.jsp">联系方式</a></li>		               
	              	</ul>
	                
	               	<%if (userlogin!=null) {%>
				      <div class="text-center" style="margin-top:8px;margin-right:25px;" id="userId">
				      	<div style="margin-left:5px;margin-top:5px;"><a  style="margin-left:5px;margin-top:5px;float:right"id="exit" onclick="logout()">注销</a></div>	     
				        <div style="font-size:20;color:#FFFFFF;float:right">您好,<a href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%>！</a></div>
				      </div>
			       	<%}else{ %>
		        	 <div class="text-center" style="margin-top:8px;"><a  class="btn btn-default" href="pages/login.jsp">管理员登陆</a></div>
	            	<%} %>
              
	            </div>
	          </div>
	        </div>
	
	      </div>
	    </div> --%>
	 
		    
		    <!-- Carousel
	    ================================================== -->
	   <!--  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	      	Indicators
			<ol class="carousel-indicators">
			  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			  <li data-target="#myCarousel" data-slide-to="1"></li>
			  <li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
				  <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:地图建模" alt="地图建模">
				  <div class="container">
				    <div class="carousel-caption">
				      <h1>与GIS接口</h1> 
				      <p>与地理信息系统的接口，提供地图呈现和实际管网展现功能。</p>
				      <p></p>
				      <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
				    </div>
				  </div>
				</div>
				<div class="item">
				  <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:地图建模" alt="地图建模">
				  <div class="container">
				    <div class="carousel-caption">
				       <h1>与3D地形接口</h1>
				      <p>与3D地形呈现系统的接口，提供数字三维地图的展示。</p>
				      <p></p>
				       <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
				    </div>
				  </div>
				</div>
		        <div class="item">
		          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:地图建模" alt="地图建模">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1>与现场数据接口</h1>
		              <p>与现场采集数据的接口。</p>
		              <p></p>
		               <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
		            </div>
		          </div>
		        </div>
	      </div>
	      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>/.carousel
 -->
    	 <!-- Marketing messaging and featurettes
	    ================================================== -->
	    <!-- Wrap the rest of the page in another container to center all the content. -->
	    
		<div class="container marketing condiv" style="width:1200px;margin-top:55px;">
	    	
	    	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
					
					
						<div id="header">
							<span> <img src="" /> </span>
						</div>
					
						<div id="actions">
					
							<a href="javascript:createNewModal();"
								title="新建">
								<img
								src="editor/icons/sign_add.png" border="0" />
							</a> 
							<img class="separator" src="editor/assets/images/toolbar_separator.gif"
								border="0" width="1" height="16" /> <a
								href="javascript:listGUIProGrid();"
								title="打开">
								<img
								src="editor/icons/folder.png" border="0" />
							</a> <img class="separator" src="editor/assets/images/toolbar_separator.gif"
								border="0" width="1" height="16" /> <a
								href="javascript:save();"
								title="保存"><img
								src="editor/icons/save_labled.png" border="0"
								alt="Organic" />
							</a> <img class="separator" src="editor/assets/images/toolbar_separator.gif"
								border="0" width="1" height="16" /> <a
								href="javascript:scaleCenter(1.25);"
								title="放大画布"><img
								src="editor/icons/arrow_expand.png" border="0" alt="Container" />
							</a> 
							<img class="separator" src="editor/assets/images/toolbar_separator.gif"
								border="0" width="1" height="16" /> <a
								href="javascript:scaleCenter(0.8);"
								title="缩小画布"><img
								src="editor/icons/arrow_contract.png" border="0" alt="Container" />
							</a> 
							<img class="separator" src="editor/assets/images/toolbar_separator.gif"
								border="0" width="1" height="16" /> <input type="checkbox" checked=true
								onclick="showGrid();" id="gridCheckbox" title="Show grid" /> <span
								class="toolbarText">Show grid</span> <img class="separator"
								src="editor/assets/images/toolbar_separator.gif" border="0" width="1"
								height="16" /> <input type="checkbox" onclick="snapToGrid();"
								id="snapCheckbox" title="Snap elements to grid" /> <span
								class="toolbarText">Snap to grid</span> <img class="separator"
								src="editor/assets/images/toolbar_separator.gif" border="0" width="1"
								height="16" /> <a href="javascript:action('front');"
								title="Move to front"><img src="editor/assets/images/icon_front.gif"
								border="0" />
							</a> <img class="separator" src="editor/assets/images/toolbar_separator.gif"
								border="0" width="1" height="16" /> <a
								href="javascript:action('back');" title="Move to back"><img
								src="editor/assets/images/icon_back.gif" border="0" />
							</a> <img class="separator" src="editor/assets/images/toolbar_separator.gif"
								border="0" width="1" height="16" /> <a
								href="javascript:action('moveforward');"
								title="Move (one level) to front"><img
								src="editor/assets/images/icon_forward.gif" border="0" />
							</a>
						</div>
						
						<div id="editor" style="background-color:#F6F6F6">
							<input id="selectedID" style="display: none;"/> 
							<div id="tab-container" class="tab-container"  style="position: absolute;z-index:100;margin-left:120px;margin-top:2px;">
							  <ul id="paintingTabs" class='etabs'>
							    <!--
							    <li class='tab'><a href="#tabs1-html">HTML Markup</a></li>
							    <li class='tab'><a href="#tabs1-js">Required JS</a></li>
							    <li class='tab'><a href="#tabs1-css">Example CSS</a></li>  
							    -->
							    
							  </ul>
							</div>
						
							<div id="container">
							
							</div>
						<!-- 	<div id="output" style="margin-top:-270px;margin-left:115px;border:solid;width:900px;height:250px;">

							</div>  -->
						<!-- 	<div id="output" style="margin-top:-270px;margin-left:115px;border:solid;width:900px;height:250px;">
								<textarea cols="108" rows="11" id="outputarea" name="outputarea" disabled="">
								输出testtesttestetsdtgffgfdgfhgdfjhdgjhjhggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
								</textarea>
							</div>  -->
					</div>
					
					<!--The import panel-->
					<div id="import-dialog"
						style="background-color: white; display: none; margin-top: auto; margin-bottom: auto;">
						<form action="./common/controller.php" method="POST"
							enctype="multipart/form-data">
							<input type="hidden" name="action" value="importDiagramExe" />
							<h2>Import Diagramo file</h2>
							<p />
							<input type="file" name="diagramFile" id="diagramFile" />
							<p />
							<input type="image" src="editor/assets/images/import.gif" />
						</form>
					</div>
							
					<!--Insert Image dialog content-->
					<div id="insert-image-dialog">
						<h2>Insert Image</h2>
						<form action="editor/common/controller.php" method="POST"
							target="upload_target" enctype="multipart/form-data">
							<input type="hidden" name="action" value="insertImage" />
							<div class="insert-image-line">
								<input type="radio" name="image-group" value="URL" checked>
								<label>From URL:</label> <input type="text" class="url-input"
									name="imageURL" id="imageURL" />
							</div>
							<div class="insert-image-line">
								<input type="radio" name="image-group" value="Upload"> <label>Upload:</label>
								<input type="file" class="right-offset" name="imageFile"
									id="imageFile" />
							</div>
							<div class="insert-image-line">
								<input type="radio" name="image-group" value="Reuse"
									id="insert-image-reuse-group"> <label>Reuse:</label> <select
									id="insert-image-reuse" name="reuseImageFile">
								</select>
							</div>
							<div id="upload-image-error"></div>
							<div class="submit-container">
								<input type="submit" value="Insert" />
							</div>
						</form>
					</div>		
					
					<!--Insert Image hidden iframe-->
					<iframe id="upload_target" name="upload_target"
						style="width:0;height:0;border:0px;"></iframe>
									
										
					</div>
				</div>
			</div> 
	    </div><!-- /.container -->		
		<hr class="featurette-divider">
      	<div id="footer">
	        <%@ include file="commons/footer.jsp" %>
	    </div>
	    
		<ul id="contextmenu" style="display:none;z-index:100">	
			<li><a>解除锁定</a></li>
			<li><a>顺时针旋转90°</a></li>
			<li><a>逆时针旋转90°</a></li>	
			<!--<li><a>更改颜色</a></li>
			<li><a>放大</a></li>
			<li><a>缩小</a></li>	-->		
			<li><a>删除该节点</a></li>
			<li><a>属性</a></li>
			<li><a>进入站点</a></li>
	    </ul>
	    <!-- 属性框 -->
		<div id="pointPra"  style=" display: none;z-index:100;position:absolute">
			<div id="pointPraClose" ><span style="font-size:25px;float:right;width:20px;align:center;margin-top:-30px;" onclick="closePraList()">x</span></div>
			<table id="PointPraList" class="table table-striped table-bordered table-hover datatable " >
			</table>
	   		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:700" >
				<div id="PointPraPager" ></div>
			</div>		
		</div>

		
		<!-- 新建图形项目的模态框 -->   	
		<div class="modal fade" id="add_GUI_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" id="add_GUI_modal_close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">新建项目</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addGUIForm" action="addGUIPro.action" method="post"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table">		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >名称:</label></td>
				            <td><input id="proname" type="text" class="input2" name="proname"/><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >描述：</label></td>
		      				<td><input id="description" type="text" class="input2" name="description" /></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >类型：</label></td>
		      				<td><input id="type" type="text" class="input2" name="type" /></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">作者：</label></td>
			        		<td><select id="authorID" name="authorID"></select><em style="color:red">*</em></td>   						
		      			</tr>
		      				    				
				   </table>
				   <div class="modal-footer">
				       <!--  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
				        <button type="submit" class="btn btn-primary"  >保存</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
					
    		<!-- 查看图形项目列表的模态框 -->   	
		<div class="modal fade" id="listGUIPro_modal">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:1070">
		      <div class="modal-header">
		        <button type="button" id="listGUIPro_modal_close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		       <!--  <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看输入</h4> -->
		      </div>
		      <div class="modal-body">  
		      	<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<table id="GUIProList" class="table table-striped table-bordered table-hover datatable " ></table>
				      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1000" >
				      			<div id="GUIProPager" ></div>
				      		</div>	      		
						</div>
					</div>
				</div>  
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
				<!--载入选择框 -->  
		<div class="modal fade" id="load_modal" ><!-- width="155" style="margin: 250px 200 0 -280px;" -->
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">选择操作</h4>
		      </div>
		      <div class="modal-body">
		      	
		     	 <img src="editor/icons/new.gif"  style="margin-left:95px;margin-bottom:20px;" alt="" onclick="clickLoad(1);"  title="新建工程" />
		     	 <img src="editor/icons/open.gif" style="margin-left:100px;" alt="" onclick="clickLoad(2);" title="打开工程" />
		     	
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
				
		<script type="text/javascript">
		
			$('#listGUIPro_modal>.modal-dialog').css({
			 'margin-top': function () {
			            return ($(window).height())/2-178;
			        },
			 'margin-right':function () {
			            return ($(window).width())/2-50;
			        },
			});
			
			$('#load_modal>.modal-dialog').css({
			 'margin-top': function () {
			            return ($(window).height())/2-123;
			        },
			 'margin-right':function () {
			            return ($(window).width())/2-300;
			        },
			});
			$(function(){
				$('#tab-container').easytabs();			
			});
			function loadFill(check) {
				if (check.checked === true) {
					if ($('#colorpickerHolder3').css('display') === 'none') {
						$('#colorSelector3').click();
					}
				} else {
					if ($('#colorpickerHolder3').css('display') === 'block') {
						$('#colorSelector3').click();
					}
				}
			}
			function closePraList(){
				$("#pointPra").hide();
	
			}
	 	
	 	
		</script>
  </body>
  
</html>




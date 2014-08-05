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
	
	<script defer="defer" type="text/javascript" src="editor/lib/init2.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/platform.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/leftpoly.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/Paintings.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/tools.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/kinecttab.js"></script>

		
	<script defer="defer" type="text/javascript" src="js/simulate_hydraulic.js"></script>
	<script defer="defer" type="text/javascript" src="js/diagram.js"></script>
	
	<link type='text/css' href='editor/assets/simplemodal/css/diagramo.css' rel='stylesheet' media='screen' />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/colorPicker_new.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
	<!-- <link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/processui.css" />  -->
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>	

	<link rel="stylesheet" type="text/css" href="css/diagram.css"/>	
		
	<link rel="stylesheet" type="text/css" href="css/simulate_hydraulic.css"/>
	<style type="text/css">
	/* 	body { font-family: "HelveticaNeue", "Helvetica-Neue", "Helvetica", "Arial", sans-serif;background: linear-gradient(45deg, #020031 0%, #6d3353 100%); }
	 */
	</style>

  </head>
    
  
  <body  id="body"  onload="initLight();">

	<div id="head">
		    <%@ include file="commons/header.jsp" %>
	</div>  
		<div class="container marketing condiv" style="width:1200px;margin-top:55px;">
	    	
	    	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
					<div class="page-header">
						<h1>气固两相管网计算&nbsp;</h1>
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
						<!-- 	<a id="pop" onclick="">输入</a>
							<input id="pop" style="margin-left: 300px;" type="button" value="输入">
							 -->
						</div>
						
						<div class="nav_control navbar-collapse collapse">
							<ul  class="nav navbar-nav">
								<li class="dropdown-submenu">
				                    <button tabindex="-1" >输入</button>
				                    <ul class="dropdown-menu">
				                        <li><a tabindex="-1" href="javascript:showLiquidPra();">流体参数</a>
				                        <li><a tabindex="-1" href="javascript:showBasicData();">基础数据</a></li>			                        
				                    </ul>
				                </li>
				                <li>
				                    <button tabindex="-1" href="javascript:runSimulator();">运行</button>			                 
				                </li>
				                <li>
				                    <button tabindex="-1" href="javascript:showOutput();">输出</button>			                 
				                </li>
				             </ul>
			            </div>  
			              	
						<div id="editor" style="background-color:#F6F6F6">
							<input id="selectedID" style="display: none;"/> 
							<div id="tab-container" class="tab-container"  style="position: absolute;z-index:100;margin-left:120px;margin-top:2px;">
							  <ul id="paintingTabs" class='etabs'>
				
							  </ul>
							</div>
						
							<div id="container">
							
							</div>		
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
	    </div>
		<hr class="featurette-divider">
		
	
	    	  
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
		
		
		
		
		<!-- 输入流体参数弹出框 -->
		<div id="popdiv_liquidpra" class="popdiv" style="display:none;padding:10px 20px 20px;">
			<a id="close_liquidpra" class="close">x</a>
		
			
			<div class="row-fluid">
				<div class="span12">
					<form id="form1" runat="server">
					<div class="row-fluid">
						<div class="span6" style="float:left">
							 <div id="left">
						        <select multiple="multiple" id="select1" style="width:100px;height:160px">
							        <option>CH4</option>
							        <option>C2H6</option>
							        <option>C3H8</option>
							        <option>i-C4H10</option>
							        <option>n-C4H10</option>
							        <option>i-C5H12</option>
							        <option>n-C5H12</option>
							        <option>n-C6H14</option>
							        <option>n-C7H16</option>
							        <option>n-C8H18</option>
							        <option>n-C9H20</option>
							        <option>n-C10H22</option>
							        <option>C11</option>
							        <option>C12</option>
							        <option>C13</option>
							        <option>C14</option>
							        <option>C15</option>
							        <option>C2H4</option>
							        <option>C3H6</option>
							        <option>H2S</option>
							        <option>SO2</option>
							        <option>N2</option>
							        <option>CO2</option>
							        <option>Kr</option>
							        <option>Xe</option>
						        </select>
						    </div>
						</div>
						<div  style="float:left;margin-top:40px;padding-left:5px;padding-right:5px;">
					   		<button id="add" type="button" class="btn btn-small">添加</button><br />
					   		<button style="margin-top:5px;" id="remove" type="button" class="btn btn-small">删除</button>
					   	</div>
						<div class="span6" style="float:left">
							 <div id="right">
						        <select multiple="multiple" id="select2" style="width:100px;height:160px"></select>
						    </div>
						</div>
						<div style="float:left;margin-top:100px;padding-left:5px;">	
							<span>Total:</span><span>1</span>							
							<button type="button" type="button" class="btn btn-small">保存</button>
						</div>
					</div>		
				</form>
					
					
				<div class="row-fluid">
					<div class="span8" style="float:left;margin-top:20px;">
						<table>
							<tr><td>气体动力粘度</td><td><input/></td><td>Pa.s</td></tr>
							<tr><td>环境温度</td><td><input/></td><td>k</td></tr>
						</table>
					</div>
					<div class="span4" style="float:left;margin-top:30px;padding-left:5px;">
						<button  type="button" type="button" class="btn btn-small">保存</button>
					</div>
				</div> 
					
				</div>
			</div>
			
			
		</div>
		
		<!-- 输入基础数据弹出框 -->
		<div id="popdiv_basicdata" class="popdiv" style="display:none">
			<a id="close_basicdata" class="close">关闭</a>
			
			<div id="basedata_tab" class="tab-container">
			  <ul class='etabs'>
			    <li class='tab'><a href="#basedata_tabs1">节点数据</a></li>
			    <li class='tab'><a href="#basedata_tabs2">管段数据</a></li>
			    <li class='tab'><a href="#basedata_tabs3">离心压缩机</a></li>
			    <li class='tab'><a href="#basedata_tabs4">往复式压缩机</a></li>
			  </ul>
			  <div id="basedata_tabs1"><!-- 节点数据 -->
			    
			    <div class="container-fluid">
					<div class="row-fluid">
					<button class="btn" type="button" style="float:left">导入Excel</button>
						<div class="span12">
							<table class="table  table-striped">
								<thead>
									<tr>
										<th>序号</th><th>节点名称</th><th>坐标x(m)</th><th>坐标y(m)</th>
										<th>坐标z(m)</th><th>节点压力(MPa)</th><th>节点流量(Mm3/d)</th><th>控制模式</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td>
									</tr>
									<tr class="success">
										<td>1</td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td>
									</tr>
									<tr class="error">
										<td>1</td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td>
									</tr>
									<tr class="warning">
										<td>1</td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td>
									</tr>
									<tr class="info">
										<td>1</td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td>
									</tr>
								</tbody>
							</table> 
							
						</div>
						<div style="margin-bottom:20px;">
						<button class="btn" type="button">保存</button>
						</div>
					</div>
				</div>
			    
			    
			    <!-- content -->
			  </div>
			  
			  <div id="basedata_tabs2"><!-- 管段数据 -->
			    
			    <div class="container-fluid">
					<div class="row-fluid">
					<button class="btn" type="button" style="float:left">导入Excel</button>
						<div class="span12">
							<table class="table  table-striped">
								<thead>
									<tr>
										<th>序号</th><th>管段名称</th><th>类型</th><th>上游节点</th>
										<th>下游节点</th><th>管长(km)</th><th>管内径(m)</th><th>绝对粗糙度(m)</th>
										<th>摩阻系数公式</th><th>压缩机名称</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td><td></td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr class="success">
										<td>1</td><td></td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr class="error">
										<td>1</td><td></td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr class="warning">
										<td>1</td><td></td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td><td></td>										
									</tr>
									<tr class="info">
										<td>1</td><td></td><td></td><td></td><td></td>
										<td></td><td></td><td></td><td></td><td></td>										
									</tr>
								</tbody>
							</table> <button class="btn" type="button">保存</button>
						</div>
					</div>
				</div>

			    <!-- content -->
			  </div>
			  
			  <div id="basedata_tabs3"><!-- 离心压缩机 -->
			    
			    <div class="container-fluid">
					<div class="row-fluid">
					<button class="btn" type="button" style="float:left">导入Excel</button>
						<div class="span12">
							<table class="table  table-striped">
								<thead>
									<tr>
										<th>
											序号
										</th>
										<th>
											名称
										</th>
										<th>
											a
										</th>
										<th>
											b
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr class="success">
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr class="error">
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr class="warning">
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr class="info">
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table> <button class="btn" type="button">保存</button>
						</div>
					</div>
				</div>
			    
			    <!-- content -->
			  </div>
			  <div id="basedata_tabs4">
			    
			    <div class="container-fluid">
					<div class="row-fluid">
					<button class="btn" type="button" style="float:left">导入Excel</button>
						<div class="span12">
							<table class="table  table-striped">
								<thead>
									<tr>
										<th>
											编号
										</th>
										<th>
											产品
										</th>
										<th>
											交付时间
										</th>
										<th>
											状态
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Default
										</td>
									</tr>
									<tr class="success">
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Approved
										</td>
									</tr>
									<tr class="error">
										<td>
											2
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											02/04/2012
										</td>
										<td>
											Declined
										</td>
									</tr>
									<tr class="warning">
										<td>
											3
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											03/04/2012
										</td>
										<td>
											Pending
										</td>
									</tr>
									<tr class="info">
										<td>
											4
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											04/04/2012
										</td>
										<td>
											Call in to confirm
										</td>
									</tr>
								</tbody>
							</table> <button class="btn" type="button">保存</button>
						</div>
					</div>
				</div>
			    
			    <!-- content -->
			  </div>
			  
			</div>
			
		</div>
		
	
		
		<script type="text/javascript">
		$().ready(function(){
			$('#basedata_tab').easytabs();
			}	
		);
			 
		
		
		</script>
		   
  </body>
  
</html>

	

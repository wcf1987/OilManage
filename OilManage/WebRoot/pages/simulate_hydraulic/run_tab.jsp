<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<div id="running-container" >
	<div style="padding-left:2px;background-color:#ccc">运行控制台</div>
	<textarea cols="111" rows="6" id="outputarea" name="outputarea" disabled="">
	输出testtesttestetsdtgffgfdgfhgdfjhdgjhjhggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
	</textarea>
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
<iframe id="upload_target" name="upload_target" style="width:0;height:0;border:0px;"></iframe>


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
<style>
#running-container { border:2px solid;width: 100%;height:206px;; padding: 0; clear: both; background-color:white}
</style>
<!-- 新建图形项目的模态框 -->
		<!--    	
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
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >保存</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div>/.modal-content
		  </div>/.modal-dialog
		</div>/.modal -->
		
					
    		<!-- 查看图形项目列表的模态框 -->   	
		<!-- <div class="modal fade" id="listGUIPro_modal">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:1070">
		      <div class="modal-header">
		        <button type="button" id="listGUIPro_modal_close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看输入</h4>
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
		     
		    </div>/.modal-content
		  </div>/.modal-dialog
		</div>/.modal -->

		
<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>



<div id="running-container" >
	<div><span>运行输出台</span><button onclick="loadOutput(0)">查看输出</button></div>
	<textarea  id="outputarea" name="outputarea" disabled="">
	</textarea>
</div>

  
<div id="actions">					
	<!-- <a href="javascript:createNewModal();" title="新建">
		<img src="editor/icons/sign_add.png" border="0" />
	</a> --> 
	<img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
	<a href="javascript:listGUIProGrid();" title="载入">
		<img src="editor/icons/folder.png" border="0" />
	</a> 
	<!-- <img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
	<a href="javascript:save();" title="保存">	
		<img src="editor/icons/save_labled.png" border="0" alt="Organic" />
	</a>  -->
	<img class="separator" src="editor/assets/images/toolbar_separator.gif"	border="0" width="1" height="16" /> 
	<a href="javascript:scaleCenter(1.25);" title="放大画布">
		<img src="editor/icons/arrow_expand.png" border="0" alt="Container" />
	</a> 
	<img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
	<a href="javascript:scaleCenter(0.8);" title="缩小画布">
		<img src="editor/icons/arrow_contract.png" border="0" alt="Container" />
	</a> 
	<img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
		<input type="checkbox" checked=true onclick="showGrid();" id="gridCheckbox" title="Show grid" />
		<span class="toolbarText">Show grid</span> 
	<img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
		<input type="checkbox" onclick="snapToGrid();" id="snapCheckbox" title="Snap elements to grid" /> 
		<span class="toolbarText">Snap to grid</span> 
	<img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
	<a href="javascript:action('front');" title="Move to front">
		<img src="editor/assets/images/icon_front.gif" border="0" />
	</a> 
	<img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
	<a href="javascript:action('back');" title="Move to back">
		<img src="editor/assets/images/icon_back.gif" border="0" />
	</a>
	<img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
	<a href="javascript:action('moveforward');" title="Move (one level) to front">
		<img src="editor/assets/images/icon_forward.gif" border="0" />
	</a>
	<img class="separator" src="editor/assets/images/toolbar_separator.gif" border="0" width="1" height="16" /> 
	<a href="javascript:changeGIS();" title="切换画布">
		<img src="editor/icons/changeGIS.jpg" border="0" alt="Container" />
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
<div id="simulate_gismap" style="display:none">
 <%@ include file="gismap.jsp" %> 
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
	<li><a>管道图示</a></li>
	<li><a>进入站点</a></li>
   </ul>
   <!-- 属性框 -->
<div id="pointPra"  style=" display: none;z-index:100;position:absolute">
	<div id="pointPraClose" ><span style="font-size:25px;float:right;width:20px;align:center;margin-top:-30px;" onclick="closePraList()">x</span></div>
	<table id="PointPraList" class="table table-striped table-bordered table-hover datatable " >
	</table>
  		<div>
		<div id="PointPraPager" ></div>
	</div>		
</div>

<div id="PipePra"  style=" display: none;z-index:100;position:absolute">
	<div id="PipePraClose" >
	<span style="font-size:25px;float:right;width:20px;align:center;margin-top:-30px;" onclick="closePipeList()">x</span>
	</div>
<div id="pipecontainer" class="tab-container">
  <ul class='etabs'>
    <li class='tab'><a href="#tabs1-Pipe1">参数表</a></li>
    <li class='tab'><a href="#tabs1-Pipe2">分布图</a></li>   
  </ul>
  <div id="tabs1-Pipe1">
   <table id="PipePraList" class="table table-striped table-bordered table-hover datatable " >
	</table>
  	<div>
		<div id="PipePraPager" ></div>
	</div>	
  </div>
  <div id="tabs1-Pipe2">
    <div id="graphiDraw" style="width:100%; height:auto;margin-left:200px;"></div> 	
    content
  </div>
  </div>	
</div>

<script>
$('#pipecontainer').easytabs({
	animate: false
	 }); 
function changeGIS(){
	var diagramo_show=$("#editor").css('display');
	var gis_show=$("#simulate_gismap").css('display');
	if(diagramo_show=='none'){
		$("#editor").css({'display':'block'});
		$("#simulate_gismap").css({'display':'none'});
	}else if(gis_show=='none'){
		$("#simulate_gismap").css({'display':'block'});
		$("#editor").css({'display':'none'});
	}
}

/* $('#father_tab').easytabs({
	animate: false
}); */
</script>
<style>
	#running-container { border:2px solid;width: 100%;height:206px;; padding: 0; clear: both; background-color:white}
	#running-container>div{
		padding:5px 5px;background-color:#fff;font-size:12px;font-weight:bold
	}
	#running-container>div>span{
		background-color:#fff;
		border-radius:3px;
		border:2px solid;
		padding:2px;
		margin-right:5px;
	}
	textarea{
		width:100%;
		font-size:14px;
		height:85%;
	}
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

		
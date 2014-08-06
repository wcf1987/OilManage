
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
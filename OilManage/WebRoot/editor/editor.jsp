<!DOCTYPE html>
<html>
<!--Copyright 2010 Scriptoid s.r.l-->
<head>
<title>HTML5 diagram editor</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<script type="text/javascript" src="./lib/kinetic-v5.1.0.min.js"></script>

<link rel="stylesheet" media="screen" type="text/css"
	href="./assets/css/style.css" />
<link rel="stylesheet" media="screen" type="text/css"
	href="./assets/css/minimap.css" />

<script type="text/javascript" src="./assets/javascript/json2.js"></script>
<script type="text/javascript"
	src="./assets/javascript/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="./assets/javascript/ajaxfileupload.js"></script>

<link type='text/css' href='./assets/simplemodal/css/diagramo.css'
	rel='stylesheet' media='screen' />




<link rel="stylesheet" media="screen" type="text/css"
	href="./assets/css/colorPicker_new.css" />


<!--[if IE]>
        <script src="./assets/javascript/excanvas.js"></script>
        <![endif]-->

</head>
<body onload="initLight('');" id="body">

	<div id="header">
		<span> <img src="./assets/images/logo_36h_full.png" /> </span>
	</div>

	<div id="actions">

		<a href="javascript:action('connector-straight');"
			title="Straight connector"><img
			src="assets/images/icon_connector_straight.gif" border="0" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('connector-jagged');"
			title="Jagged connector"><img
			src="assets/images/icon_connector_jagged.gif" border="0" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('connector-organic');"
			title="Organic connector (Experimental)"><img
			src="assets/images/icon_connector_organic.gif" border="0"
			alt="Organic" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('container');"
			title="Container (Experimental)"><img
			src="assets/images/container.png" border="0" alt="Container" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <input type="checkbox"
			onclick="showGrid();" id="gridCheckbox" title="Show grid" /> <span
			class="toolbarText">Show grid</span> <img class="separator"
			src="assets/images/toolbar_separator.gif" border="0" width="1"
			height="16" /> <input type="checkbox" onclick="snapToGrid();"
			id="snapCheckbox" title="Snap elements to grid" /> <span
			class="toolbarText">Snap to grid</span> <img class="separator"
			src="assets/images/toolbar_separator.gif" border="0" width="1"
			height="16" /> <a href="javascript:action('front');"
			title="Move to front"><img src="assets/images/icon_front.gif"
			border="0" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('back');" title="Move to back"><img
			src="assets/images/icon_back.gif" border="0" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('moveforward');"
			title="Move (one level) to front"><img
			src="assets/images/icon_forward.gif" border="0" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('moveback');" title="Move (one level) back"><img
			src="assets/images/icon_backward.gif" border="0" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('group');" title="Group (Ctrl-G)"><img
			src="assets/images/group.gif" border="0" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('ungroup');" title="Ungroup (Ctrl-U)"><img
			src="assets/images/ungroup.gif" border="0" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:createFigure(figure_Text);" title="Add text"><img
			src="assets/images/text.gif" border="0" height="16" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:showInsertImageDialog();" title="Add image"><img
			src="/editor/assets/images/image.gif" border="0" height="16"
			alt="Image" />
		</a> <img class="separator" src="assets/images/toolbar_separator.gif"
			border="0" width="1" height="16" /> <a
			href="javascript:action('undo');" title="Undo (Ctrl-Z)"><img
			src="assets/images/arrow_undo.png" border="0" />
		</a>
		<!-- TODO: From Janis: we have to create a nice icon for duplicate, currently this is the only command without an icon -->
		<!--
            <a href="javascript:action('duplicate');">Copy (Ctrl-D)</a>
            -->

		<!-- <a href="javascript:action('redo');" title="Redo (Ctrl-Y)"><img src="assets/images/arrow_redo.png" border="0"/></a> -->
		<!--
            <input type="text" id="output" />                
            <img style="vertical-align:middle;" src="../assets/images/toolbar_separator.gif" border="0" width="1" height="16"/>
            <a href="javascript:action('duplicate');">Copy</a>
            <img style="vertical-align:middle;" src="../assets/images/toolbar_separator.gif" border="0" width="1" height="16"/>
            <a href="javascript:action('group');">Group</a>
            <img style="vertical-align:middle;" src="../assets/images/toolbar_separator.gif" border="0" width="1" height="16"/>
            <a href="javascript:action('ungroup');">Ungroup</a>
            -->
	</div>


	<div id="editor">
		
		

		

		
			<div id="container">
				<script defer="defer" type="text/javascript" src="./lib/init.js"></script>
			</div>
	

		<!--Right panel-->
		<div id="right">
			<center>
				<div id="minimap"></div>
			</center>
			<div style="overflow: scroll;" id="edit"></div>
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
			<input type="image" src="./assets/images/import.gif" />
		</form>
	</div>

	<!--Insert Image dialog content-->
	<div id="insert-image-dialog">
		<h2>Insert Image</h2>
		<form action="./common/controller.php" method="POST"
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

	<script type="text/javascript">
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
	</script>
	<br />
	<? //require_once dirname(__FILE__) . '/common/analytics.php';?>
</body>
</html>

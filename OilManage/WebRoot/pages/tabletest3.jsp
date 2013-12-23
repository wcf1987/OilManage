<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My First jqGrid</title>
 
<link rel="stylesheet" type="text/css" media="screen" href="../js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../js/jqGrid/css/ui.jqgrid.css" />
 
<style>
html, body {
margin: 0;
padding: 0;
font-size: 75%;
}
</style>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="../js/jqGrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
 
<script type="text/javascript">
 
$(document).ready(
function() {
	jQuery("#list2").jqGrid({
		url:"testData.action",//后端的数据交互程序，改为你的
		datatype: "json",//前后交互的格式是json数据
		mtype: 'GET',//交互的方式是发送httpget请求
		colNames:['teacher_name','organization_name'],//表格的列名
		colModel:[
		{name:'teacher_name',index:'teacher_name', width:200,editable:true,editoptions:{size:10}},//每一列的具体信息，index是索引名，当需要排序时，会传这个参数给后端
		{name:'organization_name',index:'organization_name', width:200,align:"right",editable:true,editoptions:{size:10}}
		
		],
		rowNum:10,//每一页的行数
		height: 'auto',
		rowList:[10,20,30],
		pager: '#pager2',
		sortname: 'id',
		viewrecords: true,
		sortorder: "desc",
		jsonReader: {//读取后端json数据的格式
		root: "aaData",//保存详细记录的名称
		//total: "total",//总共有页
		//page: "page",//当前是哪一页
		records: "records",//总共记录数
		repeatitems: false
		},
		caption: "My jqgrid test",//表格名称
		editurl:"tableDelete.action"
	});
	
	jQuery("#list2").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});
 	
 	$("#deldata").click(function(){
		var gr = jQuery("#list2").jqGrid('getGridParam','selarrrow');
		if( gr != null ) jQuery("#list2").jqGrid('delGridRow',gr,{
			reloadAfterSubmit:false,
			url:"tableDelete.action"
			});
		else alert("Please Select Row to delete!");
	});
	
	$("#editdata").click(function(){
		var gr = jQuery("#list2").jqGrid('getGridParam','selrow');
		if( gr != null ) jQuery("#list2").jqGrid('editGridRow',gr,{
			height:280,reloadAfterSubmit:false,
			url:"tableEdit.action"
			});
		else alert("Please Select Row");
	});
	

});
</script>
 
</head>
<body>
 <table id="list2"></table>
 <div id="pager2"></div>
 <input type="button" id="editdata" value="编辑"/>
 <input type="button" id="deldata" value="删除" />
</body>
</html>
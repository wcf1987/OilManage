
$(
	
		
	function() {

	/*
	 * 算法管理列表
	 */
	var datagrid = jQuery("#ProjectList")
	.jqGrid(
			{
				url : "listAlgPro.action",// 后端的数据交互程序，改为你的
				datatype : "json",// 前后交互的格式是json数据
				mtype : 'POST',// 交互的方式是发送httpget请求						
				colNames : [ '编号', '名称', '描述','作者','添加时间','最后运行时间','历史运行次数','设置',],// 表格的列名
				colModel : [
						{
							name : 'ID',
							index : 'ID',
							width : 50,
							align : "center",
							sortable:true,
							sorttype:'int'
						},// 每一列的具体信息，index是索引名，当需要排序时，会传这个参数给后端
						{
							name : 'name',
							index : 'name',
							width : 100,
							align : "center",
							sortable:true
						},
						{
							name : 'description',
							index : 'Description',
							width : 100,
							align : "center",
							sortable:true
						},
						{
							name : 'author',
							index : 'Author',
							width : 100,
							align : "center",
							sortable:true
						},
						{
							name : 'addTimes',
							index : 'AddTimes',
							width : 100,
							align : "center",
							sortable:true
						},
						{
							name:'lastCalcTimes',
							index:'LastCalcTimes',
							width:100,
							align:'center',
							sortable:true
						},
						{
							name:'calcHisNum',
							index:'CalcHisNum',
							width:100,
							align:'center',
							sortable:true
						},
						{
							name:'set',
							index:'set',
							width:200,
							align:'center',
							sortable:false,
							formatter : function(value, grid, rows,state) {
								return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"viewAlgorithmInput('"
										+ rows.ID + "')\">设置</a>"
							}
						}
						],
//				autowidth:true,
				rowNum:10,//每一页的行数
				height: 'auto',
				width:1230,
				rowList:[10,20,30],
				pager: '#ProjectPager',
				sortname: 'ID',
				viewrecords: true,
				sortorder: "desc",
				multiselect: true,  //可多选，出现多选框 
			    multiselectWidth: 35, //设置多选列宽度 
				jsonReader: {//读取后端json数据的格式
					root: "dataList",//保存详细记录的名称
					total: "total",//总共有多少页
					page: "page",//当前是哪一页
					records: "records",//总共记录数
					repeatitems: false
				},
				caption: "工程管理"//表格名称
				
			});
//	datagrid.jqGrid('hideCol','ID');
//	datagrid.jqGrid('filterToolbar',{searchOperators:true});
	datagrid.jqGrid('navGrid','#ProjectPager',{
		edit : false,
		add : false,
		search:false,
		del : false}).jqGrid('navButtonAdd',"#ProjectPager",{
				title:'添加',
				caption:"添加",
				id:"add_ProjectList",
				onClickButton : function addModal(){
					// 配置对话框

						$('#add_project_modal').modal();
				
				},
				position:"first"
			
		
			}).jqGrid('navButtonAdd',"#ProjectPager",{
				title:'删除',
				caption:"删除",	
				id:"delete_ProjectList",
				onClickButton:deleteProject,
				position:"first"
			});
	
}//function结束
);//$()结束

function deleteProject() {
    var sels = $("#ProjectList").jqGrid('getGridParam','selarrrow'); 
    if(sels==""){ 
       //$().message("请选择要删除的项！"); 
       alert("请选择要删除的项!");
    }else{ 
    	var selectedIDs={};
    	$.each(sels,function(i,n){ 
          if(sels[i]!=""){ 
        	  var rowData = $("#ProjectList").jqGrid("getRowData", sels[i]);
        	  selectedIDs["ids[" + i + "]"]=rowData.ID;
//        	  alert(rowData.ID);
          } 
    	}); 

       if(confirm("您是否确认删除？")){ 
        $.ajax({ 
          type: "POST", 
          url: "delAlgPro.action", 
          data: selectedIDs, 
          beforeSend: function() { 
               $().message("正在请求..."); 
          }, 
          error:function(){ 
               $().message("请求失败..."); 
          }, 
          
          success: function(msg){ 
        	alert("删除成功！");
			$("#ProjectList").trigger("reloadGrid");
               if(msg!=0){ 
                   var arr = msg.split(','); 
                   $.each(arr,function(i,n){ 
                         if(arr[i]!=""){ 
                             $("#ProjectList").jqGrid('delRowData',n);  
                         } 
                   }); 
                   $().message("已成功删除!"); 
               }else{ 
                   $().message("操作失败！"); 
               } 
          } 
        }); 
       } 
    } 
}




function viewAlgorithmInput(cycleId){
		$("#cloneTr").nextAll().remove();
		$("#cloneTr").show();
		$.ajax({
			type:"post",
			url:"listAlgorithmInputs.action",
			dataType:"json",
			data:{
				CycleID:cycleId,
				sidx:"ID",
				sord:"asc"
			},
			success:function(data){
				var tr=$("#cloneTr");
				$.each(data.dataList,function(index,row){
					var clonedTr=tr.clone();
					var _index=index;
					clonedTr.children("td").each(function(inner_index){
						switch(inner_index){
							case(0):$(this).html(row.ID);break;
							case(1):$(this).html(row.display);break;
							case(2):$(this).html(row.symbol);break;
						
						}//end switch
					});//end children.each
					clonedTr.insertAfter(tr);		
				});//end $each
				$("#cloneTr").hide();
				$("#generatedTable").show();
				$("#listAlgorithmInput_modal").modal();
	
			}//end success
		});//end ajax
	}

function viewInput(cycleId){//没用
	/*
	 * 输入参数管理列表
	 */
	var datagrid = jQuery("#AlgorithmInputList")
	.jqGrid(
			{
				url : "listAlgorithmInputs.action",// 后端的数据交互程序，改为你的
				postData:{CycleID:cycleId},
				datatype : "json",// 前后交互的格式是json数据
				mtype : 'POST',// 交互的方式是发送httpget请求						
				colNames : [ '编号', '参数', '符号'],// 表格的列名
				colModel : [
						{
							name : 'ID',
							index : 'ID',
							width : 50,
							align : "center",
							sortable:true,
							sorttype:'int'
						},// 每一列的具体信息，index是索引名，当需要排序时，会传这个参数给后端
						{
							name : 'display',
							index : 'display',
							width : 100,
							align : "center",
							sortable:true
						},
						{
							name : 'symbol',
							index : 'symbol',
							width : 100,
							align : "center"
						}
	
						],
//				autowidth:true,
				rowNum:10,//每一页的行数
				height: 'auto',
				width:555,
				rowList:[10,20,30],
				pager: '#AlgorithmInputMeasurePager',
				sortname: 'ID',			
				viewrecords: true,
				sortorder: "desc",
				multiselect: true,  //可多选，出现多选框 
			    multiselectWidth: 35, //设置多选列宽度 
				jsonReader: {//读取后端json数据的格式
					root: "dataList",//保存详细记录的名称
					total: "total",//总共有多少页
					page: "page",//当前是哪一页
					records: "records",//总共记录数
					repeatitems: false
				},
				caption: "输入参数管理"//表格名称
				
			});
	datagrid.jqGrid('navGrid','#AlgorithmInputMeasurePager',{
		edit : false,
		add : false,
		search:false,
		del : false}).jqGrid('navButtonAdd',"#AlgorithmInputMeasurePager",{
				title:'删除',
				caption:"删除",	
				id:"delete_AlgorithmInput",
				onClickButton:deleteAlgorithmInput,
				position:"first"
			});
	$("#listAlgorithmInput_modal").modal();
//	alert(cycleId);
//	$('#CycleID').val(cycleId);
	}

function selectInput(cycleId){
	$('#addAlgorithmInput_modal').modal();
	$('#CycleID').val(cycleId);
	loadParameterOptions();
}

function loadParameterOptions(){
	$.ajax({
		url:'listParameter.action',
		type:'post',
		dataType:'json',
		data : {
			sidx: 'id',
			sord: "desc"
		},
		success:function(data){
			var items="";
			$.each(data.dataList,function(i,parameter){
				items+= "<option value=\"" + parameter.ID + "\">" + parameter.display + "</option>"; 
			});
			$("#select1").html(items);
		}
	});
	}


$(document).ready(function() {
	$('#algorithmfile').uploadify({
		'swf' : 'js/upload/uploadify.swf',
		'uploader' : 'uploadAlgorithm.action',
		'queueID' : 'fileQueue',
		'auto' : true,
		'multi' : false,
		'buttonText' : '上传算法文件',
		'fileSizeLimit' : '5MB',
		'fileObjName' : 'algorithmfile',
		'onUploadSuccess' : function(file, data, response) {
	        alert('The file was saved to: ' + data);
	    },
		'method' : 'post'
	});
});

$(
	
		
	function() {

	/*
	 * 算法管理列表
	 */
	var datagrid = jQuery("#AlgorithmList")
	.jqGrid(
			{
				url : "listAlgorithmsCycle.action",// 后端的数据交互程序，改为你的
				datatype : "json",// 前后交互的格式是json数据
				mtype : 'POST',// 交互的方式是发送httpget请求						
				colNames : [ '编号', '名称', '作者','描述','添加时间','输入参数添加','输出参数设置','查看详情'],// 表格的列名
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
							name:'authorName',
							index:'authorName',
							width:100,
							align:'center',
							sortable:true
						},
						{
							name:'description',
							index:'description',
							width:200,
							align:'center',
							sortable:false
						},
						{
							name:'addDates',
							index:'addDate',
							width:100,
							align:'center',
							sortable:true
						},
						{				
							name : 'input',
							index : 'input',
							width : 100,
							align : "center",
							formatter : function(value, grid, rows,
									state) {
//								alert(rows.ID);
								return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"selectInput('"
										+ rows.ID + "')\">输入参数添加</a>"
							}
						},
						{
							name : 'output',
							index : 'output',
							width : 100,
							align : "center",
							formatter : function(value, grid, rows,
									state) {
//								alert(rows.ID);
								return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"selectOutput('"
										+ rows.ID + "')\">输出参数设置</a>"
							}
						},
						{
							name : 'view',
							index : 'view',
							width : 100,
							align : "center",
//							hidden:true,
							formatter : function(value, grid, rows,
									state) {
//								alert(rows.ID);
								return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"viewDetail('"
										+ rows.ID + "')\">查看</a>"
							}
						}
	
						],
//				autowidth:true,
				rowNum:10,//每一页的行数
				height: 'auto',
				width:1230,
				rowList:[10,20,30],
				pager: '#AlgorithmPager',
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
				caption: "算法管理"//表格名称
					
//				gridComplete: function(){
//	                var ids = $("#AlgorithmList").getDataIDs();//jqGrid('getDataIDs');
//	                for(var i=0;i<ids.length;i++){
//	                    var cl = ids[i];
//	                    be = "<input  type='button' value='查看' onclick=\"jQuery('#AlgorithmList').jqGrid('viewGridRow','"+cl+"',{modal:true});\"  />"; 
//	                    de = "<input  type='button' value='删除' onclick=\"jQuery('#AlgorithmList').jqGrid('delGridRow','"+cl+"',{closeOnEscape:true});\"  />";
//	                    jQuery("#AlgorithmList").jqGrid('setRowData',ids[i],{test:be+de});
//	                } 
//	            }
		            
				
			});
	datagrid.jqGrid('filterToolbar',{searchOperators:true});
	datagrid.jqGrid('navGrid','#AlgorithmPager',{
		edit : false,
		add : false,
		search:false,
		del : false}).jqGrid('navButtonAdd',"#AlgorithmPager",{
				title:'添加',
				caption:"添加",
				id:"add_AlgorithmList",
				onClickButton : function addModal(){
					// 配置对话框
					loadAuthorOptions();//加载作者选项
					$('#uploadAlgorithmModal').modal();
					$("#addAlgorithmForm").validate({
						debug:true,
						onsubmit:true,
						onfocusout:false,
						onkeyup:true,
						rules:{
							name:{
								required:true
							},
							authorID:{
								required:true
							}
						},
						messages:{
							name:{
								required:"名称不能为空！",
							},							
							authorID:{
								required:"请选择作者！"
							}
						},
						submitHandler:function(){
							add_algorithm();
						}
					});
						
				
				},
				position:"first"
			
		
			}).jqGrid('navButtonAdd',"#AlgorithmPager",{
				title:'编辑',
				caption:"编辑",
				id:"edit_AlgorithmList",
				onClickButton : function addModal(){
					 var sels = $("#AlgorithmList").jqGrid('getGridParam','selarrrow'); 
					    if(sels==""){ 
					       //$().message("请选择要删除的项！"); 
					       alert("请选择编辑的项!");
					    }else if(sels.length>1){
					    	alert("只能选择一项！");
					    }else{ 
					    	var selectedID=sels[0];
					    	var rowData = $("#AlgorithmList").jqGrid("getRowData", selectedID);
				        	var ID=rowData.ID;
							// 配置对话框
							loadAuthorOptions();//加载作者选项
							$('#uploadAlgorithmModal').modal();
							$("#addAlgorithmForm").validate({
								debug:true,
								onsubmit:true,
								onfocusout:false,
								onkeyup:true,
								rules:{
									name:{
										required:true
									},
									authorID:{
										required:true
									}
								},
								messages:{
									name:{
										required:"名称不能为空！",
									},							
									authorID:{
										required:"请选择作者！"
									}
								},
								submitHandler:function(){		
									    	edit_algorithm(ID);								
								}
							});
					    }

				},
		
			
		
			}).jqGrid('navButtonAdd',"#AlgorithmPager",{
				title:'删除',
				caption:"删除",	
				id:"delete_AlgorithmList",
				onClickButton:deleteAlgorithm,
				position:"first"
			});
	
	
}//function结束
);//$()结束
/*
 * 查看算法详情
 */
function viewDetail(rowId){
	$("#inputTr").nextAll().remove();
	$("#inputTr").show();	
	$("#outputTr").nextAll().remove();
	$("#outputTr").show();	
	$('#view_detail_modal').modal();

	$.ajax({
		type:"post",
		url:"viewAlgorithmDetail.action",
		data:{
			ID:rowId,
			sidx:"ID",
			sord:"asc"
		},
		success:function(data){
			$("#AlgID").text(data.algorithm.ID);
			$("#AlgName").text(data.algorithm.name);
			$("#AlgDes").text(data.algorithm.description);
			$("#AlgAddDate").text(data.algorithm.addDates);
			$("#AlgLastUpdateDate").text(data.algorithm.lastUpdateDates);
			$("#AlgAuthor").text(data.algorithm.authorName);
			$("#AlgClassName").text(data.algorithm.className);
			var tr=$("#inputTr");
			$.each(data.inputList,function(index,row){
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
			$("#inputTr").hide();
			$("#inputTable").show();			
			
			var tr=$("#outputTr");
			$.each(data.outputList,function(index,row){
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
			$("#outputTr").hide();
			$("#outputTable").show();			
			
		}
	});
}
/*
 * 添加算法
 */
function add_algorithm() {
	//alert(hideFilePath);
	$.ajax({
		type : 'POST',
		url : 'addAlgorithmsCycle.action',
		data : {
			name:$("#algname").val(),
			Description : $("#Description").val(),
			authorID:$("#authorID").val(),
			filePath : hideFilePath,
			className:$("#className").val()
		},
		success : function(data) {
			alert('算法文件上传成功');
			$('#uploadAlgorithmModal').modal('hide');
			$("#AlgorithmList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter(msg);
			$('#uploadAlgorithmModal').modal('hide');
			$("#AlgorithmList").trigger("reloadGrid");
		}
	});
	}

/*
 * 编辑算法
 */
function edit_algorithm(selectedID) {

	    	
	//alert(hideFilePath);
	$.ajax({
		type : 'POST',
		url : 'updateAlgorithmsCycle.action',
		data : {
			ID:selectedID,
			name:$("#algname").val(),
			Description : $("#Description").val(),
			authorID:$("#authorID").val(),
			filePath : hideFilePath,
			className:$("#className").val()
		},
		success : function(data) {
			alert('算法文件上传成功');
			$('#uploadAlgorithmModal').modal('hide');
			$("#AlgorithmList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter(msg);
			$('#uploadAlgorithmModal').modal('hide');
			$("#AlgorithmList").trigger("reloadGrid");
		}
	});
	}

/*
 * 删除算法
 */
function deleteAlgorithm() {
    var sels = $("#AlgorithmList").jqGrid('getGridParam','selarrrow'); 
    if(sels==""){ 
       //$().message("请选择要删除的项！"); 
       alert("请选择要删除的项!");
    }else{ 
    	var selectedIDs={};
    	$.each(sels,function(i,n){ 
          if(sels[i]!=""){ 
        	  var rowData = $("#AlgorithmList").jqGrid("getRowData", sels[i]);
        	  selectedIDs["ids[" + i + "]"]=rowData.ID;
          } 
    	}); 

       if(confirm("您是否确认删除？")){ 
        $.ajax({ 
          type: "POST", 
          url: "delAlgorithmsCycle.action", 
          data: selectedIDs, 
          beforeSend: function() { 
               $().message("正在请求..."); 
          }, 
          error:function(){ 
               $().message("请求失败..."); 
          }, 
          
          success: function(msg){ 
        	alert("删除成功！");
			$("#AlgorithmList").trigger("reloadGrid");
               if(msg!=0){ 
                   var arr = msg.split(','); 
                   $.each(arr,function(i,n){ 
                         if(arr[i]!=""){ 
                             $("#AlgorithmList").jqGrid('delRowData',n);  
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


function deleteAlgorithmInput(){
	
}
/*
 * 查看算法输入参数列表，使用动态生成表格
 */
function viewAlgorithmInput(cycleId){//暂时没用
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

/*
 * 添加算法输入
 */
function selectInput(cycleId){
	$('#addAlgorithmInput_modal').modal();
	$('#CycleID').val(cycleId);
	loadParameterOptions("#select1");
	$("#addAlgorithmInputForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout:false,
		onkeyup:true,
		rules:{
			selectedIDs:{
				required:true
			}
		},
		messages:{
			selectedIDs:{
				required:"请选择输入参数！",
			}
		},
		submitHandler:function(){
			add_algorithmInput();
		}
	});
}

/*
 * 添加算法输入
 */
function add_algorithmInput() {
	var $options = $('#select2 option');
	var ids={};
  	$.each($options,function(i,n){ 
           if($options[i]!=""){ 
         	  ids[i]=$options[i].value;
           } 
  	}); 
	$.ajax({
		type : 'POST',
		url : 'addAlgorithmInput.action',
		data : {
			ids:ids,
			CycleID:$("#CycleID").val()
		},
		success : function(data) {
			alert('添加输入参数成功!');
			$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmInputList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter(msg);
			$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmList").trigger("reloadGrid");
		}
	});
	}
/*
 * 添加算法输出
 */	
function selectOutput(cycleId){
	$('#addAlgorithmOutput_modal').modal();
	$('#outputCycleID').val(cycleId);
	loadParameterOptions("#outputselect1");
	$("#addAlgorithmOutputForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout:false,
		onkeyup:true,
		rules:{
			selectedIDs:{
				required:true
			}
		},
		messages:{
			selectedIDs:{
				required:"请选择输入参数！",
			}
		},
		submitHandler:function(){
			add_algorithmOutput();
		}
	});
}

/*
 * 添加算法输出
 */
function add_algorithmOutput() {
	var $options = $('#outputselect2 option');
	var ids={};
  	$.each($options,function(i,n){ 
           if($options[i]!=""){ 
         	  ids[i]=$options[i].value;
           } 
  	}); 
	$.ajax({
		type : 'POST',
		url : 'addAlgorithmOutput.action',
		data : {
			ids:ids,
			CycleID:$("#outputCycleID").val()
		},
		success : function(data) {
			alert('添加输出参数成功!');
			$('#addAlgorithmOutput_modal').modal('hide');
			//$("#AlgorithmInputList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter(msg);
			$('#addAlgorithmOutput_modal').modal('hide');
			//$("#AlgorithmList").trigger("reloadGrid");
		}
	});
	}
/*
 * 加载参数下拉列表
 */
function loadParameterOptions(selectStr){
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
			$(selectStr).html(items);
		}
	});
	}
/*
 * 加载作者下拉列表
 */
function loadAuthorOptions(){
	$.ajax({
		url:'listUser.action',
		type:'post',
		dataType:'json',
		success:function(data){
			var items="";
			$.each(data.dataList,function(i,user){
				items+= "<option value=\"" + user.userid + "\">" + user.username + "</option>"; 
			});
			$("#authorID").html(items);
		}
	});
	}


	
var hideFilePath;
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
	        //alert('The file was saved to: ' + data);
	        var tempJson = jQuery.parseJSON(data);
	        hideFilePath = tempJson['filePath'];
	        //alert(hideFilePath);
	    },
		'method' : 'post'
	});
	
	//给算法添加输入的select项的多选
	 $('#add').click(function(){  
        var $options = $('#select1 option:selected');//获取当前选中的项  
        var $remove = $options.remove();//删除下拉列表中选中的项  
        $remove.appendTo('#select2');//追加给对方  
    });  
      
    $('#remove').click(function(){  
        var $removeOptions = $('#select2 option:selected');  
        $removeOptions.appendTo('#select1');//删除和追加可以用appendTo()直接完成  
    });  
      
    $('#addAll').click(function(){  
        var $options = $('#select1 option');  
        $options.appendTo('#select2');  
    });  
      
    $('#removeAll').click(function(){  
        var $options = $('#select2 option');  
        $options.appendTo('#select1');  
    });  
      
    //双击事件  
    $('#select1').dblclick(function(){  
        //var $options = $('#select1 option:selected');  
        var $options = $('option:selected', this);//注意此处“option”与“:”之间的空格，有空格是不可以的  
        $options.appendTo('#select2');  
    });  
      
    $('#select2').dblclick(function(){  
        $('#select2 option:selected').appendTo('#select1');  
    });
    
  //给算法添加输出的select项的多选
	 $('#outputadd').click(function(){  
       var $options = $('#outputselect1 option:selected');//获取当前选中的项  
       var $remove = $options.remove();//删除下拉列表中选中的项  
       $remove.appendTo('#outputselect2');//追加给对方  
   });  
     
   $('#outputremove').click(function(){  
       var $removeOptions = $('#outputselect2 option:selected');  
       $removeOptions.appendTo('#outputselect1');//删除和追加可以用appendTo()直接完成  
   });  
     
   $('#outputaddAll').click(function(){  
       var $options = $('#outputselect1 option');  
       $options.appendTo('#outputselect2');  
   });  
     
   $('#outputremoveAll').click(function(){  
       var $options = $('#outputselect2 option');  
       $options.appendTo('#outputselect1');  
   });  
     
   //双击事件  
   $('#outputselect1').dblclick(function(){  
       //var $options = $('#select1 option:selected');  
       var $options = $('option:selected', this);//注意此处“option”与“:”之间的空格，有空格是不可以的  
       $options.appendTo('#outputselect2');  
   });  
     
   $('#outputselect2').dblclick(function(){  
       $('#outputselect2 option:selected').appendTo('#outputselect1');  
   });
       
});


	var datagridGraphDetail;
function viewGraphiDetail(gid,gtype){
	graphID=gid;
	detailType=gtype;
	if(gtype==0){
		
		$('#listGraphiDetail_modal').modal();
		loadGraphiDetail(gid);
	}
}
function loadGraphiDetail(GID) {	
			
		 datagridGraphDetail = jQuery("#GraphiDetailList").jqGrid(
			{
				url : "listGraphiDetailByGraphID.action",// 后端的数据交互程序，改为你的
				datatype : "json",// 前后交互的格式是json数据
				mtype : 'POST',// 交互的方式是发送httpget请求	
				postData : {
					GraphiID:GID
				},
				colNames : [ '编号','图编号', '参数编号', '参数名称','类型','单位','附加信息A','附加信息B'],// 表格的列名
				colModel : [
						{
							name : 'id',
							index : 'id',
							width : 50,
							align : "center",
							sortable:true,
							sorttype:'int'
						},// 每一列的具体信息，index是索引名，当需要排序时，会传这个参数给后端
						{
							name : 'graphiID',
							index : 'graphiID',
							width : 50,
							hidden :true,
							align : "center",
							sortable:true
						},
						{
							name:'paramID',
							index:'paramID',
							width:50,
							hidden :true,
							align:'center',
							sortable:true
						},	
						{
							name:'paramDisplay',
							index:'paramDisplay',
							width:50,
							align:'center',
							sortable:true
						},	
						{
							name:'paramTypeS',
							index:'paramTypeS',
							width:50,
							align:'center',
							sortable:true
						},	
						{
							name:'messureShow',
							index:'messureShow',
							width:50,
							align:'center',
							sortable:true
						},	
						{
							name:'info1',
							index:'info1',
							width:50,
							align:'center',
							
							sortable:true
						},
						{
							name : 'info2',
							index : 'info2',
							width:50,
							align:'center',
							hidden :true,
							sortable:true
						}
	
						],
//				autowidth:true,
				rowNum:10,//每一页的行数
				height: 'auto',
				width:800,
				rowList:[10,20,30],
				pager: '#GraphiDetailPager',
				sortname: 'ID',
				viewrecords: true,
				sortorder: "desc",
				multiselect: true,  //可多选，出现多选框 
			    multiselectWidth: 35, //设置多选列宽度 
				jsonReader: {//读取后端json数据的格式
					root: "listGraphiDetail",//保存详细记录的名称
					total: "total",//总共有多少页
					page: "page",//当前是哪一页
					records: "records",//总共记录数
					GraphiID:GID,
					repeatitems: false
				},
				caption: "输出图详细配置"//表格名称	            
				
			});
		//datagridGraph.jqGrid('filterToolbar',{searchOperators:true});
		 datagridGraphDetail.jqGrid('navGrid','#GraphiDetailPager',{
		edit : false,
		add : false,
		search:false,
		del : false});
		datagridGraphDetail.jqGrid('navButtonAdd',"#GraphiDetailPager",{
				title:'添加',
				caption:"添加",
				id:"add_GraphiDetail",
				onClickButton : function addModal(){
					// 配置对话框
					//loadAuthorOptions();//加载作者选项
					$('#addnewGraphiDetailModal').modal();
					loadParameterDetail("#addParameterDetailID");
					$("#addGraphiDetailForm").validate({
						debug:true,
						onsubmit:true,
						onfocusout:false,
						onkeyup:true,
						/*rules:{
							graphiName:{
								required:true
							}							
						},
						messages:{
							graphiName:{
								required:"名称不能为空！",
							}
						},*/
						submitHandler:function(){
							add_GraphiDetail();
						}
					});
						
				
				},
				position:"last"
			
		
			});
/*		datagridGraph.jqGrid('navButtonAdd',"#GraphiPager",{
				title:'编辑',
				caption:"编辑",
				id:"edit_GraphiList",
				onClickButton : function addModal(){
//					alert(1);
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
				        	$("#algname").text(rowData.name);
				        	$("#Description").text(rowData.Description);
				        	$("#authorID").text(rowData.authorName);
//				        	$("#className").val(rowData);
//				        	$("#algorithmfile").val(rowData);
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
				
				position:"last"
		
			});*/
		datagridGraphDetail.jqGrid('navButtonAdd',"#GraphiDetailPager",{
				title:'删除',
				caption:"删除",	
				id:"delete_GraphiDetailList",
				onClickButton:deleteGraphi,
				position:"last"
			});
	}//function end;
	
//添加新输出图
	function add_GraphiDetail() {
		//alert(hideFilePath);
		
		$.ajax({
			type : 'POST',
			url : 'addGraphiDetail.action',
			data : {
				GraphiID:graphID,
				paramID : $("#addParameterDetailID").val(),
				info1:$("#info1").val(),
				info2:'',
			},
			success : function(data) {
				alert('添加图表配置成功');
				$('#addnewGraphiDetailModal').modal('hide');
				$("#GraphiDetailList").trigger("reloadGrid");			
			},
			error:function(msg){
				alter(msg);
				$('#addnewGraphiDetailModal').modal('hide');
				$("#GraphiDetailList").trigger("reloadGrid");
			}
		});
		}

	

	/*
	 * 删除算法
	 */
	function deleteGraphi() {
	    var sels = $("#GraphiDetailList").jqGrid('getGridParam','selarrrow'); 
	    if(sels==""){ 
	       //$().message("请选择要删除的项！"); 
	       alert("请选择要删除的项!");
	    }else{ 
	    	var selectedIDs={};
	    	$.each(sels,function(i,n){ 
	          if(sels[i]!=""){ 
	        	  var rowData = $("#GraphiDetailList").jqGrid("getRowData", sels[i]);
	        	  selectedIDs["ids[" + i + "]"]=rowData.id;
	          } 
	    	}); 

	       if(confirm("您是否确认删除？")){ 
	        $.ajax({ 
	          type: "POST", 
	          url: "delGraphiDetail.action", 
	          data: selectedIDs, 
	          beforeSend: function() { 
	               $().message("正在请求..."); 
	          }, 
	          error:function(){ 
	               $().message("请求失败..."); 
	          }, 
	          
	          success: function(msg){ 
	        	alert("删除成功！");
				$("#GraphiDetailList").trigger("reloadGrid");
	               if(msg!=0){ 
	                   var arr = msg.split(','); 
	                   $.each(arr,function(i,n){ 
	                         if(arr[i]!=""){ 
	                             $("#GraphiDetailList").jqGrid('delRowData',n);  
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
	/*
	 * 加载参数下拉列表
	 */
	/*
	 * 加载参数下拉列表
	 */
	function loadParameterDetail(selectStr){
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
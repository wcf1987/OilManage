
$(
	
	function() {

	var datagrid = jQuery("#PhysicalList")
			.jqGrid(
					{
						url : "listPhysical.action",// 后端的数据交互程序，改为你的
						datatype : "json",// 前后交互的格式是json数据
						mtype : 'POST',// 交互的方式是发送httpget请求						
						colNames : [ '编号', '物理量名称', '英文名称', '描述', 'ISO基本单位'],// 表格的列名
						colModel : [
								{
									name : 'ID',
									index : 'id',
									width : 50,
									align : "center",
									sortable:true
								},// 每一列的具体信息，index是索引名，当需要排序时，会传这个参数给后端
								{
									name : 'CName',
									index : 'CName',
									width : 150,
									align : "center",
									sortable:true
								},
								{
									name : 'EName',
									index : 'EName',
									width : 200,
									align : "center",
									sortable:true
								},
								{
									name : 'description',
									index : 'Description',
									width : 200,
									align : "center",
									sortable:true
								},
								{
									name:'ISOBasicUnit',
									index:'ISOBasicUnit',
									width:200,
									align:'center',
									sortable:true
								}
			
								],
//						autowidth:true,
						editurl:"editData.action",
						rowNum:10,//每一页的行数
						height: 'auto',
						width:1230,
						rowList:[10,20,30],
						pager: '#PhysicalPager',
						sortname: 'id',
						viewrecords: true,
						sortorder: "desc",
						multiselect: true,  //可多选，出现多选框 
					    multiselectWidth: 35, //设置多选列宽度 
						jsonReader: {//读取后端json数据的格式
						root: "dataList",//保存详细记录的名称
						total: "total",//总共有页
						page: "page",//当前是哪一页
						records: "records",//总共记录数
						repeatitems: false
						},
						caption: "物理量管理",//表格名称,
						jsonReader : {// 读取后端json数据的格式
							root : "dataList",// 保存详细记录的名称
							// total: "total",//总共有页
							// page: "page",//当前是哪一页
							records : "records",// 总共记录数
							repeatitems : false
						}
					}
					
					
			);

	datagrid.jqGrid('filterToolbar',{searchOperators:true});			
	datagrid.jqGrid('navGrid','#PhysicalPager',{
			edit : false,
			add : false,
			search:false,
			del : false}).jqGrid('navButtonAdd',"#PhysicalPager",{
					title:'添加',
					caption:"添加",
					id:"add_PhysicalList",
					onClickButton : function addModal(){
						// 配置对话框
							$('#add_physical_modal').modal();
					
					},
					position:"first"
				
			
				}).jqGrid('navButtonAdd',"#PhysicalPager",{
					title:'删除',
					caption:"删除",	
					id:"delete_PhysicalList",
					onClickButton:deletePhysical,
					position:"first"
				});
	
	function deletePhysical() {
		/*
		var gr = jQuery("#PhysicalList").jqGrid('getGridParam','selarrrow');
		if( gr != null ) jQuery("#PhysicalList").jqGrid('delGridRow',gr,{
												reloadAfterSubmit:false,
												caption:"删除记录",
												bSubmit:"确定",
												bCancel:"取消",
												url:"delPhysical.action"
									
												});
		else alert("Please Select Row to delete!");
		*/
		
	        var sels = $("#PhysicalList").jqGrid('getGridParam','selarrrow'); 
	        if(sels==""){ 
	           //$().message("请选择要删除的项！"); 
	           alert("请选择要删除的项!");
	        }else{ 
	        	var selectedIDs={};
	        	$.each(sels,function(i,n){ 
                  if(sels[i]!=""){ 
                	  var rowData = $("#PhysicalList").jqGrid("getRowData", sels[i]);
                	  selectedIDs["ids[" + i + "]"]=rowData.ID;
                  } 
	        	}); 

	           if(confirm("您是否确认删除？")){ 
	            $.ajax({ 
	              type: "POST", 
	              url: "delPhysical.action", 
	              data: selectedIDs, 
	              beforeSend: function() { 
	                   $().message("正在请求..."); 
	              }, 
	              error:function(){ 
	                   $().message("请求失败..."); 
	              }, 
	              
	              success: function(msg){ 
	            	alert("删除成功！");
//	            	alert(msg);
					$("#PhysicalList").trigger("reloadGrid");
	                   if(msg!=0){ 
	                       var arr = msg.split(','); 
	                       $.each(arr,function(i,n){ 
	                             if(arr[i]!=""){ 
	                                 $("#PhysicalList").jqGrid('delRowData',n);  
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
	 * 单位管理列表
	 */
	var datagrid = jQuery("#MeasureList")
	.jqGrid(
			{
				url : "listMeasure.action",// 后端的数据交互程序，改为你的
				datatype : "json",// 前后交互的格式是json数据
				mtype : 'POST',// 交互的方式是发送httpget请求						
				colNames : [ '编号', '英文名称', '中文名称', '符号', '物理量','单位体系','转换率A','转换率B'],// 表格的列名
				colModel : [
						{
							name : 'ID',
							index : 'mid',
							width : 50,
							align : "center",
							sortable:true,
							sorttype:'int'
						},// 每一列的具体信息，index是索引名，当需要排序时，会传这个参数给后端
						{
							name : 'EName',
							index : 'mEName',
							width : 150,
							align : "center",
							sortable:true
						},
						{
							name : 'CName',
							index : 'mCName',
							width : 200,
							align : "center",
							sortable:true
						},
						{
							name : 'symbol',
							index : 'symbol',
							width : 200,
							align : "center",
							sortable:true
						},
						{
							name:'phy.CName',
							index:'pCName',
							width:200,
							align:'center',
							sortable:true
						},
						{
							name:'style.styleName',
							index:'styleName',
							width:200,
							align:'center',
							sortable:false
						},
						{
							name:'ratioA',
							index:'RatioA',
							width:200,
							align:'center',
							sortable:true
						},
						{
							name:'ratioB',
							index:'RatioB',
							width:200,
							align:'center',
							sortable:true
						}
	
						],
//				autowidth:true,
				rowNum:10,//每一页的行数
				height: 'auto',
				width:1230,
				rowList:[10,20,30],
				pager: '#MeasurePager',
				sortname: 'mid',
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
				caption: "物理单位管理"//表格名称
				
			});
	datagrid.jqGrid('filterToolbar',{searchOperators:true});
	datagrid.jqGrid('navGrid','#MeasurePager',{
		edit : false,
		add : false,
		search:false,
		del : false}).jqGrid('navButtonAdd',"#MeasurePager",{
				title:'添加',
				caption:"添加",
				id:"add_MeasureList",
				onClickButton : function addModal(){
					// 配置对话框

						$('#add_measure_modal').modal();
				
				},
				position:"first"
			
		
			}).jqGrid('navButtonAdd',"#MeasurePager",{
				title:'删除',
				caption:"删除",	
				id:"delete_MeasureList",
				onClickButton:deleteMeasure,
				position:"first"
			});
	
	function deleteMeasure() {
		/*
		var gr = jQuery("#PhysicalList").jqGrid('getGridParam','selarrrow');
		if( gr != null ) jQuery("#PhysicalList").jqGrid('delGridRow',gr,{
												reloadAfterSubmit:false,
												caption:"删除记录",
												bSubmit:"确定",
												bCancel:"取消",
												url:"delPhysical.action"
									
												});
		else alert("Please Select Row to delete!");
		*/
		
	        var sels = $("#MeasureList").jqGrid('getGridParam','selarrrow'); 
	        if(sels==""){ 
	           //$().message("请选择要删除的项！"); 
	           alert("请选择要删除的项!");
	        }else{ 
	        	var selectedIDs={};
	        	$.each(sels,function(i,n){ 
                  if(sels[i]!=""){ 
                	  var rowData = $("#MeasureList").jqGrid("getRowData", sels[i]);
                	  selectedIDs["ids[" + i + "]"]=rowData.ID;
                  } 
	        	}); 

	           if(confirm("您是否确认删除？")){ 
	            $.ajax({ 
	              type: "POST", 
	              url: "delMeasure.action", 
	              data: selectedIDs, 
	              beforeSend: function() { 
	                   $().message("正在请求..."); 
	              }, 
	              error:function(){ 
	                   $().message("请求失败..."); 
	              }, 
	              
	              success: function(msg){ 
	            	alert("删除成功！");
//	            	alert(msg);
					$("#MeasureList").trigger("reloadGrid");
	                   if(msg!=0){ 
	                       var arr = msg.split(','); 
	                       $.each(arr,function(i,n){ 
	                             if(arr[i]!=""){ 
	                                 $("#MeasureList").jqGrid('delRowData',n);  
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

	
	
}//function结束
);//$()结束





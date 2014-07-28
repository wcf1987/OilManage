

	var datagridGraph;
	var AlgID;
	function loadGraphi(CycleID) {	
			AlgID=CycleID;
		 datagridGraph = jQuery("#GraphiList").jqGrid(
			{
				url : "listGraphiByAlgID.action",// 后端的数据交互程序，改为你的
				datatype : "json",// 前后交互的格式是json数据
				mtype : 'POST',// 交互的方式是发送httpget请求	
				postData : {
					test:1,
					CycleID:CycleID
				},
				colNames : [ '编号', '名称', '类型','类型','查看详情'],// 表格的列名
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
							name : 'graphiName',
							index : 'graphiName',
							width : 50,
							align : "center",
							sortable:true
						},
						{
							name:'graphiTypeS',
							index:'graphiTypeS',
							width:50,
							align:'center',
							sortable:true
						},	
						{
							name:'graphiType',
							index:'graphiType',
							width:50,
							align:'center',
							hidden :true,
							sortable:true
						},
						{
							name : 'view',
							index : 'view',
							width : 50,
							align : "center",
//							hidden:true,
							formatter : function(value, grid, rows,
									state) {
//								alert(rows.ID);
								return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"viewGraphiDetail('"
										+ rows.id + "' , '"+rows.graphiType+"')\">查看</a>"
							}
						}
	
						],
//				autowidth:true,
				rowNum:10,//每一页的行数
				height: 'auto',
				width:800,
				rowList:[10,20,30],
				pager: '#GraphiPager',
				sortname: 'ID',
				viewrecords: true,
				sortorder: "desc",
				multiselect: true,  //可多选，出现多选框 
			    multiselectWidth: 35, //设置多选列宽度 
				jsonReader: {//读取后端json数据的格式
					root: "listGraphi",//保存详细记录的名称
					total: "total",//总共有多少页
					page: "page",//当前是哪一页
					records: "records",//总共记录数
					CycleID:CycleID,
					repeatitems: false
				},
				caption: "输出图管理"//表格名称	            
				
			});
		//datagridGraph.jqGrid('filterToolbar',{searchOperators:true});
		datagridGraph.jqGrid('navGrid','#GraphiPager',{
		edit : false,
		add : false,
		search:false,
		del : false});
		datagridGraph.jqGrid('navButtonAdd',"#GraphiPager",{
				title:'添加',
				caption:"添加",
				id:"add_Graphi",
				onClickButton : function addModal(){
					// 配置对话框
					//loadAuthorOptions();//加载作者选项
					$('#addnewGraphiModal').modal();
					$("#addGraphiForm").validate({
						debug:true,
						onsubmit:true,
						onfocusout:false,
						onkeyup:true,
						rules:{
							graphiName:{
								required:true
							}							
						},
						messages:{
							graphiName:{
								required:"名称不能为空！",
							}
						},
						submitHandler:function(){
							add_Graphi();
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
			datagridGraph.jqGrid('navButtonAdd',"#GraphiPager",{
				title:'删除',
				caption:"删除",	
				id:"delete_GraphiList",
				onClickButton:deleteGraphi,
				position:"last"
			});
	}//function end;
	
//添加新输出图
	function add_Graphi() {
		//alert(hideFilePath);
		$.ajax({
			type : 'POST',
			url : 'addGraphi.action',
			data : {
				CycleID:AlgID,
				graphiName : $("#graphiName").val(),
				graphiType:$("#graphiType").val(),
			},
			success : function(data) {
				alert('添加图表配置成功');
				$('#addnewGraphiModal').modal('hide');
				$("#GraphiList").trigger("reloadGrid");			
			},
			error:function(msg){
				alter(msg);
				$('#addnewGraphiModal').modal('hide');
				$("#GraphiList").trigger("reloadGrid");
			}
		});
		}

	//编辑新输出图
	function edit_algorithm(selectedID) {

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
				alert('算法文件上传成功!');
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
	function deleteGraphi() {
	    var sels = $("#GraphiList").jqGrid('getGridParam','selarrrow'); 
	    if(sels==""){ 
	       //$().message("请选择要删除的项！"); 
	       alert("请选择要删除的项!");
	    }else{ 
	    	var selectedIDs={};
	    	$.each(sels,function(i,n){ 
	          if(sels[i]!=""){ 
	        	  var rowData = $("#GraphiList").jqGrid("getRowData", sels[i]);
	        	  selectedIDs["ids[" + i + "]"]=rowData.id;
	          } 
	    	}); 

	       if(confirm("您是否确认删除？")){ 
	        $.ajax({ 
	          type: "POST", 
	          url: "delGraphi.action", 
	          data: selectedIDs, 
	          beforeSend: function() { 
	               $().message("正在请求..."); 
	          }, 
	          error:function(){ 
	               $().message("请求失败..."); 
	          }, 
	          
	          success: function(msg){ 
	        	alert("删除成功！");
				$("#GraphiList").trigger("reloadGrid");
	               if(msg!=0){ 
	                   var arr = msg.split(','); 
	                   $.each(arr,function(i,n){ 
	                         if(arr[i]!=""){ 
	                             $("#GraphiList").jqGrid('delRowData',n);  
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

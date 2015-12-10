$(
		function(){
			var datagrid = jQuery("#RoleList")
			.jqGrid(
					{
						url : "listRole.action",// 后端的数据交互程序，改为你的
						datatype : "json",// 前后交互的格式是json数据
						mtype : 'POST',// 交互的方式是发送httpget请求						
						colNames : [ '角色名称','描述','角色ID','用户管理','算法管理'],// 表格的列名
						colModel : [
								{name : 'roleName',index:'roleName',width:50,align:"center",sortable:true},
								{name : 'roleDescription',index:'roleDescription',width:200,align:"center",sortable:true},
								{name:'roleID',index:'roleID',width:200,hidden:true},
								{name : 'viewUser',index : 'viewUser',width : 100,align : "center",
									formatter : function(value, grid, rows,state) {
										return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"viewUserByRole('"
												+ rows.roleID + "')\">用户管理</a>";
									}
								},
								{name : 'viewAlg',index : 'viewAlg',width : 100,align : "center",
									formatter : function(value, grid, rows,state) {
										return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"viewAlgByRole('"
												+ rows.roleID + "')\">算法管理</a>";
									}
								}
//								{name:'act',index:'act',align : "center", width:200,sortable:false}
								],
//						autowidth:true,
//						editurl:"editData.action",
						rowNum:10,//每一页的行数
						height: 'auto',
						width:$(document).width()-80,
						rowList:[10,20,30],
						pager: '#RolePager',
						sortname: 'roleID',
						viewrecords: true,
						sortorder: "desc",
						multiselect: true,  //可多选，出现多选框 
					    multiselectWidth: 35, //设置多选列宽度 
						jsonReader: {//读取后端json数据的格式
						root: "roleList",//保存详细记录的名称
						total: "total",//总共有页
						page: "page",//当前是哪一页
						records: "records",//总共记录数
						repeatitems: false
						},
						loadComplete : function() {
							var table = this;
							setTimeout(function(){
								updatePagerIcons(table);
								enableTooltips(table);
							}, 0);
						},
						caption: "角色列表",//表格名称,
//						gridComplete: function(){
//							var ids = jQuery("#RoleList").jqGrid('getDataIDs');
//							for(var i=0;i < ids.length;i++){
//								var cl = ids[i];
//								au = "<input style='height:22px;width:100px;' type='button' value='添加用户' onclick=\"jQuery('#PointPraList').editRow('"+cl+"');\"  />"; 
//								aa = "<input style='height:22px;width:100px;' type='button' value='添加算法' onclick=\"jQuery('#PointPraList').saveRow('"+cl+"');\"  />"; 
//								jQuery("#RoleList").jqGrid('setRowData',ids[i],{act:au+aa});
//							}	
//						},
						jsonReader : {// 读取后端json数据的格式
							root : "roleList",// 保存详细记录的名称
							total: "total",//总共有页
							page: "page",//当前是哪一页
							records : "records",// 总共记录数
							repeatitems : false
						}
					});
		
		datagrid.jqGrid('navGrid','#RolePager',{
				edit : false,
				add : false,
				search:false,
				refreshicon:'ace-icon fa fa-refresh green',
				refreshtext:'刷新',
				del : false}).jqGrid('navButtonAdd',"#RolePager",{
					title:'删除',
					caption:"删除",	
					id:"delete_role",
					buttonicon : 'ace-icon fa fa-times red',
					onClickButton:deleteRole,
					position:"first"
				}).jqGrid('navButtonAdd',"#RolePager",{
						title:'新建',
						caption:"新建",
						buttonicon : 'ace-icon fa fa-pencil-square blue',
						id:"add_RoleList",
						onClickButton : function addModal(){
							// 配置对话框
								$('#add_role_modal').modal();								
								$("#addRoleForm").validate({
									debug:true,
									onsubmit:true,
									onfocusout:false,
									onkeyup:true,
									rules:{
										roleName:{
											required:true
										}
									},
									messages:{
										roleName:{
											required:"名称不能为空！",
										}
									},
									submitHandler:function(){
										add_role();
									}
								});
						},
						position:"first"
					});
		/**
		 * 角色下的用户管理
		 */
		var datagrid1 =jQuery("#UserByRoleList").jqGrid({
			   	url:'listUserByRole.action',
				datatype: "json",
				mtype : 'POST',
				colNames : [ '序号','用户名','所属角色','用户ID','角色ID','userRoleID'],// 表格的列名
				colModel : [
				        {
				        	name:'order',
				        	index:'order',
				        	width:100,
				        	align:'center',
				        	sortable:true
				        },
						{
							name : 'username',
							index : 'username',
							width : 100,
							align : "center",
							sortable:true,
						},
						{
							name : 'roleName',
							index : 'roleName',
							width : 100,
							align : "center",
							sortable:true,
						},
						{
							name:'userid',
							index:'userid',
							width:200,
							hidden:true
						},
						{
							name:'roleID',
							index:'roleID',
							width:200,
							hidden:true
						},{
							name:'userRoleID',
							index:'userRoleID',
							width:50,
							hidden:true
						}
						],
				width:520,
			   	rowNum:10,
			   	rowList:[10,20,30],
			   	pager: '#UserByRolePager',
			   	sortname: 'userid',
			    viewrecords: true,
			    sortorder: "desc",
			    multiselect: true,  //可多选，出现多选框 
			    multiselectWidth: 35, //设置多选列宽度 
			    loadComplete : function() {
					var table = this;
					setTimeout(function(){
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
				},
				caption: "用户列表",
				jsonReader: {//读取后端json数据的格式
					root: "userList",//保存详细记录的名称
					total: "total",//总共有多少页
					page: "page",//当前是哪一页
					records: "records",//总共记录数
					repeatitems: false
				},
			});
			 $('#UserByRoleList').trigger("reloadGrid");
			 datagrid1.jqGrid('navGrid','#UserByRolePager',{
					edit : false,
					add : false,
					search:false,
					refreshicon:'ace-icon fa fa-refresh green',
					refreshtext:'刷新',
					del : false}).jqGrid('navButtonAdd',"#UserByRolePager",{
							title:'添加',
							caption:"添加",
							buttonicon : 'ace-icon fa fa-pencil-square blue',
							id:"add_UserRole",
							onClickButton : function addModal(){
									loadUserOptions();
									$('#addUserRole_modal').modal();								
									$("#addUserRoleForm").validate({
										debug:true,
										onsubmit:true,
										onfocusout:false,
										onkeyup:true,
										rules:{
											userID:{
												required:true
											}
										},
										messages:{
											userID:{
												required:"用户不能为空！",
											}
										},
										submitHandler:function(){
											
											addUserRole();
										}
									});
							},
							position:"first"
						}).jqGrid('navButtonAdd',"#UserByRolePager",{
							title:'删除',
							caption:"删除",	
							id:"del_UserRole",
							buttonicon : 'ace-icon fa fa-times red',
							onClickButton:delUserRole,
							position:"first"
						});
			 
			/**
			 * 角色下的算法管理
			 */
			var datagrid =jQuery("#AlgByRoleList").jqGrid({
				   	url:'listAlgByRole.action',
					datatype: "json",
					mtype : 'POST',
					colNames : [ '序号','算法名称','所属角色','algID','roleID','algRoleID'],// 表格的列名
					colModel : [
					        {
					        	name:'order',
					        	index:'order',
					        	width:100,
					        	align:'center',
					        	sortable:true
					        },
							{
								name : 'algName',
								index : 'algName',
								width : 100,
								align : "center",
								sortable:true,
							},
							{
								name : 'roleName',
								index : 'roleName',
								width : 100,
								align : "center",
								sortable:true,
							},
							{
								name:'algID',
								index:'algID',
								width:200,
								hidden:true
							},
							{
								name:'roleID',
								index:'roleID',
								width:200,
								hidden:true
							},{
								name:'algRoleID',
								index:'algRoleID',
								width:50,
								hidden:true
							}
							],
					width:520,
				   	rowNum:10,
				   	rowList:[10,20,30],
				   	pager: '#AlgByRolePager',
				   	sortname: 'algID',
				    viewrecords: true,
				    sortorder: "desc",
				    multiselect: true,  //可多选，出现多选框 
				    multiselectWidth: 35, //设置多选列宽度 
				    loadComplete : function() {
						var table = this;
						setTimeout(function(){
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
					caption: "算法列表",
					jsonReader: {//读取后端json数据的格式
						root: "algList",//保存详细记录的名称
						total: "total",//总共有多少页
						page: "page",//当前是哪一页
						records: "records",//总共记录数
						repeatitems: false
					},
				});
		 $('#AlgByRoleList').trigger("reloadGrid");
		 datagrid.jqGrid('navGrid','#AlgByRolePager',{
				edit : false,
				add : false,
				search:false,
				refreshicon:'ace-icon fa fa-refresh green',
				refreshtext:'刷新',
				del : false}).jqGrid('navButtonAdd',"#AlgByRolePager",{
						title:'添加',
						caption:"添加",
						id:"add_AlgRole",
						onClickButton : function addModal(){
								loadAlgOptions();
								$('#addAlgRole_modal').modal();								
								$("#addAlgRoleForm").validate({
									debug:true,
									onsubmit:true,
									onfocusout:false,
									onkeyup:true,
									rules:{
										algID:{
											required:true
										}
									},
									messages:{
										algID:{
											required:"算法不能为空！",
										}
									},
									submitHandler:function(){
										
										addAlgRole();
									}
								});
						},
						position:"first"
					}).jqGrid('navButtonAdd',"#AlgByRolePager",{
						title:'删除',
						caption:"删除",
						buttonicon : 'ace-icon fa fa-times red',
						id:"del_AlgRole",
						onClickButton:delAlgRole,
						position:"first"
					});	
				
		var datagrid = jQuery("#UserList")
		.jqGrid(
				{
					url : "listUser.action",// 后端的数据交互程序，改为你的
					datatype : "json",// 前后交互的格式是json数据
					mtype : 'POST',// 交互的方式是发送httpget请求						
					colNames : [ '用户名','添加时间','上次登录时间','登录次数','角色ID'],// 表格的列名
					colModel : [
							{
								name : 'username',
								index : 'username',
								width : 50,
								align : "center",
								sortable:true,
							},
							{
								name : 'addTime',
								index : 'addTime',
								width : 200,
								align : "center",
								sortable:true,
								formatter : function(value, grid, rows,
										state) {
									if(rows.addTime!=null){
										return rows.addTime.replace("T"," ");
									}else{
										return "";
									}
								}
							},
							{
								name:'lastLoginTime',
								index:'lastLoginTime',
								width:200,
								sortable:true,
								formatter : function(value, grid, rows,
										state) {
									if(rows.lastLoginTime!=null){
										return rows.lastLoginTime.replace("T"," ");
									}else{
										return "";
									}
								}
							},
							{
								name:'loginTimes',
								index:'loginTimes',
								width:200,
								sortable:true
							},
							{
								name:'userid',
								index:'userid',
								width:200,
								hidden:true
							}
							],
//					autowidth:true,
//					editurl:"editData.action",
					rowNum:10,//每一页的行数
					height: 'auto',
					width:$(document).width()-80,
					rowList:[10,20,30],
					pager: '#UserPager',
					sortname: 'userid',
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
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
					caption: "用户列表",//表格名称,
					jsonReader : {// 读取后端json数据的格式
						root : "dataList",// 保存详细记录的名称
						total: "total",//总共有页
						page: "page",//当前是哪一页
						records : "records",// 总共记录数
						repeatitems : false
					}
				});

		datagrid.jqGrid('navGrid','#UserPager',{
				edit : false,
				add : false,
				search:false,
				refreshicon:'ace-icon fa fa-refresh green',
				refreshtext:'刷新',
				del : false}).jqGrid('navButtonAdd',"#UserPager",{
						title:'删除',
						caption:"删除",	
						buttonicon : 'ace-icon fa fa-times red',
						id:"delete_user",
						onClickButton:deleteUser,
						position:"first"
					});
		
		}
);

/*
 * 添加角色
 */
function add_role() {
	//alert(hideFilePath);
	$.ajax({
		type : 'POST',
		url : 'addRole.action',
		data : {
			roleName:$("#roleName").val(),
			roleDes : $("#roleDescription").val()	
		},
		success : function(data) {
			alert('添加成功');
			$('#add_role_modal').modal('hide');
			$("#RoleList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter('通信错误！');
			$('#add_role_modal').modal('hide');
			$("#RoleList").trigger("reloadGrid");
		}
	});
	}
/*
 * 删除角色
 */
function deleteRole() {
    var sels = $("#RoleList").jqGrid('getGridParam','selarrrow'); 
    if(sels==""){ 
       //$().message("请选择要删除的项！"); 
       alert("请选择要删除的项!");
    }else{ 
    	var selectedIDs={};
    	$.each(sels,function(i,n){ 
          if(sels[i]!=""){ 
        	  var rowData = $("#RoleList").jqGrid("getRowData", sels[i]);
        	  selectedIDs["ids[" + i + "]"]=rowData.roleID;
          } 
    	}); 

       if(confirm("您是否确认删除？")){ 
        $.ajax({ 
          type: "POST", 
          url: "delRole.action", 
          data: selectedIDs, 
          beforeSend: function() { 
               $().message("正在请求..."); 
          }, 
          error:function(){ 
               $().message("请求失败..."); 
          }, 
          
          success: function(data){ 
        	alert("删除成功！");
			$("#RoleList").trigger("reloadGrid");
          } 
        }); 
       } 
    } 
	}

/*
 * 根据角色查看用户
 */
function viewUserByRole(roleID){
	 jQuery("#UserByRoleList").jqGrid("setGridParam", { 
		 url: "listUserByRole.action", //设置表格的url 
		 datatype: "json", //设置数据类型 
		 postData: {
			 roleID:roleID,
//			pointPraID:$("#gridTable").jqGrid("getRowData", $("#gridTable").jqGrid("getGridParam", "selrow")).ID
				} 
	 }); 
	$("#selRoleID").val(roleID);
	$('#UserByRoleList').trigger("reloadGrid");
	$('#listUserByRole_modal').modal();
	}
/*
 * 添加用户角色关系
 */
function addUserRole() {

	$.ajax({
		type : 'POST',
		url : 'addUserRole.action',
		data : {			
			userID:$("#userID").val(),	
			roleID:$("#selRoleID").val()
		},
		success : function(data) {
			alert('添加成功');
			$('#addUserRole_modal').modal('hide');
			$("#UserByRoleList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter(msg);
			$('#addUserRole_modal').modal('hide');
			$("#UserByRoleList").trigger("reloadGrid");
		}
	});
	}
/*
 * 解除用户角色关系
 */
function delUserRole(){
	
	 var sels = $("#UserByRoleList").jqGrid('getGridParam','selarrrow'); 
	    if(sels==""){ 
	       //$().message("请选择要删除的项！"); 
	       alert("请选择要删除的项!");
	    }else{ 
	    	var selectedIDs={};
	    	$.each(sels,function(i,n){ 
	          if(sels[i]!=""){ 
	        	  var rowData = $("#UserByRoleList").jqGrid("getRowData", sels[i]);
	        	  selectedIDs["ids[" + i + "]"]=rowData.userRoleID;
	          } 
	    	}); 

	       if(confirm("您是否确认删除？")){ 
	        $.ajax({ 
	          type: "POST", 
	          url: "delUserRole.action", 
	          data: selectedIDs, 
	          beforeSend: function() { 
	               $().message("正在请求..."); 
	          }, 
	          error:function(){ 
	               $().message("请求失败..."); 
	          }, 
	          
	          success: function(msg){ 
	        	alert("删除成功！");
				$("#UserByRoleList").trigger("reloadGrid");
	               if(msg!=0){ 
	                   var arr = msg.split(','); 
	                   $.each(arr,function(i,n){ 
	                         if(arr[i]!=""){ 
	                             $("#UserByRoleList").jqGrid('delRowData',n);  
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
 * 加载用户下拉列表
 */
function loadUserOptions(){
	$.ajax({
		url:'listUserNoRole.action',
		type:'post',
		dataType:'json',
		success:function(data){
			var items="";
			$.each(data.dataList,function(i,user){
				items+= "<option value=\"" + user.userid + "\">" + user.username + "</option>"; 
			});
			$("#userID").html(items);
		}
	});
	}

/*
 * 根据角色查看算法
 */
function viewAlgByRole(roleID){
	 jQuery("#AlgByRoleList").jqGrid("setGridParam", { 
		 url: "listAlgByRole.action", //设置表格的url 
		 datatype: "json", //设置数据类型 
		 postData: {
			 roleID:roleID,
//			pointPraID:$("#gridTable").jqGrid("getRowData", $("#gridTable").jqGrid("getGridParam", "selrow")).ID
				} 
	 }); 
	$("#selRoleID").val(roleID);
	$('#AlgByRoleList').trigger("reloadGrid");
	$('#listAlgByRole_modal').modal();
	}
/*
 * 添加用户算法关系
 */
function addAlgRole() {

	$.ajax({
		type : 'POST',
		url : 'addAlgRole.action',
		data : {			
			algID:$("#algID").val(),	
			roleID:$("#selRoleID").val()
		},
		success : function(data) {
			alert('添加成功');
			$('#addAlgRole_modal').modal('hide');
			$("#AlgByRoleList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter(msg);
			$('#addAlgRole_modal').modal('hide');
			$("#AlgByRoleList").trigger("reloadGrid");
		}
	});
	}
/*
 * 解除用户角色关系
 */
function delAlgRole(){
	
	 var sels = $("#AlgByRoleList").jqGrid('getGridParam','selarrrow'); 
	    if(sels==""){ 
	       //$().message("请选择要删除的项！"); 
	       alert("请选择要删除的项!");
	    }else{ 
	    	var selectedIDs={};
	    	$.each(sels,function(i,n){ 
	          if(sels[i]!=""){ 
	        	  var rowData = $("#AlgByRoleList").jqGrid("getRowData", sels[i]);
	        	  selectedIDs["ids[" + i + "]"]=rowData.algRoleID;
	          } 
	    	}); 

	       if(confirm("您是否确认删除？")){ 
	        $.ajax({ 
	          type: "POST", 
	          url: "delAlgRole.action", 
	          data: selectedIDs, 
	          beforeSend: function() { 
	               $().message("正在请求..."); 
	          }, 
	          error:function(){ 
	               $().message("请求失败..."); 
	          },          
	          success: function(msg){ 
	        	alert("删除成功！");
				$("#AlgByRoleList").trigger("reloadGrid");
	          } 
	        }); 
	       } 
	    } 
	
	}

/*
 * 加载算法下拉列表
 */
function loadAlgOptions(){
	$.ajax({
		url:'listAlgorithmsCycle.action',
		type:'post',
		data:{
			sidx:"ID",
			sord:"desc"
		},
		dataType:'json',
		success:function(data){
			var items="";
			$.each(data.dataList,function(i,alg){
				items+= "<option value=\"" + alg.ID + "\">" + alg.name + "</option>"; 
			});
			$("#algID").html(items);
		}
	});
	}

function deleteUser() {
    var sels = $("#UserList").jqGrid('getGridParam','selarrrow'); 
    if(sels==""){ 
       //$().message("请选择要删除的项！"); 
       alert("请选择要删除的项!");
    }else{ 
    	var selectedIDs={};
    	$.each(sels,function(i,n){ 
          if(sels[i]!=""){ 
        	  var rowData = $("#UserList").jqGrid("getRowData", sels[i]);
        	  selectedIDs["ids[" + i + "]"]=rowData.userid;
          } 
    	}); 

       if(confirm("您是否确认删除？")){ 
        $.ajax({ 
          type: "POST", 
          url: "delUser.action", 
          data: selectedIDs, 
          beforeSend: function() { 
               $().message("正在请求..."); 
          }, 
          error:function(){ 
               $().message("请求失败..."); 
          }, 
          
          success: function(msg){ 
        	alert("删除成功！");
			$("#UserList").trigger("reloadGrid");
               if(msg!=0){ 
                   var arr = msg.split(','); 
                   $.each(arr,function(i,n){ 
                         if(arr[i]!=""){ 
                             $("#UserList").jqGrid('delRowData',n);  
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
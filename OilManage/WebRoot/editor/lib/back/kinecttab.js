/*function updatePraVal(){
	var gr = jQuery("#PointPraList").jqGrid('getGridParam','selrow');
	if( gr != null ) jQuery("#PointPraList").jqGrid('editGridRow',gr,{height:280,reloadAfterSubmit:false});
	else alert("Please Select Row");
}*/
var TabTools=function (){
	
	/*
	 * 图形项目列表
	 */
	this.datagrid = jQuery("#GUIProList")
	.jqGrid(
			{
				url : "listGUIPro.action",// 后端的数据交互程序，改为你的
				datatype : "json",// 前后交互的格式是json数据
				mtype : 'POST',// 交互的方式是发送httpget请求						
				colNames : [ '编号', '项目名称', '作者','描述','添加时间','操作'],// 表格的列名
				colModel : [
						{
							name : 'id',
							index : 'ID',
							width : 50,
							align : "center",
							sortable:true,
							sorttype:'int'
						},// 每一列的具体信息，index是索引名，当需要排序时，会传这个参数给后端
						{
							name : 'proname',
							index : 'proname',
							width : 100,
							align : "center",
							sortable:true
						},
						{
							name:'author',
							index:'author',
							width:100,
							align:'center',
							sortable:true
						},
						{
							name:'description',
							index:'description',
							width:100,
							align:'center',
							sortable:false,
							formatter : function(value, grid, rows,
									state) {
								return "<a title=\""+rows.description+"\" href=\"javascript:void(0)\" style=\"color:#798991\">"+rows.description+"</a>"
							}
						},
						{
							name:'addTime',
							index:'addTime',
							width:100,
							align:'center',
							sortable:true,
							formatter : function(value, grid, rows,
									state) {
								return rows.addTime.replace("T"," ");
							}
						},
						{
							name : 'load',
							index : 'load',
							width : 100,
							align : "center",
							formatter : function(value, grid, rows,
									state) {
//								alert(rows.id);
								return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"tabtools.load('"
										+ rows.id + "')\">加载</a>"
							}
						}					
	
						],
//				autowidth:true,
				rowNum:10,//每一页的行数
				height: 'auto',
				width:1000,
				rowList:[10,20,30],
				pager: '#GUIProPager',
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
				caption: "模型列表"//表格名称       
				
			});
	$('#GUIProList').trigger("reloadGrid");

	

	
	this.listGUIProGrid=function(isFirst){
		jQuery("#GUIProList").jqGrid("setGridParam", { 
			url: "listGUIPro.action", //设置表格的url 
			datatype: "json" //设置数据类型 
		}); 
		$('#GUIProList').trigger("reloadGrid");
	/*	if(isFirst){//如果是刷新页面后在弹出框上点击的新建，则去掉关闭按钮
			$("#listGUIPro_modal_close").remove();
		}else{
			
		}*/
		$('#listGUIPro_modal').modal({  
			backdrop:'static',
		     keyboard:false,
		     show:true
		     });
	 }

	this.createNewModal=function(isFirst){
		newone=new Paintings();
		platform.addPainting(newone.init());
		// 配置对话框
		loadAuthorOptions();//加载作者选项
	/*	if(isFirst){//如果是刷新页面后在弹出框上点击的新建，则去掉关闭按钮
			$("#add_GUI_modal_close").remove();
		}else{
			
		}*/
		$('#add_GUI_modal').modal({  
			backdrop:'static',//后面遮罩背景不允许关闭
		     keyboard:false,//esc键禁用关闭
		     show:true});
		$("#addGUIForm").validate({
			debug:true,
			onsubmit:true,
			onfocusout: function(element) { $(element).valid(); },
		    onkeyup: function(element) { $(element).valid(); },
			rules:{
				proname:{
					required:true
				},
				authorID:{
					required:true
				},
				type:{
					digits:true                 
				}
			},
			messages:{
				proname:{
					required:"名称不能为空！",
				},							
				authorID:{
					required:"请选择作者！"
				},
				type:{
					digits:"请输入整数", 
				}
			},
			submitHandler:function(){
				createNew();
			}
		});
			
	}
	/*
	 * 添加图形项目
	 */
	var createNew=function() {
//		if($('#selectedID').val()==''){
			jsondata=platform.selectPainting.p.toJSON();
			$.ajax({
				type : 'POST',
				url : 'addGUIPro.action',
				data : {
					description:$("#description").val(),
					name:$('#proname').val(),
					data:jsondata,
					authorID:$("#authorID").val(),
					type:0
				},
				success : function(data) {
					if(data.nameFlag=="true"){
						alert("项目名称已经存在，请重新填写！");
					}else{
						alert('项目新建成功!');
						log('项目'+data.name+'新建成功!');
						$('#add_GUI_modal').modal('hide');
						tabtools.load(data.ID);						
					}	
				},
				error:function(msg){
					alert(msg);
					$('#add_GUI_modal').modal('hide');				
				}
			});

	}

	this.save=function() {
		//selectPainting=Kinetic.Node.create(jsondata, 'container')
		var selectedID=platform.selectPainting.ID;
		recSaveChildren(selectedID);
		updateGUIByID(selectedID);
				
	}
	function recSaveChildren(selectedID){//递归保存所有子项目的painting
		$("input[name='fProID']").each(function(){//找出所有子项目painting。	
            if($(this).val()==selectedID){
            	var $proID=$(this).parent().find("input[name='proID']").val();
            	recSaveChildren($proID);//保存之前先保存子项目
            	var $index=$(this).parent().find("input[name='paintingIndex']").val();
            	updateGUIByIndex($index);
            }
         });
	}
	function updateGUIByID(ID){
		paintingtemp=platform.getPaintingByID(ID);
		updateGUIByPaint(paintingtemp);
	}
	function updateGUIByIndex(index){
		paintingtemp=platform.getPaintingByIndex(index);
		updateGUIByPaint(paintingtemp);
		
	}
	function updateGUIByPaint(paintingtemp){
		
		//paintingtemp=platform.getPaintingByIndex(index);
		paintingtemp.updateConnects();
		paintingtemp.updatePoints();
		jsondata=paintingtemp.p.toJSON();
		//console.log(jsondata);
		s=JSON.stringify(paintingtemp.connects);
		//console.log(s);
		$.ajax({
			type : 'POST',
			url : 'updateGUIPro.action',
			data : {			
				data:jsondata,
				Points:JSON.parse(JSON.stringify(paintingtemp.points)),
				Conns: s,
				scaleN:paintingtemp.scaleN,				
				ID:paintingtemp.ID,
			},
			success : function(data) {
				//alert('项目保存成功!');
				log('项目'+paintingtemp.name+'已保存！');
				paintingtemp.clearChange();
				//$('#addAlgorithmInput_modal').modal('hide');
				//$("#AlgorithmInputList").trigger("reloadGrid");			
			},
			error:function(msg){
				alert(msg);
				log('项目'+paintingtemp.name+'保存失败！');
				//$('#addAlgorithmInput_modal').modal('hide');
				//$("#AlgorithmList").trigger("reloadGrid");
			}
		});
	}
	this.switchTab=function(selectedID) {
				platform.showPainting(selectedID);
		
	}
	this.loadSubPro=function(subID,fProID){//subid为子站对应的父元件的nameID,pro_id为父站项目ID
		var exist=0;
		$("input[name='subID']").each(function(){
            if($(this).val()==subID){
				$(this).next().click();
				exist=1;
            }
         });
		
		if(exist==0){
			$.ajax({
				type : 'POST',
				url : 'viewGUIPro.action',
				data : {
					parentID:fProID,
					subID:subID,
					type:1
					
				},
				success : function(data) {
					$('#listGUIPro_modal').modal('hide');
					try{
						saveData=data['dataView']['JSONData'];
					}catch(err){
						alert('该项目模型为空！');
					}
					//alert(saveData);
					//console.log(saveData['JSONData']);
					var newone=Kinetic.Node.create(saveData);
					var id=data['dataView']['id'];
					//$('#selectedID').val(data['dataView']['id']);
					var scalN=data['dataView']['scalN'];
					var name=data['dataView']['proname'];
					var index=platform.addLoadPainting(newone,scalN,id,name);					
					createTab(data['dataView']['proname'],index,subID,id,fProID,"sub");
					//createNewTab(data['dataView']['proname']);
					platform.draw();
					log('子站点'+name+'已打开！');
							
				},
				error:function(msg){
					alert(msg);
				}
			});
		}
	}
	this.load=function(selectedID) {
		var exist=0;
		$("input[name='proID']").each(function(){
            if($(this).val()==selectedID){
				$(this).next().click();
				$('#listGUIPro_modal').modal('hide');
				exist=1;
				
            }
         });

		if(exist==0){
			$.ajax({
				type : 'POST',
				url : 'viewGUIPro.action',
				data : {
					
					ID:selectedID,
					type:0
				},
				success : function(data) {
//					alert('图形化载入成功!');
					//$('#selectedID').val(selectedID);
					//data=jQuery.parseJSON(data);
					$('#listGUIPro_modal').modal('hide');
					try{
						saveData=data['dataView']['JSONData'];
					}catch(err){
						alert('该项目模型为空！');
					}
					//alert(saveData);
					//console.log(saveData['JSONData']);
					var newone=Kinetic.Node.create(saveData);
					var scalN=data['dataView']['scalN'];
					var id=data['dataView']['id'];
					var name=data['dataView']['proname'];
					var index=platform.addLoadPainting(newone,scalN,id,name);				
					createTab(name,index,null,id,null,"pro");
					//createNewTab(data['dataView']['proname']);
					platform.stage.draw();
					log('项目'+name+'已打开！');		
				},
				error:function(msg){
					alert(msg);
				}
			});
		}
	}
	this.load=function(selectedID) {
		var exist=0;
		$("input[name='proID']").each(function(){
            if($(this).val()==selectedID){
				$(this).next().click();
				$('#listGUIPro_modal').modal('hide');
				exist=1;
				
            }
         });

		if(exist==0){
			$.ajax({
				type : 'POST',
				url : 'viewGUIPro.action',
				data : {
					
					ID:selectedID,
					type:0
				},
				success : function(data) {
//					alert('图形化载入成功!');
					//$('#selectedID').val(selectedID);
					//data=jQuery.parseJSON(data);
					$('#listGUIPro_modal').modal('hide');
					try{
						saveData=data['dataView']['JSONData'];
					}catch(err){
						alert('该项目模型为空！');
					}
					//alert(saveData);
					//console.log(saveData['JSONData']);
					var newone=Kinetic.Node.create(saveData);
					var scalN=data['dataView']['scalN'];
					var id=data['dataView']['id'];
					var name=data['dataView']['proname'];
					var index=platform.addLoadPainting(newone,scalN,id,name);				
					createTab(name,index,null,id,null,"pro");
					//createNewTab(data['dataView']['proname']);
					platform.stage.draw();
					log('项目'+name+'已打开！');		
				},
				error:function(msg){
					alert(msg);
				}
			});
		}
	}
	var tabX=50;
	var tabY=50;
	var position;
	 
	function createTab(proname,paintingIndex,subID,proID,fProID,type){
		$("#paintingTabs").children().removeClass("active");
		var tabItem;
		if(type=="sub"){
			tabItem="<li class=\"tab active\"><input name='paintingIndex' value='"+paintingIndex+"' style='display: none;'/><input id="+proID+" name='proID' value='"+proID+"' style='display: none;'/> <input name='subID' value='"+subID+"' style='display: none;'/> <a name='show' style='float:left' href=\"javascript:void(0)\" onclick=\"tabtools.showPainting(this,'"+ paintingIndex + "','"+proID+"')\">"+proname+"</a><input name='fProID' value='"+fProID+"' style='display: none;'/><a  name='hide' onclick=\"tabtools.hidePainting(this,'"+ paintingIndex + "')\" style='float:right;margin-top:-14px;padding-right:2px;'>x</a></li>";			
		}else{
			tabItem="<li class=\"tab active\"><input name='paintingIndex' value='"+paintingIndex+"' style='display: none;'/><input id="+proID+" name='proID' value='"+proID+"' style='display: none;'/> <a name='show' style='float:left' href=\"javascript:void(0)\" onclick=\"tabtools.showPainting(this,'"+ paintingIndex + "','"+proID+"')\">"+proname+"</a><a  name='hide' onclick=\"tabtools.hidePainting(this,'"+ paintingIndex +"')\" style='float:right;margin-top:-14px;padding-right:2px;'>x</a></li>";
		}
		$("#paintingTabs").append(tabItem);
	}
	this.showPainting=function(obj,paintingIndex){
		$("#paintingTabs").children().removeClass("active");
		$(obj).parent().addClass("active");
		//$('#selectedID').val(proID);
		platform.selectPainting.saveScroll();
		platform.showPainting(paintingIndex);
	}
	this.hidePainting=function(obj,paintingIndex){
//		$("#paintingTabs").children().removeClass("active");
//		$(obj).parent().removeClass("active");
		var proIDtemp=$(obj).parent().find("input[name='proID']").val();
		if(platform.getPaintingByIndex(paintingIndex).getChange()){//检测该画布是否已经改变，若改变提示保存。
			if(confirm("该模型已经改变，是否保存？")){
				recSaveChildren(proIDtemp);
				updateGUIByID(proIDtemp);		
			}
		}
		if(proIDtemp){
			$("input[name='fProID']").each(function(){//找出所有子项目painting，并尝试关闭操作。	
	            if($(this).val()==proIDtemp){
	            	$(this).parent().find("a[name='show']").click();
					$(this).parent().find("a[name='hide']").click();		
	            }
	         });
		}
		
		
		var $prevTab=$(obj).parent().prev();//将前一个tab激活
		if($prevTab){
			$prevTab.find("a[name='show']").click();
		}
		
		$(obj).parent().remove();//删除tab
		platform.hidePainting(paintingIndex);//删除tab下的painting画布		
		
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
}

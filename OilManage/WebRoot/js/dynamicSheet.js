
/*var sid = 1;
var proid = 11;
var algid = 27;
var sheetDiv="#sheet1"
var pageDiv="#pager1"
var sheetgrid1 = new SheetGrid();

sheetgrid1.GetDynamicCols(sid, algid);
sheetgrid1.creategrid(proid,sheetDiv,pageDiv);
//sheetgrid1.loadTableData();
*/
function SheetGrid() {
	this.GetSheetName=function(sid,algid,inOrOut){
		var sheetName="";
		$.ajax({
			url:'listSheetTitle.action',
			type:'post',
			dataType:'json',
			data:{
				sheetID:sid,
				algID:algid,
				InOrOut:inOrOut
			},
			async:false,
			success:function(data){
				sheetName=data.sheetName;
			}
		});
		return sheetName;
	};
	this.GetDynamicCols = function(sid, algid,inOrOut) {//动态获取列
		this.inOrOut=inOrOut;
		this.sid = sid;
		this.algid = algid;
		var temp = this;
		$.ajax({
			url : 'listSheetTitle.action',
			type : 'post',
			dataType : 'json',
			data : {
				sheetID : sid,
				algID : algid,
				InOrOut:inOrOut
			},
			async:false,
			success : function(data) {
				
				if (data.msg == null || data.msg == '') {
					temp.colNames = data.sheetTile;// sheet的列名
					temp.colModel = data.colModel;
					temp.sheetName = data.sheetName;//sheet的名字
					
				} else {
					alert(data.msg);
				}

			}
			

		});
	};
	this.loadTableData = function() {//加载表格数据
		var temp = this;
		this.sheetgridpro.jqGrid("setGridParam", {
			postData : {
				sheetID : temp.sid,
				algID : temp.algid,
				InOrOut:temp.inOrOut,
				proID : temp.proid
			}
		}).trigger("reloadGrid");
	}
	this.creategrid = function(proid,sheetDiv,pageDiv,delID) {
		var temp = this;
		this.proid = proid;
		this.sheetgridpro = jQuery(sheetDiv).jqGrid({
			url : "listSheetContent.action",// 后端的数据交互程序，改为你的
			datatype : "json",// 前后交互的格式是json数据
			mtype : 'POST',// 交互的方式是发送httpget请求
			postData : {
				sheetID : temp.sid,
				algID : temp.algid,
				InOrOut:temp.inOrOut,
				proID : temp.proid
			}, 
			// colNames : [ 'id', '项目名称', '上传时间', '地图查看', '编辑', '删除',
			colNames : temp.colNames,// 表格的列名
			colModel : temp.colModel,
			cellEdit:true,
			cellsubmit : 'remote',
			cellurl : 'editSheetContent.action',
			beforeSubmitCell : function(rowid,celname,value,iRow,iCol) { 
				var index_ID=temp.sheetgridpro.jqGrid("getRowData", iRow).Index_ID 
				var z={
						proID:temp.proid,
						sheetID:temp.sid,
						algID : temp.algid,
						InOrOut:temp.inOrOut,
						Index_ID:index_ID,					
						col_ID:iCol-1,
						newValue:value					
					};
				return  z;
				
				} ,
		
			//autowidth : true,
			multiselect : true, // 可多选，出现多选框
			multiselectWidth : 35, // 设置多选列宽度
			rowNum : 10,// 每一页的行数
			height : 'auto',
			width : 1040,
			rowList : [ 10, 20, 30 ],
			pager : pageDiv,			
			viewrecords : true,
			jsonReader : {// 读取后端json数据的格式
				root : "content",// 保存详细记录的名称
				total : "total",// 总共有页
				page : "page",// 当前是哪一页
				records : "records",// 总共记录数
				repeatitems : false
			},
			caption : temp.sheetName// 表格名称,
			

		});

		this.sheetgridpro.jqGrid('navGrid', pageDiv, {
			
			add : true,
			edit : false,
			del : false
		},{},{
			addCaption: "添加记录",
			url:'addSheetContent.action',
			width:500,
			left:200,
			top:20,
			editCaption: "Edit Record",
			bSubmit: "提交",
			bCancel: "取消",
			bClose: "Close",
			saveData: "Data has been changed! Save changes?",
			bYes : "Yes",
			bNo : "No",
			closeAfterAdd:true,
			closeOnEscape:true,
			bExit : "Cancel",
			onclickSubmit : function(params, posdata) { 
				
				data={
					'postMap':posdata	
				}
				return {postMap:JSON.stringify(posdata),proID:temp.proid,
					sheetID:temp.sid,Index_ID:-1,algID : temp.algid,InOrOut:temp.inOrOut}; 
				},
				afterSubmit : function(response, postdata) 
				{ 
		
					//alert(/xs/);
					return [true,"",""] 
				}
		});
		

		this.sheetgridpro.jqGrid('navButtonAdd', pageDiv, {
			title : '删除',
			caption : "删除",
			id : delID,
			position : "first"
		});
		/*
		this.sheetgridpro.jqGrid('navButtonAdd', "#pager1", {
			title : "添加新数据",
			caption : "添加新数据",
			id : 'add_sheet',
			position : "first"
		});
		
		this.sheetgridpro.jqGrid('editGridRow', "new", {
			addCaption: "添加记录",
			url:'addSheetContent.action',
			width:500,
			left:200,
			top:20,
			editCaption: "Edit Record",
			bSubmit: "提交",
			bCancel: "取消",
			bClose: "Close",
			saveData: "Data has been changed! Save changes?",
			bYes : "Yes",
			bNo : "No",
			closeAfterAdd:true,
			bExit : "Cancel",
			onclickSubmit : function(params, posdata) { 
				
				data={
					'postMap':posdata	
				}
				return {postMap:JSON.stringify(posdata),proID:temp.proid,
					sheetID:temp.sid,Index_ID:-1}; 
				}
			
		} );*/
		/*$("#add_sheet").bind("click",arr,function(){
			
			
		});*/
		var temp=this;
		var arr=new Array();
		arr[0]=temp;
		$("#"+delID+"").bind("click",arr,deleteSheet);
	
		
	}
	this.reloadGrid=function(){
		var sheetDiv = "#sheet";
		var inputSheetNum=$("#inputSheetNum").val();
		for(var i=0;i<inputSheetNum;i++){//刷新5个表格
	    	$(sheetDiv+i).trigger("reloadGrid");
	    }
	}

	deleteSheet=function(data) {
		var maptemp={};
		var grid=data.data[0];
		maptemp["proID"]=grid.proid;
		maptemp["sheetID"]=grid.sid;
		maptemp["algID"]=grid.algid;
		maptemp["InOrOut"]=grid.inOrOut;
		 var sels = grid.sheetgridpro.jqGrid('getGridParam','selarrrow'); 
		    if(sels==""){ 
		       //$().message("请选择要删除的项！"); 
		       alert("请选择要删除的项!");
		    }else{ 
		 
		    	for(var i=0;i<sels.length;i++){
		    		if(sels[i]!=""){ 
			        	  var rowData = grid.sheetgridpro.jqGrid("getRowData", sels[i]);
			        	  maptemp["ids[" + i + "]"]=rowData.Index_ID;
			        	 // alert(rowData.Index_ID);
//			        	  alert(rowData.ID);
			          } 
		    	}
		    	 

		       if(confirm("您是否确认删除？")){ 
		        $.ajax({ 
		          type: "POST", 
		          url: "delSheetContent.action", 
		          data: maptemp, 
		          beforeSend: function() { 
		        	  //sheetgrid1.sheetgridpro.message("正在请求..."); 
		          }, 
		          error:function(){ 
		        	 // sheetgrid1.sheetgridpro.message("请求失败..."); 
		          }, 
		          
		          success: function(msg){ 
		        	alert("删除成功！");
		        	grid.sheetgridpro.trigger("reloadGrid");
		              
		          } 
		        }); 
		       } 
		    } 
	}

}

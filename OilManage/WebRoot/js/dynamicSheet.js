
$(
	

	
	function() {
var sid = 0;
var proid = 10;
var algid = 25;

var sheetgrid1 = new SheetGrid();

sheetgrid1.GetDynamicCols(sid, algid);
sheetgrid1.creategrid(proid);
//sheetgrid1.loadTableData();

function SheetGrid() {

	this.GetDynamicCols = function(sid, algid) {

		this.sid = sid;
		this.algid = algid;
		var temp = this;
		$.ajax({
			url : 'listSheetTitle.action',
			type : 'post',
			dataType : 'json',
			data : {
				sheetID : sid,
				algID : algid
			},
			async:false,
			success : function(data) {
				
				if (data.msg == null || msg == '') {
					temp.colNames = data.sheetTile;// 表格的列名
					temp.colModel = data.colModel;
					temp.sheetName = data.sheetName;
				} else {
					alert(data.msg);
				}

			}
			

		});
	}
	this.loadTableData = function() {
		var temp = this;
		this.sheetgridpro.jqGrid("setGridParam", {
			postData : {
				sheetID : temp.sid,
				algID : temp.algid,
				proID : temp.proid
			}
		}).trigger("reloadGrid");
	}
	this.creategrid = function(proid) {
		var temp = this;
		this.proid = proid;
		this.sheetgridpro = jQuery("#sheetTest").jqGrid({
			url : "listSheetContent.action",// 后端的数据交互程序，改为你的
			datatype : "json",// 前后交互的格式是json数据
			mtype : 'POST',// 交互的方式是发送httpget请求
			postData : {
				sheetID : temp.sid,
				algID : temp.algid,
				proID : temp.proid
			},
			// colNames : [ 'id', '项目名称', '上传时间', '地图查看', '编辑', '删除',
			colNames : temp.colNames,// 表格的列名
			colModel : temp.colModel,
			autowidth : true,
			multiselect : true, // 可多选，出现多选框
			multiselectWidth : 35, // 设置多选列宽度
			rowNum : 10,// 每一页的行数
			height : 'auto',
			width : 1230,
			rowList : [ 10, 20, 30 ],
			pager : '#pager1',			
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

		this.sheetgridpro.jqGrid('navGrid', '#pager1', {
			edit : false,
			add : false,
			del : false
		});
		this.sheetgridpro.jqGrid('navButtonAdd', "#pager1", {
			title : '删除',
			caption : "删除",
			id : "delete_sheet",
			onClickButton : deleteSheet,
			position : "first"
		});
		this.sheetgridpro.jqGrid('navButtonAdd', "#pager1", {
			title : "添加新数据",
			caption : "添加新数据",
			onClickButton : addSheet,
			id : 'add_sheet',
			position : "first"
		});
		
	}

	deleteSheet=function() {
		var maptemp={};
		maptemp["proID"]=sheetgrid1.proid;
		maptemp["sheetID"]=sheetgrid1.sid;
		 var sels = sheetgrid1.sheetgridpro.jqGrid('getGridParam','selarrrow'); 
		    if(sels==""){ 
		       //$().message("请选择要删除的项！"); 
		       alert("请选择要删除的项!");
		    }else{ 
		 
		    	for(var i=0;i<sels.length;i++){
		    		if(sels[i]!=""){ 
			        	  var rowData = sheetgrid1.sheetgridpro.jqGrid("getRowData", sels[i]);
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
		        	sheetgrid1.sheetgridpro.trigger("reloadGrid");
		              
		          } 
		        }); 
		       } 
		    } 
	}

	addSheet=function() {
		var temp=this;
		$.ajax({
			type : 'POST',
			url : 'addMap.action',
			async:false,
			data : {
				proid : sheetgrid1.proid
			},
			success : function(data) {
				alert('新地图文件上传成功');
				//temp.sheetgridpro.trigger("reloadGrid");
			}

		});
	}
}
});
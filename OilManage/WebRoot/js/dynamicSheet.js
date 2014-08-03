

		var sid=0;
		var proid=0;
		var algid=25;
		GetDynamicCols(sid,algid);		
	function GetDynamicCols(sid,algid) {
	            $.ajax({
	            	url:'listSheetTitle.action',
	    			type:'post',
	    			dataType:'json',
	    			data : {
	    				sheetID:sid,
	    				algID:algid
	    			},
	                success: function(data) {
	                	if(data.msg==null||msg==''){
	                	
	                    creategrid(data);
	                	}else{
	                		alert(data.msg);
	                	}
	                
	                },
	                beforeSend: function() {
	                    //$.jBox.tip("正在查询数据...", 'loading');
	                }

	            });
	        }	
	
	function creategrid(data) {
		
	var sheetgrid = jQuery("#sheetTest")
			.jqGrid(
					{
						url : "",// 后端的数据交互程序，改为你的
						datatype : "json",// 前后交互的格式是json数据
						mtype : 'POST',// 交互的方式是发送httpget请求
						//colNames : [ 'id', '项目名称', '上传时间', '地图查看', '编辑', '删除',
						colNames : data.sheetTile,// 表格的列名
						colModel : data.colModel,
//						autowidth:true,
						rowNum:10,//每一页的行数
						height: 'auto',
						width:1230,
						rowList:[10,20,30],
						pager: '#pager2',
						sortname: 'id',
						viewrecords: true,
						sortorder: "desc",
						jsonReader: {//读取后端json数据的格式
						root: "dataList",//保存详细记录的名称
						total: "total",//总共有页
						page: "page",//当前是哪一页
						records: "records",//总共记录数
						repeatitems: false
						},
						caption: "地图坐标文件管理",//表格名称,
						jsonReader : {// 读取后端json数据的格式
							root : "dataList",// 保存详细记录的名称
							// total: "total",//总共有页
							// page: "page",//当前是哪一页
							records : "records",// 总共记录数
							repeatitems : false
						},
						caption : "地图坐标文件管理"// 表格名称
					});

	sheetgrid.jqGrid('navGrid', '#pager2', {
		edit : false,
		add : false,
		del : false
	});
	sheetgrid.jqGrid('navButtonAdd', "#pager2", {
		caption : "添加新的地图文件",
		onClickButton : add,
		id : 'mappro',
		position : "first"

	});
	}


function delMap(str) {
	if (confirm("确定要删除这条地图记录吗？")) {
		$.ajax({
			type : 'POST',
			url : 'delMap.action',
			data : {
				id : str

			},
			success : function(data) {
				alert(data['re']);
				$("#list2").trigger("reloadGrid");
			}

		});
	}
}
function showMap(str) {

	$.ajax({
		type : 'POST',
		url : 'viewMap.action',
		data : {
			id : str

		},
		success : function(data) {
			viewMap(data);
		}

	});

}
function add() {

	$.ajax({
		type : 'POST',
		url : 'addMap.action',
		data : {
			proName : $("#projectname").val(),
			filePath : $("#hideFilePath").val()
		},
		success : function(data) {
			alert('新地图文件上传成功');
			$("#list2").trigger("reloadGrid");
		}

	});
}

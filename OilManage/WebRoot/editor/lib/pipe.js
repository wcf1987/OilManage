function testpipe1(){

	alert(/tools2/);
}

function pipeInit(){
	algID=0;
	proID=0;
	pipeName="";
	var Pipegrid =jQuery("#PipePraList").jqGrid({
	   	url:'listPipe.action',
		datatype: "json",
		mtype : 'POST',
		postData : {
			algID : algID,
			InOrOut:"Out",
			proID : proID,
			pipeName:pipeName
		}, 
	   	colNames:['序号','管道名称','里程(m)','高程(m)','压力(MPa)','流量(m3/d)','温度(℃)'],
	   	colModel:[
	   		{name:'序号',index:'序号', width:100,align:"center"},
	   		{name:'管道名称',index:'管道名称', width:100, align:"center"},
	   		{name:'里程(m)',index:'里程(m)', width:100,align:"center"},
	   		{name:'高程(m)',index:'高程(m)', width:100, align:"center"},
	   		{name:'压力(MPa)',index:'压力(MPa)', width:100,align:"center"},
	   		{name:'流量(m3/d)',index:'流量(m3/d)', width:100, align:"center"},
	   		{name:'温度(℃)',index:'温度(℃)', width:100, align:"center"}
	   	],
	   	width:'auto',//530
	   	height:'auto',
	   	rowNum:10,
	   	rowList:[10,20,30],		   	
	   	sortname: 'id',
	    viewrecords: true,
	    sortorder: "desc",		   
		caption: "管道列表",
		jsonReader: {//读取后端json数据的格式
			root: "pipeList",//保存详细记录的名称
			total: "total",//总共有多少页
			page: "page",//当前是哪一页
			records: "records",//总共记录数
			repeatitems: false
		},
	});
	/*
	var Pipegrid =jQuery("#PipePraList").jqGrid({
	   	url:'listPipe.action',
		datatype: "json",
		mtype : 'POST',
		postData : {
			algID : algID,
			InOrOut:"Out",
			proID : proID
			pipeName:pipeName
		}, 
	   	colNames:['序号','管道名称','里程(m)','高程(m)','压力(MPa)','流量(m3/d)','温度(℃)'],
	   	colModel:[
	   		{name:'序号',index:'序号', width:100,align:"center"},
	   		{name:'管道名称',index:'管道名称', width:100, align:"center"},
	   		{name:'里程(m)',index:'里程(m)', width:100,align:"center"},
	   		{name:'高程(m)',index:'高程(m)', width:100, align:"center"},
	   		{name:'压力(MPa)',index:'压力(MPa)', width:100,align:"center"},
	   		{name:'流量(m3/d)',index:'流量(m3/d)', width:100, align:"center"},
	   		{name:'温度(℃)',index:'温度(℃)', width:100, align:"center"}
	   	],
	   	width:'auto',//530
	   	height:'auto',
	   	rowNum:10,
	   	rowList:[10,20,30],		   	
	   	sortname: 'id',
	    viewrecords: true,
	    sortorder: "desc",		   
		caption: "管道列表",
		jsonReader: {//读取后端json数据的格式
			root: "pipeList",//保存详细记录的名称
			total: "total",//总共有多少页
			page: "page",//当前是哪一页
			records: "records",//总共记录数
			repeatitems: false
		},
	});*/
	//return datagrid;
}
/**/
function closePipeList(){
	$("#PipePra").hide();
}
function showPipe(pipeName,proID,algID,attrtop,attrleft){
	 var lastsel;
		jQuery("#PipePraList").jqGrid("setGridParam", {
			 url: "listPipe.action", //设置表格的url 
			 datatype: "json", //设置数据类型 
			postData : {
				algID : algID,
				InOrOut:"Out",
				proID : proID,
				pipeName:pipeName
			}
		}).trigger("reloadGrid");
		
		$("#PipePra").css({
			top :attrtop,
			left : attrleft,
		}).show();	
	  	
}

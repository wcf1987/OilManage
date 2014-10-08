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
		success:function(data){
			//graphiDraw();
			alert(/ss1/);
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
	   	width:'auto',// 530
	   	height:'auto',
	   	rowNum:10,
	   	rowList:[10,20,30],		   	
	   	sortname: 'id',
	   	pager : PipePraPager,
	    viewrecords: true,
	    sortorder: "desc",		   
		caption: pipeName+"管道沿线参数",
		jsonReader: {// 读取后端json数据的格式
			root: "content",// 保存详细记录的名称
			total: "total",// 总共有多少页
			page: "page",// 当前是哪一页
			records: "records",// 总共记录数
			repeatitems: false
		},
	});
	/*
	 * var Pipegrid =jQuery("#PipePraList").jqGrid({ url:'listPipe.action',
	 * datatype: "json", mtype : 'POST', postData : { algID : algID,
	 * InOrOut:"Out", proID : proID pipeName:pipeName },
	 * colNames:['序号','管道名称','里程(m)','高程(m)','压力(MPa)','流量(m3/d)','温度(℃)'],
	 * colModel:[ {name:'序号',index:'序号', width:100,align:"center"},
	 * {name:'管道名称',index:'管道名称', width:100, align:"center"},
	 * {name:'里程(m)',index:'里程(m)', width:100,align:"center"},
	 * {name:'高程(m)',index:'高程(m)', width:100, align:"center"},
	 * {name:'压力(MPa)',index:'压力(MPa)', width:100,align:"center"},
	 * {name:'流量(m3/d)',index:'流量(m3/d)', width:100, align:"center"},
	 * {name:'温度(℃)',index:'温度(℃)', width:100, align:"center"} ],
	 * width:'auto',//530 height:'auto', rowNum:10, rowList:[10,20,30],
	 * sortname: 'id', viewrecords: true, sortorder: "desc", caption: "管道列表",
	 * jsonReader: {//读取后端json数据的格式 root: "pipeList",//保存详细记录的名称 total:
	 * "total",//总共有多少页 page: "page",//当前是哪一页 records: "records",//总共记录数
	 * repeatitems: false }, });
	 */
	// return datagrid;
}
/**/
function closePipeList(){
	$("#PipePra").hide();
}
function showPipe(pipeName,proID,algID,attrtop,attrleft){
	 var lastsel;
	 jQuery("#PipePraList").jqGrid('setCaption',pipeName+" 管道沿线参数") 
		jQuery("#PipePraList").jqGrid("setGridParam", {
			 url: "listPipe.action", // 设置表格的url
			 datatype: "json", // 设置数据类型
			postData : {
				algID : algID,
				InOrOut:"Out",
				proID : proID,
				pipeName:pipeName
			},
			success:function(data){
				//graphiDraw();
				alert(/ss2/);
			}
		}).trigger("reloadGrid");

		
		$("#PipePra").css({
			top :attrtop,
			left : attrleft,
		}).show();	
	  	
}
function graphiDraw(){

	pipeName=leftpoly.pipeName;
	proID=leftpoly.pipeProID;
	algID=leftpoly.pipeAlgID;
	$.ajax({
		url:'listPipe.action',
		type:'post',
		dataType:'json',
		data : {
			algID : algID,
			InOrOut:"Out",
			proID : proID,
			rows:0,
			pipeName:pipeName
		},
		success:function(data){				
			var drawnew= document.createElement('div');
			// drawnew.innerHTML = "test";
			drawnew.id="graphiPipe";
			drawnew.style="width:1000px; height:400px;margin-top:0px;margin-left:0px;";
			$("#graphiDraw").append(drawnew)	
			// loadLines(pro_id,temp.id,i,drawnew.id);
			
			dataX=createX(data['content']);
			dataY=createY(data['content']);
			drawPipeLines(dataX,dataY,drawnew.id,pipeName);
			}
		});
}
function createX(cont){
	var data=new Array;
	if(cont==null){
		return data;
	}
	for(var i=0;i<cont.length;i++){
		data.push(parseInt(cont[i]['里程(m)']));
	}
	return data;
}
function createY(cont){
	var data=new Array;
	var datatemp=new Array
	if(cont==null){
		return data;
	}
	for(var i=0;i<cont.length;i++){
		datatemp.push( parseFloat(cont[i]['高程(m)']));
	}
	data.push(datatemp);
	datatemp=new Array
	for(var i=0;i<cont.length;i++){
		datatemp.push(parseFloat(cont[i]['压力(MPa)']));
	}
	data.push(datatemp);
	datatemp=new Array
	for(var i=0;i<cont.length;i++){
		datatemp.push(parseFloat(cont[i]['流量(m3/d)']));
	}
	data.push(datatemp);
	datatemp=new Array
	for(var i=0;i<cont.length;i++){
		datatemp.push(parseFloat(cont[i]['温度(℃)']));
	}
	data.push(datatemp);
	return data;
}
function drawPipeLines(XData,YData,container,pipeName){
	var	chart = new Highcharts.Chart({
		  		chart: {
		  			renderTo: container,
			        type: 'line',
			//backgroundColor:'#66ffff',
			  		borderWidth:5
			  		
			  },
	            title: {
	                text: '',
	                x: -20, // center
	                stype:{ "color": "#000000", "fontSize": "18px"}
	            },
	            subtitle: {
	                text: pipeName+'管道沿线参数分布图',
	                x: -20,
	                stype:{ "color": "#000000", "fontSize": "26px"}
	            },
	            xAxis: {
	               categories: XData,
	               gridLineWidth:2,
	               title: {
		                text: '管道长度(m)',
		                x: -20, // center
		                stype:{ "color": "#000000", "fontSize": "18px"}
		            }
	            },
	            yAxis: [
	            	{ //高程(m)
	                    labels: {
	                        formatter: function() {
	                            return this.value +' (m)';
	                        },
	                        style: {
	                            color: '#003366'
	                        }
	                    },
	                    title: {
	                        text: '高程(m)',
	                        style: {
	                            color: '#003366'
	                        }
	                    },
	                    opposite: true

	                }, { // 压力(MPa)
	                    gridLineWidth: 0,
	                    title: {
	                        text: '压力(MPa)',
	                        style: {
	                            color: '#FF00FF'
	                        }
	                    },
	                    labels: {
	                        formatter: function() {
	                            return this.value +' (MPa)';
	                        },
	                        style: {
	                            color: '#FF00FF'
	                        }
	                    }

	                }, { // 流量(m3/d)
	                    gridLineWidth: 0,
	                    title: {
	                        text: '流量(m3/d)',
	                        style: {
	                            color: '#FAFAD2'
	                        }
	                    },
	                    labels: {
	                        formatter: function() {
	                            return this.value +' (m3/d)';
	                        },
	                        style: {
	                            color: '#FAFAD2'
	                        }
	                    }

	                }, { // 温度(℃)
	                    gridLineWidth: 0,
	                    title: {
	                        text: '温度(℃)',
	                        style: {
	                            color: '#FFB6C1'
	                        }
	                    },
	                    labels: {
	                        formatter: function() {
	                            return this.value +' (℃)';
	                        },
	                        style: {
	                            color: '#FFB6C1'
	                        }
	                    },
	                    opposite: true
	                }
	            ],
	            tooltip: {
	                shared: true
	            },
	          
	            legend: {
	                layout: 'vertical',
	                align: 'left',
	                verticalAlign: 'middle',
	                borderWidth: 3
	            },
	            series:  [{
	                name: '高程(m)',
	                type: 'spline',
	                tooltip: {
	                    valueSuffix: ' (m)'
	                },
	                data: YData[0]
	                	// [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3,
						// 18.3, 13.9]
	            }, {
	                name: '压力(MPa)',
	                type: 'spline',
	                tooltip: {
	                    valueSuffix: ' (MPa)'
	                },
	                color:'#FF00FF',
	                data: YData[1]
	            }, {
	                name: '流量(m3/d)',
	                type: 'spline',
	                color:'#FAFAD2',
	                
	                tooltip: {
	                    valueSuffix: ' (m3/d)'
	                },
	                data: YData[2]
	            }, {
	                name: '温度(℃)',
	                type: 'spline',
	                tooltip: {
	                    valueSuffix: ' 温度(℃)'
	                },

	                color:'#FFB6C1',
	                data: YData[3]
	            }]
	          
	        });
	
	}
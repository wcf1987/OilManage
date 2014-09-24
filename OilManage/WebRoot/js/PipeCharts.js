
/*var graphiCharts=new GraphiCharts();
graphiCharts.init(26,7);*/

function GraphiCharts(){
	
	this.init=function (algID,pro_id){
		this.algID=algID
		this.pro_id=pro_id;
		this.graphiArray=new Array;
		$.ajax({
			url:'listPipe.action',
			type:'post',
			dataType:'json',
			data : {
				algID : algID,
				InOrOut:"Out",
				proID : proID,
				pipeName:pipeName
			},
			success:function(data){
				//alert(data['listGraphi'].length);
				var listGraphi=data['listGraphi'];
				
				for (var i=0;i<listGraphi.length;i++){
					var temp=listGraphi[i];
					 
					var drawnew= document.createElement('div');
					//drawnew.innerHTML = "test";
					drawnew.id="graphi"+i;
					drawnew.style="width:50%; height:400px;margin-top:10px;margin-left:200px;";
					$("#graphiDraw").append(drawnew)
					
					//alert(temp.graphiType);
					if (temp.graphiType==0){
						graphiCharts.loadLines(pro_id,temp.id,i,drawnew.id);
					}
					if (temp.graphiType==2){
						graphiCharts.loadBars(pro_id,temp.id,i,drawnew.id);
					}
					if (temp.graphiType==1){
						graphiCharts.loadPies(pro_id,temp.id,i,drawnew.id);
					}
					
					
					
				}
			}
		});
	}
	this.loadLines=function(pro_id,graphid,index,container){
		$.ajax({
			url:'getProGraphi.action',
			type:'post',
			dataType:'json',
			data : {
				pro_id:pro_id,
				graphID:graphid
			},
			success:function(data){				
					var graphitemp=data['graphi'];
					var chart=graphiCharts.drawLines(graphitemp['y'][0].messure,container);
					//alert(1);
					var X=graphitemp['x'];
					//var chart=graphiCharts.graphiArray[index];
					chart.xAxis[0].setCategories(X.value,true);
					chart.xAxis[0].setTitle({
						text: X.display+"   "+X.messure				
						},true); 
					
					var Y=graphitemp['y'];
					
					chart.setTitle({text:graphitemp.graphiName});
					for(var k=0;k<Y.length;k++){
						chart.addSeries({
		                    id:k,
		                    name: Y[k].display,
		                    data: Y[k].value		
		                    }); 
					}
					
			}
			});
	}
	this.drawLines=function(tip,container){
		  var	chart = new Highcharts.Chart({
			  		chart: {
			  			renderTo: container,
				        type: 'line'
				                      },
		            title: {
		                text: '',
		                x: -20 //center
		            },
		            subtitle: {
		                text: '',
		                x: -20
		            },
		            xAxis: {
		               // categories: ['0.1','0.2','0.3','0.4','0.5','0.6']
		            },
		            yAxis: {
		                title: {
		                    text: ''
		                },
		                plotLines: [{
		                    value: 0,
		                    width: 0.01,
		                    color: '#808080'
		                }]
		            },
		            tooltip: {
		                valueSuffix: tip
		            },
		            legend: {
		                layout: 'vertical',
		                align: 'right',
		                verticalAlign: 'middle',
		                borderWidth: 0
		            },
		            series: []
		        });
		     return  chart;
		}
	this.loadBars=function(pro_id,graphid,index,container){
		$.ajax({
			url:'getProGraphi.action',
			type:'post',
			dataType:'json',
			data : {
				pro_id:pro_id,
				graphID:graphid
			},
			success:function(data){				
				var graphitemp=data['graphi'];
				var chart=graphiCharts.drawBars(graphitemp['y'][0].messure,container);
				//alert(1);
				var X=graphitemp['x'];
				//var chart=graphiCharts.graphiArray[index];
				chart.xAxis[0].setCategories(X.value,true);
				chart.xAxis[0].setTitle({
					text: X.display+"   "+X.messure				
					},true); 
				
				var Y=graphitemp['y'];
				
				chart.setTitle({text:graphitemp.graphiName});
				for(var k=0;k<Y.length;k++){
					chart.addSeries({
	                    id:k,
	                    name: Y[k].display,
	                    data: Y[k].value		
	                    }); 
				}
				
			}
			});
	}
	this.loadPies=function(pro_id,graphid,index,container){
		$.ajax({
			url:'getProGraphi.action',
			type:'post',
			dataType:'json',
			data : {
				pro_id:pro_id,
				graphID:graphid
			},
			success:function(data){				
					var graphitemp=data['graphi'];
					if(graphitemp['points']==null){
						return;
					}
					var temp=graphitemp['points'][0];
					var chart=graphiCharts.drawPies(temp.messure,container);					
					temp=graphitemp['points']
					
					chart.setTitle({text:graphitemp.graphiName});
					var tempArr=new Array;
					for(var k=0;k<temp.length;k++){
						tempArr[k]=new Array(temp[k].display,temp[k].value);
					}
					chart.addSeries({
			                type: 'pie',
			                name: '占比',
			                data:tempArr
		            }); 
					/*chart.addSeries( {
		                name: 'London',
		                data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
		            })*/
			}
			});
	}
	
	this.drawBars=function(tip,container){
		  var	chart = new Highcharts.Chart({
			  		chart: {
			  			renderTo: container,
				        type: 'bar'
				                      },
		            title: {
		                text: '',
		                x: -20 //center
		            },
		            subtitle: {
		                text: '',
		                x: -20
		            },
		            /*xAxis: {
		                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
		                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		            },*/
		            
		                  
			        
		            yAxis: {
		                title: {
		                    text: ''
		                },
		                plotLines: [{
		                    value: 0,
		                    width: 1,
		                    color: '#808080'
		                }]
		            },
		            tooltip: {
		                valueSuffix: tip
		            },
		            legend: {
		                layout: 'vertical',
		                align: 'right',
		                verticalAlign: 'middle',
		                borderWidth: 0
		            },
		            series: []
		        });
		     return  chart;
		}
	this.drawPies=function(tip,container){
		  var	chart = new Highcharts.Chart({
			  chart: {
	                plotBackgroundColor: null,
	                renderTo: container,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: 'Browser market shares at a specific website, 2014'
	            },
	            tooltip: {
	        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false
	                    },
	                    showInLegend: true
	                }
	            },

	        });
		     return  chart;
		}
		
}



$(function () { 
		   /* $('#container0').highcharts({
		        chart: {
		            type: 'bar'
		        },
		        title: {
		            text: 'Fruit Consumption'
		        },
		        lang: {
		            printChart: '打印图表',
		            downloadPNG: '下载JPEG 图片',
		            downloadJPEG: '下载JPEG文档',
		            downloadPDF: '下载PDF 文件',
		            downloadSVG: '下载SVG 矢量图',
		            contextButtonTitle: '下载图片'
		
		        },
		        
		        xAxis: {
		            categories: ['Apples', 'Bananas', 'Oranges']
		        },
		        yAxis: {
		            title: {
		                text: 'Fruit eaten'
		            }
		        },
		        series: [{
		            name: 'Jane',
		            data: [1, 0, 4]
		        }, {
		            name: 'John',
		            data: [5, 7, 3]
		        }]
		    });
		    
		     $('#container1').highcharts({
            title: {
                text: 'Monthly Average Temperature',
                x: -20 //center
            },
            subtitle: {
                text: 'Source: WorldClimate.com',
                x: -20
            },
            xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            },
            yAxis: {
                title: {
                    text: 'Temperature (°C)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '°C'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: 'Tokyo',
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
            }, {
                name: 'New York',
                data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
            }, {
                name: 'Berlin',
                data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
            }, {
                name: 'London',
                data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
            }]
        });
        
        // Build the chart
        $('#container2').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'Browser market shares at a specific website, 2014'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['Firefox',   45.0],
                    ['IE',       26.8],
                    {
                        name: 'Chrome',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Safari',    8.5],
                    ['Opera',     6.2],
                    ['Others',   0.7]
                ]
            }]
        });*/
        
        
		});
		
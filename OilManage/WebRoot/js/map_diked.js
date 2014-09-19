
var proID;
var algID;
var InOrOut;
function showObstacle() {
	var proid=$("#proID").val();
	var algid=$("#curAlgID").val();
	var Inorout="In";
	$.ajax({
		type : 'POST',
		url : 'viewObstacle.action',
		data : {
			proID:proid,
			algID:algid,
			InOrOut:Inorout
		},
		success : function(data) {
			drawPointsDiked(data);
			//drawLines(data);
		}

	});

}


var addcallback=function(xyResults,name,points){
//	x = 2*x1-x2，y = 2*y1-y2 
	var pointsTemp=new Array();
	var xyResult = null;
	$.each(xyResults,function(i){
		xyResult = xyResults[i];
		var xyRP=new BMap.Point(xyResult.x,xyResult.y);
		xyPoint=points[i];
		var x=2*xyPoint.x-xyRP.lng;
		var y=2*xyPoint.y-xyRP.lat;
		var point = new BMap.Point(x,y);
		pointsTemp.push(point);
		map.setCenter(point);
		if(i==0){
			var secRingCenter = point;
			var secRingLabel2 = new BMap.Label(name,{offset: new BMap.Size(10,-20), position: secRingCenter});
			secRingLabel2.setStyle({"padding": "2px"});
			map.addOverlay(secRingLabel2);
		}
	});
	var proid=$("#proID").val();
	var algid=$("#curAlgID").val();
	var Inorout="In";
	$.ajax({
		type : 'POST',
		url : 'addObstacle.action',
		data : {
			proID:proid,
			algID:algid,
			InOrOut:Inorout,
			poly:JSON.stringify(pointsTemp),
			obsName:name
		},
		success : function(data) {
			drawPointsDiked(data);
			//drawPoints(data);
			//drawLines(data);
		}

	});
}	

function addObstacle(name,list) {
	BMap.Convertor.transMore(list,0,addcallback,name);
}
function clearMap(){
	pointMap = {};
	 markers = [];
	map.clearOverlays();
}
var pointMap = {};
var markers = [];
var myjingkou = new BMap.Icon("images/icons/jingkou.png",
		new BMap.Size(30, 30), {
			anchor : new BMap.Size(15, 15)
		});

var callback=function(xyResults,i,points){
	var pointsTemp=new Array();
	var xyResult = null;
	var k=-1;
	for(var index in xyResults){
		k++;
		xyResult = xyResults[index];
		if(xyResult.error != 0){continue;}
		var point = new BMap.Point(xyResult.x, xyResult.y);
		pointsTemp.push(point);
		//var marker = new BMap.Marker(point);
		//map.addOverlay(marker);
		map.setCenter(point);
		if(k==0){
			var secRingCenter = point;
			var secRingLabel2 = new BMap.Label(i,{offset: new BMap.Size(10,-20), position: secRingCenter});
			secRingLabel2.setStyle({"padding": "2px"});
			map.addOverlay(secRingLabel2);
		}
	}
    var polygon = new BMap.Polygon(pointsTemp,{strokeColor:"blue",strokeWeight:5, strokeOpacity:0.5});
	map.addOverlay(polygon);
}	
function drawPointsDiked(data){
	backPointCou=0;
	totalPointCou=0;
	id=-1;
	var jsonObject = data;
	//var pointArray = new Array();
	var pMap = jsonObject['obs'];
	var cou=0;
	for(var i in pMap){
		id++;
//		if(id>0){
//			continue;
//		}
		ps = pMap[i];//一个障碍
		var tempPoints= new Array();
		for(var k=0;k<ps.length;k++){
			p=ps[k];	
			var bp=new BMap.Point(p['longitude'], p['latitude']);
			tempPoints.push(bp);
		}
		if(id==1){
		tempPoints= [new BMap.Point(116.3786889372559,39.90762965106183),
		        				  new BMap.Point(116.38632786853032,39.90795884517671),
		        				  new BMap.Point(116.39534009082035,39.907432133833574),
		        				  new BMap.Point(116.40624058825688,39.90789300648029),
		        				  new BMap.Point(116.41413701159672,39.90795884517671)
		        				 ];
		}else if(id==2){
			tempPoints= [new BMap.Point(100.3786889372559,39.90762965106183),
       				  new BMap.Point(100.38632786853032,39.90795884517671),
       				  new BMap.Point(100.39534009082035,39.907432133833574),
       				  new BMap.Point(100.40624058825688,39.90789300648029),
       				  new BMap.Point(100.41413701159672,39.90795884517671)
       				 ];
		}
		BMap.Convertor.transMore(tempPoints,0,callback,i);
		//setTimeout(function(){BMap.Convertor.transMore(tempPoints,0,callback);}, 3000);
	}
}
/*
function callback(xyResults){
	var pointsTemp=new Array();
	var xyResult = null;
	for(var index in xyResults){
		xyResult = xyResults[index];
		if(xyResult.error != 0){continue;
		var point = new BMap.Point(xyResult.x, xyResult.y);
		pointsTemp.push(point);
		var marker = new BMap.Marker(point);
		map.addOverlay(marker);
		map.setCenter(point);
		}
	}
    var polygon = new BMap.Polygon(pointsTemp,{strokeColor:"blue",strokeWeight:5, strokeOpacity:0.5});
	map.addOverlay(polygon);
	
	var obstacle=xyResults;
	var polygon = new BMap.Polygon(obstacle,styleOptions);
	//mapWforGPSDiked.addOverlay(polygon);
	map.addOverlay(polygon);
	
	var secRingCenter=null;
	var secRingLabel2;
	var minLng=180;
	var maxLng=0;
	var minLat=90;
	var maxLat=0;
	//for(var k=0;k<obstacle.length;k++){
	for(var k in obstacle){
		var xyResult=obstacle[k];
		if(xyResult.error != 0){continue;}
		var point = new BMap.Point(xyResult.x, xyResult.y);
		//if(id==0){
			map.centerAndZoom(point, 15);	
		//}
		if(k==0){
			minLng=point.lng;
			maxLng=point.lng;
			minLat=point.lat;
			maxLat=point.lat;
		}else{
			if(point.lng<minLng){
				minLng=point.lng;
			}else if(point.lng>maxLng){
				maxLng=point.lng;
			}	
			if(point.lat<minLat){
				minLat=point.lat;
			}else if(point.lat>maxLat){
				maxLat=point.lat;
			}
		}
	}
	var midLng=(minLng+maxLng)/2;
	var midLat=(minLat+maxLat)/2;
	secRingCenter = new BMap.Point(midLng,midLat);
	secRingLabel2 = new BMap.Label(i,{offset: new BMap.Size(10,-20), position: secRingCenter});
	secRingLabel2.setStyle({"padding": "2px"});
	map.addOverlay(secRingLabel2);	


}
/*
   	var obstacleArray=new Object();
	var totalPointCou=0;
	var backPointCou=0;
	var id=-1;
	var p;
 	function drawPointsDiked(data){
	backPointCou=0;
	totalPointCou=0;
	id=-1;
	var jsonObject = data;
	//var pointArray = new Array();
	var pMap = jsonObject['obs'];
	var cou=0;
	for(var i in pMap){
		id++;
		ps = pMap[i];//一个障碍
		//var tempPoint= new Array();
		for(var k=0;k<ps.length;k++){
			cou++;
			p=ps[k];	
			var bp=new BMap.Point(p['longitude'], p['latitude']);
			obstacleArray[i]=new Array();
			setTimeout(function(){
				BMap.Convertor.translate(bp,0,translateCallback,i,k);    //真实经纬度转成百度坐标
			}, 1000);
			

		}
	
	}
	totalPointCou=cou;//记录外层是否遍历完所有点
}


translateCallback = function (point,i,k){
//	var marker = new BMap.Marker(point);
//	bm.addOverlay(marker);
	obstacleArray[i][k]=point;
	backPointCou++;//记录是否返回所有点
	if(totalPointCou==backPointCou&&totalPointCou>0){
		for(var i in obstacleArray){
			id++;
			var obstacle=obstacleArray[i];
			var polygon = new BMap.Polygon(obstacle,styleOptions);
			//mapWforGPSDiked.addOverlay(polygon);
			map.addOverlay(polygon);
			
			var secRingCenter=null;
			var secRingLabel2;
			var minLng=180;
			var maxLng=0;
			var minLat=90;
			var maxLat=0;
			for(var k=0;k<obstacle.length;k++){
				var point=obstacle[k];
				if(id==0){
					map.centerAndZoom(point, 15);	
				}
				if(k==0){
					minLng=point.lng;
					maxLng=point.lng;
					minLat=point.lat;
					maxLat=point.lat;
				}else{
					if(point.lng<minLng){
						minLng=point.lng;
					}else if(point.lng>maxLng){
						maxLng=point.lng;
					}	
					if(point.lat<minLat){
						minLat=point.lat;
					}else if(point.lat>maxLat){
						maxLat=point.lat;
					}
				}
			}
			var midLng=(minLng+maxLng)/2;
			var midLat=(minLat+maxLat)/2;
			secRingCenter = new BMap.Point(midLng,midLat);
			secRingLabel2 = new BMap.Label(i,{offset: new BMap.Size(10,-20), position: secRingCenter});
			secRingLabel2.setStyle({"padding": "2px"});
			map.addOverlay(secRingLabel2);	
		
		}
	}
}*/

var map ;
var styleOptions = {
	    strokeColor:"red",    //边线颜色。
	    fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
	    strokeWeight: 3,       //边线的宽度，以像素为单位。
	    strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
	    fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
	    strokeStyle: 'solid' //边线的样式，solid或dashed。
	}
var mapWforGPSDiked ;
function initdiked(){
	 map = new BMap.Map("dikedmap", {
		mapType : BMAP_HYBRID_MAP
	}); // 创建Map实例
	var point = new BMap.Point(116.404, 39.915); // 创建点坐标
	map.centerAndZoom(point, 8); // 初始化地图,设置中心点坐标和地图级别。
	map.enableScrollWheelZoom(); //启用滚轮放大缩小

	map.addControl(new BMap.MapTypeControl({
		anchor : BMAP_ANCHOR_TOP_RIGHT
	})); //左上角，默认地图控件
	map.setCurrentCity("北京"); //由于有3D图，需要设置城市哦
	map.addControl(new BMap.NavigationControl({
		anchor : BMAP_ANCHOR_TOP_LEFT
	})); //添加默认缩放平移控件
	 mapWforGPSDiked = new BMapLib.MapWrapper(map, BMapLib.COORD_TYPE_GPS); 

	map.addControl(new BMap.ScaleControl());
	//var marker1 = new BMap.Marker(new BMap.Point(116.384, 39.925)); // 创建标注
	//map.addOverlay(marker1);
	var point = new BMap.Point(116.404, 39.915);
	var overlays = [];
	//回调获得覆盖物信息
	var overlaycomplete = function(e){
    overlays.push(e.overlay);
    if (e.drawingMode == BMAP_DRAWING_POLYLINE || e.drawingMode == BMAP_DRAWING_POLYGON || e.drawingMode == BMAP_DRAWING_RECTANGLE) {
        //result += ' 所画的点个数：' + e.overlay.getPath().length;
        var list=e.overlay.getPath();
        //alert(z.length);
        var name=prompt("请输入障碍区名称","");
        addObstacle(name,list);
    }
    
};


//实例化鼠标绘制工具
var drawingManager = new BMapLib.DrawingManager(map, {
    isOpen: false, //是否开启绘制模式
    enableDrawingTool: true, //是否显示工具栏
    drawingToolOptions: {
        anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
        offset: new BMap.Size(125, 8), //偏离值
        drawingModes : [
                        
                        BMAP_DRAWING_POLYGON
                     ],
        scale: 0.8 //工具栏缩放比例
    },

    polygonOptions: styleOptions, //多边形的样式
});


//添加鼠标绘制工具监听事件，用于获取绘制结果
drawingManager.addEventListener('overlaycomplete', overlaycomplete);


function $(id){
    return document.getElementById(id);
}

function clearAll() {
    for(var i = 0; i < overlays.length; i++){
        map.removeOverlay(overlays[i]);
    }
    overlays.length = 0
}
}		
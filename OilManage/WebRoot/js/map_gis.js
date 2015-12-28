
var qj = new BMap.Icon("editor/icons/qijing.png", new BMap.Size(50, 50), {
	anchor : new BMap.Size(20, 20)
});

var zyclc = new BMap.Icon("editor/icons/zhongyangchulichang.png",
		new BMap.Size(50, 50), {
			anchor : new BMap.Size(20, 20)
		});

var qy = new BMap.Icon("editor/icons/waiyuanjiedian.png",
		new BMap.Size(50, 50), {
			anchor : new BMap.Size(20, 20)
		});
var glq = new BMap.Icon("editor/icons/guolvqi.png", new BMap.Size(50, 50), {
	anchor : new BMap.Size(20, 20)
});
var fsd = new BMap.Icon("editor/icons/waifenshudian.png",
		new BMap.Size(50, 50), {
			anchor : new BMap.Size(20, 20)
		});

var zdzyd = new BMap.Icon("editor/icons/zhudongzengyadian.png", new BMap.Size(
		50, 50), {
	anchor : new BMap.Size(20, 20)
});
var qzyhd = new BMap.Icon("editor/icons/qiaozhuangyehuadian.png",
		new BMap.Size(50, 50), {
			anchor : new BMap.Size(20, 20)
		});
var fz = new BMap.Icon("editor/icons/fazu.png", new BMap.Size(50, 50), {
	anchor : new BMap.Size(20, 20)
});
var jqzyz = new BMap.Icon("images/icons/jiqizengyazhan.png", new BMap.Size(50,
		50), {
	anchor : new BMap.Size(25, 25)
});

function showMapSimIn(data, proid, algid, Inorout) {
	clearMap();
	showWhiteLayer();
	drawPointsGis(data, proid, algid, Inorout);
	drawLines(data);
	mapGis.markerClusterer.addMarkers(mapGis.markers);
};
function showMapSimOut(data, proid, algid, Inorout) {
	clearMap();
	showWhiteLayer();
	drawPointsGis(data, proid, algid, Inorout);
	drawLines(data);
	mapGis.markerClusterer.addMarkers(mapGis.markers);
};
function showMapOptIn(data, proid, algid, Inorout) {
	clearMap();
	showWhiteLayer();
	drawPointsGis(data,proid,algid,"In");
	showObstacle();
	mapGis.markerClusterer.addMarkers(mapGis.markers);

};
function showMapOptOut(data, proid, algid, Inorout) {
	clearMap();
	showWhiteLayer();
	drawPointsGis(data, proid, algid, Inorout);
	showObstacle();
	showPath();
	//drawPointsGis(data, proid, algid, Inorout);
	drawLines(data);
	mapGis.markerClusterer.addMarkers(mapGis.markers);

};
function getMapSimIn(proid, algid, Inorout) {
	$.ajax({
		type : 'POST',
		url : 'viewExcelMap.action',
		data : {
			proID : proid,
			algID : algid,
			InOrOut : Inorout
		},
		success : function(data) {
			if (data['graphi']['GISReal'] == 0) {
				mapGis.GISReal = false;
				// showMapSimIn(data,proid,algid,Inorout);
				TranslateGPS(data, proid, algid, Inorout, showMapSimIn);
			} else {

				mapGis.GISReal = true;
				TranslateGPS(data, proid, algid, Inorout, showMapSimIn);
			}
		}

	});

};
function getMapSimOut(proid, algid, Inorout) {
	$.ajax({
		type : 'POST',
		url : 'viewExcelMap.action',
		data : {
			proID : proid,
			algID : algid,
			InOrOut : "In"
		},
		success : function(data) {
			if (data['graphi']['GISReal'] == 0) {
				mapGis.GISReal = false;
				// showMapSimOut(data,proid,algid,Inorout);
				TranslateGPS(data, proid, algid, Inorout, showMapSimOut);
			} else {

				mapGis.GISReal = true;
				TranslateGPS(data, proid, algid, Inorout, showMapSimOut);
			}

		}

	});

};
function getMapOptIn(proid, algid, Inorout) {

	$.ajax({
		type : 'POST',
		url : 'viewExcelMap.action',
		data : {
			proID : proid,
			algID : algid,
			InOrOut : "In"
		},
		success : function(data) {
			if (data['graphi']['GISReal'] == 0) {
				mapGis.GISReal = false;
				// showMapSimIn(data,proid,algid,Inorout);
				TranslateGPS(data, proid, algid, Inorout, showMapOptIn);
			} else {

				mapGis.GISReal = true;
				TranslateGPS(data, proid, algid, Inorout, showMapOptIn);
			}

		}

	});
};

function getMapOptOut(proid, algid, Inorout) {

	$.ajax({
		type : 'POST',
		url : 'viewExcelMap.action',
		data : {
			proID : proid,
			algID : algid,
			InOrOut : "Out"
		},
		success : function(data) {
			if (data['graphi']['GISReal'] == 0) {
				mapGis.GISReal = false;
				// showMapSimIn(data,proid,algid,Inorout);
				//drawPointsPath(data);
				TranslateGPS(data, proid, algid, Inorout, showMapOptOut);
			} else {

				mapGis.GISReal = true;				
				TranslateGPS(data, proid, algid, Inorout, showMapOptOut);
			}
		
		}
	});
};
function showMap(proid, algid, Inorout) {
	if (Inorout == "In") {
		mapGis = mapIn;

		if (algid > 4) {
			getMapOptIn(proid, algid, Inorout);

		} else {
			getMapSimIn(proid, algid, Inorout);
		}
	} else {
		mapGis = mapOut;
		if (algid > 4) {
			getMapOptOut(proid, algid, Inorout);
		} else {
			getMapSimOut(proid, algid, Inorout);// 如果是查看输出地图，则先加载输入
			// showMapIn(proid,algid,Inorout);
		}
	}

	mapGis.markerClusterer.addMarkers(mapGis.markers);
}
function clearMap() {
	mapGis.markerClusterer.clearMarkers();
	mapGis.pointMap = {};
	mapGis.markers = [];
	mapGis.clearOverlays();
}
var mapGis;
var mapIn;
var mapOut;
function initMapGis(Inorout) {

	if (Inorout == "In") {
		mapIn = new BMap.Map("mapgis" + Inorout, {
			mapType : BMAP_HYBRID_MAP
		});
		mapGis = mapIn;
	} else {
		mapOut = new BMap.Map("mapgis" + Inorout, {
			mapType : BMAP_HYBRID_MAP
		});
		mapGis = mapOut;
	}
	mapGis.pointMap = {};
	mapGis.markers = [];
	mapGis.Inorout = Inorout;
	var point = new BMap.Point(116.404, 39.915); // 
	mapGis.centerAndZoom(point, 8); // 
	mapGis.enableScrollWheelZoom();
	mapGis.addControl(new BMap.MapTypeControl({
		anchor : BMAP_ANCHOR_TOP_RIGHT
	}));
	mapGis.addControl(new BMap.NavigationControl({
		anchor : BMAP_ANCHOR_TOP_LEFT
	}));
	mapGis.addControl(new BMap.ScaleControl());
	var marker1 = new BMap.Marker(new BMap.Point(116.384, 39.925));
	// mapGis.mapWforGPS = new BMapLib.MapWrapper(mapGis,
	// BMapLib.COORD_TYPE_GPS);
	mapGis.addOverlay(marker1);
	var point = new BMap.Point(116.404, 39.915);
	addSwith();
	mapGis.markerClusterer = new BMapLib.MarkerClusterer(mapGis, {
		markers : mapGis.markers,
		isAverangeCenter : true,
		girdSize : 120,
		maxZoom : 14
	});

};
function sumTransGPS(dataAll,data,start,len,callback1){
	
	var pMap=dataAll['graphi']['points'];
	var dataIndex=0;
	var index = 0;
	for ( var i in pMap) {
		
		var p = pMap[i];// 一个point
		
		if(index>=start&&index<start+len){
			
			p.longitude = data.result[dataIndex].x;
			p.latitude = data.result[dataIndex].y;
			dataIndex++;
		}
			
		index++;
		if(index>=start+len){
				break;
		}
		

	}	

	dataAll.GPSSum=dataAll.GPSSum-len;
	//alert(dataAll.pathSum);
	if(dataAll.GPSSum==0){
		callback1(dataAll, dataAll['proID'], dataAll['algID'], dataAll['inOrOut']);
	}
}
function TranslateGPS(dataAll, proid, algid, Inorout, callback1) {
	dataAll.GPSSum = Object.keys(dataAll['graphi']['points']).length ;

	var xy = ''
	var listp = dataAll['graphi']['points'];
	var start=0;
	var len=0;
	for ( var i in listp) {
		if (xy != '') {
			xy = xy + ';';
		}
		xy = xy + listp[i].longitude + "," + listp[i].latitude;
		len++;
		start++;
		if(len>=90){
			TransGPSNet(xy,start-len,dataAll, proid, algid, Inorout, callback1);
			xy='';
			len=0;
		}
	}
	if(len>0){
		TransGPSNet(xy,start-len,dataAll, proid, algid, Inorout, callback1);		
	}	
};
function TransGPSNet(xy,start,dataAll, proid, algid, Inorout, callback1){
	var cb=(function(i,dataall) {
		
		return function(data){
			if (data.status != 0) {
				
				sumTransGPS(dataall, data,i,0,callback1);
			}else{
				
				sumTransGPS(dataall, data,i,data.result.length,callback1);
			}			
		}
	})(start,dataAll);
	$.ajax({
		crossOrigin: true,
		type : 'POST',
		url : 'http://api.map.baidu.com/geoconv/v1/',
		data : {
			coords : xy,
			from : 1,
			to : 5,
			ak : '4bfe7b8632739c89a1b8e95529da1d97'
		},
		dataType : "jsonp",
		// 传递给请求处理程序，用以获得jsonp回调函数名的参数名(默认为:callback)
		jsonp : "callback",
		// 自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名
		callback : "success",
		// 成功获取跨域服务器上的json数据后,会动态执行这个callback函数		
		success : cb
	});
}

function TranslateGPSObs(dataAll, proid, algid, Inorout, callback1) {

	var jsonObject = dataAll;
	// var pointArray = new Array();
	var pMap = jsonObject['obs'];
	var xy = '';
	for ( var i in pMap) {

		ps = pMap[i];// 一个障碍
		var tempPoints = new Array();

		for ( var k = 0; k < ps.length; k++) {
			p = ps[k];
			// var bp=new BMap.Point(p['longitude'], p['latitude']);
			if (xy != '') {
				xy = xy + ';';
			}
			xy = xy + p.longitude + "," + p.latitude;
		}

	}

	$.ajax({
		type : 'GET',
		url : 'http://api.map.baidu.com/geoconv/v1/',
		data : {
			coords : xy,
			from : 1,
			to : 5,
			ak : '4bfe7b8632739c89a1b8e95529da1d97'
		},
		dataType : "jsonp",
		// 传递给请求处理程序，用以获得jsonp回调函数名的参数名(默认为:callback)
		jsonp : "callback",
		// 自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名
		callback : "success",
		// 成功获取跨域服务器上的json数据后,会动态执行这个callback函数
		success : function(data) {

			if (data.status != 0) {
				callback1(dataAll, proid, algid, Inorout);
			}
			var xyResult = new Array();
			var index = 0;

			for ( var i in pMap) {

				ps = pMap[i];// 一个障碍
				var tempPoints = new Array();

				for ( var k = 0; k < ps.length; k++) {
					p = ps[k];
					p.longitude = data.result[index].x;
					p.latitude = data.result[index].y;
					index++;
				}

			}
			callback1(dataAll, proid, algid, Inorout);

		}
	});

};

function addSwith() {

	// 定义一个控件类,即function
	function SwithControl() {
		// 默认停靠位置和偏移量
		this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
		this.defaultOffset = new BMap.Size(400, 10);

	}
	;

	// 通过JavaScript的prototype属性继承于BMap.Control
	SwithControl.prototype = new BMap.Control();

	// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
	// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中

	SwithControl.prototype.initialize = function(mapGis) {
		// 创建一个DOM元素
		var div = document.createElement("div");
		// 添加文字说明
		div.appendChild(document.createTextNode("结构图/GIS地图切换"));
		// 设置样式
		div.style.cursor = "pointer";
		div.style.border = "1px solid gray";
		div.style.backgroundColor = "white";
		// 绑定事件,点击一次放大两级

		div.onclick = function(e) {
			// map.setZoom(map.getZoom() + 2);
			showWhiteLayer();
		};
		// 添加DOM元素到地图中
		mapGis.getContainer().appendChild(div);
		// 将DOM元素返回
		return div;
	};

	// 创建控件
	var myswithCtrl = new SwithControl();
	// 添加到地图当中
	mapGis.addControl(myswithCtrl);
};

function showWhiteLayer() {

	if (mapGis.tileLayer == null) {
		mapGis.tileLayer = new BMap.TileLayer();
		mapGis.tileLayer.getTilesUrl = function(tileCoord, zoom) {
			var url = 'images/white.png'; // 根据当前坐标，选取合适的瓦片图
			return url;
		}
		mapGis.tileLayer.whiteShow = false;
	}

	if (mapGis.tileLayer.whiteShow) {
		/*if (!mapGis.GISReal) {
			alert("本组数据未包含大地坐标，无法显示地理坐标");
			return;
		}*/
		mapGis.removeTileLayer(mapGis.tileLayer);
		mapGis.tileLayer.whiteShow = false;

	} else {
		mapGis.addTileLayer(mapGis.tileLayer);
		mapGis.tileLayer.whiteShow = true;
	}

}
function drawPointsGis(data, proid, algid, Inorout) {

	var jsonObject = data;
	var pointArray = new Array();
	var pMap = jsonObject['graphi']['points'];
	var id = 0;
	for ( var i in pMap) {

		p = pMap[i];

		// BMap.Convertor.translate(pointMap[i],0,translateCallback);
		if (p['type'] == '管道') {
			continue;
		}
		
		mapGis.pointMap[i] = new BMap.Point(p['longitude'], p['latitude']);
		if (p['type'] == '设备连接点') {
			continue;
		}
		if (id == 0) {
			mapGis.centerAndZoom(mapGis.pointMap[i], 15);
			id = 1;
		}
		myicon = qj;
		if (p['type'] == '井数据' || p['type'] == '井位置' || p['type'] == '气井') {
			myicon = qj;
		}
		if (p['type'] == '气源') {
			myicon = qy;
		}
		if (p['type'] == '分输点') {
			myicon = fsd;
		}
		if (p['type'] == '阀') {
			myicon = fz;
		}
		if (p['type'] == '过滤器') {
			myicon = glq;
		}
		if (p['type'] == '阀组数据' || p['type'] == '阀组位置' || p['type'] == '阀') {
			myicon = fz;
		}
		if (p['type'] == '集气站数据' || p['type'] == '集气站位置'
				|| p['type'] == '集气增压站') {
			myicon = jqzyz;

		}

		if (p['type'] == '离心压缩机' || p['type'] == '往复式压缩机') {
			if (p['attribute']['设备位置'] != null
					&& p['attribute']['设备位置'].indexOf('JQZYZ') > -1) {
				myicon = jqzyz;
				;
			}
			if (p['attribute']['设备位置'] != null
					&& p['attribute']['设备位置'].indexOf('ZDZYD') > -1) {
				myicon = zdzyd;
			}
			if (p['attribute']['设备位置'] != null
					&& p['attribute']['设备位置'].indexOf('ZYCLC') > -1) {
				myicon = zyclc;
			}
		}

		if (p['type'] == '中央处理厂数据' || p['type'] == '中央处理厂位置'
				|| p['type'] == '中央处理厂') {
			myicon = zyclc;
		}
		if (p['type'] == '主动增压点数据' || p['type'] == '主动增压点位置'
				|| p['type'] == '主动增压点') {
			myicon = zdzyd;
		}
		if (p['type'] == '撬装液化点数据' || p['type'] == '撬装液化点位置'
				|| p['type'] == '撬装液化点') {
			myicon = qzyhd;
		}

		var markertemp = new BMap.Marker(mapGis.pointMap[i], {
			icon : myicon
		});

		var s = "";
		s = "类别:" + p['type'] + "<br>";
		var attr = p['attribute'];
		for ( var k1 in attr) {
			s = s + k1 + ":" + attr[k1] + "<br>"
		}
		s = s + "经度:" + p['longitude'] + "<br>"
		s = s + "纬度:" + p['latitude'] + "<br>"

		// map.openInfoWindow(infoWindow,pointArray[i]); //开启信息窗口
		markertemp.contStr = s;
		markertemp.proID = proid;
		markertemp.algID = algid;

		markertemp.InOrOut = Inorout;
		if (p['type'] == '井数据') {
			markertemp.InOrOut = 'In';
		}
		markertemp.type = p['type'];
		markertemp.point_name = p['name'];
		markertemp.long = p['longitude'];
		markertemp.lati = p['latitude'];
		markertemp.addEventListener("click", function(data) {

			getDeviceProper(this);

		});
		if (p['type'] == '设备连接点') {

		} else {
			// mapGis.mapWforGPS.addOverlay(markertemp);
			mapGis.addOverlay(markertemp);
		}
		mapGis.enableScrollWheelZoom(false);
		mapGis.markers.push(markertemp);
	}

};
function getDeviceProper(markPoi) {

	var proID = $("#proID").val();
	$.ajax({
		url : 'listDevice.action',
		type : 'post',
		async : true, // 异步请求
		data : {
			algID : markPoi.algID,
			InOrOut : markPoi.InOrOut,
			proID : markPoi.proID,
			type : markPoi.type,// 元素点的类型
			name : markPoi.point_name
		},
		dataType : 'json',
		success : function(data) {
			var Prop = data['deviceKV'];

			var s = "";
			s = "类别:" + markPoi.type + "<br>";
			for ( var k2 = 0; k2 < Prop.length; k2++) {
				s = s + Prop[k2]['name'] + " : " + Prop[k2]['value'] + "<br>";
			}
			if (this.long != undefined) {
				s = s + "经度:" + this.long + "<br>"
				s = s + "纬度:" + this.lati + "<br>"
			}

			var opts = {
				width : 300, // 信息窗口宽度
				height : 350, // 信息窗口高度
				title : "节点信息" // 信息窗口标题

			}

			var infoWindow = new BMap.InfoWindow(s, opts);
			markPoi.openInfoWindow(infoWindow);
		}
	});

};
function drawLines(data) {
	var jsonObject = data;
	var pLine = jsonObject['graphi']['lines'];
	for ( var i = 0; i < pLine.length; i++) {
		var l = pLine[i];
		var pointemp = new Array();
		var polyline;
		if (l['type'] == '连接') {
			// alert(pointMap[l['start']]);
			pointemp[0] = mapGis.pointMap[l['start']];
			pointemp[1] = mapGis.pointMap[l['end']];
			polyline = new BMap.Polyline(pointemp, {
				strokeColor : "red",
				strokeWeight : 3,
				strokeOpacity : 0.5
			});
			// map.addOverlay(polyline);
			// addArrow1(polyline, 5, Math.PI / 7);
		}
		if (l['type'] == '井阀组连接') {
			// alert(pointMap[l['start']]);
			pointemp[0] = mapGis.pointMap[l['start']];
			pointemp[1] = mapGis.pointMap[l['end']];
			polyline = new BMap.Polyline(pointemp, {
				strokeColor : "red",
				strokeWeight : 3,
				strokeOpacity : 0.5
			});
			// map.addOverlay(polyline);
			// addArrow1(polyline, 5, Math.PI / 7);
		}
		if (l['type'] == '阀组集气站连接') {
			pointemp[0] = mapGis.pointMap[l['start']];
			pointemp[1] = mapGis.pointMap[l['end']];
			polyline = new BMap.Polyline(pointemp, {
				strokeColor : "blue",
				strokeWeight : 6,
				strokeOpacity : 0.5
			});
			// map.addOverlay(polyline);
			// addArrow2(polyline, 5, Math.PI / 7)
		}
		if (l['type'] == '集气站中央处理厂连接') {
			pointemp[0] = mapGis.pointMap[l['start']];
			pointemp[1] = mapGis.pointMap[l['end']];
			polyline = new BMap.Polyline(pointemp, {
				strokeColor : "yellow",
				strokeWeight : 9,
				strokeOpacity : 0.5
			});
			// map.addOverlay(polyline);
			// addArrow2(polyline, 5, Math.PI / 7)
		}
		if (l['type'] == '管段连接') {
			pointemp[0] = mapGis.pointMap[l['start']];
			pointemp[1] = mapGis.pointMap[l['end']];
			polyline = new BMap.Polyline(pointemp, {
				strokeColor : "red",
				strokeWeight : 3,
				strokeOpacity : 0.5
			});
			// addArrow2(polyline, 5, Math.PI / 7)
		}
		var s = "<span style='font-size:14px;font-weight:bold'>管道信息</span><br>";
		s = s + "类别:" + p['type'] + "<br>";
		var attr = p['attribute'];
		for ( var k1 in attr) {
			s = s + k1 + ":" + attr[k1] + "<br>"
		}
		polyline.contStr = s;
		polyline.addEventListener("click", function(data) {

			$("#lineAttrContent").html(this.contStr);
			var x = data.clientX;// 移动时根据鼠标位置计算控件左上角的绝对位置
			var y = data.pageY;
			$("#lineAttr").css({
				"display" : "block",
				"top" : y,
				"left" : x,
				"z-index" : 101
			});
			// var opts = {
			// width : 300, // 信息窗口宽度
			// height : 200, // 信息窗口高度
			// title : "管道信息", // 信息窗口标题
			// enableMessage : true,// 设置允许信息窗发送短息
			// message : ""
			// };
			// var infoWindow = new BMap.InfoWindow(this.contStr, opts);
			// this.openInfoWindow(infoWindow);
		});
		mapGis.addOverlay(polyline);
		mapGis.enableScrollWheelZoom(false);
		mapGis.markers.push(polyline);
	}
	// mapGis.markerClusterer.addMarkers(mapGis.markers);
}
function showObstacle() {
	var proid = $("#proID").val();
	var algid = $("#curAlgID").val();
	var Inorout = "In";
	$.ajax({
		type : 'POST',
		url : 'viewObstacle.action',
		data : {
			proID : proid,
			algID : algid,
			InOrOut : Inorout
		},
		success : function(data) {
			TranslateGPSObs(data, proid, algid, Inorout, drawPointsDiked);
			// drawPointsDiked(data);
			// drawLines(data);
		}

	});

}

function drawPointsDiked(data) {

	for ( var obsName in data['obs']) {
		var xyResults = data['obs'][obsName];
		var k = -1;
		var pointsTemp = new Array();
		for ( var index in xyResults) {
			k++;
			
			var point = new BMap.Point(xyResults[index].longitude,
					xyResults[index].latitude);
			pointsTemp.push(point);
			if (k == 0) {
				var secRingCenter = point;
				var secRingLabel2 = new BMap.Label(obsName, {
					offset : new BMap.Size(10, -20),
					position : secRingCenter
				});
				secRingLabel2.setStyle({
					"padding" : "2px"
				});
				mapGis.addOverlay(secRingLabel2);
			}
		}
		var polygon = new BMap.Polygon(pointsTemp, styleOptions);
		mapGis.addOverlay(polygon);
	}
};
function showPath() {
	var proid = $("#proID").val();
	var algid = $("#curAlgID").val();
	var Inorout = "Out";
	
	$.ajax({
		type : 'POST',
		url : 'viewPath.action',
		data : {
			proID : proid,
			algID : algid,
			InOrOut : Inorout
		},
		success : function(data) {	
			var len=0;
			var pMap=data['path'];
			for ( var i in pMap) {
				
				var ps = pMap[i];// 一个障碍
				
				for ( var k = 0; k < ps.length; k++) {
					len++;
				}
			}
			data.pathSum=len;
			TranslateGPSPath(data, proid, algid, Inorout, sumTrans);			
		}

	});

}
function TranslateGPSPath(dataAll, proid, algid, Inorout, callback1) {
	

	var jsonObject = dataAll;
	// var pointArray = new Array();
	var pMap = jsonObject['path'];
	var xy = '';
	var start=0;
	var len=0;
	//alert(dataAll.pathSum);
	len=0;
	for ( var i in pMap) {
		
		ps = pMap[i];// 一个障碍
		var tempPoints = new Array();
		
		for ( var k = 0; k < ps.length; k++) {
			p = ps[k];
			// var bp=new BMap.Point(p['longitude'], p['latitude']);
			if (xy != '') {
				xy = xy + ';';
			}
			xy = xy + p.longitude + "," + p.latitude;
			len++;
			start++;
			if(len>=90){
				TransGPSPathNet(xy,start-len,dataAll, proid, algid, Inorout, callback1);
				xy='';
				len=0;
			}
		}
		
		
		
	}
	if(len>0){
		TransGPSPathNet(xy,start-len,dataAll, proid, algid, Inorout, callback1);		
	}
}
function TransGPSPathNet(xy,start,dataAll, proid, algid, Inorout, callback1){
	var cb=(function(i,dataall) {
		
		return function(data){
			if (data.status != 0) {
				
				callback1(dataall, data,i,0);
			}else{
				
				callback1(dataall, data,i,data.result.length);
			}			
		}
	})(start,dataAll);
	$.ajax({
		crossOrigin: true,
		type : 'POST',
		url : 'http://api.map.baidu.com/geoconv/v1/',
		data : {
			coords : xy,
			from : 1,
			to : 5,
			ak : '4bfe7b8632739c89a1b8e95529da1d97'
		},
		dataType : "jsonp",
		// 传递给请求处理程序，用以获得jsonp回调函数名的参数名(默认为:callback)
		jsonp : "callback",
		// 自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名
		callback : "success",
		// 成功获取跨域服务器上的json数据后,会动态执行这个callback函数		
		success : cb
	});

}
	//console.log(length(xy));




function sumTrans(dataAll,data,start,len,mapgis){
	
	var xyResult = new Array();
	var index = 0;
	var pMap=dataAll['path'];
	var dataIndex=0;
	for ( var i in pMap) {
		
		ps = pMap[i];// 一个path
		for ( var k = 0; k < ps.length; k++) {
			if(index>=start&&index<start+len){
				p = ps[k];
				p.longitude = data.result[dataIndex].x;
				p.latitude = data.result[dataIndex].y;
				dataIndex++;
			}
			
			index++;
			if(index>=start+len){
				break;
			}
		}

	}
	dataAll.pathSum=dataAll.pathSum-len;
	//alert(dataAll.pathSum);
	if(dataAll.pathSum==0){
		drawPointsPath(dataAll);
	}
}
function drawPointsPath(data) {

	for ( var pathName in data['path']) {
		var xyResults = data['path'][pathName];
		var k = -1;
		var pointsTemp = new Array();
		for ( var index in xyResults) {
			k++;
			
			var point = new BMap.Point(xyResults[index].longitude,
					xyResults[index].latitude);
			pointsTemp.push(point);
			if (k == 0) {
				var secRingCenter = point;
				var secRingLabel2 = new BMap.Label(pathName, {
					offset : new BMap.Size(10, -20),
					position : secRingCenter
				});
				secRingLabel2.setStyle({
					"padding" : "2px"
				});
				//mapGis.addOverlay(secRingLabel2);
			}
		}
		var polygon = new BMap.Polygon(pointsTemp,  {
			strokeColor : "black",
			strokeWeight : 3,
			strokeOpacity : 0.5
		});
		mapGis.addOverlay(polygon);
	}
};
var styleOptions = {
	strokeColor : "red", // 边线颜色。
	fillColor : "red", // 填充颜色。当参数为空时，圆形将没有填充效果。
	strokeWeight : 3, // 边线的宽度，以像素为单位。
	strokeOpacity : 0.8, // 边线透明度，取值范围0 - 1。
	fillOpacity : 0.6, // 填充的透明度，取值范围0 - 1。
	strokeStyle : 'solid' // 边线的样式，solid或dashed。
};
function addArrow2(polyline, length, angleValue) { // 绘制箭头的函数
	var linePoint = polyline.getPath();// 线的坐标串
	var arrowCount = linePoint.length;
	for ( var i = 1; i < arrowCount; i++) { // 在拐点处绘制箭头
		var pixelStart = mapGis.pointToPixel(linePoint[i - 1]);
		var pixelEnd = mapGis.pointToPixel(linePoint[i]);
		var angle = angleValue;// 箭头和主线的夹角
		var r = length; // r/Math.sin(angle)代表箭头长度
		var delta = 0; // 主线斜率，垂直时无斜率
		var param = 0; // 代码简洁考虑
		var pixelTemX, pixelTemY;// 临时点坐标
		var pixelX, pixelY, pixelX1, pixelY1;// 箭头两个点
		if (pixelEnd.x - pixelStart.x == 0) { // 斜率不存在是时
			pixelTemX = pixelEnd.x;
			if (pixelEnd.y > pixelStart.y) {
				pixelTemY = pixelEnd.y - r;
			} else {
				pixelTemY = pixelEnd.y + r;
			}
			// 已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法
			pixelX = pixelTemX - r * Math.tan(angle);
			pixelX1 = pixelTemX + r * Math.tan(angle);
			pixelY = pixelY1 = pixelTemY;
		} else // 斜率存在时
		{
			delta = (pixelEnd.y - pixelStart.y) / (pixelEnd.x - pixelStart.x);
			param = Math.sqrt(delta * delta + 1);

			if ((pixelEnd.x - pixelStart.x) < 0) // 第二、三象限
			{
				pixelTemX = pixelEnd.x + r / param;
				pixelTemY = pixelEnd.y + delta * r / param;
			} else// 第一、四象限
			{
				pixelTemX = pixelEnd.x - r / param;
				pixelTemY = pixelEnd.y - delta * r / param;
			}
			// 已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法
			pixelX = pixelTemX + Math.tan(angle) * r * delta / param;
			pixelY = pixelTemY - Math.tan(angle) * r / param;

			pixelX1 = pixelTemX - Math.tan(angle) * r * delta / param;
			pixelY1 = pixelTemY + Math.tan(angle) * r / param;
		}

		var pointArrow = mapGis.pixelToPoint(new BMap.Pixel(pixelX, pixelY));
		var pointArrow1 = mapGis.pixelToPoint(new BMap.Pixel(pixelX1, pixelY1));
		var Arrow = new BMap.Polyline(
				[ pointArrow, linePoint[i], pointArrow1 ], {
					strokeColor : "blue",
					strokeWeight : 6,
					strokeOpacity : 0.5
				});
		mapGis.addOverlay(Arrow);
	}
}
function addArrow1(polyline, length, angleValue) { // 绘制箭头的函数
	var linePoint = polyline.getPath();// 线的坐标串
	var arrowCount = linePoint.length;
	for ( var i = 1; i < arrowCount; i++) { // 在拐点处绘制箭头
		var pixelStart = mapGis.pointToPixel(linePoint[i - 1]);
		var pixelEnd = mapGis.pointToPixel(linePoint[i]);
		var angle = angleValue;// 箭头和主线的夹角
		var r = length; // r/Math.sin(angle)代表箭头长度
		var delta = 0; // 主线斜率，垂直时无斜率
		var param = 0; // 代码简洁考虑
		var pixelTemX, pixelTemY;// 临时点坐标
		var pixelX, pixelY, pixelX1, pixelY1;// 箭头两个点
		if (pixelEnd.x - pixelStart.x == 0) { // 斜率不存在是时
			pixelTemX = pixelEnd.x;
			if (pixelEnd.y > pixelStart.y) {
				pixelTemY = pixelEnd.y - r;
			} else {
				pixelTemY = pixelEnd.y + r;
			}
			// 已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法
			pixelX = pixelTemX - r * Math.tan(angle);
			pixelX1 = pixelTemX + r * Math.tan(angle);
			pixelY = pixelY1 = pixelTemY;
		} else // 斜率存在时
		{
			delta = (pixelEnd.y - pixelStart.y) / (pixelEnd.x - pixelStart.x);
			param = Math.sqrt(delta * delta + 1);

			if ((pixelEnd.x - pixelStart.x) < 0) // 第二、三象限
			{
				pixelTemX = pixelEnd.x + r / param;
				pixelTemY = pixelEnd.y + delta * r / param;
			} else// 第一、四象限
			{
				pixelTemX = pixelEnd.x - r / param;
				pixelTemY = pixelEnd.y - delta * r / param;
			}
			// 已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法
			pixelX = pixelTemX + Math.tan(angle) * r * delta / param;
			pixelY = pixelTemY - Math.tan(angle) * r / param;

			pixelX1 = pixelTemX - Math.tan(angle) * r * delta / param;
			pixelY1 = pixelTemY + Math.tan(angle) * r / param;
		}

		var pointArrow = mapGis.pixelToPoint(new BMap.Pixel(pixelX, pixelY));
		var pointArrow1 = mapGis.pixelToPoint(new BMap.Pixel(pixelX1, pixelY1));
		var Arrow = new BMap.Polyline(
				[ pointArrow, linePoint[i], pointArrow1 ], {
					strokeColor : "red",
					strokeWeight : 3,
					strokeOpacity : 0.5
				});
		mapGis.addOverlay(Arrow);
	}
}

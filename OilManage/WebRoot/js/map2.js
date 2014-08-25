

function showMap(proid,algid,Inorout) {

	$.ajax({
		type : 'POST',
		url : 'viewExcelMap.action',
		data : {
			proID:proid,
			algID:algid,
			InOrOut:Inorout
		},
		success : function(data) {
			drawPoints(data);
			drawLines(data);
		}

	});

}
function clearMap(){
	pointMap = {};
	 markers = [];
	map.clearOverlays();
}
var pointMap = {};
var markers = [];
function drawPoints(data){
	
	var jsonObject = data;
	var pointArray = new Array();
	var pMap = jsonObject['graphi']['points'];
	var id = -1;
	for ( var i in pMap) {
		id++;
		p = pMap[i];
		pointMap[i] = new BMap.Point(p['longitude'], p['latitude']);	
		if(id==0){
			map.centerAndZoom(pointMap[i], 15);
		}
		
		if (p['type'] == '井数据') {
			myicon = myjingkou;
		}
		if (p['type'] == '阀组数据') {
			myicon = myfazu;
		}
		if (p['type'] == '集齐站数据') {
			myicon = myjiqizhan;
			
		}
		if (p['type'] == '中央处理厂数据') {
			myicon = myjiqizhan;
		}
		if (p['type'] == '中央处理厂数据') {
			myicon = myjiqizhan;
		}
		var markertemp = new BMap.Marker(pointMap[i], {
			icon : myicon
		});
		
		var s = "";
		s = "类别:" + p['type']  + "<br>";
		var attr=p['attribute'];
		for(var k1 in attr){
			s = s + k1+":" + attr[k1]+ "<br>"
		}
		s = s + "经度:" + p['longitude'] + "<br>"
		s = s+ "纬度:" + p['latitude'] + "<br>"
		
		
		// map.openInfoWindow(infoWindow,pointArray[i]); //开启信息窗口
		markertemp.contStr=s;
		markertemp.addEventListener("click", function(data) {
			var opts = {
					width : 300, // 信息窗口宽度
					height : 250, // 信息窗口高度
					title : "节点信息", // 信息窗口标题
					enableMessage : true,// 设置允许信息窗发送短息
					message : ""
				}
			var infoWindow = new BMap.InfoWindow(this.contStr, opts);
			this.openInfoWindow(infoWindow);
		});
		map.addOverlay(markertemp);
		map.enableScrollWheelZoom(false);
		markers.push(markertemp);
	}
	

}
function drawLines(data){
	var jsonObject = data;
	var pLine = jsonObject['graphi']['lines'];	
	for ( var i=0;i<pLine.length;i++) {
		var l = pLine[i];
		var pointemp = new Array();
		var polyline ;

		if (l['type'] == '井阀组连接') {
			// alert(pointMap[l['start']]);
			pointemp[0] = pointMap[l['start']];
			pointemp[1] = pointMap[l['end']];
			polyline= new BMap.Polyline(pointemp, {
				strokeColor : "red",
				strokeWeight : 3,
				strokeOpacity : 0.5
			});
			//map.addOverlay(polyline);
			addArrow1(polyline, 5, Math.PI / 7);
		}
		if (l['type'] == '阀组集气站连接') {
			pointemp[0] = pointMap[l['start']];
			pointemp[1] = pointMap[l['end']];
			polyline = new BMap.Polyline(pointemp, {
				strokeColor : "blue",
				strokeWeight : 6,
				strokeOpacity : 0.5
			});
			//map.addOverlay(polyline);
			addArrow2(polyline, 5, Math.PI / 7)
		}
		if (l['type'] == '集气站中央处理厂连接') {
			pointemp[0] = pointMap[l['start']];
			pointemp[1] = pointMap[l['end']];
			polyline = new BMap.Polyline(pointemp, {
				strokeColor : "yellow",
				strokeWeight : 9,
				strokeOpacity : 0.5
			});
			//map.addOverlay(polyline);
			addArrow2(polyline, 5, Math.PI / 7)
		}
		
		var s = "";
		s= "类别:" + p['type']  + "<br>";
		var attr=p['attribute'];
		for(var k1 in attr){
			s = s + k1+":" + attr[k1] + "<br>"
		}		
		polyline.contstr=s;
		polyline.addEventListener("click", function(data) {
			var opts = {
					width : 300, // 信息窗口宽度
					height : 150, // 信息窗口高度
					title : "管道信息", // 信息窗口标题
					enableMessage : true,// 设置允许信息窗发送短息
					message : ""
				};
			//this.contstr
			var infoWindow = new BMap.InfoWindow(this.contStr, opts);
			this.openInfoWindow(infoWindow);
		});
		map.addOverlay(polyline);
		map.enableScrollWheelZoom(false);

		markers.push(polyline);
	}
	var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers,isAverangeCenter:true,girdSize:120,maxZoom:13});
	
}
var myjingkou = new BMap.Icon("images/icons/jingkou.png",
		new BMap.Size(30, 30), {
			anchor : new BMap.Size(15, 15)
		});
var myfazu = new BMap.Icon("images/icons/fazu.png", new BMap.Size(40, 40), {
	anchor : new BMap.Size(20, 20)
});
var myjiqizhan = new BMap.Icon("images/icons/jiqizhan.png", new BMap.Size(50,
		50), {
	// 指定定位位置。
	// 当标注显示在地图上时，其所指向的地理位置距离图标左上
	// 角各偏移10像素和25像素。您可以看到在本例中该位置即是
	// 图标中央下端的尖角位置。
	anchor : new BMap.Size(25, 25)
// 设置图片偏移。
// 当您需要从一幅较大的图片中截取某部分作为标注图标时，您
// 需要指定大图的偏移位置，此做法与css sprites技术类似。
// imageOffset: new BMap.Size(0, 0 - index * 25) // 设置图片偏移
});
function addArrow2(polyline, length, angleValue) { // 绘制箭头的函数
	var linePoint = polyline.getPath();// 线的坐标串
	var arrowCount = linePoint.length;
	for ( var i = 1; i < arrowCount; i++) { // 在拐点处绘制箭头
		var pixelStart = map.pointToPixel(linePoint[i - 1]);
		var pixelEnd = map.pointToPixel(linePoint[i]);
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

		var pointArrow = map.pixelToPoint(new BMap.Pixel(pixelX, pixelY));
		var pointArrow1 = map.pixelToPoint(new BMap.Pixel(pixelX1, pixelY1));
		var Arrow = new BMap.Polyline(
				[ pointArrow, linePoint[i], pointArrow1 ], {
					strokeColor : "blue",
					strokeWeight : 6,
					strokeOpacity : 0.5
				});
		map.addOverlay(Arrow);
	}
}
function addArrow1(polyline, length, angleValue) { // 绘制箭头的函数
	var linePoint = polyline.getPath();// 线的坐标串
	var arrowCount = linePoint.length;
	for ( var i = 1; i < arrowCount; i++) { // 在拐点处绘制箭头
		var pixelStart = map.pointToPixel(linePoint[i - 1]);
		var pixelEnd = map.pointToPixel(linePoint[i]);
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

		var pointArrow = map.pixelToPoint(new BMap.Pixel(pixelX, pixelY));
		var pointArrow1 = map.pixelToPoint(new BMap.Pixel(pixelX1, pixelY1));
		var Arrow = new BMap.Polyline(
				[ pointArrow, linePoint[i], pointArrow1 ], {
					strokeColor : "red",
					strokeWeight : 3,
					strokeOpacity : 0.5
				});
		map.addOverlay(Arrow);
	}
}


function viewMap(data) {
	map.clearOverlays();
	var markers = [];
	var jsonObject = data;
	// alert(jsonObject['re']);
	// alert(jsonObject['graphi']);
	var pointArray = new Array();
	var pMap = jsonObject['graphi']['points'];
	var pLine = jsonObject['graphi']['lines'];
	// alert(pMap['JIQIZHAN']['name']);
	var id = -1;
	pointMap = {};
	
	for ( var i in pMap) {
		id++;
		p = pMap[i];

		pointArray[id] = new BMap.Point(p['longitude'], p['latitude'])
		pointMap[i] = pointArray[id];
		if (p['type'] == 'jingkou') {
			myicon = myjingkou;
			typestr = '井口'
		}
		if (p['type'] == 'fazu') {
			myicon = myfazu;
			typestr = '阀组'
		}
		if (p['type'] == 'jiqizhan') {
			myicon = myjiqizhan;
			typestr = '集气站'
		}
		var markertemp = new BMap.Marker(pointArray[id], {
			icon : myicon
		});
		
		var s = Array();
		s[i] = "类别:" + typestr + "<br>"
		s[i] = s[i] + "名称:" + p['name'] + "<br>"
		s[i] = s[i] + "大地坐标X:" + p['geodeticCoordinatesX'] + "<br>"
		s[i] = s[i] + "大地坐标Y:" + p['geodeticCoordinatesY'] + "<br>"
		s[i] = s[i] + "经度:" + p['longitude'] + "<br>"
		s[i] = s[i] + "纬度:" + p['latitude'] + "<br>"

		var opts = {
			width : 300, // 信息窗口宽度
			height : 300, // 信息窗口高度
			title : "", // 信息窗口标题
			enableMessage : true,// 设置允许信息窗发送短息
			message : ""
		}
		var infoWindow = new BMap.InfoWindow(s[i], opts); // 创建信息窗口对象
		// map.openInfoWindow(infoWindow,pointArray[i]); //开启信息窗口
		markertemp.setTitle(s[i])
		markertemp.addEventListener("click", function(data) {
			temp = this.getTitle()
			var infoWindow = new BMap.InfoWindow(temp, opts);
			this.openInfoWindow(infoWindow);
		});
		map.addOverlay(markertemp);
		map.enableScrollWheelZoom(false);
		markers.push(markertemp);
	}
	var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers,isAverangeCenter:true,girdSize:120,maxZoom:13});

	map.centerAndZoom(pointArray[0], 15);
	for ( var lkey in pLine) {
		var l = pLine[lkey];
		var pointemp = new Array();
		if (l['type'] == '1') {
			// alert(pointMap[l['start']]);
			pointemp[0] = pointMap[l['start']];
			pointemp[1] = pointMap[l['end']];
			var polyline = new BMap.Polyline(pointemp, {
				strokeColor : "red",
				strokeWeight : 3,
				strokeOpacity : 0.5
			});
			map.addOverlay(polyline);
			addArrow1(polyline, 5, Math.PI / 7);
		}
		if (l['type'] == '2') {
			pointemp[0] = pointMap[l['start']];
			pointemp[1] = pointMap[l['end']];
			var polyline = new BMap.Polyline(pointemp, {
				strokeColor : "blue",
				strokeWeight : 6,
				strokeOpacity : 0.5
			});
			map.addOverlay(polyline);
			addArrow2(polyline, 5, Math.PI / 7)
		}
			}
}




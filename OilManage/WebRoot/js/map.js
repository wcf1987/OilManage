var myjingkou = new BMap.Icon("images/icons/jingkou.png", new BMap.Size(30, 30), {    
// 指定定位位置。   
// 当标注显示在地图上时，其所指向的地理位置距离图标左上    
// 角各偏移10像素和25像素。您可以看到在本例中该位置即是   
   // 图标中央下端的尖角位置。    
	anchor: new BMap.Size(0, 0),    
   // 设置图片偏移。   
   // 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
   // 需要指定大图的偏移位置，此做法与css sprites技术类似。    
   //imageOffset: new BMap.Size(0, 0 - index * 25)   // 设置图片偏移    
 });     
var myfazu = new BMap.Icon("images/icons/fazu.png", new BMap.Size(40, 40), {    
	// 指定定位位置。   
	// 当标注显示在地图上时，其所指向的地理位置距离图标左上    
	// 角各偏移10像素和25像素。您可以看到在本例中该位置即是   
	   // 图标中央下端的尖角位置。    
	anchor: new BMap.Size(10, 20),    
	   // 设置图片偏移。   
	   // 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
	   // 需要指定大图的偏移位置，此做法与css sprites技术类似。    
	   //imageOffset: new BMap.Size(0, 0 - index * 25)   // 设置图片偏移    
	 }); 
var myjiqizhan= new BMap.Icon("images/icons/jiqizhan.png", new BMap.Size(50, 50), {    
	// 指定定位位置。   
	// 当标注显示在地图上时，其所指向的地理位置距离图标左上    
	// 角各偏移10像素和25像素。您可以看到在本例中该位置即是   
	   // 图标中央下端的尖角位置。    
	anchor: new BMap.Size(10, 20),    
	   // 设置图片偏移。   
	   // 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
	   // 需要指定大图的偏移位置，此做法与css sprites技术类似。    
	   //imageOffset: new BMap.Size(0, 0 - index * 25)   // 设置图片偏移    
	 }); 
function addArrow2(polyline,length,angleValue){ //绘制箭头的函数  
	var linePoint=polyline.getPath();//线的坐标串  
	var arrowCount=linePoint.length;  
	for(var i =1;i<arrowCount;i++){ //在拐点处绘制箭头  
	var pixelStart=map.pointToPixel(linePoint[i-1]);  
	var pixelEnd=map.pointToPixel(linePoint[i]);  
	var angle=angleValue;//箭头和主线的夹角  
	var r=length; // r/Math.sin(angle)代表箭头长度  
	var delta=0; //主线斜率，垂直时无斜率  
	var param=0; //代码简洁考虑  
	var pixelTemX,pixelTemY;//临时点坐标  
	var pixelX,pixelY,pixelX1,pixelY1;//箭头两个点  
	if(pixelEnd.x-pixelStart.x==0){ //斜率不存在是时  
	    pixelTemX=pixelEnd.x;  
	    if(pixelEnd.y>pixelStart.y)  
	    {  
	    pixelTemY=pixelEnd.y-r;  
	    }  
	    else  
	    {  
	    pixelTemY=pixelEnd.y+r;  
	    }     
	    //已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法  
	    pixelX=pixelTemX-r*Math.tan(angle);   
	    pixelX1=pixelTemX+r*Math.tan(angle);  
	    pixelY=pixelY1=pixelTemY;  
	}  
	else  //斜率存在时  
	{  
	    delta=(pixelEnd.y-pixelStart.y)/(pixelEnd.x-pixelStart.x);  
	    param=Math.sqrt(delta*delta+1);  
	  
	    if((pixelEnd.x-pixelStart.x)<0) //第二、三象限  
	    {  
	    pixelTemX=pixelEnd.x+ r/param;  
	    pixelTemY=pixelEnd.y+delta*r/param;  
	    }  
	    else//第一、四象限  
	    {  
	    pixelTemX=pixelEnd.x- r/param;  
	    pixelTemY=pixelEnd.y-delta*r/param;  
	    }  
	    //已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法  
	    pixelX=pixelTemX+ Math.tan(angle)*r*delta/param;  
	    pixelY=pixelTemY-Math.tan(angle)*r/param;  
	  
	    pixelX1=pixelTemX- Math.tan(angle)*r*delta/param;  
	    pixelY1=pixelTemY+Math.tan(angle)*r/param;  
	}  
	  
	var pointArrow=map.pixelToPoint(new BMap.Pixel(pixelX,pixelY));  
	var pointArrow1=map.pixelToPoint(new BMap.Pixel(pixelX1,pixelY1));  
	var Arrow = new BMap.Polyline([  
	    pointArrow,  
	 linePoint[i],  
	    pointArrow1  
	], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  
	map.addOverlay(Arrow);  
	}  
}
function addArrow1(polyline,length,angleValue){ //绘制箭头的函数  
	var linePoint=polyline.getPath();//线的坐标串  
	var arrowCount=linePoint.length;  
	for(var i =1;i<arrowCount;i++){ //在拐点处绘制箭头  
	var pixelStart=map.pointToPixel(linePoint[i-1]);  
	var pixelEnd=map.pointToPixel(linePoint[i]);  
	var angle=angleValue;//箭头和主线的夹角  
	var r=length; // r/Math.sin(angle)代表箭头长度  
	var delta=0; //主线斜率，垂直时无斜率  
	var param=0; //代码简洁考虑  
	var pixelTemX,pixelTemY;//临时点坐标  
	var pixelX,pixelY,pixelX1,pixelY1;//箭头两个点  
	if(pixelEnd.x-pixelStart.x==0){ //斜率不存在是时  
	    pixelTemX=pixelEnd.x;  
	    if(pixelEnd.y>pixelStart.y)  
	    {  
	    pixelTemY=pixelEnd.y-r;  
	    }  
	    else  
	    {  
	    pixelTemY=pixelEnd.y+r;  
	    }     
	    //已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法  
	    pixelX=pixelTemX-r*Math.tan(angle);   
	    pixelX1=pixelTemX+r*Math.tan(angle);  
	    pixelY=pixelY1=pixelTemY;  
	}  
	else  //斜率存在时  
	{  
	    delta=(pixelEnd.y-pixelStart.y)/(pixelEnd.x-pixelStart.x);  
	    param=Math.sqrt(delta*delta+1);  
	  
	    if((pixelEnd.x-pixelStart.x)<0) //第二、三象限  
	    {  
	    pixelTemX=pixelEnd.x+ r/param;  
	    pixelTemY=pixelEnd.y+delta*r/param;  
	    }  
	    else//第一、四象限  
	    {  
	    pixelTemX=pixelEnd.x- r/param;  
	    pixelTemY=pixelEnd.y-delta*r/param;  
	    }  
	    //已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法  
	    pixelX=pixelTemX+ Math.tan(angle)*r*delta/param;  
	    pixelY=pixelTemY-Math.tan(angle)*r/param;  
	  
	    pixelX1=pixelTemX- Math.tan(angle)*r*delta/param;  
	    pixelY1=pixelTemY+Math.tan(angle)*r/param;  
	}  
	  
	var pointArrow=map.pixelToPoint(new BMap.Pixel(pixelX,pixelY));  
	var pointArrow1=map.pixelToPoint(new BMap.Pixel(pixelX1,pixelY1));  
	var Arrow = new BMap.Polyline([  
	    pointArrow,  
	 linePoint[i],  
	    pointArrow1  
	], {strokeColor:"red", strokeWeight:3, strokeOpacity:0.5});  
	map.addOverlay(Arrow);  
	}  
}
function uploadComplete(file, data, response) {
	// event,事件对象
	// id:上传进度队列id
	// fileObj={"name":"文件名","filePath":"上传后的服务器文件路径","size":"文件的大小","creationDate":"文件创建时间","modificationDate":"文件最后修改时间","type":"扩展名"}
	// response:文件上传后返回的文本，其实也可以在这里返回文件路径比较简单
	// data={"fileCount":"上传队列中还剩下的文件数","speed":"上传的平均速度"}
	var jsonObject = jQuery.parseJSON(data);
	// alert(jsonObject['re']);
	// alert(jsonObject['graphi']);
	var pointArray = new Array();
	var pMap = jsonObject['graphi']['points'];
	var pLine=jsonObject['graphi']['lines'];
	// alert(pMap['JIQIZHAN']['name']);
	var id = -1;
	pointMap={};
	for ( var i in pMap) {
		id++;
		p = pMap[i];
		
		
		pointArray[id] = new BMap.Point(p['longitude'], p['latitude'])
		pointMap[i]=pointArray[id];
		if(p['type']=='jingkou'){
			myicon=myjingkou;
			typestr='井口'
		}
		if(p['type']=='fazu'){
			myicon=myfazu;
			typestr='阀组'
		}
		if(p['type']=='jiqizhan'){
			myicon=myjiqizhan;
			typestr='集气站'
		}
		var markertemp = new BMap.Marker(pointArray[id],{icon: myicon});

		var s = Array();
		s[i] = "类别:" + typestr + "<br>"
		s[i]=s[i]+"名称:"+p['name']+"<br>"
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
	}
	map.centerAndZoom(pointArray[0], 14);
	for (var lkey in pLine){
		var l=pLine[lkey];
		var pointemp=new Array();
		if(l['type']=='1'){
			//alert(pointMap[l['start']]);
			pointemp[0]=pointMap[l['start']];
			pointemp[1]=pointMap[l['end']];
			var polyline = new BMap.Polyline(pointemp, {
				strokeColor : "red",
				strokeWeight : 3,
				strokeOpacity : 0.5
			});
			map.addOverlay(polyline);
			addArrow1(polyline,5,Math.PI/7);
		}
		if(l['type']=='2'){
			pointemp[0]=pointMap[l['start']];
			pointemp[1]=pointMap[l['end']];
			var polyline = new BMap.Polyline(pointemp, {
				strokeColor : "blue",
				strokeWeight : 6,
				strokeOpacity : 0.5
			});
			map.addOverlay(polyline);
			addArrow2(polyline,5,Math.PI/7)
		}
		
		
	}
	

}

$(document).ready(function() {
	$('#mapfile').uploadify({
		'swf' : 'js/upload/uploadify.swf',
		'uploader' : 'uploadMap.action',
		'queueID' : 'fileQueue',
		'auto' : false,
		'multi' : false,
		'buttonText' : '上传地图文件',
		'fileSizeLimit' : '5MB',
		'fileObjName' : 'mapfile',
		'onUploadSuccess' : uploadComplete,
		'method' : 'post'
	});
});
function showGrid(){
	platform.showGrid();
}
function scaleCenter(s){
	platform.scaleCenter(s);
}
function createNewModal(isFirst){
	tabtools.createNewModal(isFirst);
}
function listGUIProGrid(isFirst){
	tabtools.listGUIProGrid(isFirst);
}
function save(){

	platform.update();
	tabtools.save();
}

function clickLoad(s){
	if(s==1){
		createNewModal(true);
		$('#load_modal').modal('hide');
	}
	else{
		listGUIProGrid(true);
		$('#load_modal').modal('hide');
	}
}

function onMouseWheel(e, delta,dx,dy) {
	event.preventDefault();
    event.stopPropagation();
    var deltaY=event.deltaY;
    var cur_scale=0;
    if (deltaY > 0) {
			cur_scale = 1.25;
			
		} else {
			cur_scale = 0.8;
			
		}
		platform.scaleCenter(cur_scale);
		platform.draw();

}

function checkPoint(pos, rect) {
	
	var size = rect.size();
	if (pos.x > rect.x() && pos.y > rect.y()
			&& (pos.x < rect.x() + size.width)
			&& (pos.y < rect.y() + size.height)) {
		return true;
	}
	return false;
};
function getLeftPoint(g){
	tempArray1 = g.getChildren(function(node) {
		return node.getName() == 'connPointsLeft'				
	});
	
		return tempArray1[0];
	
}
function getRightPoint(g){
	tempArray2 = g.getChildren(function(node) {
		return  node.getName() == 'connPointsRight'
	});
	
	return tempArray2[0];
	
}
function getLeftLine(g){
	tempArray1 = g.getChildren(function(node) {
		return node.getName() == 'lineLeft'				
	});
	
		return tempArray1[0];
	
}
function getRightLine(g){
	tempArray1 = g.getChildren(function(node) {
		return node.getName() == 'lineRight'				
	});
	
		return tempArray1[0];
	
}
function getLeftPointHide(g){
	tempArray1 = g.getChildren(function(node) {
		return node.getName() == 'PointLeft'				
	});
	
		return tempArray1[0];
	
}
function getRightPointHide(g){
	tempArray1 = g.getChildren(function(node) {
		return node.getName() == 'PointRight'				
	});
	
		return tempArray1[0];
	
}
function getPoly(g){
	tempArray1 = g.getChildren(function(node) {
		return node.getName() != 'PointLeft'&&node.getName() != 'PointRight'&&node.getName() != 'lineRight'&&node.getName() != 'lineLeft'&&node.getName() != 'connPointsLeft'&&node.getName() != 'connPointsRight'				
	});
	
		return tempArray1[0];
	
}
function resizePoint(g){
	l=getLeftLine(g);
	lc=getLeftPoint(g);
	// lch=getLeftPointHide(g);
	r=getRightLine(g);
	rc=getRightPoint(g);
	// rch=getRightPointHide(g);
	// poly=getPoly(g);
	if(checkSpecial(g)||checkLinked(g)){
		if(lc!=null){
			lc.x(leftpoly.polywidth+leftpoly.polylineLengthPainting);
			lc.y(leftpoly.polyhight/2);
			l.points(leftpoly.rpointsPainting.concat());
			
			}
			if(rc!=null){
			
				rc.x(leftpoly.polywidth+leftpoly.polylineLengthPainting);
				rc.y(leftpoly.polyhight/2);
				r.points(leftpoly.rpointsPainting.concat());
			}
	}else{
	if(lc!=null){
	lc.x(0-leftpoly.polylineLengthPainting);
	lc.y(leftpoly.polyhight/2);
	l.points(leftpoly.lpointsPainting.concat());
	
	}
	if(rc!=null){
	
		rc.x(leftpoly.polywidth+leftpoly.polylineLengthPainting);
		rc.y(leftpoly.polyhight/2);
		r.points(leftpoly.rpointsPainting.concat());
	}
	}
}
function movePoint(point,dis,rotation){
	if(rotation%360==0){
		realDis=dis
		
	}
	if(rotation%360==90||rotation%360==-270){
		realDis={
				x:dis.y,
				y:-dis.x
		}	
	}
	if(rotation%360==180||rotation%360==-180){
		realDis={
				x:-dis.x,
				y:-dis.y
		}	
	}
	if(rotation%360==270||rotation%360==-90){
		realDis={
				x:-dis.y,
				y:dis.x
		}	
	}
	// logD('dis.x:'+realDis.x+' y:'+realDis.y);
	point.move(realDis);
}
function drawLine(line,dis,rotation){
	if(rotation%360==0){
		realDis=dis
		
	}
	if(rotation%360==90||rotation%360==-270){
		realDis={
				x:dis.y,
				y:-dis.x
		}	
	}
	if(rotation%360==180||rotation%360==-180){
		realDis={
				x:-dis.x,
				y:-dis.y
		}	
	}
	if(rotation%360==270||rotation%360==-90){
		realDis={
				x:-dis.y,
				y:dis.x
		}	
	}
	lines=line.points();	
	lines[2]=lines[2]+realDis.x;
	lines[3]=lines[3]+realDis.y;
	line.points(lines);
	
}
function setImage(g){
	var kinImg=getImagePoint(g);
	kinImg.setImage(leftpoly.getImgage(g));
}
function setPointText(g,Str){
	var label=getTextPoint(g);
	
	label.text(Str);
	
}
function getImagePoint(g){
	tempArrayI = g.getChildren(function(node) {
		return node.getName() != 'connPointsLeft' &&node.getName() != 'connPointsRight'&&node.getName() != 'textLabel'		
	});
	
		return tempArrayI[0];
	
}
function getTextPoint(g){
	tempArrayI = g.getChildren(function(node) {
		return node.getName() =='textLabel'	
	});	
		return tempArrayI[0];	
}
function checkCircle(v1,v2,length){
	if(v2==null || v1==null){
		return false;
	}
	if((Math.pow((v1.getAbsolutePosition().x-v2.getAbsolutePosition().x),2)+Math.pow((v1.getAbsolutePosition().y-v2.getAbsolutePosition().y),2))<(length*length))
		{
		v1.fill('yellow');
		v2.fill('yellow');
		return true;
		}
		else{
			return false;
		}
};
function getTimeByS(){

	 var now= new Date();
	   var year=now.getYear();
	   var month=now.getMonth()+1;
	   var day=now.getDate();
	   var hour=now.getHours();
	   var minute=now.getMinutes();
	   var second=now.getSeconds();
	   var milSecond = now.getMilliseconds();
	   var divid = year+""+month+""+day+""+hour+""+minute+""+second +""+milSecond ;
	return divid;
};
function initMouseWheel(){
	 $('#container').bind('mousewheel', function(event) {
	      event.preventDefault();
	      event.stopPropagation();
	      var deltaY=event.deltaY;
	      var cur_scale=0;
	      if (deltaY > 0) {
				cur_scale = 1.25;
				
			} else {
				cur_scale = 0.8;
				
			}
			
			
				platform.scaleCenter(cur_scale);
				platform.draw();
	    });
}
function log(i){
	platform.log(i);
}
function logD(i){
	console.log(i);
	platform.log(i);
}
function sleep(milliSeconds){    
    var startTime = new Date().getTime();  // get the current time
    while (new Date().getTime() < startTime + milliSeconds);  // hog cpu
    }
function imgLoadA(url){
	
	var img = new Image();
	img.src = url;
	return img;
};
function getPolyByType(p){
	var type=p['type'];
	for(var i=0;i<leftpoly.polyGroups.length;i++){
		if (leftpoly.polyGroups[i].TYPE==type){
			return leftpoly.polyGroups[i];
		}
		if (type=='离心压缩机'||type=='往复式压缩机'){
			if(leftpoly.polyGroups[i].TYPE=='集气增压站'&&p['attribute']['设备位置']!=null&&p['attribute']['设备位置'].indexOf('JQZYZ')>-1){
				return leftpoly.polyGroups[i];
			}
			if(leftpoly.polyGroups[i].TYPE=='主动增压点'&&p['attribute']['设备位置']!=null&&p['attribute']['设备位置'].indexOf('ZDZYD')>-1){
				return leftpoly.polyGroups[i];
			}
			if(leftpoly.polyGroups[i].TYPE=='中央处理厂'&&p['attribute']['设备位置']!=null&&p['attribute']['设备位置'].indexOf('ZYCLC')>-1){
				return leftpoly.polyGroups[i];
			}
		}
		
	}
	return null;
}
function getPolyByYSJ(p){
	var type=p['type'];
	
	if (type=='离心压缩机'||type=='往复式压缩机'){
		return type;
		}
		return "";
	}
function rotateSpesail(p){
	if(checkSpecial(p)||checkLinked(p))
	{	
		p.rotate(90);
		p.y(p.y()-55);
		}
}
function checkSpecial(p){
	if(p.TYPE=='气井'||p.TYPE=='气源'||p.TYPE=='分输点')
	{
		return true;
	}
	return false;
}
function checkLinked(p){
	if(p.TYPE=='设备连接点')
	{
		return true;
	}
	return false;
}
function checkPipe(p){
	if(p.TYPE=='集气增压站'||p.TYPE=='中央处理厂'||p.TYPE=='主动增压点'||p.TYPE=='离心压缩机'||p.TYPE=='往复式压缩机')
	{
		return true;
	}
	return false;
}
function checkQY(p){
	if(p.TYPE=='集气增压站'||p.TYPE=='中央处理厂'||p.TYPE=='主动增压点'||p.TYPE=='离心压缩机'||p.TYPE=='往复式压缩机'||p.TYPE=='阀'||p.TYPE=='过滤器')
	{
		return true;
	}
	return false;
}
function checkAllPipe(p){
	if(p.TYPE=='集气增压站'||p.TYPE=='中央处理厂'||p.TYPE=='主动增压点'||p.TYPE=='离心压缩机'||p.TYPE=='往复式压缩机'||p.TYPE=='管道')
	{
		return true;
	}
	return false;
}
function addYSJ(){
	var po=leftpoly.PipeTemp;
	var name=$("#YSJName").val()
	po.TYPE=$("#YSJType").val();
	po.YSJLS=leftpoly.PipeTempType;
	leftpoly.addPointByInput(po,name);
	$('#add_ysj_modal').modal('hide');
}
function getIndexOfArray(arr1,element){
	for(var i=0;i<arr1.length;i++){
		if(arr1[i]==element){
			return i;
		}
		
	}
	return -1;
}
function searchGrid(grid1,colname,colvalue){
	
	for(var iRow=0;iRow<grid1.getGridParam("records")+1;iRow++){
		var proper=grid1.jqGrid("getRowData", iRow)[colname];
		if(proper==colvalue){
			return iRow;
		}
	}
	return -1;
}
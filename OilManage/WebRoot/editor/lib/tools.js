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
function drawLine(line,dis){
	
	lines=line.points();	
	lines[2]=lines[2]+dis.x;
	lines[3]=lines[3]+dis.y;
	line.points(lines);
	
}
function setImage(g){
	kinImg=getImagePoint(g);
	kinImg.setImage(leftpoly.getImgage(g));
}
function getImagePoint(g){
	tempArrayI = g.getChildren(function(node) {
		return node.getName() != 'connPointsLeft' &&node.getName() != 'connPointsRight'				
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
function moveLeft(l,lc,p){
	pos=p.position();
	posl={
			x:pos.x,
			y:pos.y+leftpoly.polyhight
	}
	l.position(posl);
	lc.position(posl);
}
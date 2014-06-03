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
function checkCircle(v1,v2,length){
	if((Math.pow((v1.getAbsolutePosition().x-v2.getAbsolutePosition().x),2)+Math.pow((v1.getAbsolutePosition().y-v2.getAbsolutePosition().y),2))<(length*length))
		{
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
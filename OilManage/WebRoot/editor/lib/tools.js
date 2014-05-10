function showGrid(){
	platform.showGrid();
}
function scaleCenter(s){
	platform.scaleCenter(s);
}
function createNewModal(){
	tabtools.createNewModal();
}
function listGUIProGrid(){
	tabtools.listGUIProGrid();
}
function save(){
	tabtools.save();
}
function clickLoad(s){
	if(s==1){
		createNewModal();
		$('#load_modal').modal('hide');
	}
	else{
		listGUIProGrid();
		$('#load_modal').modal('hide');
	}
}

function onMouseWheel(e, delta,dx,dy) {
	  
	  // mozilla fix...
	  if (e.originalEvent.detail){
	    delta = e.originalEvent.detail;
	  }
	  else{
	    delta = e.originalEvent.wheelDelta;
	  }
	  
			if (delta !== 0) {
				e.preventDefault();
			}

			var cur_scale;
			if (delta > 0) {
				cur_scale = (Math.abs(delta / 640)/0.075)*1.25;
			} else {
				cur_scale = (Math.abs(delta / 640)/0.075)*0.8;
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
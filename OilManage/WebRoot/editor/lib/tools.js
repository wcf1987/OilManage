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
function checkPoint(pos, rect) {
	
	var size = rect.size();
	if (pos.x > rect.x() && pos.y > rect.y()
			&& (pos.x < rect.x() + size.width)
			&& (pos.y < rect.y() + size.height)) {
		return true;
	}
	return false;
};
$(

function() {
	/*
	 * sid第几个sheet
	 * proid项目ID
	 * algid算法ID
	 */
	var sid = 1;
	var proid = 11;
	var algid = 26;
	var inOrOut="In";
	//var inOrOut="Out";
	var sheetDiv = "#sheet";
	var pageDiv = "#pager";
	var delID="delsheet";
	for(var i=0;i<5;i++){
		var sheetgrid = new SheetGrid();

		sheetgrid.GetDynamicCols(i, algid,inOrOut);
		sheetgrid.creategrid(proid, sheetDiv+i, pageDiv+i,delID+i);
		
	}	

});
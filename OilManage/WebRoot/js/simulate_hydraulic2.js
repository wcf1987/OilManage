$(

function() {
	var sid = 1;
	var proid = 11;
	var algid = 27;
	var sheetDiv = "#sheet"
	var pageDiv = "#pager"
	for(var i=0;i<8;i++){
		var sheetgrid = new SheetGrid();

		sheetgrid.GetDynamicCols(i, algid);
		sheetgrid.creategrid(proid, sheetDiv+i, pageDiv+i);
		
	}	

});
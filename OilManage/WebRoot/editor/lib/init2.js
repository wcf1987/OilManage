jQuery.ajaxSettings.traditional = true;
var platform;
var leftpoly;
var tabtools;


function initLight() {
	
	platform=new Platform();
	platform.init();
	leftpoly=new Leftpolys();
	leftpoly.init();
	platform.addLeft(leftpoly);
	//paintings=new Paintings();
	//platform.addPainting(paintings.init());

	tabtools=new TabTools(); 
	
	initMouseWheel();
	var curl=window.location.pathname;
	if(curl=="/OilManage/pages/simulate_wellbore.jsp"){
		listProjectModal();	 
	}

}


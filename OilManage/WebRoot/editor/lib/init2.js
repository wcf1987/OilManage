var platform;
var leftpoly;
var tabtools;
function initLight() {

	platform=new Platform();
	platform.init();
	leftpoly=new Leftpolys();
	leftpoly.init();
	platform.addLeft(leftpoly);
	paintings=new Paintings();
	platform.addPainting(paintings.init());
	tabtools=new TabTools();
	

}

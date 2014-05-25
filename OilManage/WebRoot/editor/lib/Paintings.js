var connectC=function(){
	this.left=0;
	this.right=0;
}
var Paintings = function() {
	this.points=new Array;
	this.connects=new Array;
	this.addPoints=function(p){
		this.points.push(p);
	}

	this.delPoints=function(p){
		this.points.remove(p);
		this.delConnectByOne(p);
	}
	this.updatePoints=function(){
		this.points=new Array;
		points1 = this.p.getChildren();
		for (li = 0; li < points1.length; li++) {
			this.addPoints(points1[li]);
		}
		//this.pointstr=this.points.toJSONString();
	}
	
	this.updateConnects=function(){

		this.connects=new Array;
		points1 = this.p.getChildren();
		for (l2 = 0; l2 < points1.length; l2++) {
			this.checkConn(points1[l2]);
		}
		//this.Connstr=this.connects.toJSONString();
		
	}
	this.checkConn = function(g) {
		tempArray = g.getChildren(function(node) {
			return node.getName() == 'connPointsLeft'
					|| node.getName() == 'connPointsRight'
		});
		points = this.p.getChildren();
		var re=null;
		for (li = 0; li < points.length; li++) {
			tempArray2 = points[li].getChildren(function(node) {
				return node.getName() == 'connPointsLeft'
						|| node.getName() == 'connPointsRight'
			});
			if (checkCircle(tempArray[0], tempArray2[1],
					tempArray[0].radius() )) {
				this.addConnect(g,points[li]);
				
				
			}
			if (checkCircle(tempArray[1], tempArray2[0],
					tempArray[0].radius())) {
				this.addConnect(points[li],g);
				
			}
		}
		return re;
	}
	this.addConnect=function(a,b){
		for(var l3=0;l3<this.connects.length;l3++){
			if(this.connects[l3].left==a.id()&&this.connects[l3].right==b.id())
				return;
		}
			var temp=new connectC;
			temp.left=a.id();
			temp.right=b.id();
			this.connects.push(temp);
		
	}
	
	this.delConnect=function(a,b){
		this.connects.remove({left:a,right:b});
	}
/*	this.delConnectByOne=function(a){
		for(var i=0;i<this.connects.length;i++){
			if(this.connects[i]!=undefined&&(this.connects[i].left==a ||this.connects[i].right==a)){
					delete this.connects[i];
			}
		}
		
	}*/
	this.hide=function(){
		this.p.hide();

	}
	this.saveScroll=function(){
		this.hscrollX=platform.hscroll.x();
		this.vscrollY=platform.vscroll.y();
	}
	this.show=function(){
		this.p.show();
		platform.hscroll.x(this.hscrollX);
		platform.vscroll.y(this.vscrollY);
	}
	this.hscrollX=platform.hscroll.x();
	this.vscrollY=platform.vscroll.y();
	this.showSelected=function(){
		this.show();

		for(var i=0;i<platform.paintingArray.length;i++){
			if (platform.paintingArray[i]!=this){
				platform.paintingArray[i].hide();
			}
		}
	
	}
	this.hideSelected=function(){
		this.hide();
	}
	
	this.init=function(){
		this.p = new Kinetic.Layer({
			x : 100,
			y : 100,
			id : 'painting',
			width : 3000,
			height : 2000,
			fill : '#ff33ee',
			
//			fill: 'transparent',
			draggable:true,
			dragBoundFunc: function(pos) {
	              console.log('abc');
	              return pos;
	          }
			
		});
		
		 this.p.draggable(true);
		 
		    //
			this.p.on('mouseover', function() {
				document.body.style.cursor = 'pointer';
			});
			this.p.on('mouseout', function() {
				document.body.style.cursor = 'default';
			});
		    return this;
	}
	this.mx;
	this.my;
	this.showed=false;
	this.showConned=false;
	this.scaleN=1;
	this.deletePainting=function(){
		
	}
	this.update=function(){
		platform.updateBackgroundPos({x:0,y:0});
		platform.centerlayer.draw();
	}
}

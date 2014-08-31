var connectC=function(){
	this.left=0;
	this.right=0;
}
var Paintings = function() {
	this.points=new Array;
	this.changed=false;
	this.ID=0;
	this.name;//项目名称
	this.index=-1;//初始化序列号为-1

	this.drawPoints=function(data){
		
		var jsonObject = data;
		var pointArray = new Array();
		var pMap = jsonObject['graphi']['points'];
		var id = -1;
		for ( var i in pMap) {
			id++;
			//if(id==2) return ;
			p = pMap[i];
			//pointMap[i] = new BMap.Point(p['longitude'], p['latitude']);			
			//myicon = myjingkou;
			var point;
			if (p['type'] == '气源') {
				point=leftpoly.polyGroups[2].clone();
			}
			if (p['type'] == '气井') {
				point=leftpoly.polyGroups[3].clone();
			}
			if (p['type'] == '分输点') {
				point=leftpoly.polyGroups[4].clone();
				
			}
			if (p['type'] == '中央处理厂数据') {
				point=leftpoly.polyGroups[5].clone();
			}
			if (p['type'] == '中央处理厂数据') {
				point=leftpoly.polyGroups[6].clone();
			}
			point.nameStr=p['name'];
			point.id(p['name']);
			this.p.add(point);
			setPointText(point,p['name']);
			point.x(p.draw2DX);
			point.y(p.draw2DY);			
			//point.x(p.draw2DY);
			//point.y(p.draw2DX);			
			leftpoly.showALLConnPoints();
			resizePoint(point);
		}
		this.p.draw();

	}
	this.getPointByName=function(name){
		var points = this.p.getChildren();
		for (var i1 = 0; i1 < points.length; i1++) {
			if(points[i1].nameStr==name){
				return points[i1];
			}
		}
		return null;
	}
	this.drawLines=function(data){
		var jsonObject = data;
		var pLine = jsonObject['graphi']['lines'];	
		for ( var i=0;i<pLine.length;i++) {
			var l = pLine[i];
			//if(i!=0) continue;
			var start=l['start'];
			var end=l['end'];
			var startP=this.getPointByName(start);
			var endP=this.getPointByName(end);
			if(startP!=null&&endP!=null){
				var	rc=getRightPoint(startP);
				var	lc=getLeftPoint(endP);
				var dis={
							x:(rc.getAbsolutePosition().x-lc.getAbsolutePosition().x)/this.scaleN,
							y:(rc.getAbsolutePosition().y-lc.getAbsolutePosition().y)/this.scaleN
						}
				var  l=getLeftLine(endP);
				
				//var	lch=getLeftPointHide(endP);
				var	r=getRightLine(endP);
				
					var	poly=getPoly(endP);				
					//if(l!=null&&lc.fill()!='red'){
						//endP.setAbsolutePosition(pos);	
						//logD('一次移动');
						//logD('lch.x:'+lch.x()+' y:'+lch.y());
						//logD('lc.x:'+lc.x()+' y:'+lc.y());
						movePoint(lc,dis,endP.rotation());
						//lc.move(point);
						//logD('move to lc.x:'+lc.x()+' y:'+lc.y());
						//logD('');
						drawLine(l,dis,endP.rotation());	
						this.p.draw();
					//}				
					//if(r!=null&&rc.fill()!='red'){
						//endP.setAbsolutePosition(pos);	
					//	movePoint(rc,dis,endP.rotation());
					//	drawLine(r,dis,endP.rotation());
					//}	
			}
			 //var polyline=leftpoly.polyGroups[9].clone();
			
			
				
				
			 
				
		}		
	}
	this.addGraphi=function(data){
		this.drawPoints(data);
		this.drawLines(data);
		leftpoly.showALLConnedPoints();
		this.p.draw();
	}
	this.hasChange=function(){
		this.changed=true;
		var $index=this.index;
	/*	$("input[name='paintingIndex']").each(function($index){//去掉改变标识*
            if($(this).val()==$index){
            	var $showobj=$(this).parent().find("a[name='show']");
            	if($showobj.children("span[name='change']").length==0){
            		$showobj.append("<span name='change'>*</span>");
            	}            	
            }
         });*/
		var showobj=$("#"+this.ID).parent().find("a[name='show']");
    	if(showobj.children("span[name='change']").length==0){
    		showobj.append("<span name='change'>*</span>");
    	}
//		if($("#paintingTabs>.active > a:first").children().length==0){
//			$("#paintingTabs>.active > a:first").append("<span name='change'>*</span>");
//		}	
	}
	this.clearChange=function(){
		this.changed=false;
//		if($("#paintingTabs>.active > a:first").children().length!=0){
//			$("#paintingTabs>.active > a:first").children().remove();
//		}
/*		var $index=this.index;
		$("input[name='paintingIndex']").each(function($index){//去掉改变标识*
            if($(this).val()==$index){
            	var $changeobj=$(this).parent().find("span[name='change']");
            	if($changeobj.length!=0){
            		$changeobj.remove();
            	}	
            }
         });*/
		var $changeobj=$("#"+this.ID).parent().find("span[name='change']");	
    	if($changeobj.length!=0){
    		$changeobj.remove();
    	}	
		
	}
	this.getChange=function(){
		return this.changed;
	}
	this.initPoint=function(){
		pointslist = this.p.getChildren();
		for(var z=0;z<pointslist.length;z++){
			leftpoly.initPoint(pointslist[z]);
		}
	}
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
			p1=platform.paintingArray[i]
			if (p1!=null&&p1!=this){
				p1.hide();
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

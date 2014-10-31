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
		var pLine = jsonObject['graphi']['lines'];
		for ( var i in pMap) {
			id++;
			p = pMap[i];

			var point;

			var ptemp=getPolyByType(p);
			if(ptemp==null){
				continue;
			}
			if(ptemp=='其他'){
				delLinesInDraw(pLine,p['name']);
				continue;
			}
			if(p['attribute']['隶属关系']!=null&&p['attribute']['隶属关系']=='管道'){
				delLinesInDraw(pLine,p['name']);
				continue;
			}
			point=ptemp.clone();
			point.nameStr=p['name'];
			point.id(p['name']);
			point.TYPE=p['type'];
			var types=getPolyByYSJ(p);
			if(types!=""){
				point.TYPE=types;
			}
			this.p.add(point);
			setPointText(point,p['name']);
			point.x(p.draw2DX);
			point.y(p.draw2DY);	
			rotateSpesail(point);		
			leftpoly.showALLConnPoints();
			resizePoint(point);
			this.p.draw();
		}
		return pLine;

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
	function delLinesInDraw(pLine,pointName){
		var endOver=new Array();
		var startOver=new Array();
		var startKey=null;
		var endKey=null;
		for(var i=pLine.length-1;i>=0;i--){
			var l= pLine[i];
			var start=l['start'];
			var end=l['end'];
			if(end==pointName){
				
				if(startKey==null){
					startKey=start;
					pLine.splice(i,1);
				}else{
					startOver.push(pLine[i]);
					pLine.splice(i,1);
				}
				
				
			}
		}
		for(var i=pLine.length-1;i>=0;i--){
			var l= pLine[i];
			//if(i!=0) continue;
			var start=l['start'];
			var end=l['end'];
			if(start==pointName){
				endOver.push(end);				
				l['start']=startKey;	
				endKey=end;
			}			
		}
		for(var i=0;i<startOver.length;i++){
			var l= startOver[i];
			//if(i!=0) continue;
						
			l['end']=endKey;				
			pLine.push(l);			
		}
	}
	this.drawLines=function(pLine){
		//var jsonObject = data;
		//var pLine = jsonObject['graphi']['lines'];	
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

				if(checkSpecial(endP))
				{var dis={
						x:-(rc.getAbsolutePosition().x-lc.getAbsolutePosition().x)/this.scaleN,
						y:-(rc.getAbsolutePosition().y-lc.getAbsolutePosition().y)/this.scaleN
					}
					var  r=getRightLine(startP);						
					movePoint(rc,dis,startP.rotation());							
					drawLine(r,dis,startP.rotation());	
				}else{
					var dis={
							x:(rc.getAbsolutePosition().x-lc.getAbsolutePosition().x)/this.scaleN,
							y:(rc.getAbsolutePosition().y-lc.getAbsolutePosition().y)/this.scaleN
						}
					var  l=getLeftLine(endP);						
					movePoint(lc,dis,endP.rotation());							
					drawLine(l,dis,endP.rotation());	
				}
				this.p.draw();
			}				
		}		
	}
	this.addGraphi=function(data){
		var pline=this.drawPoints(data);
		this.drawLines(pline);
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
		var leftconn;
		var rightconn;
		if(checkAllPipe(g)){
		
			for (li = 0; li < points.length; li++) {
			tempArray2 = points[li].getChildren(function(node) {
				return node.getName() == 'connPointsLeft'
						|| node.getName() == 'connPointsRight'
			});
			//&&checkSpecial(points[li])
			if (points[li]!=g&&checkCircle(tempArray[0], tempArray2[1],
					tempArray[0].radius() )) {
				this.addConnect(g.nameStr,points[li],g);				
			}
			if (points[li]!=g&&checkCircle(tempArray[1], tempArray2[0],
					tempArray[0].radius())) {
				this.addConnect(g.nameStr,g,points[li]);
				
			}
		}
			
		return re;
	}
		
	}
	this.addConnect=function(name,a,b){
		for(var l3=0;l3<this.connects.length;l3++){
			if(this.connects[l3].name==name&&this.connects[l3].name==a.nameStr){
				this.connects[l3].right=b.nameStr;
				return;
			}
			if(this.connects[l3].name==name&&this.connects[l3].name==b.nameStr){
				this.connects[l3].left=a.nameStr;
				return;
			}	
		}
			var temp=new connectC;
			temp.name=name;
			temp.left=a.nameStr;
			temp.right=b.nameStr;
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

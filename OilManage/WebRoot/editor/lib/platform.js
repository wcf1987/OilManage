var Platform=function(){
	this.stage = new Kinetic.Stage({
        container: 'container',
        width: 1020,
        height: 800
      });
    
	this.leftlayer   = new Kinetic.Layer({
	    x:0,
	    y:0,
	    id: 'leftlayer',
	    width:100,
	    height:800
	});
	this.centerlayer   = new Kinetic.Layer({
	    x:100,
	    y:40,
	    id: 'centerlayer',
	    width:920,
	    height:500
//	    width:8,
//	    height:8
	});
	this.gridlayer  = new Kinetic.Layer({
	    x:100,
	    y:this.centerlayer.y(),
	    id: 'gridlayer',
	    width:920,
	    height:500
	});
	
	this.paintingGroup = new Kinetic.Group({
		x : 100,
		y : 0,
		id : 'painting',
		width : 2000,
		height : 1000,
		fill : '#ff33ee',
		draggable : true
	});
	this.tablayer=new Kinetic.Layer({
		x:100,
		y:2,
		id:'tablayer',
		width:850,
		height:50,
		draggable:false,
	});
	
	
	this.rectBackground = new Kinetic.Rect({
	   x: 0,
	   y: 0,
	   height: this.stage.attrs.height,
	   width: this.stage.attrs.width,
	   fill: 'transparent',
	   draggable: false,
	   name: 'rectBackground'
	 });
	this.rectBackgroundLeft = new Kinetic.Rect({
	   x: 0,
	   y: 0,
	   height: 800,
	   width: 100,
	   fill: 'transparent',
	   draggable: false,
	   stroke:'black',
	   name: 'rectBackgroundLeft'
	 });
	this.rectBackgroundCenter = new Kinetic.Rect({
	   x: 10,
	   y: 0,
	   height: 500,
	   width: 900,
	   fill: 'transparent',
	   draggable: false,
	   stroke:'black',
	   name: 'rectBackgroundCenter'
	 });
   
	this.areas = new Kinetic.Group();
	 this.scrollbars = new Kinetic.Group();
	 var container = this.stage.getContainer();
	    
	    /*
	     * horizontal scrollbars
	     */
	   this.hscrollArea = new Kinetic.Rect({
	      x: 20,
	      y: this.centerlayer.getHeight() - 30,
	      width: this.centerlayer.getWidth() - 70,
	      height: 20,
	      fill:'black',
	      
	      opacity: 0.3
	    });
	    
	   this.hscroll = new Kinetic.Rect({
	        x: 20,
	        y: this.centerlayer.getHeight() - 30,
	        width: 130,
	        height: 20,
	        fill: '#9f005b',
	        dragOnTop: false,
	        draggable: true,
	        dragBoundFunc: function(pos) {
	          var newX = pos.x;
	          if(newX < platform.centerlayer.x()+20) {
	            newX = platform.centerlayer.x()+20;
	          }
	          else if(newX > platform.centerlayer.getWidth()-80 ) {
	            newX = platform.centerlayer.getWidth() -80;
	          }
	    
	          return {
	            x: newX,
	            y: this.getAbsolutePosition().y
	          }
	        },
	        opacity: 0.9,
	        stroke: 'black',
	        strokeWidth: 1
	      });

	    /*
	     * vertical scrollbars
	     */
	   this.vscrollArea = new Kinetic.Rect({
	      x: this.centerlayer.getWidth() - 40,
	      y: 20,
	      width: 20,
	      height: this.centerlayer.getHeight() - 70,
	      fill: 'black',
	      opacity: 0.3
	    });
	   this.vscroll = new Kinetic.Rect({
	        x: this.centerlayer.getWidth() - 40,
	        y: 20,
	        width: 20,
	        height: 130,
	        fill: '#9f005b',
	        dragOnTop: false,
	        draggable: true,
	        dragBoundFunc: function(pos) {
	          var newY = pos.y;
	          if(newY < 20+platform.centerlayer.y()) {
	            newY = 20+platform.centerlayer.y();
	          }
	          else if(newY > platform.centerlayer.getHeight() - 110-70+platform.centerlayer.y()) {
	            newY = platform.centerlayer.getHeight() - 110-70+platform.centerlayer.y();
	          }
	         
	          return {
	        	  
	            x: this.getAbsolutePosition().x,
	            y: newY
	          }
	        },
	        opacity: 0.9,
	        stroke: 'black',
	        strokeWidth: 1
	      });

	 
		
	this.selectPainting=null;	
	this.bgGroup;
	this.bgRect=null;
	this.bgGridRect=null;
   
	this.init=function(){
		this.leftlayer.on('mouseover', function() {
			document.body.style.cursor = 'pointer';
		});
		this.leftlayer.on('mouseout', function() {
			document.body.style.cursor = 'default';
		});
		this.centerlayer.on('click',function(e){//如果点击在中央层的背景上则隐藏点击菜单
			if(e.target.name()==='rectBackgroundCenter')
			$('#contextmenu').hide();
		});
	    bgGroup.add(bgRect);
	    
	    this.gridlayer.add(bgGroup);
		this.leftlayer.add(this.rectBackgroundLeft);
		this.centerlayer.add(this.rectBackgroundCenter);
		this.stage.add(this.gridlayer);
		this.stage.add(this.leftlayer);
		
		this.stage.add(this.centerlayer);
		   /*
	     * scrollbars
	     */
	   this.scrollbars.on('mouseover', function() {
	      document.body.style.cursor = 'pointer';
	    });
	   this.scrollbars.on('mouseout', function() {
	      document.body.style.cursor = 'default';
	    });

	    this.hscroll.on('dragmove', this.updateBackgroundPos);
	    
	    this.vscroll.on('dragmove', this.updateBackgroundPos);
	    //this.hscroll.dragBoundFunc(this.updateBackgroundPos);
	    //this.vscroll.dragBoundFunc(this.updateBackgroundPos);
	    
	    this.areas.add(this.hscrollArea);
	    this.areas.add(this.vscrollArea);
	    this.scrollbars.add(this.hscroll);
	    this.scrollbars.add(this.vscroll);
	    platform.centerlayer.add(this.areas);
	    platform.centerlayer.add(this.scrollbars);
		this.drawGrid();
		this.showGrid();
		
		//stage.add(tablayer);
		//this.stage.add(painting);
	}

	
	    this.updateBackgroundPos=function (pos){
			x =(platform.hscroll.getPosition().x - 20)/(platform.centerlayer.getWidth() - 90-110);
		    y =(platform.vscroll.getPosition().y - 20)/(platform.centerlayer.getHeight() -90-110);
		    px=platform.selectPainting.p.getWidth();
		    py=platform.selectPainting.p.getHeight();
		    platform.selectPainting.mx=100-(px-platform.centerlayer.getWidth())*x;
		    platform.selectPainting.my=100-(py-platform.centerlayer.getHeight())*y;
		    platform.selectPainting.p.x(platform.selectPainting.mx);
		    platform.selectPainting.p.y(platform.selectPainting.my);
		    nodeChildren=platform.selectPainting.p.getChildren().toArray();
		    for(var i=0;i<nodeChildren.length;i++){
		    	
		    	if (checkPoint(nodeChildren[i].getAbsolutePosition(),platform.centerlayer)){
		    		nodeChildren[i].show();
		    	}
		    	else{
		    		nodeChildren[i].hide();
		    	}
		    }
		    platform.selectPainting.p.draw();
		    platform.selectPainting.p.moveToTop();
		}
	this.addLeft=function(left){
		left.platform=this;
		for (var k in left.polyGroups)
		{this.leftlayer.add(left.polyGroups[k]);}
		this.leftlayer.draw();
	}

	this.getAllChildren=function(){
		return this.selectPainting.p.getChildren();
	}
	this.showGrid=function(){
		if(document.getElementById("gridCheckbox").checked==true){
			bgGroup.show();
			this.gridlayer.draw();
		}else{
			bgGroup.hide();
			this.gridlayer.draw();
		}
	}
	var gridEle = 9;
//	gridlayer=centerlayer;
	bgGroup = new Kinetic.Group();
	   //主编辑区域背景框
	bgRect = new Kinetic.Rect( {
            x : 12,
            y : this.gridlayer.y()+1,
//            fill : "#eee",
            fill: 'transparent',
            draggable : false,
//            width : gridlayer.width()-100,
//            height :gridlayer.height()-100,
            width:8000,
            height:8000,
//            shadow : {
//                    color : 'black',
//                    blur : 8,
//                    offset : [ 2, 2 ],
//                    opacity : 0.6
//            }
    });


	  //主编辑区域网格框
    bgGridRect = new Kinetic.Rect( {
            x : bgRect.x(),
            y : 0,
            fill : "#fff",
//            fill: 'transparent',
            draggable : false,
            width :900,
            height :500
    });
	this.drawGrid=function(){


	    bgGroup.add(bgGridRect);

	    //网格的行数列数
	    var rows = bgGridRect.getHeight() / gridEle + 2;
	    var cols = bgGridRect.getWidth() / gridEle - 2;

	    //绘制网格
	    for ( var i = 0; i <= rows; i++) {
	            var color = "#f3f3f3";
	            var line = new Kinetic.Line( {
	                    points : [ bgGridRect.getX(),
	                                    bgGridRect.getY() + (i * gridEle) + 0.5,
	                                    bgGridRect.getX() + bgGridRect.getWidth(),
	                                    bgGridRect.getY() + (i * gridEle) + 0.5 ],
	                    stroke : color,
	                    strokeWidth : 1,
	                    lineCap : "butt",
	                    lineJoin : "butt"
	            });
	            bgGroup.add(line);
	    }

	    for ( var i = 0; i <= cols; i++) {
	            var color = "#f3f3f3";
	            if (i % 4 == 0) {
	                    color = "#ddd";
	            }
	            var line = new Kinetic.Line( {
	                    points : [ bgGridRect.getX() + (i * gridEle) + 0.5,
	                                    bgGridRect.getY(),
	                                    bgGridRect.getX() + (i * gridEle) + 0.5,
	                                    bgGridRect.getY() + bgGridRect.getHeight() ],
	                    stroke : color,
	                    strokeWidth : 1,
	                    lineCap : "butt",
	                    lineJoin : "butt"
	            });
	            bgGroup.add(line);
	    }
	    
	    for ( var i = 0; i <= rows; i++) {
	            if (i % 4 == 0) {
	                    var line = new Kinetic.Line( {
	                            points : [ bgGridRect.getX(),
	                                            bgGridRect.getY() + (i * gridEle) + 0.5,
	                                            bgGridRect.getX() + bgGridRect.getWidth(),
	                                            bgGridRect.getY() + (i * gridEle) + 0.5 ],
	                            stroke : "#ddd",
	                            strokeWidth : 1,
	                            lineCap : "butt",
	                            lineJoin : "butt"
	                    });
	                    bgGroup.add(line);
	            }
	    }
	    this.gridlayer.draw();

	}


	this.addPainting=function(paintFrame){
		this.stage.add(paintFrame.p);
		this.selectPainting=paintFrame;
		paintFrame.update();
	}

	this.scaleCenter=function(s) {
		
		this.selectPainting.scaleN=this.selectPainting.scaleN*s;
		this.selectPainting.p.scaleX(this.selectPainting.p.scaleX() * s);
		this.selectPainting.p.scaleY(this.selectPainting.p.scaleY() * s);
		this.selectPainting.p.draw();	
		
	}
	this.paintingArray=new Array;
	this.addLoadPainting=function(newone) {
		paintings=new Paintings();
		paintings.init()
		paintings.p=newone;
		this.addPainting(paintings);
		this.paintingArray.push(paintings);
		this.selectPainting.showSelected();
		/*
		 *加载模型后为每个元素添加 事件 
		 */
		var polys=this.selectPainting.p.getChildren();
		var leftpolys=new Leftpolys();
		for ( var k=0;k<polys.length;k++) {
			polys[k].on('click',leftpolys.clickFunc);
			polys[k].dragBoundFunc(this.dragFun);
			polys[k].on('click', this.clickFunc);
			polys[k].on('dragend', this.cloneFun);
			polys[k].on('mousedown touchstart', this.cloneFun2);
			polys[k].on('mouseover', function() {
				document.body.style.cursor = 'pointer';
			});
			polys[k].on('mouseout', function() {
				document.body.style.cursor = 'default';
			});
		}
		/*
		 *加载模型后为每个元素添加 事件  结束
		 */
		return this.paintingArray.indexOf(paintings);
	}
	this.showPainting=function(index){
		this.selectPainting=this.paintingArray[index];
		this.selectPainting.showSelected();
		this.stage.draw();
	}
	this.getPaintingByIndex=function(index){
		return this.selectPainting=this.paintingArray[index];
	
	}
	this.hidePainting=function(index){
		this.selectPainting=this.paintingArray[index];
		this.selectPainting.hideSelected();
		this.stage.draw();
	}
	this.draw=function(){
		this.selectPainting.p.draw();
	}
	this.getConnShowed=function(){
		return this.selectPainting.showConned;
	}
	this.setConnShowed=function(bool){
		this.selectPainting.showConned=bool;
	}
	this.update=function(){
		
		this.selectPainting.updateConnects();
		this.selectPainting.updatePoints();
	}

};
	
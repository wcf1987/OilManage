var Platform=function(){
	this.stage = new Kinetic.Stage({
        container: 'container',
        width: 1150,
        height: 800,
        
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
	    width:1070,
	    height:500
	});
	this.gridlayer  = new Kinetic.Layer({
	    x:100,
	    y:this.centerlayer.y(),
	    id: 'gridlayer',
	    width:1070,
	    height:500
	});

	this.tablayer=new Kinetic.Layer({
		x:100,
		y:2,
		id:'tablayer',
		width:1070,
		height:50,
		draggable:false,
	});

	this.outputlayer= new Kinetic.Layer({
		x:100,
		y:540,
		id:'outputlayer',
		width:1070,
		height:250,
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
	   fill: '#F6F6F6',
	   draggable: false,
	   stroke:'black',
	   name: 'rectBackgroundLeft'
	 });
	this.rectBackgroundCenter = new Kinetic.Rect({
	   x: 10,
	   y: 0,
	   height: 500,
	   width: 1038,
	   fill: 'transparent',
	   draggable: false,
	   stroke:'black',
	   name: 'rectBackgroundCenter'
	 });
    this.rectBackgroundOutput =new Kinetic.Rect({
    	x:10,
    	y:5,
    	height:250,
    	width:1040,  
    	stroke:'black',
    	name:'rectBackgroundOutput',
    	fill:'#F8F8F8',
    	strokeWidth: 0.5,
        cornerRadius:2,
        embossWhiteLevel:0.8,
        embossStrength:0.8,
        embossDirection:top
    });
    this.rectBackgroundText = new Kinetic.Text({
    	  x: 10,
    	  y: 5,//0
    	  height:250,
      	  width:1000,
	  	  fontSize: 20,
//	      fontFamily: '微软雅黑',
	  	  levels:0,
	      fill: 'black',
	      padding: 20,
//      	  fill:'green',
	      lineHeight:1,
	      //text:'输出：\n'
    	});
    this.areas = new Kinetic.Group();
	this.scrollbars = new Kinetic.Group();
	var container = this.stage.getContainer();
	 this.rectBackgroundText.dragBoundFunc(function(){
		  return {
		    x: this.getAbsolutePosition().x,
		    y: pos.y
		  };
		});
	
	    /*
	     * horizontal scrollbars
	     */
	   this.hscrollArea = new Kinetic.Rect({
	      x: 12,//20
	      y: this.centerlayer.getHeight() - 22,
	      width: this.centerlayer.getWidth() - 52,//70
	      height: 20,
	      fill:'#E8E8E8',
	      opacity: 1
	    });
	    
	   this.hscroll = new Kinetic.Rect({
	        x: 20,
	        y: this.centerlayer.getHeight() - 22,
	        width: 130,
	        height: 20,
	        fill: '#99CCFF',
	        dragOnTop: false,
	        draggable: true,
	        dragBoundFunc: function(pos) {
	          var newX = pos.x;
	          if(newX < platform.centerlayer.x()+12) {
	            newX = platform.centerlayer.x()+12;
	          }
	          else if(newX > platform.centerlayer.getWidth()-72 ) {
	            newX = platform.centerlayer.getWidth() -72;
	          }
	    
	          return {
	            x: newX,
	            y: this.getAbsolutePosition().y
	          }
	        },
	        opacity: 0.9,
	        stroke: 'black',
	        strokeWidth: 0.5,
	        cornerRadius:2
	      });

	    /*
	     * vertical scrollbars
	     */
	   this.vscrollArea = new Kinetic.Rect({
	      x: this.centerlayer.getWidth() - 42,
	      y: 0,//20
	      width: 20,
	      height: this.centerlayer.getHeight() - 2,//70
	      fill: '#E8E8E8',
	      opacity:1
	    });
	   this.vscroll = new Kinetic.Rect({
	        x: this.centerlayer.getWidth() - 42,
	        y: 20,
	        width: 20,
	        height: 130,
	        fill: '#99CCFF',
	        dragOnTop: false,
	        draggable: true,
	        dragBoundFunc: function(pos) {
	          var newY = pos.y;
	          if(newY < 5+platform.centerlayer.y()) {
	            newY = 5+platform.centerlayer.y();
	          }
	          else if(newY > platform.centerlayer.getHeight() - 155+platform.centerlayer.y()) {
	            newY = platform.centerlayer.getHeight() - 155+platform.centerlayer.y();
	          }
	         
	          return {
	        	  
	            x: this.getAbsolutePosition().x,
	            y: newY
	          }
	        },
	        opacity: 0.9,
	        stroke: 'black',
	        strokeWidth: 0.5,
	        cornerRadius:2,
	        embossWhiteLevel:0.8,
	        embossStrength:0.8,
	        embossDirection:top
	      });
	   this.vscroll.embossDirection(top);
	   this.vscroll.embossStrength(1);
	   
	   /*
	    *output scroll 
	    */
	   this.outputareas = new Kinetic.Group();
	   this.outputscrollbars = new Kinetic.Group();
		   this.outputHscrollArea = new Kinetic.Rect({
		      x: 11,//20
		      y: this.outputlayer.getHeight() - 17,
		      width: this.outputlayer.getWidth() - 52,//70
		      height: 20,
		      fill:'#E8E8E8',
		      opacity: 1
		    });
		    
		   this.outputHscroll = new Kinetic.Rect({
		        x: 10,
		        y: this.outputlayer.getHeight()-17,
		        width: 50,
		        height: 20,
		        fill: '#99CCFF',
		        dragOnTop: false,
		        draggable: true,
		        dragBoundFunc: function(pos) {
		          var newX = pos.x;
		          if(newX < platform.outputlayer.x()+12) {
		            newX = platform.outputlayer.x()+12;
		          }
		          else if(newX > platform.outputlayer.getWidth()+2 ) {
		            newX = platform.outputlayer.getWidth() +2;
		          }
		    
		          return {
		            x: newX,
		            y: this.getAbsolutePosition().y
		          }
		        },
		        opacity: 0.9,
		        stroke: 'black',
		        strokeWidth: 0.5,
		        cornerRadius:2
		      });

		    /*
		     * vertical outputscrollbars
		     */
		   this.outputVscrollArea = new Kinetic.Rect({
		      x: this.outputlayer.getWidth() - 42,
		      y: 6,//20
		      width: 50,
		      height: this.outputlayer.getHeight() - 3,//70
		      fill: '#E8E8E8',
		      opacity:1
		    });
		   this.outputVscroll = new Kinetic.Rect({
		        x: this.outputlayer.getWidth() - 42,
		        y: 8,
		        width: 20,
		        height: 30,
		        fill: '#99CCFF',
		        dragOnTop: false,
		        draggable: true,
		        dragBoundFunc: function(pos) {
		          var newY = pos.y;
		          if(newY < 10+platform.outputlayer.y()) {
		            newY = 10+platform.outputlayer.y();
		          }
		          else if(newY > platform.outputlayer.getHeight()-50+platform.outputlayer.y()) {
		            newY = platform.outputlayer.getHeight() - 50+platform.outputlayer.y();
		          }
		         
		          return {
		        	  
		            x: this.getAbsolutePosition().x,
		            y: newY
		          }
		        },
		        opacity: 0.9,
		        stroke: 'black',
		        strokeWidth: 0.5,
		        cornerRadius:2,
		        embossWhiteLevel:0.8,
		        embossStrength:0.8,
		        embossDirection:top
		      });
		   /*
		    *output scroll 
		    */
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
			//hideALLConnPoints();
		});
	    bgGroup.add(bgRect);
	    
	    this.gridlayer.add(bgGroup);
		this.leftlayer.add(this.rectBackgroundLeft);
		
		this.centerlayer.add(this.rectBackgroundCenter);
		this.outputlayer.add(this.rectBackgroundOutput);
		this.outputlayer.add(this.rectBackgroundText);
		
		
		
		this.stage.add(this.outputlayer);
		this.stage.add(this.leftlayer);	
		this.stage.add(this.gridlayer);//添加顺序很重要，先添加的在底层，这里网格将挡住拖拽超出到中间画布上的输出框内容。
		this.stage.add(this.centerlayer);
		
		this.drawGrid();
		this.showGrid();
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
	    
		/*
	     * output scrollbars
	     */
	   this.outputscrollbars.on('mouseover', function() {
	      document.body.style.cursor = 'pointer';
	    });
	   this.outputscrollbars.on('mouseout', function() {
	      document.body.style.cursor = 'default';
	    });

	    this.outputHscroll.on('dragmove', this.outputUpdateBackgroundPos);
	    this.outputVscroll.on('dragmove', this.outputUpdateBackgroundPos);
//	    this.outputareas.add(this.outputHscrollArea);//去掉输出框的水平滚动条
	    this.outputareas.add(this.outputVscrollArea);
//	    this.outputscrollbars.add(this.outputHscroll);
	    this.outputscrollbars.add(this.outputVscroll);
	    platform.outputlayer.add(this.outputareas);
	    platform.outputlayer.add(this.outputscrollbars);
	    platform.stage.draw();
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
		}
	    
	    this.outputUpdateBackgroundPos=function (pos){//更新输出框的滚动条拉动后的文本位置	    	
	    	var x = -1 * (platform.outputHscroll.getPosition().x - 10);
	    	var y = -1 * (platform.outputVscroll.getPosition().y - 10);
	    	platform.rectBackgroundText.setAttrs({
	    		  x:x,
	    		  y:y
	    		});
	    	platform.outputlayer.draw();
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
	bgGroup = new Kinetic.Group();
	   //主编辑区域背景框
	bgRect = new Kinetic.Rect( {
            x : 12,
            y : this.gridlayer.y()+1,
            fill: 'transparent',
            draggable : false,
//            width : gridlayer.width()-100,
//            height :gridlayer.height()-100,
            width:1070,
            height:480,//这个高度保证不挡住下面的输出框

    });

	  //主编辑区域网格框
    bgGridRect = new Kinetic.Rect( {
            x : bgRect.x(),
            y : 0,
            fill : "#fff",
            draggable : false,
            width :1070,
            height :480//这个高度保证不挡住下面的输出框
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
	
	this.addLoadPainting=function(newone,scalN,id,name) {
		paintings=new Paintings();
		paintings.init();
		paintings.p=newone;
		paintings.initPoint();
		paintings.scaleN=scalN;
		paintings.ID=id;//项目ID,t_guipro的id列
		paintings.name=name;//项目名称,t_guipro的proname列
		this.addPainting(paintings);
		this.paintingArray.push(paintings);
		paintings.index=this.paintingArray.indexOf(paintings);
		this.selectPainting.showSelected();

		
		/*
		 *加载模型后为每个元素添加 事件 ，为每个元素添加图形支持
		 */
		var polys=this.selectPainting.p.getChildren();
		//var leftpolys=new Leftpolys();
		leftpoly
		for ( var k=0;k<polys.length;k++) {
			setImage(polys[k]);
			polys[k].dragBoundFunc(leftpoly.dragFun);
			polys[k].on('click', leftpoly.clickFunc);
			polys[k].on('dblclick', leftpoly.dbclickFun);
			polys[k].on('dragend', leftpoly.cloneFun);
			polys[k].on('mousedown touchstart', leftpoly.cloneFun2);
			polys[k].on('mouseover', function() {
				document.body.style.cursor = 'pointer';
			});
			polys[k].on('mouseout', function() {
				document.body.style.cursor = 'default';
			});
		}
		showALLConnedPoints();
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
		return this.paintingArray[index];
	
	}
	//this.selectPainting=
	this.getPaintingByID=function(id){
		for (var i=0;i<this.paintingArray.length;i++){
			if(this.paintingArray[i]!=null&&this.paintingArray[i].ID==id)
				return this.paintingArray[i];
		}
	}
	this.hidePainting=function(index){
		
		temp=this.paintingArray[index];
		temp.hideSelected();
		this.paintingArray[index]=null;
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
	this.log=function(str){
		s=this.rectBackgroundText.text();
		this.rectBackgroundText.text(s+str+'\n');
		this.outputlayer.draw();
	}

};
	

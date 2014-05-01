var centerlayer;
var painting;
var paintingGroup;
var poly = new Array;
var mx=100;
var my=0;
var scaleN=1;
var stage;
var rectBackgroundCenter;
var selectPainting;
var gridlayer;
function initLight() {

	stage = new Kinetic.Stage({
        container: 'container',
        width: 1020,
        height: 800
      });
    
	var  leftlayer   = new Kinetic.Layer({
	    x:0,
	    y:0,
	    id: 'leftlayer',
	    width:100,
	    height:800
	});
	centerlayer   = new Kinetic.Layer({
	    x:100,
	    y:0,
	    id: 'centerlayer',
	    width:920,
	    height:800
//	    width:8,
//	    height:8
	});
	gridlayer  = new Kinetic.Layer({
	    x:100,
	    y:0,
	    id: 'leftlayer',
	    width:920,
	    height:800
	});
	
	paintingGroup = new Kinetic.Group({
		x : 100,
		y : 0,
		id : 'painting',
		width : 2000,
		height : 1000,
		fill : '#ff33ee',
		draggable : true
	});
	painting = new Kinetic.Layer({
		x : 100,
		y : 0,
		id : 'painting',
		width : 3000,
		height : 2000,
		fill : '#ff33ee',
//		fill: 'transparent',
		draggable : true
	});
	var rectBackground = new Kinetic.Rect({
	   x: 0,
	   y: 0,
	   height: stage.attrs.height,
	   width: stage.attrs.width,
	   fill: 'transparent',
	   draggable: false,
	   name: 'rectBackground'
	 });
	var rectBackgroundLeft = new Kinetic.Rect({
	   x: 0,
	   y: 0,
	   height: 800,
	   width: 100,
	   fill: 'transparent',
	   draggable: false,
	   stroke:'black',
	   name: 'rectBackgroundLeft'
	 });
	rectBackgroundCenter = new Kinetic.Rect({
	   x: 10,
	   y: 0,
	   height: 800,
	   width: 900,
	   fill: 'transparent',
	   draggable: false,
	   stroke:'black',
	   name: 'rectBackgroundCenter'
	 });
   
	poly[0] = new Kinetic.Line({
	   x: 5,
	   y: 20,
       points: [0,0 , 90, 0, 90, 10, 0, 10],
       fill: '#00D2FF',
       stroke: 'black',
       strokeWidth: 2,
       draggable: true,
       closed: true
     });
   
	poly[1] = new Kinetic.Line({
	   x: 5,
	   y: 70,
       points: [0,0 , 90, 0, 90, 10, 0, 10],
       fill: '#00FF00',
       stroke: 'black',
       strokeWidth: 2,
       draggable: true,
       closed: true
     });
   
	poly[2] = new Kinetic.Line({
	   x: 5,
	   y: 120,
       points: [0,0 , 90, 0, 90, 10, 0, 10],
       fill: '#FF0000',
       stroke: 'black',
       strokeWidth: 2,
       draggable: true,
       closed: true
     });
   
	poly[3] = new Kinetic.Line({
	   x: 5,
	   y: 170,
       points: [0,0 , 90, 0, 90, 10, 0, 10],
       fill: '#44ffee',
       stroke: 'black',
       strokeWidth: 2,      
       draggable: true,
       closed: true
     });
   
	poly[4] = new Kinetic.Circle({
	   x:45,
	   y:220,
	   radius:15,
	   fill: 'red',
	   stroke: 'black',
	   strokeWidth: 2,
	   fillEnabled:true,
	   rotationDeg:-10,
	   draggable: true
	   });
   
	poly[5] = new Kinetic.Rect({
	   x : 9,
	   y : 270,
	   width : 80,
	   height : 30,
	   cornerRadius:10,
	   scaleX:1,
       scaleY:1,
       RotationDeg:0,
	   draggable: true,
	   fill : 'blue'
	   });
		
		
	leftlayer.add(rectBackgroundLeft);
	centerlayer.add(rectBackgroundCenter);
   
	function checkPoint(pos,rect){
	   var size=rect.size();
	   if(pos.x>rect.x() && pos.y>rect.y()&& (pos.x<rect.x()+size.width)&& (pos.y<rect.y()+size.height)){
		   return true;
	   }
	   return false;
	}	
   
	var dragFun=function(pos){	  
	   if(checkPoint(pos,centerlayer)){		    
		   return {
			   x:pos.x,
			   y:pos.y
		   };
	   }
	   return {
		    x: this.getAbsolutePosition().x,
		    y: this.getAbsolutePosition().y
		  };
		};
		
	var cloneFun = function(e) {
		var userPos = stage.getPointerPosition();
		if (checkPoint(userPos, centerlayer))

		{
			if (this.getParent() != painting) {
				this.x((this.x() - mx)/scaleN);
				this.y((this.y()-my)/scaleN);
				this.moveTo(painting);
			
			}

		} else {
			this.destroy();
		}
		centerlayer.draw(this);
		stage.draw();
	};	

	var cloneFun2 = function(e) {
		if (e.type == 'mousedown' && this.getLayer() != painting) {
			var cloneOfItem = this.clone();

			// cloneOfItem.off('mousedown touchstart');
			leftlayer.add(cloneOfItem);

		}
		if (e.type == 'dragend') {

		}

	};
	
	var dbclickFun = function(e) {
		if (e.type == 'dblclick') {
			alert('dblclick caidan');
		}

	};
	
	var flag=0;
	var clickFunc=function(e){
		// 当前位置弹出菜单（div）
		$("#contextmenu").css({
			top:this.getAbsolutePosition().y+100,
			left:this.getAbsolutePosition().x+90,
			
		}).show();
		var clickshape=e.target;
		var flagin=flag;//当前序列
		flag++;
		/* 右键菜单处理 */	
		$("#contextmenu a").click(function(){
			if(flagin!=flag-1){
				return;
			}
			
			var text = $(this).text();
			if(text == '删除该节点'){
				
				clickshape.destroy();
				$("#contextmenu").hide();
				centerlayer.draw(this);
				painting.draw();
			}else if(text == '更改颜色'){
				node.style.fillStyle = Math.floor(Math.random()*250) + ","+Math.floor(Math.random()*250)+"," + Math.floor(Math.random()*250);
			}else if(text == '顺时针旋转90°'){
				clickshape.rotate(90);
//				centerlayer.draw(this);
				painting.draw();
			}else if(text == '逆时针旋转90°'){
				clickshape.rotate(-90);
//				centerlayer.draw(this);
				painting.draw();
			}else if(text == '放大'){
				clickshape.scale({
					x:clickshape.scaleX()*2,
					y:clickshape.scaleY()
				});		
				centerlayer.draw(this);
				painting.draw();
			}else if(text == '缩小'){
				clickshape.scale({
					x:clickshape.scaleX()/2,
					y:clickshape.scaleY()
				});		
				centerlayer.draw(this);
				painting.draw();
			}
			//$("#contextmenu").hide();
		});
		/*用kineticJs实现的菜单
		centerlayer.find('.rectDelete,.rectMenu,.textDelete,.rectRotateLeft90,.textRotateLeft90,.rectRotateRight90,.textRotateRight90,.rectRotate180,.textRotate180,.rectZoomIn,.textZoomIn,.rectZoomOut,.textZoomOut').destroy();
		centerlayer.draw(this);
		stage.draw();
		var clickshape= e.target;
		var rectDelete=new Kinetic.Rect({
			name:'rectDelete',
			x : this.getAbsolutePosition().x-20,
			y : this.getAbsolutePosition().y,
			width:80, 
			height:20,
			scaleX:1,
			scaleY:1,
			draggable: false,
			stroke:'black',
			strokeWidth:0.5
		});
		var textDelete = new Kinetic.Text({
	  		name:'textDelete',
	  		x : this.getAbsolutePosition().x-20,
	  		y : this.getAbsolutePosition().y,
	  		text: 'delete',
	  		fontSize: 20,
	  		fontFamily: 'Calibri',
	  		fill: 'black',
	  		width:80,
	  		align: 'center',
			offsetX:3
			});
		
		var rectRotateLeft90=new Kinetic.Rect({
			name:'rectRotateLeft90',
			x:this.getAbsolutePosition().x-20,
			y:this.getAbsolutePosition().y+20,
			width:80,
			height:20,
			scaleX:1,
			scaleY:1,
			draggable:false,
			stroke:'black',
			strokeWidth:0.5
		});
		var textRotateLeft90=new Kinetic.Text({
			name:'textRotateLeft90',
	  		x : this.getAbsolutePosition().x-20,
	  		y : this.getAbsolutePosition().y+20,
	  		text: 'left90',
	  		fontSize: 20,
	  		fontFamily: 'Calibri',
	  		fill: 'black',
	  		width:80,
	  		align: 'center',
			offsetX:3
		});
		
		var rectRotateRight90=new Kinetic.Rect({
			name:'rectRotateRight90',
			x:this.getAbsolutePosition().x-20,
			y:this.getAbsolutePosition().y+40,
			width:80,
			height:20,
			scaleX:1,
			scaleY:1,
			draggable:false,
			stroke:'black',
			strokeWidth:0.5
		});
		var textRotateRight90=new Kinetic.Text({
			name:'textRotateRight90',
	  		x : this.getAbsolutePosition().x-20,
	  		y : this.getAbsolutePosition().y+40,
	  		text: 'right90',
	  		fontSize: 20,
	  		fontFamily: 'Calibri',
	  		fill: 'black',
	  		width:80,
	  		align: 'center',
			offsetX:3
		});
		var rectRotate180=new Kinetic.Rect({
			name:'rectRotate180',
			x:this.getAbsolutePosition().x-20,
			y:this.getAbsolutePosition().y+60,
			width:80,
			height:20,
			scaleX:1,
			scaleY:1,
			draggable:false,
			stroke:'black',
			strokeWidth:0.5
		});
		var textRotate180=new Kinetic.Text({
			name:'textRotate180',
	  		x : this.getAbsolutePosition().x-20,
	  		y : this.getAbsolutePosition().y+60,
	  		text: 'rot180',
	  		fontSize: 20,
	  		fontFamily: 'Calibri',
	  		fill: 'black',
	  		width:80,
	  		align: 'center',
			offsetX:3
		});
		
		var rectZoomIn=new Kinetic.Rect({
			name:'rectZoomIn',
			x:this.getAbsolutePosition().x-20,
			y:this.getAbsolutePosition().y+80,
			width:80,
			height:20,
			scaleX:1,
			scaleY:1,
			draggable:false,
			stroke:'black',
			strokeWidth:0.5
		});
		var textZoomIn=new Kinetic.Text({
			name:'textZoomIn',
	  		x : this.getAbsolutePosition().x-20,
	  		y : this.getAbsolutePosition().y+80,
	  		text: 'zoomIn',
	  		fontSize: 20,
	  		fontFamily: 'Calibri',
	  		fill: 'black',
	  		width:80,
	  		align: 'center',
			offsetX:3
		});
		
		var rectZoomOut=new Kinetic.Rect({
			name:'rectZoomOut',
			x:this.getAbsolutePosition().x-20,
			y:this.getAbsolutePosition().y+100,
			width:80,
			height:20,
			scaleX:1,
			scaleY:1,
			draggable:false,
			stroke:'black',
			strokeWidth:0.5
		});
		var textZoomOut=new Kinetic.Text({
			name:'textZoomOut',
	  		x : this.getAbsolutePosition().x-20,
	  		y : this.getAbsolutePosition().y+100,
	  		text: 'zoomOut',
	  		fontSize: 20,
	  		fontFamily: 'Calibri',
	  		fill: 'black',
	  		width:80,
	  		align: 'center',
			offsetX:3
		});
		var rectMenu = new Kinetic.Rect({
	   	   name:'rectMenu',
	   	   x : this.getAbsolutePosition().x-20,
	   	   y : this.getAbsolutePosition().y,
	   	   width : 80,
	   	   height : 200,
		   scaleX:1,
		   scaleY:1,
		   RotationDeg:0,
		   draggable: false,
		   fill : 'white',
		   stroke : 'black',
		   strokeWidth:0.5
		   });
   
		textDelete.on('click',function(e){
			clickshape.destroy();
			centerlayer.find('.rectDelete,.rectMenu,.textDelete,.rectRotateLeft90,.textRotateLeft90,.rectRotateRight90,.textRotateRight90,.rectRotate180,.textRotate180,.rectZoomIn,.textZoomIn,.rectZoomOut,.textZoomOut').destroy();
//		  e.target.destroy();
//		  rectDelete.destroy();
//		  rectMenu.destroy();
			centerlayer.draw(this);
			painting.draw();
		  });
		textRotateLeft90.on('click',function(e){
			clickshape.rotate(-90);
			centerlayer.draw(this);
			painting.draw();
		});
		textRotateRight90.on('click',function(e){
			clickshape.rotate(90);
			centerlayer.draw(this);
			painting.draw();
		});
		textRotate180.on('click',function(e){
			clickshape.rotate(180);
			centerlayer.draw(this);
			painting.draw();
		});
		textZoomIn.on('click',function(e){
			clickshape.scale({
				x:clickshape.scaleX()*2,
				y:clickshape.scaleY()
			});		
			centerlayer.draw(this);
			painting.draw();
		});
		textZoomOut.on('click',function(e){
			clickshape.scale({
				x:clickshape.scaleX()/2,
				y:clickshape.scaleY()
			});
			centerlayer.draw(this);
			painting.draw(); 
		});
	  centerlayer.add(rectMenu);
	  centerlayer.add(rectDelete);
	  centerlayer.add(textDelete);
	  centerlayer.add(rectRotateLeft90);
	  centerlayer.add(textRotateLeft90);
	  centerlayer.add(rectRotateRight90);
	  centerlayer.add(textRotateRight90);
	  centerlayer.add(rectRotate180);
	  centerlayer.add(textRotate180);
	  centerlayer.add(rectZoomIn);
	  centerlayer.add(textZoomIn);
	  centerlayer.add(rectZoomOut);
	  centerlayer.add(textZoomOut);
	  centerlayer.draw(this);
	  stage.draw(); */
	};
	
	for ( var k in poly) {
		poly[k].dragBoundFunc(dragFun);
		poly[k].on('click', clickFunc);
//		poly[k].on('dblclick', dbclickFun);
		leftlayer.add(poly[k]);
		poly[k].on('dragend', cloneFun);
		poly[k].on('mousedown touchstart', cloneFun2);
	}
	
	var updateBackgroundPos = function() {
	    var x =(hscroll.getPosition().x - 20)/(centerlayer.getWidth() - 90-110);
	    var y =(vscroll.getPosition().y - 20)/(centerlayer.getHeight() -90-110);
	    var px=painting.getWidth();
	    var py=painting.getHeight();
	    mx=100-(px-centerlayer.getWidth())*x;
	    my=0-(py-centerlayer.getHeight())*y;
	    painting.x(mx);
	    
	    painting.y(my);
	    var childs=painting.getChildren();
	    	 
	    
	    for (var ich in childs){
	    /*	
	    	if(checkPoint(childs[ich].getAbsolutePosition(),centerlayer)){
	    		childs[ich].show();
	    	}
	    	else{
	    		childs[ich].hide();
	    	}*/
	    	
	    }
	    painting.draw();
	};
    var areas = new Kinetic.Group();
    var scrollbars = new Kinetic.Group();
    var container = stage.getContainer();
    
    /*
     * horizontal scrollbars
     */
    var hscrollArea = new Kinetic.Rect({
      x: 20,
      y: centerlayer.getHeight() - 30,
      width: centerlayer.getWidth() - 70,
      height: 20,
      fill:'black',
      opacity: 0.3
    });
    
    var hscroll = new Kinetic.Rect({
        x: 20,
        y: centerlayer.getHeight() - 30,
        width: 130,
        height: 20,
        fill: '#9f005b',
        draggable: true,
        dragBoundFunc: function(pos) {
          var newX = pos.x;
          if(newX < centerlayer.x()+20) {
            newX = centerlayer.x()+20;
          }
          else if(newX > centerlayer.getWidth()-80 ) {
            newX = centerlayer.getWidth() -80;
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
    var vscrollArea = new Kinetic.Rect({
      x: centerlayer.getWidth() - 40,
      y: 20,
      width: 20,
      height: centerlayer.getHeight() - 70,
      fill: 'black',
      opacity: 0.3
    });
    var vscroll = new Kinetic.Rect({
        x: centerlayer.getWidth() - 40,
        y: 20,
        width: 20,
        height: 130,
        fill: '#9f005b',
        draggable: true,
        dragBoundFunc: function(pos) {
          var newY = pos.y;
          if(newY < 20) {
            newY = 20;
          }
          else if(newY > centerlayer.getHeight() - 110-70) {
            newY = centerlayer.getHeight() - 110-70;
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
    /*
     * scrollbars
     */
    scrollbars.on('mouseover', function() {
      document.body.style.cursor = 'pointer';
    });
    scrollbars.on('mouseout', function() {
      document.body.style.cursor = 'default';
    });

    hscroll.on('dragmove', updateBackgroundPos);
    vscroll.on('dragmove', updateBackgroundPos);

    areas.add(hscrollArea);
    areas.add(vscrollArea);
    scrollbars.add(hscroll);
    scrollbars.add(vscroll);
    centerlayer.add(areas);
    centerlayer.add(scrollbars);
 // group.setZIndex(-1);
	painting.on('mouseover', function() {
		document.body.style.cursor = 'pointer';
	});
	painting.on('mouseout', function() {
		document.body.style.cursor = 'default';
	});
	leftlayer.on('mouseover', function() {
		document.body.style.cursor = 'pointer';
	});
	leftlayer.on('mouseout', function() {
		document.body.style.cursor = 'default';
	});
	centerlayer.on('click',function(e){//如果点击在中央层的背景上则隐藏点击菜单
		if(e.target.name()==='rectBackgroundCenter')
		$('#contextmenu').hide();
	});
	stage.add(gridlayer);
	stage.add(leftlayer);
	
	stage.add(centerlayer);
	stage.add(painting);
	selectPainting=painting;
}



function save(s) {

	jsondata=selectPainting.toJSON();
	console.log(jsondata);
	//selectPainting=Kinetic.Node.create(jsondata, 'container')
	
	$.ajax({
		type : 'POST',
		url : 'updateGUIPro.action',
		data : {			
			data:jsondata,
			ID:'1',
		},
		success : function(data) {
			alert('图形化保存成功!');
	
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmInputList").trigger("reloadGrid");			
		},
		error:function(msg){
			alert(msg);
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmList").trigger("reloadGrid");
		}
	});

}
function createNew(s) {
	jsondata=selectPainting.toJSON();
	$.ajax({
		type : 'POST',
		url : 'addGUIPro.action',
		data : {
			Description:'testDes',
			name:'testname',
			data:jsondata,
			authorID:'1',
			type:'1'
		},
		success : function(data) {
			alert('图形化项目新建成功!');
	
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmInputList").trigger("reloadGrid");			
		},
		error:function(msg){
			alert(msg);
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmList").trigger("reloadGrid");
		}
	});

}
function load() {

	selectedID=1;
	$.ajax({
		type : 'POST',
		url : 'viewGUIPro.action',
		data : {
			
			ID:selectedID
			
		},
		success : function(data) {
			alert('图形化载入成功!');
			//data=jQuery.parseJSON(data);
			saveData=data['dataView']['JSONData'];
			//alert(saveData);
			//console.log(saveData['JSONData']);
			newone=Kinetic.Node.create(saveData);
			
			selectPainting.remove();
			selectPainting.destroy();
			stage.add(newone);
			selectPainting=newone;
			painting=newone;
			stage.draw();
			
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmInputList").trigger("reloadGrid");			
		},
		error:function(msg){
			alert(msg);
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmList").trigger("reloadGrid");
		}
	});
}
function scaleCenter(s) {
	
	scaleN=scaleN*s;
	selectPainting.scaleX(painting.scaleX() * s);
	selectPainting.scaleY(painting.scaleY() * s);
	selectPainting.draw();
}
/*
 * draw grid
 */
//var gridlayer;
var bgGroup;
var bgRect;
var bgGridRect;

function showGrid(){
	if(document.getElementById("gridCheckbox").checked==true){
		drawGrid();
	}else{
		bgGroup.destroy();
		gridlayer.draw();
	}
}
function drawGrid(){

	var gridEle = 1;
//	gridlayer=centerlayer;
	bgGroup = new Kinetic.Group();
	   //主编辑区域背景框
	bgRect = new Kinetic.Rect( {
            x : 12,
            y : gridlayer.y()+1,
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

    bgGroup.add(bgRect);
    gridlayer.add(bgGroup);
	  //主编辑区域网格框
    bgGridRect = new Kinetic.Rect( {
            x : bgRect.x(),
            y : bgRect.y(),
            fill : "#fff",
//            fill: 'transparent',
            draggable : false,
            width :880,
            height :765
    });
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
    gridlayer.draw();

}
//var showGrid = function() {
//	W=100;
//	H=100;
//	w=10;
//	h=10;
//	CELL_SIZE=1;
//    var grid = new Kinetic.Layer();
//    var r = new Kinetic.Rect({
//        x: 0,
//        y: 0,
//        width: W,
//        height: H,
//        fill: 'transparent'
//    });
//    grid.add(r);
//    for (i = 0; i < w + 1; i++) {
//        var I = i * CELL_SIZE;
//        var l = new Kinetic.Line({
//            stroke: "black",
//            points: [I, 0, I, H]
//        });
//        grid.add(l);
//    }
//
//    for (j = 0; j < h + 1; j++) {
//        var J = j * CELL_SIZE;
//        var l2 = new Kinetic.Line({
//            stroke: "black",
//            points: [0, J, W, J]
//        });
//        grid.add(l2);
//    }
//    stage.add(grid);      
//};


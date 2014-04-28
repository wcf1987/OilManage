function getMousePos(canvas, evt){
    // 获得 canvas 位置
    var obj = canvas;
    var top = 0;
    var left = 0;
    while (obj && obj.tagName != 'BODY') {
        top += obj.offsetTop;
        left += obj.offsetLeft;
        obj = obj.offsetParent;
    }
 
    // 返回鼠标相对位置
    var mouseX = evt.clientX - left + window.pageXOffset;
    var mouseY = evt.clientY - top + window.pageYOffset;
    return {
        x: mouseX,
        y: mouseY
    };
}
function mousePosition(e){
	if(e.pageX||e.pageY){
		return{x:e.pageX,y:pageY};
	}
	return{
		x:e.clientX+document.body.scrollLeft-document.body.clientLeft,
		y:e.clientY+document.body.scrollTop-document.body.clientTop
	};
}
var stage = new Kinetic.Stage({
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
   var  centerlayer   = new Kinetic.Layer({
	    x:100,
	    y:0,
	    id: 'centerlayer',
	    width:920,
	    height:800
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
   var rectBackgroundCenter = new Kinetic.Rect({
	   x: 10,
	   y: 0,
	   height: 800,
	   width: 900,
	   fill: 'transparent',
	   draggable: false,
	   stroke:'black',
	   name: 'rectBackgroundCenter'
	 });
   

   
   
   var poly1 = new Kinetic.Line({
	   x: 5,
	   y: 20,
       points: [0,0 , 90, 0, 90, 10, 0, 10],
       fill: '#00D2FF',
       stroke: 'black',
       strokeWidth: 2,
       draggable: true,
       closed: true
     });
   
   var poly2 = new Kinetic.Line({
	   x: 5,
	   y: 70,
       points: [0,0 , 90, 0, 90, 10, 0, 10],
       fill: '#00FF00',
       stroke: 'black',
       strokeWidth: 2,
       draggable: true,
       closed: true
     });
   
   var poly3 = new Kinetic.Line({
	   x: 5,
	   y: 120,
       points: [0,0 , 90, 0, 90, 10, 0, 10],
       fill: '#FF0000',
       stroke: 'black',
       strokeWidth: 2,
       draggable: true,
       closed: true
     });
   
   var poly4 = new Kinetic.Line({
	   x: 5,
	   y: 170,
       points: [0,0 , 90, 0, 90, 10, 0, 10],
       fill: '#44ffee',
       stroke: 'black',
       strokeWidth: 2,
       
       draggable: true,
       closed: true
     });
   
   var circle1 = new Kinetic.Circle({
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
   
   var rect1 = new Kinetic.Rect({

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
   
   var group=new Kinetic.Group();
   group.add(rect1);

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
		   }
	   }
	   return {
		    x: this.getAbsolutePosition().x,
		    y: this.getAbsolutePosition().y
		  };
		};
   var cloneFun=function(e){        
       var userPos = stage.getPointerPosition();
       if (checkPoint(userPos,centerlayer))
    	   
       {  if(this.getParent()!=centerlayer)
    	   {this.x(this.x()-centerlayer.x());
           this.moveTo(centerlayer);
    	   }
           
       }
       else 
       {
           this.destroy();
       }
       centerlayer.draw(this);
       stage.draw(); 
   };		
   poly1.dragBoundFunc(dragFun);
   poly2.dragBoundFunc(dragFun);
   poly3.dragBoundFunc(dragFun);
   poly4.dragBoundFunc(dragFun);
   circle1.dragBoundFunc(dragFun);
   rect1.dragBoundFunc(dragFun);
   leftlayer.add(poly1);
   leftlayer.add(poly2);
   leftlayer.add(poly3);
   leftlayer.add(poly4);
   leftlayer.add(circle1);
//   leftlayer.add(rect1);
   leftlayer.add(group);
   stage.add(leftlayer);
   stage.add(centerlayer);

   
   var cloneFun2=function(e){	   
	   if (e.type == 'mousedown' && this.getLayer()!=centerlayer) {
		    var cloneOfItem= this.clone();
		   
		    //cloneOfItem.off('mousedown touchstart');
		    leftlayer.add(cloneOfItem);  
		   
		    }
	   if (e.type == 'dragend' ) {	
		  
		 
		    }


	};
	poly1.on('dragend', cloneFun);
	poly2.on('dragend', cloneFun);
	poly3.on('dragend', cloneFun);
	poly4.on('dragend', cloneFun);
	circle1.on('dragend',cloneFun);
	rect1.on('dragend',cloneFun);
	poly1.on('mousedown touchstart',cloneFun2);
	poly2.on('mousedown touchstart',cloneFun2);
	poly3.on('mousedown touchstart',cloneFun2);
	poly4.on('mousedown touchstart',cloneFun2);
	circle1.on('mousedown touchstart',cloneFun2);
	rect1.on('mousedown touchstart',cloneFun2);
	
	
	var clickFunc=function(e){
		centerlayer.find('.rectDelete,.rectMenu,.textDelete').destroy();
		centerlayer.draw(this);
		stage.draw();

		
//		$("#contextmenu").css({
//			top: this.getAbsolutePosition().y,
//			left: this.getAbsolutePosition().x
//		}).show();
		  var clickshape= e.target;
//		  var mousePos = getMousePos($('#right'), e);
//		  var ev = ev || window.event;
//		  var mousePos = mousePosition(e);
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
				//			  	x:mousePos.x,
				//			  	y:mousePos.y,
				text: 'delete',
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
//				x:mousePos.x,
//			  	y:mousePos.y,
			   width : 80,
			   height : 200,
//			   cornerRadius:10,
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
			  e.target.destroy();
			  rectDelete.destroy();
			  rectMenu.destroy();
			  centerlayer.draw(this);
		       stage.draw(); 
			  
			  });
//		   group.add(textDelete);
		   centerlayer.add(rectMenu);
		   centerlayer.add(rectDelete);
		   centerlayer.add(textDelete);
		   
//		this.destroy();
//		this.remove();
//		this.hide();
		 centerlayer.draw(this);
	       stage.draw(); 
	};
	rect1.on('click',clickFunc);



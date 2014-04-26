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
   }		
   poly1.dragBoundFunc(dragFun);
   poly2.dragBoundFunc(dragFun);
   poly3.dragBoundFunc(dragFun);
   poly4.dragBoundFunc(dragFun);
   leftlayer.add(poly1);
   leftlayer.add(poly2);
   leftlayer.add(poly3);
   leftlayer.add(poly4);
   
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
	poly1.on('mousedown touchstart',cloneFun2);
	poly2.on('mousedown touchstart',cloneFun2);
	poly3.on('mousedown touchstart',cloneFun2);
	poly4.on('mousedown touchstart',cloneFun2);




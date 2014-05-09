var Paintings = function() {
	
	this.init=function(){
		this.p = new Kinetic.Layer({
			x : 100,
			y : 100,
			id : 'painting',
			width : 3000,
			height : 2000,
			fill : '#ff33ee',
//			fill: 'transparent',
			draggable : true
		});
		
		 
		 var areas = new Kinetic.Group();
		 var scrollbars = new Kinetic.Group();
		 var container = platform.stage.getContainer();
		    
		    /*
		     * horizontal scrollbars
		     */
		   this.hscrollArea = new Kinetic.Rect({
		      x: 20,
		      y: platform.centerlayer.getHeight() - 30,
		      width: platform.centerlayer.getWidth() - 70,
		      height: 20,
		      fill:'black',
		      opacity: 0.3
		    });
		    
		   this.hscroll = new Kinetic.Rect({
		        x: 20,
		        y: platform.centerlayer.getHeight() - 30,
		        width: 130,
		        height: 20,
		        fill: '#9f005b',
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
		      x: platform.centerlayer.getWidth() - 40,
		      y: 20,
		      width: 20,
		      height: platform.centerlayer.getHeight() - 70,
		      fill: 'black',
		      opacity: 0.3
		    });
		   this.vscroll = new Kinetic.Rect({
		        x: platform.centerlayer.getWidth() - 40,
		        y: 20,
		        width: 20,
		        height: 130,
		        fill: '#9f005b',
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

		    /*
		     * scrollbars
		     */
		    scrollbars.on('mouseover', function() {
		      document.body.style.cursor = 'pointer';
		    });
		    scrollbars.on('mouseout', function() {
		      document.body.style.cursor = 'default';
		    });

		    this.hscroll.on('dragmove', updateBackgroundPos);
		    this.vscroll.on('dragmove', updateBackgroundPos);

		    areas.add(this.hscrollArea);
		    areas.add(this.vscrollArea);
		    scrollbars.add(this.hscroll);
		    scrollbars.add(this.vscroll);
		    platform.centerlayer.add(areas);
		    platform.centerlayer.add(scrollbars);
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
	function updateBackgroundPos(){
		x =(platform.selectPainting.hscroll.getPosition().x - 20)/(platform.centerlayer.getWidth() - 90-110);
	    y =(platform.selectPainting.vscroll.getPosition().y - 20)/(platform.centerlayer.getHeight() -90-110);
	    px=platform.selectPainting.p.getWidth();
	    py=platform.selectPainting.p.getHeight();
	    platform.selectPainting.mx=100-(px-platform.centerlayer.getWidth())*x;
	    platform.selectPainting.my=100-(py-platform.centerlayer.getHeight())*y;
	    platform.selectPainting.p.x(platform.selectPainting.mx);
	    
	    platform.selectPainting.p.y(platform.selectPainting.my);
	    
	   	//selectPainting.draw();
	    platform.selectPainting.p.moveToTop();
	    platform.selectPainting.p.draw();
	}
	this.scaleN=1;
	this.deletePainting=function(){
		
	}
	this.update=function(){
		updateBackgroundPos();
		platform.centerlayer.draw();
	}
}
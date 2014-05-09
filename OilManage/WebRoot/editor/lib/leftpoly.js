var Leftpolys = function() {
	this.polys = new Array;
	this.polys[0] = new Kinetic.Line({
		x : 5,
		y : 20,
		points : [ 0, 0, 90, 0, 90, 10, 0, 10 ],
		fill : '#00D2FF',
		stroke : 'black',
		strokeWidth : 2,
		draggable : true,
		closed : true
	});

	this.polys[1] = new Kinetic.Line({
		x : 5,
		y : 70,
		points : [ 0, 0, 90, 0, 90, 10, 0, 10 ],
		fill : '#00FF00',
		stroke : 'black',
		strokeWidth : 2,
		draggable : true,
		closed : true
	});

	this.polys[2] = new Kinetic.Line({
		x : 5,
		y : 120,
		points : [ 0, 0, 90, 0, 90, 10, 0, 10 ],
		fill : '#FF0000',
		stroke : 'black',
		strokeWidth : 2,
		draggable : true,
		closed : true
	});

	this.polys[3] = new Kinetic.Line({
		x : 5,
		y : 170,
		points : [ 0, 0, 90, 0, 90, 10, 0, 10 ],
		fill : '#44ffee',
		stroke : 'black',
		strokeWidth : 2,
		draggable : true,
		closed : true
	});

	this.polys[4] = new Kinetic.Circle({
		x : 45,
		y : 220,
		radius : 15,
		fill : 'red',
		stroke : 'black',
		strokeWidth : 2,
		fillEnabled : true,
		rotationDeg : -10,
		draggable : true
	});

	this.polys[5] = new Kinetic.Rect({
		x : 9,
		y : 270,
		width : 80,
		height : 30,
		cornerRadius : 10,
		scaleX : 1,
		scaleY : 1,
		RotationDeg : 0,
		draggable : true,
		fill : 'blue'
	});
	this.init = function() {
		for ( var k in this.polys) {
			this.polys[k].dragBoundFunc(this.dragFun);
			this.polys[k].on('click', this.clickFunc);
			// polys[k].on('dblclick', dbclickFun);

			this.polys[k].on('dragend', this.cloneFun);
			this.polys[k].on('mousedown touchstart', this.cloneFun2);
		}
	}
	/*
	 * 检查点是否在矩形区域里面
	 */
	  function checkPoint(pos, rect) {
		
		var size = rect.size();
		if (pos.x > rect.x() && pos.y > rect.y()
				&& (pos.x < rect.x() + size.width)
				&& (pos.y < rect.y() + size.height)) {
			return true;
		}
		return false;
	};
	//var platform=null;
	this.dragFun = function(pos) {
		if (checkPoint(pos, platform.centerlayer)) {
			return {
				x : pos.x,
				y : pos.y
			};
		}
		return {
			x : this.getAbsolutePosition().x,
			y : this.getAbsolutePosition().y
		};
	};

	this.cloneFun = function(e) {
		var userPos = platform.stage.getPointerPosition();
		if (checkPoint(userPos, platform.centerlayer))// 如果在中间画布上面

		{
			if (this.getParent() != platform.selectPainting.p) {

				this.x((this.x() - platform.selectPainting.mx) / platform.selectPainting.scaleN);
				this.y((this.y() - platform.selectPainting.my) / platform.selectPainting.scaleN);
				this.moveTo(platform.selectPainting.p);

			}

		} else {
			this.destroy();// 不在中间画布就摧毁
		}
		platform.centerlayer.draw(this);
		platform.stage.draw();
	};

	this.cloneFun2 = function(e) {
		if (e.type == 'mousedown' && this.getLayer() != platform.selectPainting.p) {
			var cloneOfItem = this.clone();

			// cloneOfItem.off('mousedown touchstart');
			platform.leftlayer.add(cloneOfItem);

		}
		if (e.type == 'dragend') {

		}

	};

	this.dbclickFun = function(e) {
		if (e.type == 'dblclick') {
			alert('dblclick caidan');
		}

	};

	this.flag = 0;
	this.clickFunc = function(e) {
		// 当前位置弹出菜单（div）
		$("#contextmenu").css({
			top : this.getAbsolutePosition().y + 100,
			left : this.getAbsolutePosition().x + 90,

		}).show();
		var clickshape = e.target;
		var flagin = flag;// 当前序列
		flag++;
		/* 右键菜单处理 */
		$("#contextmenu a").click(
				function() {
					if (flagin != flag - 1) {
						return;
					}

					var text = $(this).text();
					if (text == '删除该节点') {

						clickshape.destroy();
						$("#contextmenu").hide();
						centerlayer.draw(this);
						selectPainting.draw();
					} else if (text == '更改颜色') {
						node.style.fillStyle = Math.floor(Math.random() * 250)
								+ "," + Math.floor(Math.random() * 250) + ","
								+ Math.floor(Math.random() * 250);
					} else if (text == '顺时针旋转90°') {
						clickshape.rotate(90);
						// centerlayer.draw(this);
						selectPainting.draw();
					} else if (text == '逆时针旋转90°') {
						clickshape.rotate(-90);
						// centerlayer.draw(this);
						selectPainting.draw();
					} else if (text == '放大') {
						clickshape.scale({
							x : clickshape.scaleX() * 2,
							y : clickshape.scaleY()
						});
						centerlayer.draw(this);
						selectPainting.draw();
					} else if (text == '缩小') {
						clickshape.scale({
							x : clickshape.scaleX() / 2,
							y : clickshape.scaleY()
						});
						centerlayer.draw(this);
						selectPainting.draw();
					}
					// $("#contextmenu").hide();
				});
	};
}
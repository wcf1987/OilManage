var Leftpolys = /**
 * 
 */
function() {
	 var lastsel;
	 var datagrid =jQuery("#PointPraList").jqGrid({
		   	url:'listPointPra.action',
			datatype: "json",
			mtype : 'POST',
		   	colNames:['ID','属性中文名称', '属性英文名称', '属性值','属性ISO值','单位名称','单位符号'],
		   	colModel:[
		   		{name:'ID',index:'ID', width:100,align:"center",hidden:true,editable:true},
		   		{name:'par_display',index:'par_display', width:100, align:"center"},
		   		{name:'par_name',index:'par_name', width:100,align:"center",hidden:true},
		   		{name:'par_value',index:'par_value', width:100, align:"center",editable:true},
		   		{name:'par_ISOValue',index:'par_ISOValue', width:100, align:"center",hidden:true,editable:true},		
		   		{name:'measure_CName',index:'measure_CName', width:100,align:"center"},		
		   		{name:'measure_Symbol',index:'measure_Symbol', width:100, align:"center"},
//		   		{name:'act',index:'act', width:75,sortable:false}
		   	],
		   	width:700,//530
		   	rowNum:10,
		   	rowList:[10,20,30],
		   	pager: '#PointPraPager',
		   	sortname: 'id',
		    viewrecords: true,
		    sortorder: "desc",
/*			gridComplete: function(){
				var ids = jQuery("#PointPraList").jqGrid('getDataIDs');
				for(var i=0;i < ids.length;i++){
					var cl = ids[i];
					be = "<input style='height:22px;width:20px;' type='button' value='E' onclick=\"jQuery('#PointPraList').editRow('"+cl+"');\"  />"; 
					se = "<input style='height:22px;width:20px;' type='button' value='S' onclick=\"jQuery('#PointPraList').saveRow('"+cl+"');\"  />"; 
					ce = "<input style='height:22px;width:20px;' type='button' value='C' onclick=\"jQuery('#PointPraList').restoreRow('"+cl+"');\" />"; 
					jQuery("#PointPraList").jqGrid('setRowData',ids[i],{act:be+se+ce});
				}	
			},*/
			editurl: "editPointPra.action",
			caption: "属性列表",
			jsonReader: {//读取后端json数据的格式
				root: "pointPraList",//保存详细记录的名称
				total: "total",//总共有多少页
				page: "page",//当前是哪一页
				records: "records",//总共记录数
				repeatitems: false
			},
		});
//		 $('#PointPraList').trigger("reloadGrid");
	 datagrid.jqGrid('navGrid','#PointPraPager',{
			edit : false,
			add : false,
			search:false,
			del : false}).jqGrid('navButtonAdd',"#PointPraPager",{
				title:'保存',
				caption:"保存",	
				id:"save_PointPraList",
				onClickButton:function(){
					var rowID = $("#PointPraList").jqGrid('getGridParam','selrow'); 				
					jQuery("#PointPraList").jqGrid('saveRow',rowID, function(result) {
							if (result.responseText=="") {alert("更新失败!"); return false;}
							return true;
						}
					);
					},
				position:"first"
			}).jqGrid('navButtonAdd',"#PointPraPager",{
					title:'编辑',
					caption:"编辑",
					id:"edit_PointPraList",
					onClickButton : function addModal(){
						var rowID = $("#PointPraList").jqGrid('getGridParam','selrow'); 
						jQuery("#PointPraList").jqGrid('editRow',rowID);
					},
					position:"first"
				});

	this.polys = new Array;
	this.imgobj=new Array;
	this.polyGroups = new Array;
	this.connectionPoints = new Array;
	this.radiusL=5;
	this.polyhight=30;
	this.polywidth=40;
	this.polylineLength=20;
	this.lpoints=[ 0, 0, -20, 0];
	this.rpoints=[ 0, 0, 20, 0];
/*	this.polys[0] = new Kinetic.Line({
		x : 5,
		y : 20,
		points : [ 0, 0, 90, 0, 90, 10, 0, 10 ],
		fill : '#00D2FF',
		stroke : 'black',
		strokeWidth : 2,

		name : 'test1',
		closed : true
	});
*/  
	this.imgLoad = function (url,i){
	
		this.imgobj[i] = new Image();
		this.imgobj[i].src = url;
	    if (this.imgobj[i].complete) {
	        this.createIMG(this.imgobj[i],i);
	    } else {
	    	this.imgobj[i].onload = function () {
	        	leftpoly.createIMG(leftpoly.imgobj[i],i);
	        	leftpoly.imgobj[i].onload = null;
	        };
	    };
	    
	};
	this.createIMG = function (img,i){
		
		leftpoly.polys[i] = new Kinetic.Image({
		    x: 10,
		    y: 10+i*70,
		    image: img,
		    width: 80,
		    name : 'type'+i,
		    height: 60
		  });
	}

	this.getImgage=function (g){
		name=g.name();
		index=name.substr(4,1);
		return this.imgobj[index];
	}
	this.reloadIMG=function(){
		for ( var k=0;k<this.polys.length;k++) {
		this.polys[k].setImage(this.imgobj[k]);
		}
		platform.drawLeft();
	}
		
	this.init = function() {
		for(var i=0;i<6;i++){
			this.imgLoad('editor/icons/type'+i+'.png',i);
		}	
		for ( var k=0;k<this.polys.length;k++) {
			
			this.polyGroups[k] = new Kinetic.Group({
				x : this.polys[k].x(),
				y : this.polys[k].y(),
				name:this.polys[k].name(),
				draggable : true

			});
			var PointLeft = new Kinetic.Circle({
				x : this.polylineLength,
				y : this.polyhight,

				radius : 0,
				fill : 'black',
				stroke : 'black',
				name : 'PointLeft',
				strokeWidth : 1
			});
			
			var PointRight = new Kinetic.Circle({
				x : this.polywidth+this.polylineLength,
				y : this.polyhight,
				name : 'PointRight',
				radius : 0,
				fill : 'black',
				stroke : 'black',
				strokeWidth : 1
			});
			
			var lineLeft = new Kinetic.Line({
				x : this.polylineLength,
				y : this.polyhight,
				points : 	this.lpoints.concat(),
				 
				 stroke : 'black',
				strokeWidth : 5,

				name : 'lineLeft',
				closed : true
				
			});
			var lineRight = new Kinetic.Line({
				x : this.polywidth+this.polylineLength,
				y : this.polyhight,
				 points : this.rpoints.concat(),
				
				 stroke : 'black',
				strokeWidth : 5,

				name : 'lineRight',
				closed : true
			});
			var connPointsLeft = new Kinetic.Circle({
				x : 0,
				y : this.polyhight,

				radius : this.radiusL,
				fill : 'red',
				stroke : 'black',
				name : 'connPointsLeft',
				strokeWidth : 2
			});
			
			var connPointsRight = new Kinetic.Circle({
				x : this.polywidth+this.polylineLength*2,
				y : this.polyhight,
				name : 'connPointsRight',
				radius : this.radiusL,
				fill : 'red',
				stroke : 'black',
				strokeWidth : 2
			});

			this.polys[k].x(0);
			this.polys[k].y(0);
			this.polyGroups[k].add(this.polys[k]);
			this.lock=false;
			if(k==0){
				this.polyGroups[k].add(lineRight);
				this.polyGroups[k].add(connPointsRight);
				this.polyGroups[k].add(PointRight);
				
				connPointsRight.hide();	
				this.initPoint(this.polyGroups[k]);
				continue;
			}
			if(k==1){
				this.polyGroups[k].add(lineLeft);
				this.polyGroups[k].add(connPointsLeft);	
				this.polyGroups[k].add(PointLeft);
				connPointsLeft.hide();
				this.initPoint(this.polyGroups[k]);
				continue;
			}
			this.polyGroups[k].add(lineRight);
			this.polyGroups[k].add(lineLeft);
			this.polyGroups[k].add(connPointsLeft);
			this.polyGroups[k].add(PointLeft);
			this.polyGroups[k].add(connPointsRight);
			this.polyGroups[k].add(PointRight);
			connPointsLeft.hide();
			connPointsRight.hide();	
			this.initPoint(this.polyGroups[k]);
			
		}

	}
	this.initPoint = function(point){
		point.dragBoundFunc(this.dragFun);
		point.on('click', this.clickFunc);
		point.on('dblclick', this.dbclickFun);
		point.on('dragend', this.cloneFun);
		point.on('mousedown touchstart', this.cloneFun2);
		point.on('mouseover', function() {
			document.body.style.cursor = 'pointer';
		});
		point.on('mouseout', function() {
			document.body.style.cursor = 'default';
		});
	}
	/*
	 * 检查点是否在矩形区域里面
	 */

	// var platform=null;
	this.dragFun = function(pos) {

		if(platform.selectPainting==null){
			return {
				x : this.getAbsolutePosition().x,
				y : this.getAbsolutePosition().y
			};
		}
	
		
		if (checkPoint(pos, platform.centerlayer)) {		
			if((this.lock==null||this.lock==false)){

				platform.selectPainting.hasChange();		
				resizePoint(this);	
				return {
					x : pos.x,
					y : pos.y
				};
			}else{
				platform.selectPainting.hasChange();				
				dis={
						x:(this.getAbsolutePosition().x-pos.x)/platform.selectPainting.scaleN,
						y:(this.getAbsolutePosition().y-pos.y)/platform.selectPainting.scaleN
					}
				
				l=getLeftLine(this);
				lc=getLeftPoint(this);
				lch=getLeftPointHide(this);
				r=getRightLine(this);
				rc=getRightPoint(this);
				poly=getPoly(this);				
				if(l!=null&&lc.fill()!='red'){
					this.setAbsolutePosition(pos);	
					//logD('一次移动');
					//logD('lch.x:'+lch.x()+' y:'+lch.y());
					//logD('lc.x:'+lc.x()+' y:'+lc.y());
					movePoint(lc,dis,this.rotation());
					//lc.move(point);
					//logD('move to lc.x:'+lc.x()+' y:'+lc.y());
					//logD('');
					drawLine(l,dis,this.rotation());					
				}				
				if(r!=null&&rc.fill()!='red'){
					this.setAbsolutePosition(pos);	
					movePoint(rc,dis,this.rotation());
					drawLine(r,dis,this.rotation());
				}				
				//platform.draw();
				return {
					x : this.getAbsolutePosition().x,
					y : this.getAbsolutePosition().y
				};
			}
			
		}
		return {
			x : this.getAbsolutePosition().x,
			y : this.getAbsolutePosition().y
		};
	};
	
	this.cloneFun = function(e) {

		var userPos = platform.stage.getPointerPosition();
		if (platform.selectPainting!=null &&checkPoint(userPos, platform.centerlayer))// 如果在中间画布上面

		{
			if (this.getParent() != platform.selectPainting.p) {

				this.x((this.x() - platform.selectPainting.mx)
						/ platform.selectPainting.scaleN);
				this.y((this.y() - platform.selectPainting.my)
						/ platform.selectPainting.scaleN);
				this.id(getTimeByS());
				this.moveTo(platform.selectPainting.p);
				platform.selectPainting.hasChange();
			}
			poss = checkConn(this);
			if (poss != null) {
				this.lock=true;
				this.x((this.x() - (poss.x/platform.selectPainting.scaleN))			);
				this.y((this.y() - (poss.y/platform.selectPainting.scaleN)));
				platform.draw();
			}
			showALLConnedPoints();
		} else {
			if(platform.selectPainting!=null){
			this.destroy();// 不在中间画布就摧毁
			}

		}

		showALLConnedPoints();
		platform.draw();

	};

	this.cloneFun2 = function(e) {

		if (e.type == 'mousedown'
				&&platform.selectPainting!=null &&this.getLayer() != platform.selectPainting.p) {
			var cloneOfItem = this.clone();
			showConnect(this);
			// cloneOfItem.off('mousedown touchstart');
			platform.leftlayer.add(cloneOfItem);

		}
		if (e.type == 'dragend') {

		}

	};
	var TimeFn=null;
	this.dbclickFun = function(e) {
		if (e.type == 'dblclick') {
			// 取消上次延时未执行的方法
		    clearTimeout(TimeFn);//单击事件
		    //双击事件的执行代码
			$("#contextmenu").hide();
			var clickshape = e.target.getParent();
			point_name=clickshape.id();
			point_type=clickshape.name();
		// 当前位置弹出菜单（div）
			var attrtop=this.getAbsolutePosition().y + 100;
			var attrleft=this.getAbsolutePosition().x + 90;		
			pro_id=$(".active > input[name='proID']").val();
			showPrameter(point_name,pro_id,point_type,attrtop,attrleft);									
			platform.selectPainting.p.draw();
			
		}

	};

	this.flag = 0;
	this.clickFunc = function(e) {
		if (e.type == 'click') {
			// 取消上次延时未执行的方法
		    clearTimeout(TimeFn);
		    var clickshape = e.target.getParent();
			point_name=clickshape.id();
			point_type=clickshape.name();
			// 当前位置弹出菜单（div）
			var attrtop=this.getAbsolutePosition().y + 300;//300
			var attrleft=this.getAbsolutePosition().x + 450;//450
			var flagin = leftpoly.flag;// 当前序列
			leftpoly.flag++;
			/* 右键菜单处理 */
			$("#contextmenu a").click(
					function() {
						if (flagin != leftpoly.flag - 1) {
							return;
						}		
						var text = $(this).text();
						if (text == '进入站点') {		
							if(point_type=='type5'){
								platform.selectPainting.hasChange();	
								fProID=$(".active > input[name='proID']").val();
//								if(pro_id=null){
//									pro_id=$(".active > input[name='fproID']").val();
//								}
								tabtools.loadSubPro(point_name,fProID);
							}
							
							$("#contextmenu").hide();		
							platform.draw();
						} else if (text == '解除锁定') {		
							clickshape.lock=false;	
							platform.selectPainting.hasChange();	
							$("#contextmenu").hide();		
							platform.selectPainting.p.draw();
						} else	if (text == '删除该节点') {
							platform.selectPainting.hasChange();		
							clickshape.destroy();
							showALLConnedPoints();
							$("#contextmenu").hide();		
							platform.selectPainting.p.draw();
						} else if (text == '更改颜色') {
							node.style.fillStyle = Math.floor(Math.random() * 250)
									+ "," + Math.floor(Math.random() * 250) + ","
									+ Math.floor(Math.random() * 250);
						} else if (text == '顺时针旋转90°') {
							if(clickshape.lock){
								alert('控件已锁定，无法旋转');
							}else{
								platform.selectPainting.hasChange();	
							clickshape.rotate(90);
							// centerlayer.draw(this);
							platform.selectPainting.p.draw();
							}
						} else if (text == '逆时针旋转90°') {
							if(clickshape.lock){
								alert('控件已锁定，无法旋转');
							}else{
								platform.selectPainting.hasChange();	
							clickshape.rotate(-90);
							// centerlayer.draw(this);
							platform.selectPainting.p.draw();
							}
						} else if (text == '放大') {
							clickshape.scale({
								x : clickshape.scaleX() * 2,
								y : clickshape.scaleY()
							});
							platform.selectPainting.p.draw();
						} else if (text == '缩小') {
							clickshape.scale({
								x : clickshape.scaleX() / 2,
								y : clickshape.scaleY()
							});
							platform.selectPainting.p.draw();
						}else if (text == '属性') {
							platform.selectPainting.hasChange();	
							$("#contextmenu").hide();
							pro_id=$(".active > input[name='proID']").val();
							showPrameter(point_name,pro_id,point_type,attrtop,attrleft);									
							platform.selectPainting.p.draw();
						}
						//hideALLConnPoints();					
						// $("#contextmenu").hide();
					});
			var shapes = clickshape.getChildren(function(node){
				 if((node.name()!='connPointsLeft')&&(node.name()!='connPointsRight')){
					 return node;				 
				 }
				});//找出元件group中除了连接点外的真正的图形
			$("#contextmenu").css({
				top : clickshape.getAbsolutePosition().y+300,//300
				left : clickshape.getAbsolutePosition().x + ($(window).width()-1200)/2+1*shapes[0].width(),//450
			});
		    //执行延时
		    TimeFn = setTimeout(function(clickshape){
		        //do function在此处写单击事件要执行的代码
				$("#contextmenu").show();
		    },300);
		}
	};
	unlockConnects=function(g){

	}
	getConnectedStatus=function(g){
		
	}
	showALLConnPoints = function() {
		points = platform.getAllChildren();
		for (i1 = 0; i1 < points.length; i1++) {
			showConnect(points[i1]);

		}
		platform.draw();
		platform.setConnShowed(true);
	}
	showALLConnedPoints = function() {
		points = platform.getAllChildren();
		for (i1 = 0; i1 < points.length; i1++) {
			right=getRightPoint(points[i1]);
			left=getLeftPoint(points[i1]);
			if (right!=null) right.fill('red');
			if (left!=null) left.fill('red');
			points[i1].lock=false;
		}
		for (i1 = 0; i1 < points.length; i1++) {
			checkConn(points[i1]);
		}
		
	}
/*	hideALLConnPoints = function() {//隐藏所有连接点
		points = platform.getAllChildren();
		for (i1 = 0; i1 < points.length; i1++) {
			hideConnection(points[i1]);
		}
		platform.draw();
		platform.setConnShowed(false);
	}*/
	showConnect = function(g) {

		tempArray = g.getChildren(function(node) {
			return node.getName() == 'connPointsLeft'
					|| node.getName() == 'connPointsRight'
		});
		for(var i=0;i<tempArray.length;i++){
			tempArray[i].show();
		
		}
		
		g.draw();
	}
/*	hideConnection = function(g) {
		tempArray = g.getChildren(function(node) {
			return node.getName() == 'connPointsLeft'
					|| node.getName() == 'connPointsRight'
		});
		for(var i=0;i<tempArray.length;i++){
			tempArray[i].hide();
		
		}

	}*/
	
	/*
	 * 检查控件之间连接关系
	 */
	checkConn = function(g) {
		leftCir=getLeftPoint(g);
		rightCir=getRightPoint(g);
		points = platform.getAllChildren();
		var re=null;
		for (li = 0; li < points.length; li++) {
			var tempL=getLeftPoint(points[li]);
		
			if (checkCircle(rightCir, tempL,
					leftpoly.radiusL*platform.selectPainting.scaleN * 2)) {
				g.lock=true;
				points[li].lock=true;
				re= {
					g : points[li],
					right : 0,
					left : tempL,
					x : rightCir.getAbsolutePosition().x
							- tempL.getAbsolutePosition().x,
					y : rightCir.getAbsolutePosition().y
							- tempL.getAbsolutePosition().y,
				}
				
			}
		}
		for (li = 0; li < points.length; li++) {
			var tempR=getRightPoint(points[li]);
			if (checkCircle(leftCir, tempR,
					leftpoly.radiusL*platform.selectPainting.scaleN  * 2)) {
				g.lock=true;
				points[li].lock=true;
				re= {
						g : points[li],
						right : tempR,
						left : 0,
						x : leftCir.getAbsolutePosition().x
								- tempR.getAbsolutePosition().x,
						y : leftCir.getAbsolutePosition().y
								- tempR.getAbsolutePosition().y,
					}
				
			}
			
		}		
		return re;
	}


	/*
	 * 属性编辑列表
	 */
	 showPrameter=function(point_name,pro_id,point_type,attrtop,attrleft){
//		$("#PointPraList").empty();

		 jQuery("#PointPraList").jqGrid("setGridParam", { 
			 url: "listPointPra.action", //设置表格的url 
			 datatype: "json", //设置数据类型 
			 postData: {
				    pointName:point_name,//相当于pointID
					pro_id:pro_id,//项目ID
					pointType:point_type,//元素点的类型
//					pointID:1,
					pointPraID:$("#PointPraList").jqGrid("getRowData", $("#gridTable").jqGrid("getGridParam", "selrow")).ID
					} 
		 }); 
		$('#PointPraList').trigger("reloadGrid");
		$("#pointPra").css({
			top :attrtop,
			left : attrleft,
		}).show();	
		
	 }
		
	
}


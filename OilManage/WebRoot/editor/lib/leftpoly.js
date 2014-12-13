var Leftpolys = /**
 * 
 */
function() {
	 var lastsel;
	 var proID=$("#proID").val();
	  var algID=$("#curAlgID").val();
	if(proID==""){
		proID=0;//这样一改，就不会出现属性框时不时无法加载的问题了
	}
	 var datagrid =jQuery("#PointPraList").jqGrid({
		   	url:'listDevice.action',
			datatype: "json",
			mtype : 'POST',
			postData : {
				algID : algID,
				InOrOut:"In",
				proID : proID
				
			}, 
		   	colNames:['属性','值'],
		   	colModel:[
		   		{name:'name',index:'name', width:100,align:"center"},
		   		{name:'value',index:'value', width:100, align:"center",editable:true},
		   	],
		   	width:'auto',//530
		   	height:'auto',
		   	rowNum:30,
		   	rowList:[10,20,30],		   	
		   	sortname: 'id',
		    viewrecords: true,
		    sortorder: "desc",
		    cellEdit:true,
			cellsubmit : 'remote',
			cellurl : 'editDevice.action',
			formatCell : function(rowid, cellname, value, iRow, iCol){
				var proper=jQuery("#PointPraList").jqGrid("getRowData", iRow).name;
				if(proper=='控制模式'){
					//this.edittype="select";
					//this.editoptions={"value":{'Flow':'Flow','Pressure':Pressure}};
					
					jQuery("#PointPraList").setColProp('value',{edittype:'select', editoptions:{value:{'Flow':'Flow','Pressure':'Pressure'}} });
					return value;
				}
				
				if(proper=='节点压力(MPa)'){
					var rowC=searchGrid(jQuery("#PointPraList"),'name','控制模式');
					if(rowC!=-1){
						var tempC=jQuery("#PointPraList").jqGrid("getRowData", rowC).value;
						if(tempC=='Flow'){
							jQuery("#PointPraList").setColProp('value',{edittype:'text',editoptions:{maxlength:0,value:""}});
						}else{
							jQuery("#PointPraList").setColProp('value',{edittype:'text',editoptions:{maxlength:20,value:value}});
						}
					}
					return value;
				}
				if(proper=='节点流量(m3/d)'){
						var rowC=searchGrid(jQuery("#PointPraList"),'name','控制模式');
						if(rowC!=-1){
							var tempC=jQuery("#PointPraList").jqGrid("getRowData", rowC).value;
							if(tempC=='Pressure'){
								jQuery("#PointPraList").setColProp('value',{edittype:'text',editoptions:{maxlength:0,value:""}});
								
							
							}else{
								jQuery("#PointPraList").setColProp('value',{edittype:'text',editoptions:{maxlength:20,value:value}});
								
							}	
						}
						return value;
					}
				if(proper=='隶属关系'){
					//this.edittype="select";
					//"气井","气源","分输点","设备连接点";
					
					jQuery("#PointPraList").setColProp('value',{edittype:'select', editoptions:{value:{'气井':'气井','气源':'气源','分输点':'分输点','设备连接点':'设备连接点'}} });
					return value;
				}
				if(proper=='气体方程'){
					//this.edittype="select";
					//this.editoptions={"value":{'Flow':'Flow','Pressure':Pressure}};
					
					jQuery("#PointPraList").setColProp('value',{edittype:'select', editoptions:{value:{'Colebrook':'Colebrook','FormerSU':'FormerSU','PanA':'PanA','PanB':'PanB','Weymouth':'Weymouth'}} });
					return value;
				}
				if(proper=='压缩机类型'){
					//this.edittype="select";
					//this.editoptions={"value":{'Flow':'Flow','Pressure':Pressure}};
					
					jQuery("#PointPraList").setColProp('value',{edittype:'select', editoptions:{value:{'离心压缩机':'离心压缩机','往复式压缩机':'往复式压缩机'}} });
					return value;
				}
				jQuery("#PointPraList").setColProp('value',{editable:true,edittype:'text',editoptions:{value:value,maxlength:20} });
				return value;
			},
			beforeSubmitCell : function(rowid,celname,value,iRow,iCol) { 
				//alert(/sd/);
				var type=leftpoly.clickshape.TYPE;
				var name=leftpoly.clickshape.nameStr;
				var bkcolor="#999999";
				var nrcolor="#FFFFFF";
				var proper=jQuery("#PointPraList").jqGrid("getRowData", iRow).name;
				var propervalue=value;
				if(proper=='控制模式'){
					if(propervalue=='Flow'){
						var rowC=searchGrid(jQuery("#PointPraList"),'name','节点压力(MPa)');						
						jQuery("#PointPraList").setCell (rowC,'value',' ',{background:bkcolor});  
						rowC=searchGrid(jQuery("#PointPraList"),'name','节点流量(m3/d)');						
						jQuery("#PointPraList").setCell (rowC,'value',' ',{background:nrcolor});  
					}
					if(propervalue=='Pressure'){
						var	rowC=searchGrid(jQuery("#PointPraList"),'name','节点流量(m3/d)');						
						jQuery("#PointPraList").setCell (rowC,'value',' ',{background:bkcolor});  
						rowC=searchGrid(jQuery("#PointPraList"),'name','节点压力(MPa)');						
						jQuery("#PointPraList").setCell (rowC,'value',' ',{background:nrcolor});
					}
					
				}
				if(proper=='压缩机类型'){
					if(propervalue=='离心压缩机'){
						var rowC=searchGrid(jQuery("#PointPraList"),'name','相对余隙容积α');							
						jQuery("#PointPraList").setCell (rowC,'value',' ',{background:bkcolor});  						
						jQuery("#PointPraList").setCell (rowC+1,'value',' ',{background:bkcolor});  						
						jQuery("#PointPraList").setCell (rowC+2,'value',' ',{background:bkcolor});  					
						jQuery("#PointPraList").setCell (rowC+3,'value',' ',{background:bkcolor});  					
						jQuery("#PointPraList").setCell (rowC+4,'value',' ',{background:bkcolor});  
						rowC=searchGrid(jQuery("#PointPraList"),'name','特性曲线参数a');						
						jQuery("#PointPraList").setCell (rowC,'value',' ',{background:nrcolor});  						
						jQuery("#PointPraList").setCell (rowC+1,'value',' ',{background:nrcolor});
						leftpoly.clickshape.TYPE='离心压缩机';
					}
					if(propervalue=='往复式压缩机'){
						var	rowC=searchGrid(jQuery("#PointPraList"),'name','特性曲线参数a');						
						jQuery("#PointPraList").setCell (rowC,'value',' ',{background:bkcolor});						
						jQuery("#PointPraList").setCell (rowC+1,'value',' ',{background:bkcolor}); 
						rowC=searchGrid(jQuery("#PointPraList"),'name','相对余隙容积α');							
						jQuery("#PointPraList").setCell (rowC,'value',' ',{background:nrcolor});  						
						jQuery("#PointPraList").setCell (rowC+1,'value',' ',{background:nrcolor});  						
						jQuery("#PointPraList").setCell (rowC+2,'value',' ',{background:nrcolor});  					
						jQuery("#PointPraList").setCell (rowC+3,'value',' ',{background:nrcolor});  					
						jQuery("#PointPraList").setCell (rowC+4,'value',' ',{background:nrcolor}); 
						leftpoly.clickshape.TYPE='往复式压缩机';
					}
					
				}
				if(proper=='名称'){
					
					setPointText(leftpoly.clickshape,value);
					leftpoly.clickshape.nameStr=value;
					platform.draw();
				}
				var z={
					algID : $("#curAlgID").val(),
					InOrOut:"In",
					proID : $("#proID").val(),
					type:type,//元素点的类型
					name:name,
					proper:proper,
					newValue:value					
					};
				return  z;
				
				} ,
			caption: "属性列表",
			jsonReader: {//读取后端json数据的格式
				root: "deviceKV",//保存详细记录的名称
				total: "total",//总共有多少页
				page: "page",//当前是哪一页
				records: "records",//总共记录数
				repeatitems: false
			},
		});
	  	

	this.polys = new Array;
	this.imgobj=new Array;
	this.polyGroups = new Array;
	this.connectionPoints = new Array;
	this.radiusL=5;
	this.polyhight=30;
	this.polywidth=30;
	this.polylineLength=20;
	this.textHeight=20;
	this.lpoints=[ 0, 0, -this.polylineLength, 0];
	this.rpoints=[ 0, 0, this.polylineLength, 0];
	//画布显示时，加大了线的长度
	this.polylineLengthPainting=40;
	this.lpointsPainting=[ 0, 0, -this.polylineLengthPainting, 0];
	this.rpointsPainting=[ 0, 0,this.polylineLengthPainting, 0];
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
	this.imgLoad = function (url,type,i){
	
		this.imgobj[i] = new Image();
	
	    if (this.imgobj[i].complete) {
	        this.createIMG(this.imgobj[i],type,i);
	        platform.leftDraw();
	   } else {
	    	
	    	this.imgobj[i].onload = function () {	    		
	    		 //alert('get');
	    		//leftpoly.imgobj[i].src = url;
	    		leftpoly.createIMG(leftpoly.imgobj[i],type,i);
	 	        leftpoly.imgobj[i].onload = null;
	        	//alert('in');
	 	       
	        };
	    };
	    //setTimeout("leftpoly.imgobj["+i+"].src = "+url+";",1000); 
	    this.imgobj[i].src = url;
	};
	this.createIMG = function (img,type,i){
		
		leftpoly.polys[i] = new Kinetic.Image({
		    x: 35,
		    y: 10+i*60,
		    image: img,
		    width: this.polywidth,
		    name : type,
		    height:this.polyhight
		  });
		 platform.leftDraw();
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
	this.updateLines=function(){
		platform.selectPainting.updateConnects();
		s=JSON.stringify(platform.selectPainting.connects);
		var proID=$("#proID").val();
		var algID=$("#curAlgID").val();			
        $.ajax({ 
            type: "POST", 
            url: "updateConn.action",
            data: {
            	proID:proID,
				algID:algID,
				InOrOut:"In",
				conn:s
			 }, 
			 success : function(data) {
            		if(data['msg']==null||data['msg']==""){
            			
            		}else{
            			alert(data['msg']);
            			p.destroy();
            		}
            } 
          }); 
	}	
	this.addPoint=function(type,name,p){
		var proID=$("#proID").val();
		  var algID=$("#curAlgID").val();	
		  var ysjls=p.YSJLS;
		  if (ysjls==null){
			  ysjls=0;
		  }
        $.ajax({ 
            type: "POST", 
            url: "addPoint.action",
            data: {
            	proID:proID,
				algID:algID,
				InOrOut:"In",
				type:type,
				YSJLS:ysjls,
				name:name
			 }, 
			 success : function(data) {
            		if(data['msg']==null||data['msg']==""){
            			
            		}else{
            			alert(data['msg']);
            			p.destroy();
            		}
            } 
          }); 
	}	
	this.delPoint=function(type,name,p){
		var proID=$("#proID").val();
		  var algID=$("#curAlgID").val();			
        $.ajax({ 
            type: "POST", 
            url: "delPoint.action",
            data: {
            	proID:proID,
				algID:algID,
				InOrOut:"In",
				type:type,
				name:name
			 }, 
			 success : function(data) {
            		if(data['msg']==null||data['msg']==""){
            			//p.destroy();
            		}else{
            			alert(data['msg']);
            			
            		}
            } 
          }); 
	}	
	this.init = function() {
		var urllist=[];
		var typelist=[];
        $.ajax({ 
            type: "POST", 
            url: "listPointType.action",
            async: false, //改成同步的，也就是Ajax请求完毕，将urllist填充完了再执行下面的程序。
            success: function(data){ 
            		pointTypeList=data.pointTypeList;
            		$.each(pointTypeList, function( index, pointType ) {         			
            			//leftpoly.imgLoad(pointType.path,index); //这里用this.imgLoad会提示不存在，改成这样也不行，可能imgLoad里面包含的函数无法调用，但全部改成具体对象.方法 还是不行，浏览器不报错。
            			url=pointType.path;          				
            			urllist.push(url);
            			typelist.push(pointType.type);
            	    	 }); 
            } 
          }); 
  
  /*      $.each(urllist,function(i,url){//each里面放this.imgLoad跟Ajax方法一样，程序找不到改方法。但for循环可以。
        	alert(url);
        	this.imgLoad(url,i);
        });*/
        for(var j = 0, l = urllist.length; j < l; j++ ){
        	this.imgLoad( urllist[j],typelist[j],j);
        }
	/*	for(var i=0;i<6;i++){
			this.imgLoad('editor/icons/type'+i+'.svg',i);
		}*/
        //this.polys.push(this.polys[0]);
		for ( var k=0;k<this.polys.length;k++) {
			
			this.polyGroups[k] = new Kinetic.Group({
				x : this.polys[k].x(),
				y : this.polys[k].y(),
				name:this.polys[k].name(),
				draggable : true

			});
			this.polyGroups[k].TYPE=this.polys[k].name();
			var lineLeft = new Kinetic.Line({
				x : 0,
				y : this.polyhight/2,
				points : 	this.lpoints.concat(),
				 
				 stroke : 'black',
				strokeWidth : 3,

				name : 'lineLeft',
				closed : true
				
			});
			var lineRight = new Kinetic.Line({
				x : this.polywidth,
				y : this.polyhight/2,
				 points : this.rpoints.concat(),
				
				 stroke : 'black',
				strokeWidth : 3,

				name : 'lineRight',
				closed : true
			});
			var lineLeftSp = new Kinetic.Line({
				x : this.polywidth,
				y : this.polyhight/2,
				 points : this.rpoints.concat(),
				
				 stroke : 'black',
				strokeWidth : 3,

				name : 'lineLeft',
				closed : true
			});
			var connPointsLeft = new Kinetic.Circle({
				x : 0-this.polylineLength,
				y : this.polyhight/2,

				radius : this.radiusL,
				fill : 'red',
				stroke : 'black',
				name : 'connPointsLeft',
				strokeWidth : 2
			});
			
			var connPointsRight = new Kinetic.Circle({
				x : this.polywidth+this.polylineLength,
				y : this.polyhight/2,
				name : 'connPointsRight',
				radius : this.radiusL,
				fill : 'red',
				stroke : 'black',
				strokeWidth : 2
			});
			var connPointsLeftSp = new Kinetic.Circle({
				x : this.polywidth+this.polylineLength,
				y : this.polyhight/2,
				name : 'connPointsLeft',
				radius : this.radiusL,
				fill : 'red',
				stroke : 'black',
				strokeWidth : 2
			});
			var text = new Kinetic.Text({
				  x: -this.polylineLength,
				  y: this.polyhight+5,//55,
				  text: this.polys[k].name(),
				  name:'textLabel',
				  fontSize: 12,
				  width:this.polylineLength+this.polylineLength+this.polywidth,
				  height:this.textHeight,
				  align:'right',
				  fontFamily: '宋体',
				  fill: 'black'
				});
			text.align('center');
			this.polys[k].x(0);
			this.polys[k].y(0);
			this.polyGroups[k].add(this.polys[k]);
			this.polyGroups[k].add(text);
			this.lock=false;
			
			/*//起点
			if(){
				this.polyGroups[k].add(lineRight);
				this.polyGroups[k].add(connPointsRight);
				//this.polyGroups[k].add(PointRight);
				
				connPointsRight.hide();	
				this.initPoint(this.polyGroups[k]);
				continue;
			}*/
			//终点
			if(checkSpecial(this.polyGroups[k])){
				this.polyGroups[k].add(lineRight);
				this.polyGroups[k].add(connPointsRight);
				//this.polyGroups[k].add(PointRight);
				
				connPointsRight.hide();	
				
				this.polyGroups[k].add(lineLeftSp);
				this.polyGroups[k].add(connPointsLeftSp);
				//this.polyGroups[k].add(PointRight);
				
				connPointsLeft.hide();	
				this.initPoint(this.polyGroups[k]);
				continue;
			}
			if(checkLinked(this.polyGroups[k])){
				this.polyGroups[k].add(lineRight);
				this.polyGroups[k].add(connPointsRight);
				//this.polyGroups[k].add(PointRight);
				
				
				
				this.polyGroups[k].add(lineLeftSp);
				this.polyGroups[k].add(connPointsLeftSp);
				//this.polyGroups[k].add(PointRight);
				
				this.polys[k].hide();
				connPointsRight.hide();		
				lineRight.hide();
				
				lineLeftSp.hide();
				connPointsLeftSp.hide();
				text.hide();
				
				//connPointsLeft.hide();
				//connPointsRight.hide();
				this.initPoint(this.polyGroups[k]);
				continue;
			}
			
			//终点
		/*	if(k==1){
				this.polyGroups[k].add(lineLeft);
				this.polyGroups[k].add(connPointsLeft);	
				//this.polyGroups[k].add(PointLeft);
				connPointsLeft.hide();
				this.initPoint(this.polyGroups[k]);
				continue;
			}*/
			
			this.polyGroups[k].add(lineRight);
			this.polyGroups[k].add(lineLeft);
			this.polyGroups[k].add(connPointsLeft);
			//this.polyGroups[k].add(PointLeft);
			this.polyGroups[k].add(connPointsRight);
			//this.polyGroups[k].add(PointRight);
			
			connPointsLeft.hide();
			
			
			connPointsRight.hide();	
			this.initPoint(this.polyGroups[k]);
			
	
		}
		pipeInit();
	}
	this.initPoint = function(point){
		var algID=$("#curAlgID").val();
		if(algID==4&&checkQY(point)){
			point.draggable(false);
			return;
		}
		point.dragBoundFunc(this.dragFun);
		
		point.on('click', this.clickFunc);
//		point.on('dblclick', this.dbclickFun);
		point.on('dragend', this.cloneFun);
		point.on('mousedown touchstart', this.cloneFun2);
		point.on('mouseover', function() {
			document.body.style.cursor = 'pointer';
		});
		point.on('mousemove', function() {
			//alert(/xss/);
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
			alert("您需要打开或新建一个工程");
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
				if(checkSpecial(this)||checkLinked(this)){
					this.setAbsolutePosition(pos);					
					movePoint(rc,dis,this.rotation());					
					drawLine(r,dis,this.rotation());	
					movePoint(lc,dis,this.rotation());					
					drawLine(l,dis,this.rotation());
				}else{
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
	this.addPointByInput=function(po,name){
		if(name==null||name==''){
			po.destroy();
		}
		po.nameStr=name;
		po.id(name);
		setPointText(po,name);
		po.moveTo(platform.selectPainting.p);
		if(checkSpecial(po)||checkLinked(po)){
			po.rotate(90);
		}
		leftpoly.addPoint(po.TYPE,name,po);
		platform.selectPainting.hasChange();
		poss = checkConn(po);
		if (poss != null) {
			po.lock=true;
			po.x((po.x() - (poss.x/platform.selectPainting.scaleN)));
			po.y((po.y() - (poss.y/platform.selectPainting.scaleN)));
			leftpoly.updateLines();
			
			
		}
		leftpoly.showALLConnedPoints();
		platform.draw();
	}
	this.cloneFun = function(e) {

		var userPos = platform.stage.getPointerPosition();
		if (platform.selectPainting!=null &&checkPoint(userPos, platform.centerlayer))// 如果在中间画布上面

		{	showConnect(this);
			if (this.getParent() != platform.selectPainting.p) {

				this.x((this.x() - platform.selectPainting.mx)
						/ platform.selectPainting.scaleN);
				this.y((this.y() - platform.selectPainting.my)
						/ platform.selectPainting.scaleN);
				//this.id(getTimeByS());
				
				
					if(checkPipe(this)){
						leftpoly.PipeTemp=this;
						leftpoly.PipeTempType=this.TYPE;
						$('#add_ysj_modal').modal();
						return;
					}else{						
						var name=prompt("请输入元件名称","");
						//leftpoly.addPointByInput(this,name);
					}
					var po=this;
					if(name==null||name==''){
						po.destroy();
					}
					po.nameStr=name;
					po.id(name);
					setPointText(po,name);
					po.moveTo(platform.selectPainting.p);
					if(checkSpecial(po)||checkLinked(po)){
						po.rotate(90);
					}
					leftpoly.addPoint(po.TYPE,name,po);
					platform.selectPainting.hasChange();
					
			}
			
			poss = checkConn(this);
			if (poss != null) {
				this.lock=true;
				this.x((this.x() - (poss.x/platform.selectPainting.scaleN)));
				this.y((this.y() - (poss.y/platform.selectPainting.scaleN)));
				leftpoly.updateLines();
				platform.draw();
				
			}
			leftpoly.showALLConnedPoints();
		} else {
			if(platform.selectPainting!=null){
			this.destroy();// 不在中间画布就摧毁
			}

		}

		leftpoly.showALLConnedPoints();
		platform.draw();

	};

	this.cloneFun2 = function(e) {

		if (e.type == 'mousedown'
				&&platform.selectPainting!=null &&this.getLayer()!= platform.selectPainting.p) {
			
			var cloneOfItem = this.clone();
			hideConnection(this);
			
			hideConnection(cloneOfItem);
			// cloneOfItem.off('mousedown touchstart');
			platform.leftlayer.add(cloneOfItem);
			cloneOfItem.TYPE=this.TYPE;
			leftpoly.polyGroups[leftpoly.searchPointIndex(this)]=cloneOfItem;
			
		}
		if (e.type == 'dragend') {

		}

	};
	this.searchPointIndex=function(g){
		for(var i=0;i<leftpoly.polyGroups.length;i++){
			if(leftpoly.polyGroups[i]==g){
				return i;
			}
		}
	}
	var TimeFn=null;
	this.dbclickFun = function(e) {
		if (e.type == 'dblclick') {
			// 取消上次延时未执行的方法
		    clearTimeout(TimeFn);//单击事件
		    //双击事件的执行代码
			$("#contextmenu").hide();
			var clickshape = e.target.getParent();
			point_name=clickshape.nameStr;
			point_type=clickshape.TYPE;
			leftpoly.clickshape=clickshape;
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
			var point_name=clickshape.id();
			var point_type=clickshape.TYPE;
			var algID=$("#curAlgID").val();
			var proID=$("#proID").val();
			leftpoly.clickshape=clickshape;
			// 当前位置弹出菜单（div）
			var attrtop=this.getAbsolutePosition().y+260;//300
			var attrleft=this.getAbsolutePosition().x + 250;//450
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
							leftpoly.delPoint(clickshape.TYPE,clickshape.nameStr,clickshape);
							platform.selectPainting.hasChange();		
							clickshape.destroy();
							leftpoly.showALLConnedPoints();
							$("#contextmenu").hide();		
							platform.draw();
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
						}else if (text == '输入属性') {
							platform.selectPainting.hasChange();	
							$("#contextmenu").hide();
							//pro_id=$(".active > input[name='proID']").val();
							showPrameter(point_name,proID,point_type,attrtop,attrleft);									
							platform.selectPainting.p.draw();
						}if (text == '输出属性') {
							
							$("#contextmenu").hide();
							//pro_id=$(".active > input[name='proID']").val();
							showPrameterOut(point_name,proID,point_type,attrtop,attrleft);									
							platform.selectPainting.p.draw();
						}else if (text == '管道图示') {
							if(point_type=='管道'){	
								$("#contextmenu").hide();
								//pro_id=$(".active > input[name='proID']").val();
								leftpoly.pipeName=point_name;
								leftpoly.pipeProID=proID;
								leftpoly.pipeAlgID=algID;
								showPipe(point_name,proID,algID,attrtop,attrleft);									
								platform.selectPainting.p.draw();
								
							}
							
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
				top : clickshape.getAbsolutePosition().y+250,//300
				left : clickshape.getAbsolutePosition().x + ($(window).width()-1200)/2+1*shapes[0].width(),//450
			});
		    //执行延时
		    TimeFn = setTimeout(function(clickshape){
		        //do function在此处写单击事件要执行的代码
		    	if(leftpoly.clickshape.TYPE=='管道'){
		    	$("#pipiShowText").show();
		    	}else{
		    		$("#pipiShowText").hide();
		    	}
				$("#contextmenu").show();
		    },300);
		}
	};
	unlockConnects=function(g){

	}
	getConnectedStatus=function(g){
		
	}
	this.showALLConnPoints = function() {
		var points = platform.getAllChildren();
		for (i1 = 0; i1 < points.length; i1++) {
			showConnect(points[i1]);

		}
		platform.draw();
		platform.setConnShowed(true);
	}
	this.showALLConnedPoints = function() {
		var points = platform.getAllChildren();
		for (i1 = 0; i1 < points.length; i1++) {
			var right=getRightPoint(points[i1]);
			var left=getLeftPoint(points[i1]);
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

		var tempArray = g.getChildren(function(node) {
			return node.getName() == 'connPointsLeft'
					|| node.getName() == 'connPointsRight'
		});
		for(var i=0;i<tempArray.length;i++){
			tempArray[i].show();
		
		}
		
		g.draw();
	}
	hideConnection = function(g) {
		tempArray = g.getChildren(function(node) {
			return node.getName() == 'connPointsLeft'
					|| node.getName() == 'connPointsRight'
		});
		for(var i=0;i<tempArray.length;i++){
			tempArray[i].hide();
		
		}

	}
	
	/*
	 * 检查控件之间连接关系
	 */
	checkConn = function(g) {
		var leftCir=getLeftPoint(g);
		var rightCir=getRightPoint(g);
		var points = platform.getAllChildren();
		var re=null;
		g.leftConnArray=new Array();
		g.rightConnArray=new Array();
		for (li = 0; li < points.length; li++) {
			var tempL=getLeftPoint(points[li]);
		
			if (points[li]!=g&&checkCircle(rightCir, tempL,
					leftpoly.radiusL*platform.selectPainting.scaleN * 2)) {
				g.lock=true;
				g.rightConnArray.push(points[li]);
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
				if(checkSpecial(g)||checkLinked(g)){
					leftCir.fill('yellow');
				}
			}
		}
		addLinked(g,re,'Right');
		var points = platform.getAllChildren();
		for (li = 0; li < points.length; li++) {
			var tempR=getRightPoint(points[li]);
			if (points[li]!=g&&checkCircle(leftCir, tempR,
					leftpoly.radiusL*platform.selectPainting.scaleN  * 2)) {
				g.lock=true;
				g.leftConnArray.push(points[li]);
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
				if(checkSpecial(g)||checkLinked(g)){
					rightCir.fill('yellow');
				}
			}
			
		}
		addLinked(g,re,'Left');
		return re;
	}


	/*
	 * 属性编辑列表
	 */
	 showPrameter=function(point_name,pro_id,type,attrtop,attrleft){
//		$("#PointPraList").empty();
		 $("#tempStr1").val(type);
		 $("#tempStr2").val(point_name);
		 var proID=$("#proID").val();
		 /*jQuery("#PointPraList").jqGrid("setGridParam", { 
			 url: "listDevice.action", //设置表格的url 
			 datatype: "json", //设置数据类型 
			 postData: {
				 	algID : algID,
					InOrOut:"In",
					proID : proID,
					type:type,//元素点的类型
					name:point_name
					} 
		 }); 
		$('#PointPraList').trigger("reloadGrid");*/
		
		jQuery("#PointPraList").jqGrid("setGridParam", {
			 url: "listDevice.action", //设置表格的url 
			 datatype: "json", //设置数据类型 
			postData : {
				algID : algID,
				InOrOut:"In",
				proID : proID,
				type:type,//元素点的类型
				name:point_name
			}
		}).trigger("reloadGrid");
		
		$("#pointPra").css({
			top :attrtop,
			left : attrleft,
		}).show();	
		
	 }
		/*
		 * 输出属性列表
		 */
		 showPrameterOut=function(point_name,pro_id,type,attrtop,attrleft){
//			$("#PointPraList").empty();
			 $("#tempStr1").val(type);
			 $("#tempStr2").val(point_name);
			 var proID=$("#proID").val();
			
			
			jQuery("#PointPraList").jqGrid("setGridParam", {
				 url: "listDevice.action", //设置表格的url 
				 datatype: "json", //设置数据类型 
				postData : {
					algID : algID,
					InOrOut:"Out",
					proID : proID,
					type:type,//元素点的类型
					name:point_name
				}
			}).trigger("reloadGrid");
			
			$("#pointPra").css({
				top :attrtop,
				left : attrleft,
			}).show();	
			
		 }		
	
}


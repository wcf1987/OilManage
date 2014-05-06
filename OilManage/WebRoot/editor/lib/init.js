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
var paintingArray=new Array;
var tabArray=new Array;
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
	tablayer=new Kinetic.Layer({
		x:100,
		y:2,
		id:'tablayer',
		width:850,
		height:50,
		draggable:false,
	});
	/*
	tabRect=new Kinetic.Rect({
		x:15,
		y:3,
		width:860,
		height:50,
		draggable:false,
		fill:'#CCCCCC',
		stroke:'#FFFFFF',
		strokeWidth:5
	})
	tablayer.add(tabRect);*/
	painting = new Kinetic.Layer({
		x : 100,
		y : 100,
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
	/*
	 * 检查点是否在矩形区域里面
	 */
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
		if (checkPoint(userPos, centerlayer))//如果在中间画布上面

		{
			if (this.getParent() != painting) {
				this.x((this.x() - mx)/scaleN);
				this.y((this.y()-my)/scaleN);
				this.moveTo(painting);
			
			}

		} else {
			this.destroy();//不在中间画布就摧毁
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
	stage.add(tablayer);
	stage.add(painting);
	selectPainting=painting;
	
	
	/*
	 * 图形项目列表
	 */
	var datagrid = jQuery("#GUIProList")
	.jqGrid(
			{
				url : "listGUIPro.action",// 后端的数据交互程序，改为你的
				datatype : "json",// 前后交互的格式是json数据
				mtype : 'POST',// 交互的方式是发送httpget请求						
				colNames : [ '编号', '项目名称', '作者','描述','添加时间','操作'],// 表格的列名
				colModel : [
						{
							name : 'id',
							index : 'ID',
							width : 50,
							align : "center",
							sortable:true,
							sorttype:'int'
						},// 每一列的具体信息，index是索引名，当需要排序时，会传这个参数给后端
						{
							name : 'proname',
							index : 'proname',
							width : 100,
							align : "center",
							sortable:true
						},
						{
							name:'author',
							index:'author',
							width:100,
							align:'center',
							sortable:true
						},
						{
							name:'description',
							index:'description',
							width:200,
							align:'center',
							sortable:false
						},
						{
							name:'addTime',
							index:'addTime',
							width:100,
							align:'center',
							sortable:true
						},
						{
							name : 'load',
							index : 'load',
							width : 100,
							align : "center",
							formatter : function(value, grid, rows,
									state) {
//								alert(rows.id);
								return "<a href=\"javascript:void(0)\" style=\"color:#798991\" onclick=\"load('"
										+ rows.id + "')\">加载</a>"
							}
						}					
	
						],
//				autowidth:true,
				rowNum:10,//每一页的行数
				height: 'auto',
				width:1230,
				rowList:[10,20,30],
				pager: '#GUIProPager',
				sortname: 'ID',
				viewrecords: true,
				sortorder: "desc",
				multiselect: true,  //可多选，出现多选框 
			    multiselectWidth: 35, //设置多选列宽度 
				jsonReader: {//读取后端json数据的格式
					root: "dataList",//保存详细记录的名称
					total: "total",//总共有多少页
					page: "page",//当前是哪一页
					records: "records",//总共记录数
					repeatitems: false
				},
				caption: "模型列表"//表格名称       
				
			});
}//initLight end

/*
 * draw grid 背景网格
 */
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


function scaleCenter(s) {
	
	scaleN=scaleN*s;
	selectPainting.scaleX(painting.scaleX() * s);
	selectPainting.scaleY(painting.scaleY() * s);
	selectPainting.draw();
}

function listGUIProGrid(){
//	$("#GUIProList").empty();
	/*
	 * 图形项目列表
	 */
	$('#GUIProList').trigger("reloadGrid");
	
	$('#listGUIPro_modal').modal();
}
function createNewModal(){
	selectedPainting = new Kinetic.Layer({
		x : 100,
		y : 100,
		id : 'painting',
		width : 3000,
		height : 2000,
		fill : '#ff33ee',
//		fill: 'transparent',
		draggable : true
	});
	stage.add(selectedPainting);
//	paintingArray.add(selectedPainting);
	// 配置对话框
	loadAuthorOptions();//加载作者选项
	$('#add_GUI_modal').modal();
	$("#addGUIForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout: function(element) { $(element).valid(); },
	    onkeyup: function(element) { $(element).valid(); },
		rules:{
			proname:{
				required:true
			},
			authorID:{
				required:true
			},
			type:{
				digits:true                 
			}
		},
		messages:{
			proname:{
				required:"名称不能为空！",
			},							
			authorID:{
				required:"请选择作者！"
			},
			type:{
				digits:"请输入整数", 
			}
		},
		submitHandler:function(){
			createNew();
		}
	});
		
}
/*
 * 添加图形项目
 */
function createNew() {
//	if($('#selectedID').val()==''){
		jsondata=selectPainting.toJSON();
		$.ajax({
			type : 'POST',
			url : 'addGUIPro.action',
			data : {
				description:$("#description").val(),
				name:$('#proname').val(),
				data:jsondata,
				authorID:$("#authorID").val(),
				type:$('#type').val()
			},
			success : function(data) {
				alert('图形化项目新建成功!');
				$('#add_GUI_modal').modal('hide');
				load(data.ID);
				//$("#AlgorithmList").trigger("reloadGrid");		
			},
			error:function(msg){
				alert(msg);
				$('#add_GUI_modal').modal('hide');
				//$("#AlgorithmList").trigger("reloadGrid");
				
			}
		});

}

function save() {
	//selectPainting=Kinetic.Node.create(jsondata, 'container')
	var selectedID=$('#selectedID').val();
	if(selectedID==''){
		createNewModal();
	}else{
		updateGUI();
	}
	
}
function updateGUI(){
	jsondata=selectPainting.toJSON();
	console.log(jsondata);
	$.ajax({
		type : 'POST',
		url : 'updateGUIPro.action',
		data : {			
			data:jsondata,
			ID:$('#selectedID').val(),
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
function load(selectedID) {

//	selectedID=1;
	$.ajax({
		type : 'POST',
		url : 'viewGUIPro.action',
		data : {
			
			ID:selectedID
			
		},
		success : function(data) {
			alert('图形化载入成功!');
			$('#selectedID').val(selectedID);
			//data=jQuery.parseJSON(data);
			$('#listGUIPro_modal').modal('hide');
			try{
				saveData=data['dataView']['JSONData'];
			}catch(err){
				alert('该项目模型为空！');
			}
			//alert(saveData);
			//console.log(saveData['JSONData']);
			newone=Kinetic.Node.create(saveData);
			
//			selectPainting.remove();
//			selectPainting.destroy();
			selectPainting.hide();
			stage.add(newone);
			selectPainting=newone;
			painting=newone;
			paintingArray.push(newone);
			
			createTab(data['dataView']['proname'],paintingArray.indexOf(newone));
			//createNewTab(data['dataView']['proname']);
			stage.draw();
					
		},
		error:function(msg){
			alert(msg);
		}
	});
}
var tabX=50;
var tabY=50;
var position;
 
function createTab(proname,paintingIndex){
	$("#paintingTabs").children().removeClass("active");
	var tabItem="<li class=\"tab active\"> <a href=\"javascript:void(0)\" onclick=\"showPainting(this,'"+ paintingIndex + "')\">"+proname+"</a></li>";
	$("#paintingTabs").append(tabItem);
}
function showPainting(obj,paintingIndex){
	$("#paintingTabs").children().removeClass("active");
	$(obj).parent().addClass("active");
	selectPainting=paintingArray[paintingIndex];
	selectPainting.show();
	for(var i in paintingArray){
		if(i!=paintingIndex){
			paintingArray[i].hide();
		}
	}
	stage.draw();
}
function createNewTab(proname){

	
	var label = new Kinetic.Label({
		  x: tabX,
		  y: tabY, 
		  width:100,
		  height:5,
		  draggable: true,
		  listening:true
		});
	label.add(new Kinetic.Tag({
	        fill: '#FFFFFF',
	        opacity: 0.75,
			pointerDirection: 'down',
			pointerWidth: 10,
			pointerHeight: 10,
			lineJoin: 'round',
			shadowColor: 'black',
			shadowBlur: 10,
			shadowOffset: {x:10,y:20},
			shadowOpacity: 0.5
	      }));
	label.add(new Kinetic.Text({
		  text: proname,
//		  fontSize: 50,
//		  lineHeight: 1.2,
//		  padding: 10,
//		  fill: 'red'		
		fontFamily: 'Calibri',
		fontSize: 25,
		fontStyle:'bold',
		padding: 10,
		fill: '#0099CC'
		 }));
	label.getText().on('click', clickTab);
	tabArray.push(label);
	tablayer.add(label);
	for ( var k in tabArray) {
		if(tabArray[k]!=label){
			tabArray[k].getText().fill('black').fontSize(22).fontStyle('normal');
		}
		}
	stage.draw();
	tabX+=50;
}
var tabFlag=0;
var clickTab=function(e){
		var tabFlagin=tabFlag;
		tabFlag++;
		if(tabFlagin!=tabFlag-1){
			return;
		}
			for(var p in tabArray){
				if(tabArray[p].getText()==e.target){
					position=p;
//					alert('p'+p);
				}
			}
//				position=tabArray.indexOf(e.target);
//			alert(position);
			e.target.fill('#0099CC');
			e.target.fontSize(25);
			e.target.fontStyle('bold');
			selectPainting=paintingArray[position];
			selectPainting.show();
			if(selectPainting==null){
				alert("painting is null");
			}else{
//				alert(selectPainting.getClassName());
			}
//			paintingArray[position].moveUp();
			for(var i in paintingArray){
				if(i!=position){
					tabArray[i].getText().fill('black').fontSize(22).fontStyle('normal');
					paintingArray[i].hide();
				}
			}
			stage.draw();
		
}
/*
 * 加载作者下拉列表
 */
function loadAuthorOptions(){
	$.ajax({
		url:'listUser.action',
		type:'post',
		dataType:'json',
		success:function(data){
			var items="";
			$.each(data.dataList,function(i,user){
				items+= "<option value=\"" + user.userid + "\">" + user.username + "</option>"; 
			});
			$("#authorID").html(items);
		}
	});
	}


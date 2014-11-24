$(function(){

	/*
	 * 浮动div的可拖动设置
	 */
	var _move=false;//移动标记
	var _x,_y;//鼠标离控件左上角的相对位置
	var target="";
	 $("#dikedMove").click(function(){
	    //alert("click");//点击（松开后触发）
	    }).mousedown(function(e){
	    target=$(e.target).parent();
	    _move=true;
	    _x=e.pageX-parseInt($("#dikedAreaMap").css("left"));
	    _y=e.pageY-parseInt($("#dikedAreaMap").css("top"));
	    //$("#popdiv_liquidpra").fadeTo(20, 0.25);//点击后开始拖动并透明显示
	});
	    
    $(document).mousemove(function(e){
        if(_move){
            var x=e.pageX-_x;//移动时根据鼠标位置计算控件左上角的绝对位置
            var y=e.pageY-_y;
            //$("#popdiv_liquidpra").css("display").css({top:y,left:x})
            $(target).css({top:y,left:x});//控件新位置
        }
    }).mouseup(function(){
    	_move=false;
    	target="";
    	//$("#popdiv_liquidpra").fadeTo("fast", 1);//松开鼠标后停止移动并恢复成不透明
    });

	$("#dikedAreaMap").css({
	 'top': function () {
	            return ($(window).height())+$(this).height()/2;
	        },
	 'left':function () {
	            return ($(window).width())/2-$(this).width()/2;
	        },
	}); 
	$("#close_lineAttr").click(function() {
		$("#lineAttr").hide();
	});
	/*
	 * 浮动div的可拖动设置
	 */
	initInputTab();
	initOutputTab();
	
});

function initInputTab(){
	/*
	 * input_tab初始化
	 */
	var input_base_sheetNum=$("#input_base_sheetNum").val();
	var input_function_sheetNum=$("#input_function_sheetNum").val();
	var input_condition_sheetNum=$("#input_condition_sheetNum").val();
	$("#input-base-container ul li").css("width",100/input_base_sheetNum+"%");
	$("#input-condition-container ul li").css("width",100/input_condition_sheetNum+"%");
	$("#input-function-container ul li").css("width",100/input_function_sheetNum+"%");

	/*
	 * 基础数据tab创建
	 */
	$("#input_base_div").html("");
	var input_base_div_html="";
	var maxSheetNum=5;//每个container里放几个tab
	var containerNum=parseInt(input_base_sheetNum/maxSheetNum)+1;//分几个container，一个container里面放5个tab
	var lastTabSheetNum=input_base_sheetNum%maxSheetNum;//最后一个container中的tab数量(sheet)
	if(lastTabSheetNum==0){
		containerNum-=1;
	}
	for(var i=0;i<containerNum;i++){//分别构建几个container
		var maxSheetNumTemp=maxSheetNum;
		if(i==containerNum-1&&lastTabSheetNum>0){//如果是最后一个container
			maxSheetNumTemp=lastTabSheetNum;
		}
		var panels="";
		var lis="";
		var algid=$("#curAlgID").val();
		if (algid==0){//如果是井筒流压计算
			input_base_div_html="<div id='input-base-container"+i+"' class='tabs-container'><div id='input-base-panels"+i+"'></div><ul id='input-base-ul"+i+"'></ul></div>";
			$("#input_base_div").append(input_base_div_html);
			panels+="<div id='input-base-tab' style='width:520px;float:right'>"+
		  	"<div><table id='input-sheet0' class='table table-striped table-bordered table-hover datatable' ></table>"+
				"<div id='input-pager0' ></div></div>" +
				"<div style='margin-top:20px'><table id='input-sheet1' class='table table-striped table-bordered table-hover datatable'></table>"+
					"<div id='input-pager1' ></div></div>" +
						"</div>";

			var tempid="input-base-panels"+i;
			$("#"+tempid).html(panels);
		}else{
			input_base_div_html="<div id='input-base-container"+i+"' class='tabs-container'><div id='input-base-panels"+i+"' class='panel-container'></div><ul id='input-base-ul"+i+"'></ul></div>";
			$("#input_base_div").append(input_base_div_html);
			for(var j=0;j<maxSheetNumTemp;j++){//创建五个tab
				var sid=i*5+j;
				var algid=$("#curAlgID").val();
				var inOrOut="In";
				var sheetgrid = new SheetGrid();
				var sheetName=sheetgrid.GetSheetName(sid,algid,inOrOut);
				if(sheetName=="障碍区"){//如果是障碍区的sheet序号
					panels+="<div id='input-base-tab"+sid+"'>"+
				  	"<table id='input-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:600px' ></table>"+
					"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:600px' >"+
						"<div id='input-pager"+sid+"' ></div></div>"+
						"<button style='font-size:12px;height:22px;margin-right:10px;margin-top:5px;' onclick='showDikedAreaMap()'>地图</button></div>";
				}else{
					panels+="<div id='input-base-tab"+sid+"'>"+
				  	"<table id='input-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
					"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
						"<div id='input-pager"+sid+"' ></div></div></div>";
				}
				//创建五个li
				lis+="<li><a href='#input-base-tab"+sid+"'>"+sheetName+"</a></li>";		
			}
			var tempid="input-base-panels"+i;
			$("#"+tempid).html(panels);
			var tempid="input-base-ul"+i;
			$("#"+tempid).html(lis);
			var tempid="input-base-container"+i;
			$("#input-base-container"+i+" ul li").css("width",100/maxSheetNumTemp+"%");
			$('#'+tempid).easytabs({
				animate: false
			});	
		}
		
	
	}

	/*
	 *问题描述tab创建
	 */
	$("#input_function_div").html("");
	var input_function_div_html="";
	var maxSheetNum=5;//每个container里放几个tab
	var containerNum=parseInt(input_function_sheetNum/maxSheetNum)+1;//分几个container，一个container里面放5个tab
	var lastTabSheetNum=input_function_sheetNum%maxSheetNum;//最后一个container中的tab数量(sheet)
	if(lastTabSheetNum==0){
		containerNum-=1;
	}
	for(var i=0;i<containerNum;i++){//分别构建几个container
		var maxSheetNumTemp=maxSheetNum;
		input_function_div_html="<div id='input-function-container"+i+"' class='tabs-container'><div id='input-function-panels"+i+"' class='panel-container'></div><ul id='input-function-ul"+i+"'></ul></div>";
		$("#input_function_div").append(input_function_div_html);
		if(i==containerNum-1&&lastTabSheetNum>0){//如果是最后一个container
			maxSheetNumTemp=lastTabSheetNum;
		}
		var panels="";
		var lis="";
		for(var j=0;j<maxSheetNumTemp;j++){//创建五个tab
			var sid=input_base_sheetNum*1+i*5+j;
			var algid=$("#curAlgID").val();
			var inOrOut="In";
			var sheetgrid = new SheetGrid();
			var sheetName=sheetgrid.GetSheetName(sid,algid,inOrOut);
			panels+="<div id='input-function-tab"+sid+"'>"+
		  	"<table id='input-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
			"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
				"<div id='input-pager"+sid+"' ></div></div></div>";
			//创建五个li
			lis+="<li><a href='#input-function-tab"+sid+"'>"+sheetName+"</a></li>";		
		}
		var tempid="input-function-panels"+i;
		$("#"+tempid).html(panels);
		var tempid="input-function-ul"+i;
		$("#"+tempid).html(lis);
		var tempid="input-function-container"+i;
		$("#input-function-container"+i+" ul li").css("width",100/maxSheetNumTemp+"%");
		$('#'+tempid).easytabs({
			animate: false
		});	
	}
	/*
	 *约束条件tab创建
	 */
	$("#input_condition_div").html("");
	var input_condition_div_html="";
	var maxSheetNum=5;//每个container里放几个tab
	var containerNum=parseInt(input_condition_sheetNum/maxSheetNum)+1;//分几个container，一个container里面放5个tab
	var lastTabSheetNum=input_condition_sheetNum%maxSheetNum;//最后一个container中的tab数量(sheet)
	if(lastTabSheetNum==0){
		containerNum-=1;
	}
	for(var i=0;i<containerNum;i++){//分别构建几个container
		var maxSheetNumTemp=maxSheetNum;
		input_condition_div_html="<div id='input-condition-container"+i+"' class='tabs-container'><div id='input-condition-panels"+i+"' class='panel-container'></div><ul id='input-condition-ul"+i+"'></ul></div>";
		$("#input_condition_div").append(input_condition_div_html);
		if(i==containerNum-1&&lastTabSheetNum>0){//如果是最后一个container
			maxSheetNumTemp=lastTabSheetNum;
		}
		var panels="";
		var lis="";
		for(var j=0;j<maxSheetNumTemp;j++){//创建五个tab
			var sid=input_base_sheetNum*1+input_function_sheetNum*1+i*5+j;
			var algid=$("#curAlgID").val();
			var inOrOut="In";
			var sheetgrid = new SheetGrid();
			var sheetName=sheetgrid.GetSheetName(sid,algid,inOrOut);
			panels+="<div id='input-condition-tab"+sid+"'>"+
		  	"<table id='input-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
			"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
				"<div id='input-pager"+sid+"' ></div></div></div>";
			//创建五个li
			lis+="<li><a href='#input-condition-tab"+sid+"'>"+sheetName+"</a></li>";		
		}
		var tempid="input-condition-panels"+i;
		$("#"+tempid).html(panels);
		var tempid="input-condition-ul"+i;
		$("#"+tempid).html(lis);
		var tempid="input-condition-container"+i;
		$("#input-condition-container"+i+" ul li").css("width",100/maxSheetNumTemp+"%");
		$('#'+tempid).easytabs({
			animate: false
		});	
	}
	
}
function initOutputTab(){
	//output_tab初始化
	
	var output_base_sheetNum=$("#output_base_sheetNum").val();
	var output_fee_sheetNum=$("#output_fee_sheetNum").val();
	var output_position_sheetNum=$("#output_position_sheetNum").val();
	$("#output-base-container ul li").css("width",100/output_base_sheetNum+"%");
	$("#output_fee-container ul li").css("width",100/output_fee_sheetNum+"%");
	$("#output_position-container ul li").css("width",100/output_position_sheetNum+"%");
	
	//基础数据tab创建
	
	$("#output_base_div").html("");
	var output_base_div_html="";
	var maxSheetNum=5;//每个container里放几个tab
	var containerNum=parseInt(output_base_sheetNum/maxSheetNum)+1;//分几个container，一个container里面放5个tab
	var lastTabSheetNum=output_base_sheetNum%maxSheetNum;//最后一个container中的tab数量(sheet)
	if(lastTabSheetNum==0){
		containerNum-=1;
	}
	for(var i=0;i<containerNum;i++){//分别构建几个container
		var maxSheetNumTemp=maxSheetNum;
		output_base_div_html="<div id='output-base-container"+i+"' class='tabs-container'><div id='output-base-panels"+i+"' class='panel-container'></div><ul id='output-base-ul"+i+"'></ul></div>";
		$("#output_base_div").append(output_base_div_html);
		if(i==containerNum-1&&lastTabSheetNum>0){//如果是最后一个container
			maxSheetNumTemp=lastTabSheetNum;
		}
		var panels="";
		var lis="";
		for(var j=0;j<maxSheetNumTemp;j++){//创建五个tab
			var sid=i*5+j;
			var algid=$("#curAlgID").val();
			var inOrOut="Out";
			var sheetgrid = new SheetGrid();
			var sheetName=sheetgrid.GetSheetName(sid,algid,inOrOut);
	
			panels+="<div id='output-base-tab"+sid+"'>"+
		  	"<table id='output-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
			"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
				"<div id='output-pager"+sid+"' ></div></div></div>";
			//创建五个li
			lis+="<li><a href='#output-base-tab"+sid+"'>"+sheetName+"</a></li>";		
		}
		var tempid="output-base-panels"+i;
		$("#"+tempid).html(panels);
		var tempid="output-base-ul"+i;
		$("#"+tempid).html(lis);
		var tempid="output-base-container"+i;
		$("#output-base-container"+i+" ul li").css("width",100/maxSheetNumTemp+"%");
		$('#'+tempid).easytabs({
			animate: false
		});	
	}
	
	 //费用数据tab创建
	 
	$("#output_fee_div").html("");
	var output_fee_div_html="";
	var maxSheetNum=5;//每个container里放几个tab
	var containerNum=parseInt(output_fee_sheetNum/maxSheetNum)+1;//分几个container，一个container里面放5个tab
	var lastTabSheetNum=output_fee_sheetNum%maxSheetNum;//最后一个container中的tab数量(sheet)
	if(lastTabSheetNum==0){
		containerNum-=1;
	}
	for(var i=0;i<containerNum;i++){//分别构建几个container
		var maxSheetNumTemp=maxSheetNum;
		output_fee_div_html="<div id='output-fee-container"+i+"' class='tabs-container'><div id='output-fee-panels"+i+"' class='panel-container'></div><ul id='output-fee-ul"+i+"'></ul></div>";
		$("#output_fee_div").append(output_fee_div_html);
		if(i==containerNum-1&&lastTabSheetNum>0){//如果是最后一个container
			maxSheetNumTemp=lastTabSheetNum;
		}
		var panels="";
		var lis="";
		for(var j=0;j<maxSheetNumTemp;j++){//创建五个tab
			var sid=output_base_sheetNum*1+i*5+j;
			var algid=$("#curAlgID").val();
			var inOrOut="Out";
			var sheetgrid = new SheetGrid();
			var sheetName=sheetgrid.GetSheetName(sid,algid,inOrOut);
	
			panels+="<div id='output-fee-tab"+sid+"'>"+
		  	"<table id='output-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
			"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
				"<div id='output-pager"+sid+"' ></div></div></div>";
			//创建五个li
			lis+="<li><a href='#output-fee-tab"+sid+"'>"+sheetName+"</a></li>";		
		}
		var tempid="output-fee-panels"+i;
		$("#"+tempid).html(panels);
		var tempid="output-fee-ul"+i;
		$("#"+tempid).html(lis);
		var tempid="output-fee-container"+i;
		$("#output-fee-container"+i+" ul li").css("width",100/maxSheetNumTemp+"%");
		$('#'+tempid).easytabs({	
			animate: false
		});	
	}
	
	 // 站点数据tab创建
	 
	$("#output_position_div").html("");
	var output_position_div_html="";
	var maxSheetNum=5;//每个container里放几个tab
	var containerNum=parseInt(output_position_sheetNum/maxSheetNum)+1;//分几个container，一个container里面放5个tab
	var lastTabSheetNum=output_position_sheetNum%maxSheetNum;//最后一个container中的tab数量(sheet)
	if(lastTabSheetNum==0){
		containerNum-=1;
	}
	for(var i=0;i<containerNum;i++){//分别构建几个container
		var maxSheetNumTemp=maxSheetNum;
		output_position_div_html="<div id='output-position-container"+i+"' class='tabs-container'><div id='output-position-panels"+i+"' class='panel-container'></div><ul id='output-position-ul"+i+"'></ul></div>";
		$("#output_position_div").append(output_position_div_html);
		if(i==containerNum-1&&lastTabSheetNum>0){//如果是最后一个container
			maxSheetNumTemp=lastTabSheetNum;
		}
		var panels="";
		var lis="";
		for(var j=0;j<maxSheetNumTemp;j++){//创建五个tab
			var sid=output_base_sheetNum*1+output_fee_sheetNum*1+i*5+j;
			var algid=$("#curAlgID").val();
			var inOrOut="Out";
			var sheetgrid = new SheetGrid();
			var sheetName=sheetgrid.GetSheetName(sid,algid,inOrOut);
	
			panels+="<div id='output-position-tab"+sid+"'>"+
		  	"<table id='output-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
			"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
				"<div id='output-pager"+sid+"' ></div></div></div>";
			//创建五个li
			lis+="<li><a href='#output-position-tab"+sid+"'>"+sheetName+"</a></li>";		
		}
		var tempid="output-position-panels"+i;
		$("#"+tempid).html(panels);
		var tempid="output-position-ul"+i;
		$("#"+tempid).html(lis);
		var tempid="output-position-container"+i;
		$("#output-position-container"+i+" ul li").css("width",100/maxSheetNumTemp+"%");
		$('#'+tempid).easytabs({
			animate: false
		});	
	}
}
function showDikedAreaMap(){//显示障碍区地图
	if($("#dikedAreaMap").css("display")=="none"){
		$("#dikedAreaMap").show();
		var proid=$("#proID").val();
		var algid=$("#curAlgID").val();
		initdiked();
		showObstacle();
	}else{
		$("#dikedAreaMap").hide();
		
	}
	
}
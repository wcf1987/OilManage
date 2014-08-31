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
	            return ($(window).height())/2-$(this).height()/2;
	        },
	 'left':function () {
	            return ($(window).width())/2-$(this).width()/2;
	        },
	}); 
	/*
	 * 浮动div的可拖动设置
	 */
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
		input_base_div_html+="<div id='input-base-container"+i+"' class='tabs-container'><div id='input-base-panels"+i+"' class='panel-container'></div><ul id='input-base-ul"+i+"'></ul></div>";
		$("#input_base_div").append(input_base_div_html);
		if(i==containerNum-1&&lastTabSheetNum>0){//如果是最后一个container
			maxSheetNumTemp=lastTabSheetNum;
		}
		var panels="";
		var lis="";
		for(var j=0;j<maxSheetNumTemp;j++){//创建五个tab
			var sid=i*5+j;
			var algid=$("#curAlgID").val();
			var inOrOut="In";
			var sheetgrid = new SheetGrid();
			var sheetName=sheetgrid.GetSheetName(sid,algid,inOrOut);
			if(sheetName=="障碍区"){//如果是障碍区的sheet序号
				panels+="<div id='input-base-tab"+sid+"'>"+
			  	"<table id='input-base-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:600px' ></table>"+
				"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:600px' >"+
					"<div id='input-base-pager"+sid+"' ></div></div>"+
					"<button style='font-size:12px;height:22px;margin-right:10px;margin-top:5px;' onclick='showDikedAreaMap()'>地图</button></div>";
			}else{
				panels+="<div id='input-base-tab"+sid+"'>"+
			  	"<table id='input-base-sheet"+sid+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
				"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
					"<div id='input-base-pager"+sid+"' ></div></div></div>";
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
	/*
	 * 约束条件tab创建
	 */
	var tabs="";
	for(var i=0;i<input_condition_sheetNum;i++){
		tabs+="<div id='input-condition-tab"+i+"'>"+
		  	"<table id='input-condition-sheet"+i+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
			"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
				"<div id='input-condition-pager"+i+"' ></div></div></div>";
	}
	$("#input-condition-tabs").html(tabs);

	var i=0;
	var tabs="<div id='input-function-tab"+i+"'>"+
		"<table id='input-function-sheet"+i+"' class='table table-striped table-bordered table-hover datatable' style='width:1230px' ></table>"+
	"<div style='box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230px' >"+
		"<div id='input-function-pager"+i+"' ></div></div></div>";
	$("#input-function-tabs").html(tabs);
	
});

function showDikedAreaMap(){//显示障碍区地图
	if($("#dikedAreaMap").css("display")=="none"){
		$("#dikedAreaMap").show();
		var proid=$("#proID").val();
		var algid=$("#curAlgID").val();
		init();
		showObstacle(proid,algid,"In");
	}else{
		$("#dikedAreaMap").hide();
	}
	
}
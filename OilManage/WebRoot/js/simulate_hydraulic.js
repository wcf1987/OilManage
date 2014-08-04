/*
 * 浮动div的可拖动设置
 */
var _move=false;//移动标记
var _x,_y;//鼠标离控件左上角的相对位置
$(document).ready(function(){
	var target="";
	 $("#popdiv_liquidpra").click(function(){
	    //alert("click");//点击（松开后触发）
	    }).mousedown(function(e){
	    target=e.target;
	    _move=true;
	    _x=e.pageX-parseInt($("#popdiv_liquidpra").css("left"));
	    _y=e.pageY-parseInt($("#popdiv_liquidpra").css("top"));
	    //$("#popdiv_liquidpra").fadeTo(20, 0.25);//点击后开始拖动并透明显示
	});
	$("#popdiv_basicdata").click(function(){
	    //alert("click");//点击（松开后触发）
	    }).mousedown(function(e){
	    target=e.target;	
	    _move=true;
	    _x=e.pageX-parseInt($("#popdiv_basicdata").css("left"));
	    _y=e.pageY-parseInt($("#popdiv_basicdata").css("top"));
	   // $("#popdiv_basicdata").fadeTo(20, 0.25);//点击后开始拖动并透明显示
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
    
    $("#close_liquidpra").click(function() {
    	$("#popdiv_liquidpra").hide();
    });
    $("#close_basicdata").click(function() {
    	$("#popdiv_basicdata").hide();
    });
    
    
    
});

/*
 * 打开参数输入框
 */
function showLiquidPra(){
	$("#popdiv_liquidpra").show();
}
/*
 * 打开基础数据输入框
 */
function showBasicData(){
	$("#popdiv_basicdata").show();
}
/*
 * 运行
 */
function runSimulator(){
	
}
/*
 * 显示输出
 */
function showOutput(){
	
}

/*
 * 多选框
 */
$(document).ready(function(){
    // 把选择项追加给对方
    $('#add').click(function(){
    var options=$('#select1 option:selected');
    var remove=options.remove();
    remove.appendTo("#select2");
    });
    // 把所有项追加给对方
    $('#addAll').click(function(){
    var options=$('#select1 option');
    var remove=options.remove();
    remove.appendTo("#select2");
    });
    // 把选择项退回给对方
    $('#remove').click(function(){
    var options=$('#select2 option:selected');
    var remove=options.remove();
    remove.appendTo("#select1");
    });
    // 把全部项退回给对方
    $('#removeAll').click(function(){
    var options=$('#select2 option');
    var remove=options.remove();
    remove.appendTo("#select1");
    });
});
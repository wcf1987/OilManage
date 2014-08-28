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
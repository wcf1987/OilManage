$(document).ready(function(){

	backtop();
	
});

function logout(){
	$.ajax({
		url:'logout.action',
		type:'post',
		dataType:'json',
		success:function(data){
//			alert(data.flag);
			if(data.flag=="true"){
				
//				location.href="#";
				window.location.reload();
			}else{
				alert("登出失败！");
//				window.location.reload();
				//$('#register_modal').modal('hide');
			}
		}
	});

}
function backtop(){
    var backtop = $("<a class='backTop'>∧</a>");
    $("body").append(backtop);
      
    var fn = function(){
    $('html,body').animate({
        scrollTop: '0px'
        }, 400);
        return false;
    };
    $('.backTop').bind('click',fn);
      
    $(window).scroll(function () {
        var scrollt = $(window).scrollTop();
        if ( scrollt > 900 ){
            $(".backTop").fadeIn("slow");
        } else {
            $(".backTop").fadeOut("slow");
        }
    });
}

function updatePagerIcons(table) {
	var replacement = 
	{
		'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
		'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
		'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
		'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
	};
	$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
		var icon = $(this);
		var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
		
		if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
	})
}
function enableTooltips(table) {
	//$('.navtable .ui-pg-button').tooltip({container:'body'});
	//$(table).find('.ui-pg-div').tooltip({container:'body'});
}

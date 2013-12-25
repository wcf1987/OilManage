$(document).ready(function(){

	backtop();


});


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
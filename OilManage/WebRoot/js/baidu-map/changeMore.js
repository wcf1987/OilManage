//2011-7-25 zhangying
//modified by zsy
(function(){
function load_script(xyUrl,callback){
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = xyUrl;
    //借鉴了jQuery的script跨域方法
    script.onload = script.onreadystatechange = function(){
        if((!this.readyState || this.readyState === "loaded" || this.readyState === "complete")){
            callback && callback();
            // Handle memory leak in IE
            script.onload = script.onreadystatechange = null;
            if ( head && script.parentNode ) {
                head.removeChild( script );
            }
        }
    };
    // Use insertBefore instead of appendChild  to circumvent an IE6 bug.
    head.insertBefore( script, head.firstChild );
}
function transMore(points,type,callback,i){//参数的添加主要在这里，上面的load_script里面没影响
	var callbackName = 'cbk_' + Math.round(Math.random() * 10000);  
	var xyUrl = "http://api.map.baidu.com/ag/coord/convert?from=" + type + "&to=4&mode=1";
	var xs = [];
	var ys = [];
	var maxCnt = 50;//每次发送的最大个数
	var send = function(){
		var url = xyUrl + "&x=" + xs.join(",") + "&y=" + ys.join(",") + "&callback=BMap.Convertor." + callbackName;
	    //动态创建script标签
	    load_script(url);
	    BMap.Convertor[callbackName] = function(xyResults){
	        delete BMap.Convertor[callbackName];    //调用完需要删除改函数
	        callback && callback(xyResults,i,points);//参数的添加主要在这里，上面的load_script里面没影响
	    }
		xs = [];
		ys = [];
	}
    for(var index in points){
		if(index % maxCnt == 0 && index != 0){
			send();
		}
    	xs.push(points[index].lng);
    	ys.push(points[index].lat);
		if(index == points.length - 1){
			send();
		}
    }
    
}

window.BMap = window.BMap || {};
BMap.Convertor = {};
BMap.Convertor.transMore = transMore;
})();

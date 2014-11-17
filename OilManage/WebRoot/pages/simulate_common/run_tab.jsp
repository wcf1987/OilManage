<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>

	<script src="js/Highcharts-4.0.1/highcharts.js"></script>
	<script src="js/Highcharts-4.0.1/js/modules/exporting.js"></script>
	
	<script type="text/javascript" src="js/Highcharts-4.0.1/js/themes/gray.js"></script>

<div id="running-container" >
	<div><span>运行输出台</span><button onclick="loadOutput(0)">查看输出</button></div>
	<textarea  id="outputarea" name="outputarea" disabled="">
	</textarea>
</div>






<style>
	#running-container { border:2px solid;width: 100%;height:206px;; padding: 0; clear: both; background-color:white}
	#running-container>div{
		padding:5px 5px;background-color:#fff;font-size:12px;font-weight:bold
	}
	#running-container>div>span{
		background-color:#fff;
		border-radius:3px;
		border:2px solid;
		padding:2px;
		margin-right:5px;
	}
	textarea{
		width:100%;
		font-size:14px;
		height:85%;
	}
</style>
		
 

		
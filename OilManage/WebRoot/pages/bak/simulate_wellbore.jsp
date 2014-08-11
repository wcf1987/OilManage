<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <%
//User userlogin=(User)(session.getAttribute("user"));
%> 
    <base href="<%=basePath%>">
    
    <title>系统模拟</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	
	<script type="text/javascript" src="editor/lib/kinetic-v5.1.0.min.js"></script>
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />  
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	<link rel="stylesheet" media="screen" type="text/css"
		href="editor/assets/css/style.css" />
	<link rel="stylesheet" media="screen" type="text/css"
		href="editor/assets/css/minimap.css" />

	<script type="text/javascript" src="editor/assets/javascript/json2.js"></script>
	<script type="text/javascript" src="editor/assets/javascript/jquery-1.11.0.min.js"></script>
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	<script type="text/javascript" src="editor/assets/javascript/ajaxfileupload.js"></script>
	<script src="js/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/holder.min.js"></script>
	<script type="text/javascript" src="js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
	<script src="js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
	<script src="js/easytabs/jquery.easytabs.js" type="text/javascript"></script>
	<script src="js/jqueryPlug/jquery.mousewheel.min.js" type="text/javascript"></script>
	
	<script defer="defer" type="text/javascript" src="editor/lib/init2.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/platform.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/leftpoly.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/Paintings.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/tools.js"></script>
	<script defer="defer" type="text/javascript" src="editor/lib/kinecttab.js"></script>

	<script defer="defer" type="text/javascript" src="js/simulate_hydraulic.js"></script>
	<script defer="defer" type="text/javascript" src="js/diagram.js"></script>
	
	<link type='text/css' href='editor/assets/simplemodal/css/diagramo.css' rel='stylesheet' media='screen' />
	<link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/colorPicker_new.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
	<!-- <link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/processui.css" />  -->
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>	

	<link rel="stylesheet" type="text/css" href="css/diagram.css"/>	
		
	<link rel="stylesheet" type="text/css" href="css/simulate_wellbore.css"/>
	<style type="text/css">
	/* 	body { font-family: "HelveticaNeue", "Helvetica-Neue", "Helvetica", "Arial", sans-serif;background: linear-gradient(45deg, #020031 0%, #6d3353 100%); }
	 */
	</style>

  </head>
    
  
  <body  id="body"  onload="initLight();">

	<div id="head">
		    <%@ include file="commons/header.jsp" %>
	</div>  
	<div class="container marketing condiv" style="width:1200px;margin-top:55px;">
    	
    	<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
				<div class="page-header">
					<h1>井筒模拟&nbsp;</h1>
				</div>
								
				<div id="maindiv" class="container-fluid" >
					<div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span8">
									<div class="row-fluid">
									<div class="span4 " style="float:left;margin-right:10px;">
										<img  class="wellImage" src="images/jingtong.png" />
									</div>
										<div class="span6" style="float:left">
											<table class="table table-condensed table-bordered">
												<caption>气井参数</caption>
												<thead>
													<tr>
														<th>序号
														</th>
														<th>
															参数
														</th>
														<th>
															值
														</th>
														<th>单位</th>														
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>井深</td>
														<td></td>
														<td>m</td>														
													</tr>
													<tr>
														<td>2</td>
														<td>井口套压</td>
														<td></td>
														<td>MPa</td>
													</tr>
													<tr>
														<td>3</td>
														<td>井口温度</td>
														<td></td>
														<td>K</td>
													</tr>
													<tr>
														<td>4</td>
														<td>油管外径</td>
														<td></td>
														<td>m</td>
													</tr>
													<tr>
														<td>5</td>
														<td>套管内径</td>
														<td></td>
														<td>m</td>
													</tr>
													<tr>
														<td>6</td>
														<td>绝对粗糙度</td>
														<td></td>
														<td>m</td>
													</tr>
													<tr>
														<td>7</td>
														<td>日产气量</td>
														<td></td>
														<td>Nm3/d</td>
													</tr>
													<tr>
														<td>8</td>
														<td>井下温度梯度</td>
														<td></td>
														<td>K/m</td>
													</tr>
													<tr>
														<td>9</td>
														<td>气柱高度</td>
														<td></td>
														<td>m</td>
													</tr>
												</tbody>
											</table>
											<div >
												<button class="btn" type="button" style="float:left;margin:15px;">导入Excel</button>
												<button class="btn" type="button" style="float:right;margin:15px;">保存</button>
											</div>
										</div>
										<div class="span6" style="float:left">
											<table class="table table-condensed table-bordered">
												<caption>流体参数</caption>
												<thead>
													<tr>
														<th>
															序号
														</th>
														<th>
															参数
														</th>
														<th>
															值
														</th>
														<th>单位</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															1
														</td>
														<td>
															气体动力粘度
														</td>
														<td>
															
														</td>
														<td>
															Pa.s
														</td>
													</tr>
													<tr>
														<td>
															2
														</td>
														<td>
															气体相对密度
														</td>
														<td>
															
														</td>
														<td>
													
														</td>
													</tr>
													<tr>
														<td>
															3
														</td>
														<td>
															液体密度
														</td>
														<td>
															
														</td>
														<td>
															kg/m3
														</td>
													</tr>													
												</tbody>
											</table>	
											<div >
												<button class="btn" type="button" style="float:left;margin:15px;">导入Excel</button>		
												<button class="btn" type="button" style="float:right;margin:15px;">保存</button>
											</div>							
										</div>
										<div class="span6" style="float:left;margin-top:20px;width:350px;">
											<form class="form-horizontal" style="padding:10px;">
												<div class="control-group">
													<label class="control-label" for="inputEmail">计算结果</label>
													<div class="controls">
														<input id="inputEmail" type="text" />
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														 <button class="btn" type="submit">点击计算井底流压</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>

					
								
			
			</div>
		</div> 
    </div><!-- /.container -->		
    </div>

	    	  
	<hr class="featurette-divider">
     	<div id="footer">
        <%@ include file="commons/footer.jsp" %>
    </div>
	 


		   
  </body>
  
</html>

	

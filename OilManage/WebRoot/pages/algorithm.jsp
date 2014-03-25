<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%
User userlogin=(User)(session.getAttribute("user"));
if (userlogin==null){
response.sendRedirect("login.jsp");
return;
}
else{

}
%>

    <base href="<%=basePath%>">
    
    <title>算法管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="算法管理">
	
	
	<!-- Bootstrap -->
   
	<!--  <link rel="stylesheet" href="css/justified-nav.css">
	-->
	<link rel="stylesheet" href="js/upload/uploadify.css">
	 
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	 
	
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/overcast/jquery.ui.theme.css" />  
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/black-tie/jquery.ui.theme.css" />
	 
	 
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	<!-- 自定义 -->
	
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	  
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/holder.min.js"></script>
	 
	<script src="js/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	
	
	<script type="text/javascript" src="js/upload/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/jquery/jquery.message.js"></script>
	<!-- 自定义 -->
	<script src="js/global.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

	<script type="text/javascript" src="js/algorithm_manage.js"></script>

  </head>
  
  <body style="background-color:#CCCCCC;">
 
 	
	   	
	  <div class="navbar-wrapper">
	      <div class="container">
	        <div class="navbar navbar-inverse navbar-static-top" role="navigation">
	          <div class="container">
	            <div class="navbar-header">
	              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	              </button>
	              <a class="navbar-brand" href="#"><div style="font-color:#99CCFF;font-weight:bold;font-family:Georgia, serif;">煤层气集输系统后台管理</div></a>
	            </div>
	            <div class="navbar-collapse collapse">
	              <ul class="nav navbar-nav">
	                <li><a href="pages/map.jsp">返回首页</a></li>
	                <li><a href="pages/data.jsp">数据管理</a></li>
	                <li class="active"><a href="pages/algorithm.jsp">算法管理</a></li>
	                <li><a href="pages/home.jsp">系统管理</a></li>
			        <li><a href="pages/home.jsp">关于</a></li>
			        <li><a href="pages/home.jsp">联系方式</a></li>
	                <li class="dropdown">
	                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
	                  <ul class="dropdown-menu">
	                    <li><a href="#">Action</a></li>
	                    <li><a href="#">Another action</a></li>
	                    <li><a href="#">Something else here</a></li>
	                    <li class="divider"></li>
	                    <li class="dropdown-header">Nav header</li>
	                    <li><a href="#">Separated link</a></li>
	                    <li><a href="#">One more separated link</a></li>
	                  </ul>
	                </li>
	              </ul>
	                
	               
			      <div class="text-center" style="margin-top:8px;margin-right:25px;" id="userId">
			      	<div style="margin-left:5px;margin-top:5px;"><a  style="margin-left:5px;margin-top:5px;float:right"id="exit" href="logOut.action">注销</a></div>
			        <div style="font-size:20;color:#FFFFFF;float:right">您好,<a href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%></a></div>
			       
			        	
			      	
			      </div>
			     
			  
	              
	            </div>
	          </div>
	        </div>
	
	      </div>
	    </div>
	 
		    
		    <!-- Carousel
	    ================================================== -->
	    <div id="myCarousel" class="carousel slide" data-ride="carousel">
	      	<!-- Indicators -->
			<ol class="carousel-indicators">
			  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			  <li data-target="#myCarousel" data-slide-to="1"></li>
			  <li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
				  <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:地图建模" alt="地图建模">
				  <div class="container">
				    <div class="carousel-caption">
				      <!-- <h1>与GIS接口</h1>  -->
				      <p>与地理信息系统的接口，提供地图呈现和实际管网展现功能。</p>
				      <p></p>
				      <!-- <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p> -->
				    </div>
				  </div>
				</div>
				<div class="item">
				  <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:地图建模" alt="地图建模">
				  <div class="container">
				    <div class="carousel-caption">
				       <!-- <h1>与3D地形接口</h1> -->
				      <p>与3D地形呈现系统的接口，提供数字三维地图的展示。</p>
				      <p></p>
				      <!--  <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>-->
				    </div>
				  </div>
				</div>
		        <div class="item">
		          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:地图建模" alt="地图建模">
		          <div class="container">
		            <div class="carousel-caption">
		              <!-- <h1>与现场数据接口</h1> -->
		              <p>与现场采集数据的接口。</p>
		              <p></p>
		              <!--  <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>-->
		            </div>
		          </div>
		        </div>
	      </div>
	      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
		</div><!-- /.carousel -->

    	 <!-- Marketing messaging and featurettes
	    ================================================== -->
	    <!-- Wrap the rest of the page in another container to center all the content. -->
	    
		<div class="container marketing" style="width:1200px;">
	    	
	    	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
						<div class="tabbable" id="tabs-360872">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#panel-1" data-toggle="tab" style="font-size:12px;font-weight:bold;font-family:黑体">算法管理</a>
								</li>
								<!-- 
								<li>
									<a href="#panel-2" data-toggle="tab" style="font-size:12px;font-weight:bold;font-family:黑体">物理单位管理</a>
								</li>
								<li>
									<a href="#panel-3" data-toggle="tab" style="font-size:12px;font-weight:bold;font-family:黑体">参数管理</a>
								</li> -->
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-1">		
									<table id="AlgorithmList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230" >
						      			<div id="AlgorithmPager" ></div>
						      		</div>	      		
								</div>
								<!--  
								<div class="tab-pane" id="panel-2">							
						      		<table id="MeasureList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230" >
						      			<div id="MeasurePager" ></div>
						      		</div>	      		
								</div>
								<div class="tab-pane" id="panel-3">							
									<table id="ParameterList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230" >
						      			<div id="ParameterPager" ></div>
						      		</div>
								</div>
								-->
							</div>
						</div>
										
					</div>
				</div>
			</div>

	      	<hr class="featurette-divider">

	
	      	<!-- FOOTER -->
	      	<div class="footer">
	        	<p>&copy; 2013 中国石油大学</p>
	      	</div>
	
	    </div><!-- /.container -->
	    
	   
			<!-- 上传算法文件的模态框 -->   
		<div id="uploadAlgorithmModal" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title">添加算法</h4>
		      </div>
		      <div class="modal-body">
		      	<form id="addAlgorithmForm" action="addAlgorithmsCycle.action" method="post"> 
			        <p> 
			        <!-- 上传文件选择 -->
			        	  算法描述：<input type="text" name="Description" id='Description'/><em style="color:red">*</em>
			        	  作者：
			        	<select id="authorID" name="authorID">		                  
                		</select>
   						<em style="color:red">*</em>
			        	  
			        	<input type="file" name="xxx" id="algorithmfile" /> 
			        </p>  		 
			 		
			      <div class="modal-footer">
			       	<button type="submit" class="btn btn-primary">保存 &nbsp;</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			       <input type="text" id="hideAlgorithmFilePath" value=""  style="display:none;"/>
			      </div>
		      	</form>
		       </div>
		       
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
			
    	
   				
				
    		<!-- 选择输入参数的模态框 -->   	
		<div class="modal fade" id="addAlgorithmInput_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加输入</h4>
		      </div>
		      <div class="modal-body">  	  
		     	 <form id="addAlgorithmInputForm" action="addAlgorithmInput.action" method="post"> 		 
		      	  <div class="centent"> 
		      	  	<input id="CycleID" style="display: none;"/> 
				    <select multiple id="select1" style="width:200px;height:auto;margin-left:50px;">  
				    
				    </select>  
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				    <select multiple id="select2" name="selectedIDs" style="width:200px;height:auto;">  
				          
				    </select>  
				  </div>  
				  <div >  
				    <button id="add" style="margin-left:50px;">选中添加到右边&gt;&gt;</button>  
				    <button id="remove" style="margin-left:80px;">&lt;&lt;选中添加到左边</button><br>  
				    <button id="addAll"  style="margin-left:50px;">全部添加到右边&gt;&gt;</button>  
				    <button id="removeAll" style="margin-left:80px;">&lt;&lt;全部添加到左边</button>  
				  </div>  	
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >保存</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	
			<!-- 选择输出参数的模态框 -->   	
		<div class="modal fade" id="addAlgorithmOutput_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加输出</h4>
		      </div>
		      <div class="modal-body">  	  
		     	 <form id="addAlgorithmOutputForm"> 		 
		      	  <div class="centent"> 
		      	  	<input id="outputCycleID" style="display: none;"/> 
				    <select multiple id="outputselect1" style="width:200px;height:auto;margin-left:50px;">  
				    
				    </select>  
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				    <select multiple id="outputselect2" name="outputSelectedIDs" style="width:200px;height:auto;">  
				          
				    </select>  
				  </div>  
				  <div >  
				    <button id="outputadd" style="margin-left:50px;">选中添加到右边&gt;&gt;</button>  
				    <button id="outputremove" style="margin-left:80px;">&lt;&lt;选中添加到左边</button><br>  
				    <button id="outputaddAll"  style="margin-left:50px;">全部添加到右边&gt;&gt;</button>  
				    <button id="outputremoveAll" style="margin-left:80px;">&lt;&lt;全部添加到左边</button>  
				  </div>  	
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >保存</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
						
    		<!-- 查看输入参数的模态框 -->   	
		<div class="modal fade" id="listAlgorithmInput_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		       <!--  <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看输入</h4> -->
		      </div>
		      <div class="modal-body">  
		      	<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<table id="generatedTable" class="table" >
								<thead>
									<tr>
										<th>
											编号
										</th>
										<th>
											参数名
										</th>
										<th>
											符号
										</th>
									</tr>
								</thead>
								<tbody>
									<tr id="cloneTr">
										<td>											
										</td>
										<td>											
										</td>
										<td>											
										</td>						
									</tr>									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 
	      		<table id="AlgorithmInputList" class="table table-striped table-bordered table-hover datatable " style="width:600px;" ></table>
	      		<div>
	      			<div id="AlgorithmInputMeasurePager" ></div>
	      		</div>	
	      		 -->	  
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
			<!-- 查看详情的模态框 -->   	
		<div class="modal fade" id="view_detail_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		       <!--  <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看输入</h4> -->
		      </div>
		      <div class="modal-body">  
		      	<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<dl class="dl-horizontal">
								<dt>
									编号
								</dt>
								<dd id="AlgID">
									
								</dd>
								<dt>
									名称
								</dt>
								<dd id="AlgName">
									
								</dd>
							
								<dt>
									描述
								</dt>
								<dd id="AlgDes">
									
								</dd>
								<dt>
									添加时间
								</dt>
								<dd id="AlgAddDate">
									
								</dd>
								<dt>
									最后更新时间
								</dt>
								<dd id="AlgLastUpdateDate">
									
								</dd>
								<dt>
									作者
								</dt>
								<dd id="AlgAuthor">
									
								</dd>
							</dl>	
							
							<hr size=1 style="COLOR:#ff9999;border-style:double;width:490"> 
							
							<dl class="dl-horizontal">
								
								<dt>
									输入参数明细
								</dt>
								<dd>
									<table id="inputTable" class="table" >
										<thead>
											<tr>
												<th>
													编号
												</th>
												<th>
													参数名
												</th>
												<th>
													符号
												</th>
											</tr>
										</thead>
										<tbody>
											<tr id=inputTr>
												<td>											
												</td>
												<td>											
												</td>
												<td>											
												</td>						
											</tr>									
										</tbody>
									</table>	
								</dd>
								<dt>
									输出明细
								</dt>
								<dd>
									<table id="outputTable" class="table" >
										<thead>
											<tr>
												<th>
													编号
												</th>
												<th>
													参数名
												</th>
												<th>
													符号
												</th>
											</tr>
										</thead>
										<tbody>
											<tr id=outputTr>
												<td>											
												</td>
												<td>											
												</td>
												<td>											
												</td>						
											</tr>									
										</tbody>
									</table>	
								</dd>															
							</dl>						
						<!--  
							<table id="generatedTable" class="table" >
								<thead>
									<tr>
										<th>
											编号
										</th>
										<th>
											参数名
										</th>
										<th>
											符号
										</th>
									</tr>
								</thead>
								<tbody>
									<tr id="cloneTr">
										<td>											
										</td>
										<td>											
										</td>
										<td>											
										</td>						
									</tr>									
								</tbody>
							</table>
							-->
						</div>
					</div>
				</div>
				<!-- 
	      		<table id="AlgorithmInputList" class="table table-striped table-bordered table-hover datatable " style="width:600px;" ></table>
	      		<div>
	      			<div id="AlgorithmInputMeasurePager" ></div>
	      		</div>	
	      		 -->	  
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
  </body>
  
</html>




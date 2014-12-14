<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>


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
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />  
	 <!-- <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/black-tie/jquery.ui.theme.css" /> -->
	 
	 
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	<!-- 自定义 -->
	
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	  
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	
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
	<script type="text/javascript" src="js/graphi.js"></script>
	<script type="text/javascript" src="js/graphiDetail.js"></script>
  </head>
  
  <body>
 
 	   <div id="head">
		    <%@ include file="commons/header_admin.jsp" %>
	  	</div> 
	   
    	 <!-- Marketing messaging and featurettes
	    ================================================== -->
	    <!-- Wrap the rest of the page in another container to center all the content. -->
	    
		<div class="container marketing condiv" style="width:1200px;">
	    	
	    	<div class="container-fluid-admin">
				<div class="row-fluid row-fluid3">
					<div class="span12">
						
						<div class="tabbable" id="tabs-360872">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#panel-1" data-toggle="tab"  class="tab-a">算法管理</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-1">		
									<table id="AlgorithmList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div id="AlgorithmPager" ></div>      		
								</div>
							</div>
						</div>
										
					</div>
				</div>
			</div>
	
	    </div><!-- /.container -->
	    <hr>
      	<div id="footer">
	        <%@ include file="commons/footer.jsp" %>
	    </div>
	   
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
			        	 名称：<input type="text" name="algname" id='algname'/><em style="color:red">*</em><br> <br> 
			        	  算法描述：<input type="text" name="Description" id='Description'/><em style="color:red">*</em><br> <br> 
			        	  作者：
			        	<select id="authorID" name="authorID">		                  
                		</select>
   						<em style="color:red">*</em><br> <br> 
   						类名：<input type="text" name="className" id='className'/><em style="color:red">*</em>
			        	<br> <br> 
			        	<input type="file" name="algorithmfile" id="algorithmfile" /> 
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
		      	<!-- 添加输入参数 -->	  
		     	 <form id="addAlgorithmInputForm"  > 		 
		      	  <div class="centent"> 
		      	  	<input id="algID" style="display: none;"/> 
		      	  	<input id='addInputDisplay' style='display: none;'/><input id='addInputMeasure' style='display: none;'/>
				    <select  id="addParameterID" name="addParameterID" style="width:200px;height:auto;margin-left:50px;">  
				    
				    </select>  
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  				   
					<button type="submit" class="btn btn-primary"  >添加</button>
				   	<!--  <span id="measureSymbol" name="measureSymbol"></span>--> 
				  </div>
				 </form> 
				 <hr size=1 style="COLOR:#ff9999;border-style:double;width:550"> 
				 <!-- <div class="modal-header"> -->		        	
		        	<h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看输入</h4>
		      	<!-- </div> -->
		      	 <hr size=1 style="COLOR:#ff9999;border-style:double;width:550"> 
				<ul id="ItemInputList"  data-role="list" style="margin-bottom:10px;"></ul>
			     <!-- 
		     	 <form id="addAlgorithmInputForm" action="addAlgorithmInput.action" method="post"> 		 
		      	  <div class="centent"> 
		      	  	<input id="CycleID" style="display: none;"/> 				 
				    <select multiple id="select1" style="width:200px;height:250px;margin-left:50px;">  				    
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
				 --> 	
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
		      	
		      	<!-- 添加输出参数 -->	  
		     	 <form id="addAlgorithmOutputForm"  > 		 
		      	  <div class="centent"> 
		      	  	<input id="outputAlgID" style="display: none;"/> 
		      	  	<input id='addOutputDisplay' style='display: none;'/><input id='addOutputMeasure' style='display: none;'/>
				    <select  id="outputParameterID" name="outputParameterID" style="width:200px;height:auto;margin-left:50px;">  
				    
				    </select>  
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  				   
					<button type="submit" class="btn btn-primary"  >添加</button>
				   	<!--  <span id="measureSymbol" name="measureSymbol"></span>--> 
				  </div>
				 </form> 
				 <hr size=1 style="COLOR:#ff9999;border-style:double;width:550"> 
				 <!-- <div class="modal-header"> -->		        	
		        	<h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看输出</h4>
		      	<!-- </div> -->
		      	 <hr size=1 style="COLOR:#ff9999;border-style:double;width:550"> 
				<ul id="ItemOutputList"  data-role="list" style="margin-bottom:10px;"></ul>
		      	<!-- 
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
				 -->
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
									类名
								</dt>
								<dd id="AlgClassName">
									
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
		
		
		
		
		 <!-- 查看输出图参数的模态框 -->   	
		<div class="modal fade" id="listGraphi_modal"  >
		  <div class="modal-dialog">
		    <div class="modal-content" style="width: 870px;">		      
		      <div class="modal-body" >  
		      	<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<table id="GraphiList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
						      			<div id="GraphiPager" ></div>
						      		</div>	
						</div>
					</div>
				</div>				  
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- /.添加新的图形输出参数 -->
		<div id="addnewGraphiModal" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title">添加新图表</h4>
		      </div>
		      <div class="modal-body">
		      	<form id="addGraphiForm" action="addGraphi.action" method="post"> 
			        <p> 
			        <!-- 上传文件选择 -->
			        	 图名称：<input type="text" name="graphiName" id='graphiName'/><em style="color:red">*</em><br> <br> 
			        	  图类型：  	<select id="graphiType" name="graphiType">
  								<option value ="0" SELECTED>线形图</option>
  								<option value ="1">饼图</option>
  								<option value="2">柱状图</option>
  								<option value="3">其他</option>
								</select>
   						<em style="color:red">*</em><br> <br> 
   					
			        </p>  		 
			 		
			      <div class="modal-footer">
			       	<button type="submit" class="btn btn-primary">保存 &nbsp;</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        </div>
		      	</form>
		       </div>
		       
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		
		
				 <!-- 查看输出图详细参数的模态框 -->   	
		<div class="modal fade" id="listGraphiDetail_modal"  >
		  <div class="modal-dialog">
		    <div class="modal-content" style="width: 870px;">		      
		      <div class="modal-body" >  
		      	<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<table id="GraphiDetailList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
						      			<div id="GraphiDetailPager" ></div>
						      		</div>	
						</div>
					</div>
				</div>				  
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- /.添加新的图形输出参数 -->
		<div id="addnewGraphiDetailModal0" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title">线形图参数设置(只能添加列表参数)</h4>
		      </div>
		      <div class="modal-body">
		      	<form id="addGraphiDetailForm" action="addGraphiDetail.action" method="post"> 
			       <div class="centent"> 
		      	  	<input id="algID" style="display: none;"/> 
		      	  	 参数选择：
				    <select  id="addParameterDetailID" name="addParameterDetailID" style="width:200px;height:auto;">  
				    
				    </select>  
				    <em style="color:red">*</em><br> <br> 
				   				   
				   	坐标轴：<select name="info1" id="info1">
  								<option value ="X" SELECTED>X轴</option>
  								<option value ="Y">Y轴</option>
								</select>
								
								<em style="color:red">*</em><br> <br>;
				   	
				   		
				  </div> 
			 		
			      <div class="modal-footer">
			       	<button type="submit" class="btn btn-primary">保存 &nbsp;</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        </div>
		      	</form>
		       </div>
		       
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		
		<!-- /.添加新的图形输出参数 -->
		<div id="addnewGraphiDetailModal1" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title">饼图参数设置(只能添加单值参数)</h4>
		      </div>
		      <div class="modal-body">
		      	<form id="addGraphiDetailForm1" action="addGraphiDetail.action" method="post"> 
			       <div class="centent"> 
		      	  	<input id="algID" style="display: none;"/> 
		      	  	 参数选择：
				    <select  id="addParameterDetailID1" name="addParameterDetailID1" style="width:200px;height:auto;">  
				    
				    </select>  
				    
				    <em style="color:red">*</em><br> <br> 
				   				
				   	
				   		
				  </div> 
			 		
			      <div class="modal-footer">
			       	<button type="submit" class="btn btn-primary">保存 &nbsp;</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        </div>
		      	</form>
		       </div>
		       
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		
		<!-- /.添加新的图形输出参数 -->
		<div id="addnewGraphiDetailModal2" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title">柱状图参数设置(只能添加列表参数)</h4>
		      </div>
		      <div class="modal-body">
		      	<form id="addGraphiDetailForm2" action="addGraphiDetail.action" method="post"> 
			       <div class="centent"> 
		      	  	<input id="algID" style="display: none;"/> 
		      	  	 参数选择：
				    <select  id="addParameterDetailID2" name="addParameterDetailID2" style="width:200px;height:auto;">  
				    
				    </select>  
				    <em style="color:red">*</em><br> <br> 
				   坐标轴：<select name="info2_1" id="info2_1">
  								<option value ="X" SELECTED>X轴</option>
  								<option value ="Y">Y轴</option>
								</select>
								
								<em style="color:red">*</em><br> <br>;	   
				   		
				  </div> 
			 		
			      <div class="modal-footer">
			       	<button type="submit" class="btn btn-primary">保存 &nbsp;</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        </div>
		      	</form>
		       </div>
		       
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
  </body>
  
</html>




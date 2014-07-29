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
//if (userlogin==null){
//response.sendRedirect("login.jsp");
//return;
//}
//else{

//}
%> 

    <base href="<%=basePath%>">
    
    <title>工程管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="工程管理">
	
	
	<!-- Bootstrap -->
   
	<!--  <link rel="stylesheet" href="css/justified-nav.css">
	-->
	<link rel="stylesheet" href="js/upload/uploadify.css">
	 
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	 
	
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/overcast/jquery.ui.theme.css" />  
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />
	 
	 
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
	 <link rel="stylesheet" href="css/docs-5892f62386325d472ddefdaec9d29018.css"> 
	 <link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
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
	<script src="js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
	<script src="js/easytabs/jquery.ba-hashchange.js" type="text/javascript"></script>
	<script src="js/easytabs/jquery.easing.1.3.js" type="text/javascript"></script>
	
	<script src="js/easytabs/jquery.easytabs.js" type="text/javascript"></script>
	<script src="js/easytabs/jquery.raptorize.1.0.js" type="text/javascript"></script>
	
	<!-- 自定义 -->
	<script src="js/global.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

	<script type="text/javascript" src="js/project.js"></script>


  </head>
  
  <body style="background-color:#CCCCCC;">
 
	 	<div id="head">
		   <%@ include file="commons/header.jsp" %>
		</div>  
    	 <!-- Marketing messaging and featurettes
	    ================================================== -->
	    <!-- Wrap the rest of the page in another container to center all the content. -->
	    
		<div class="container marketing condiv" style="width:1200px;">
	    	
	    	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
						<div class="tabbable" id="tabs-360872">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#panel-1" data-toggle="tab" style="font-size:12px;font-weight:bold;font-family:黑体">工程管理</a>
								</li>							
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-1">		
									<table id="ProjectList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230" >
						      			<div id="ProjectPager" ></div>
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
	    
	     <!-- 查看计算历史的输入输出的模态框 -->   	
		<div class="modal fade" id="view_input_output_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看历史输入输出</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="viewHisInputOutputForm"> 
		     	  <h5 class="modal-title" style="font-weight:bold;font-family:幼圆">输入:</h5>
		     	   	<dd>
						<table id="hisInputTable" class="table" >
							<thead>
								<tr>
									<th>
										编号
									</th>
									<th>
										参数名
									</th>
									<th>
										值
									</th>
									<th>
										符号
									</th>
								</tr>
							</thead>
							<tbody>
								<tr id="hisInputTr">
									<td id="hisInputID">											
									</td>
									<td id="hisInputName">											
									</td>
									<td id="hisInputValue">
									</td>
									<td id="hisInputSymbol">											
									</td>						
								</tr>									
							</tbody>
						</table>	
					</dd>		
					<h5 class="modal-title" style="font-weight:bold;font-family:幼圆">输出:</h5>	
					<dd>
						<table id="hisOutputTable" class="table" >
							<thead>
								<tr>
									<th>
										编号
									</th>
									<th>
										参数名
									</th>
									<th>
										值
									</th>
									<th>
										符号
									</th>
								</tr>
							</thead>
							<tbody>
								<tr id="hisOutputTr">
									<td id="hisOutputID">											
									</td>
									<td id="hisOutputName">											
									</td>
									<td id="hisOutputValue">
									</td>
									<td id="hisOutputSymbol">											
									</td>						
								</tr>									
							</tbody>
						</table>	
					</dd>						
									
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>				        
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
	    
	   	 <!-- 查看运行历史的模态框 -->   	
		<div class="modal fade" id="view_calchistory_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看运行历史</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="viewCalcHistoryForm"> 
		     	   
					<dd>
						<table id="calcHistoryTable" class="table" >
							<thead>
								<tr>
									<th>
										编号
									</th>
									<th>
										算法名
									</th>
									<th>
										计算结果
									</th>
									<th>
										开始运行时间
									</th>
									<th>
										结束运行时间
									</th>			
									<th>
										查看输入输出
									</th>						
								</tr>
							</thead>
							<tbody>
								<tr id="historyTr">
									<td id="historyID">											
									</td>
									<td id="historyAlgName">											
									</td>
									<td id="historyValue">
									</td>
									<td id="historyStartTime">											
									</td>	
									<td id="historyEndTime">											
									</td>		
									<td>
										<a href="javascript:void(0)"  style="color:#798991" onclick="viewHisInputOutput(this)">查看输入输出</a>
									</td>			
								</tr>									
							</tbody>
						</table>	
					</dd>							
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>				    
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
	   <!-- 查看输出的模态框 -->   	
		<div class="modal fade" id="view_output_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">查看输出</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="viewOutputForm"> 
		     	   
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
										值
									</th>
									<th>
										符号
									</th>
								</tr>
							</thead>
							<tbody>
								<tr id="outputTr">
									<td id="outputID">											
									</td>
									<td id="outputName">											
									</td>
									<td id="outputValue">
									</td>
									<td id="outputSymbol">											
									</td>						
								</tr>									
							</tbody>
						</table>	
					</dd>							
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- 查看选择算法的模态框 -->   	
		<div class="modal fade" id="select_algorithm_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		         <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">选择算法</h4>
		      </div>
		      <div class="modal-body">  
		      	<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							 <form id="selectAlgorithmForm"  > 		 
					      	  <div class="centent"> 
					      	  	<input id="proID2" style="display: none;"/> 
					      	  	
							    <select  id="algorithmID" name="algorithmID" style="width:200px;height:auto;margin-left:50px;">  
							    
							    </select>  
							    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  							
							    <button type="submit" class="btn btn-primary"  >保存</button>
							   	<!--  <span id="measureSymbol" name="measureSymbol"></span>--> 
							  </div>
							 </form> 
				 			 <hr size=1 style="COLOR:#ff9999;border-style:double;width:550"> 
							 <!-- <div class="modal-header"> -->		        	
					        	<h4 class="modal-title" style="font-weight:bold;font-family:幼圆">当前算法明细</h4>
					      	<!-- </div> -->
					      	 <hr size=1 style="COLOR:#ff9999;border-style:double;width:550"> 
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
											<tr id="inputTr">
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
									<table id="algOutputTable" class="table" >
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
											<tr id="algOutputTr">
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
		
	   
	   	<!-- 添加工程的模态框 -->   	
		<div class="modal fade" id="add_project_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加工程</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addProjectForm" action="addAlgPro.action" method="post"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table">
		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >名称:</label></td>
				            <td><input id="name" type="text" class="input2" name="name" maxlength="30"/><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >描述：</label></td>
		      				<td><input id="Description" type="text" class="input2" name="Description" maxlength="10" /><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">作者：</label></td>
		      				<td>		      					 
					        	<select id="authorID" name=authorID>		                  
			              		</select>
		 						<em style="color:red">*</em>    						
		      				</td>
		      			</tr>		    				
				   </table>
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >保存</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
   
				
    		<!-- 设置输入参数的模态框 -->   	
		<div class="modal fade" id="setProjectInput_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加输入</h4>
		      </div>
		      <div class="modal-body">  
		      	 <!-- 添加输入参数 -->	  
		     	 <form id="addProInputForm"  > 		 
		      	  <div class="centent"> 
		      	  	<input id="proID" style="display: none;"/> 
		      	  	<input id='addInputDisplay' style='display: none;'/><input id='addInputMeasure' style='display: none;'/>
				    <select  id="addParameterID" name="addParameterID" style="width:200px;height:auto;margin-left:50px;">  
				    
				    </select>  
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				    <input id="addInputValue" name="addInputValue" />&nbsp;&nbsp; 
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
				
			
				 <div class="modal-footer">
				      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>					      			       
				 </div>
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
			
					
    	
		<script type="text/javascript">
	/* 		$(function(){
				$('#tab-side-container').easytabs({
					  animate: false,
					  tabActiveClass: "selected-tab",
					  panelActiveClass: "displayed"
					});
			}); */
		</script>
  </body>
</html>


				


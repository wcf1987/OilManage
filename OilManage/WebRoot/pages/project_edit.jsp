<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%

String backurl=request.getParameter("backurl");
String projectID=request.getParameter("projectID");
String projectName=request.getParameter("projectName");
%> 

    <base href="<%=basePath%>">
    
    <title>工程管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="工程管理">
	
	
	<!-- Bootstrap -->
   
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

	<script type="text/javascript" src="js/project_edit.js"></script>


  </head>
  
  <body style="background-color:#CCCCCC;">
 
	 	<div id="head">
		   <%@ include file="commons/header.jsp" %>
		</div>  
    	 <!-- Marketing messaging and featurettes
	    ================================================== -->
	    <!-- Wrap the rest of the page in another container to center all the content. -->
	    
		<div class="container marketing condiv" style="width:1200px;">
			<div style="font-size:20px;color:#02A0CC;margin-bottom:15px;margin-left:15px;">工程配置</div>
	    	<div style="margin-right:15px;margin-top:-25px;float:right">
			<a href=<%out.print(backurl);%> style="font-size:15px;font-weight:bold;font-family:黑体">返回</a>
			</div>
	    	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
						<div>
							<div>							
								<div>							
									<div style="width:100%;height:100%;background-color:#DDDDDD">
										<ul id="alglist" style="background:#F1EAEA;height:auto;width:200px;float:left;">
									 	</ul>							
									 	<!-- <div class="panel-container"  >	 -->						
									 		<div id="loadAlgDiv" style="margin-top:20px;float:left;display:none">
									 			<input id="proID" style="display:none;" value="<%out.print(projectID);%>"/>
										 		<dl class="dl-horizontal"><dt>工程名</dt><dd><%out.print(projectName);%></dd></dl>
										 		<hr size=1 style="COLOR:#ff9999;border-style:double;width:490">
										 		<dl class="dl-horizontal">
													<!-- <dt>编号</dt><dd id="proAlgID" ></dd> -->
													<dt>名称</dt><dd id="proAlgName"></dd>			
													<dt>描述</dt><dd id="proAlgDes"></dd>
													<dt>添加时间</dt><dd id="proAlgAddDate">	</dd>
													<dt>最后更新时间</dt><dd id="proAlgLastUpdateDate"></dd>
													<dt>作者</dt><dd id="proAlgAuthor"></dd>
												</dl>				
												<hr size=1 style="COLOR:#ff9999;border-style:double;width:490">																 
												<dl class="dl-horizontal">
													<dt>输入参数</dt>
													<dd>
														<table id="proinputTable" class="table" >
															<thead>
																<tr>
																	<th style="display:none">参数编号</th>
																	<th>参数名</th>
																	<th>值</th>
																	<th>符号</th>
																</tr>
															</thead>
															<tbody>
																<tr id="proinputTr">
																	<td style="display:none"></td>							
																	<td></td>
																	<td></td>
																	<td></td>						
																</tr>									
															</tbody>
														</table>	
													</dd>
													</dl>
													
													<hr size=1 style="COLOR:#ff9999;border-style:double;width:490">
													<dl class="dl-horizontal">
														<dd>
														 	<div class="span3" style="width:100px;margin-left:5px;float:right">
													      	<a href="javascript:void(0)" onclick="viewOutput()" class="btn btn-large btn-block btn-success">查看输出</a>
													     	</div>
														 	<div class="span3" style="width:100px;margin-left:5px;float:right">
													      	<a href="javascript:void(0)" onclick="runAlg()" class="btn btn-large btn-block btn-danger">运行</a>
													    	</div> 
															<div class="span3" style="width:100px;float:right">
													      	<a href=" javascript:void(0)" onclick="saveProjectInput();" class="btn btn-large btn-block btn-primary">保存</a>
															</div>
														</dd>
										
													</dl>
										 			<hr size=1 style="COLOR:#ff9999;border-style:double;width:490">
													<dl id="viewOutputDl" class="dl-horizontal"  style="display:none">
													<dt>输出</dt>	
													<dd>
														<table id="outputTable" class="table" >
															<thead>
																<tr>
																	<th style="display:none">
																		编号
																	</th>
																	<th>
																		参数名
																	</th>
																	<th>值</th>
																	<th>
																		符号
																	</th>
																</tr>
															</thead>
															<tbody>
																<tr id="outputTr">															
																	<td id="outputID" style="display:none">											
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
												</dl>		
											</div>
															 													     		
								</div>						
							</div>
						</div>
						
						
						      						
					</div>
				</div>
			</div>
	    </div><!-- /.container -->
	    <hr class="featurette-divider">
      	<div id="footer">
	        <%@ include file="commons/footer.jsp" %>
	    </div>
	    
	   
	 
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
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->	
					
  </body>
</html>


				


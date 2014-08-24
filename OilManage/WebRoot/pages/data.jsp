<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <base href="<%=basePath%>">
    
    <title>数据管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="数据管理">
	
	
	<!-- Bootstrap -->
   
	<!--  <link rel="stylesheet" href="css/justified-nav.css">
	-->
	<link rel="stylesheet" href="js/upload/uploadify.css">
	 
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	 
	
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	 <!-- <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/vder/jquery.ui.theme.css" />   -->
	 <!-- <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" /> -->
	 
	 
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
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4bfe7b8632739c89a1b8e95529da1d97"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
	<script type="text/javascript" src="js/data_manage.js"></script>

<script>
$(document).ready(function(){
	
	$("#addPhysicalForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout:false,
		onkeyup:true,
		rules:{
			CName:{
				required:true
			},
			EName:{
				required:true
			},
			ISOBasicUnit:{
				required:true
			}	
		},
		messages:{
			CName:{
			required:"物理量中文名称不能为空！",
		
			},
			EName:{
			required:"物理量英文名称不能为空！",
			},
			ISOBasicUnit:{
			required:"ISO基本单位不能为空！"
			}
		},
		submitHandler:function(){
			add_physical();
		}
	});
	
	loadPhysicalStyleOptions();
	loadPhysicalOptions();
	$("#addMeasureForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout:false,
		onkeyup:true,
		rules:{
			MCName:{
				required:true
			},
			MEName:{
				required:true
			},
			PhysicalID:{
				required:true
			},
			StyleID:{
				required:true
			},
			Symbol:{
				required:true
			},
			RatioA:{
				number:true,
				required:true
			},
			RatioB:{
				number:true,
				required:true
			}
		},
		messages:{
			MCName:{
			required:"物理单位中文名称不能为空！",
			},
			MEName:{
			required:"物理单位英文名称不能为空！",
			},
			PhysicalID:{
				required:"请选择物理量！"
			},
			StyleID:{
				required:"请选择单位体系！"
			},
			Symbol:{
				required:"符号不能为空！"
			},
			RatioA:{
				number:"输入必须为数字!",
				required:"转换率A不能为空!"
			},
			RatioB:{
				number:"输入必须为数字!",
				required:"转换率B不能为空！"
			}
		},
		submitHandler:function(){
			add_measure();
		}
	});
	loadMeasureOptions();
	
	
	
});//ready 结束


</script>


  </head>
     
  <body>
 
 	
		<div>
		    <%@ include file="commons/header_admin.jsp" %>
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
									<a href="#panel-1" data-toggle="tab" class="tab-a">物理量管理</a>
								</li>
								<li>
									<a href="#panel-2" data-toggle="tab" class="tab-a">物理单位管理</a>
								</li>
								<li>
									<a href="#panel-3" data-toggle="tab" class="tab-a">参数管理</a>
								</li>
								<li>
									<a href="#panel-4" data-toggle="tab" class="tab-a">控件图标管理</a>
								</li>
								<li>
									<a href="#panel-5" data-toggle="tab" class="tab-a">控件参数管理</a>
								</li>
								
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-1">		
									<table id="PhysicalList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div>
						      			<div id="PhysicalPager" ></div>
						      		</div>	      		
								</div>
								<div class="tab-pane" id="panel-2">							
									<!-- 表格 -->
						      		<table id="MeasureList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div id="MeasurePager" ></div>      		
								</div>
								<div class="tab-pane" id="panel-3">							
									<table id="ParameterList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div id="ParameterPager" ></div>
								</div>
								<div class="tab-pane" id="panel-4">							
									<table id="GuiPointTypeList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div id="GuiPointTypePager" ></div>
								</div>
								<div class="tab-pane" id="panel-5">							
									<table id="GuiPointProperList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div id="GuiPointProperPager" ></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
	    </div><!-- /.container -->
	   <!--  <hr class="featurette-divider"> -->
      	<div id="footer">
	        <%@ include file="commons/footer.jsp" %>
	    </div>
	   
		
    		<!-- 添加物理量的模态框 -->   	
		<div class="modal fade" id="add_physical_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加物理量</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addPhysicalForm" action="addPhysical.action" method="post"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table">
		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >物理量名称：</label></td>
				            <td><input id="CName" type="text" class="input2" name="CName" maxlength="30" /><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >英文名称：</label></td>
		      				<td><input id="EName" type="text" class="input2" name="EName" maxlength="10"/><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">描述：</label></td>
		      				<td><input id="Description" type="text" class="input2" style="width:100px" name="Description" maxlength="30" /></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">ISO基本单位</label></td>
		      				<td><input id="ISOBasicUnit" type="text" class="input2" style="width:100px" name="ISOBasicUnit" maxlength="30" /><em style="color:red">*</em></td>
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
		
				
    		<!-- 添加单位的模态框 -->   	
		<div class="modal fade" id="add_measure_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加物理单位</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addMeasureForm" action="addMeasure.action" method="post"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table">
		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >中文名称：</label></td>
				            <td><input id="MCName" type="text" class="input2" name="MCName" maxlength="30"/><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >英文名称：</label></td>
		      				<td><input id="MEName" type="text" class="input2" name="MEName" maxlength="10" /><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">符号：</label></td>
		      				<td><input id="Symbol" type="text" class="input2" style="width:100px" name="Symbol " maxlength="30" /></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">物理量</label></td>
		      				<td>
		      				<select id="PhysicalID" name="PhysicalID">		                  
			                </select>
		      				<em style="color:red">*</em>
		      				</td>
		      			</tr>	
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">单位体系</label></td>
		      				<td>
		      				<select id="StyleID" name="StyleID">
		      				</select>
		      				<em style="color:red">*</em>
		      				</td>
		      			</tr>	
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">转换率A</label></td>
		      				<td><input id="RatioA" type="text" class="input2" style="width:100px" name="RatioA" maxlength="30" /><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">转换率B</label></td>
		      				<td><input id="RatioB" type="text" class="input2" style="width:100px" name="RatioB" maxlength="30" /><em style="color:red">*</em></td>
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
    
    	
   				
				
    		<!-- 添加参数的模态框 -->   	
		<div class="modal fade" id="add_parameter_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加参数</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addParameterForm" action="addParameter.action" method="post"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table">
		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >名称：(英文)</label></td>
				            <td><input id="name" type="text" class="input2" name="name" maxlength="30"/><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >显示：(中文)</label></td>
		      				<td><input id="display" type="text" class="input2" name="display" maxlength="10" /><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">物理单位：</label></td>
		      				<td>
      							<select id="measureID" name="measureID">		                  
			                	</select>
		      					<em style="color:red">*</em>
		      				</td>
		      			</tr>		 
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">参数类型：</label></td>
		      				<td>
      							<select id="type" name="type">
      							 <option value ="0" SELECTED>单值</option>
  								 <option value ="1">列表</option>		                  
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
	
				
    		<!-- 添加控件属性的模态框 -->   	
		<div class="modal fade" id="add_PointProper_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加控件属性</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addPointProperForm" action="addPointProper.action" method="post"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table">
		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >控件类型名称：</label></td>				         
				           	<td>
				           	<select id="pointTypeID" name="pointTypeID">		                  
			                	</select>
		      					<em style="color:red">*</em>
				           </td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">参数：</label></td>
		      				<td>
      							<select id="parID" name="parID">		                  
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
	
		
		<!-- 添加控件图标的模态框 -->   	
		<div class="modal fade" id="add_PointType_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加控件图标</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addPointTypeForm" action="addPointType.action" method="post"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table">
		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >控件类型名称：</label></td>				         
				           	<td>
				           	<input id="type_name" name="type_name"/>		                  			                
		      					<em style="color:red">*</em>		      				
				           </td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">备注：</label></td>
		      				<td>
      							<input id="type_remark" name="type_remark"/>		                 		      
		      				</td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">上传图片：</label></td>
		      				<td  style="padding-top:5px;">
      							<input type="file" name="iconfile" id="iconfile" />
      							<div id="file_uploadQueue" class="uploadifyQueue"></div>
      							<!-- <a href="javascript:$('#iconfile').uploadify('upload');" >upload</a> -->
		      				</td>
		      			</tr>	
				   </table>
				   <span id="type_icon_path" name="type_icon_path"></span>  
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >保存</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	
  </body>
  
</html>




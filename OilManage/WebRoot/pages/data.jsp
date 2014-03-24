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
	$("#addParameterForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout:false,
		onkeyup:true,
		rules:{
			name:{
				required:true
			},
			display:{
				required:true
			},
			measureID:{
				required:true
			}
		},
		messages:{
			name:{
			required:"名称不能为空！",
			},
			display:{
			required:"中文名称不能为空！",
			},
			measureID:{
				required:"请选择单位！"
			}
		},
		submitHandler:function(){
			add_parameter();
		}
	});
	
	
});//ready 结束

function add_physical() {
	$.ajax({
		type : 'POST',
		url : 'addPhysical.action',
		data : {
			CName:$("#CName").val(),
			EName:$("#EName").val(),
			Description:$("#Description").val(),
			ISOBasicUnit:$("#ISOBasicUnit").val()
		},
		dataType:'json',
		complete : function(msg) {
			alert("添加成功！");
			$('#add_physical_modal').modal('hide');
			$("#PhysicalList").trigger("reloadGrid");
		},
		error:function(msg){
			alert("添加失败！");
			alter(msg);
			$('#add_physical_modal').modal('hide');
			$("#PhysicalList").trigger("reloadGrid");
		}
	});
	}

function add_measure() {

	$.ajax({
		type : 'POST',
		url : 'addMeasure.action',
		data : {
			mCName:$("#MCName").val(),
			mEName:$("#MEName").val(),
			Symbol:$("#Symbol").val(),
			RatioA:$("#RatioA").val(),
			RatioB:$("#RatioB").val(),
			PhysicalID:$("#PhysicalID").val(),
			StyleID:$("#StyleID").val()
		},
		dataType:'json',
		success : function(msg) {
			alert("添加成功！");
			$('#add_measure_modal').modal('hide');
			$("#MeasureList").trigger("reloadGrid");
		},
		error:function(msg){
			alter(msg);
			$('#add_measure_modal').modal('hide');
			$("#MeasureList").trigger("reloadGrid");
		}
	});
	}

function add_parameter() {

	$.ajax({
		type : 'POST',
		url : 'addParameter.action',
		data : {
			name:$("#name").val(),
			display:$("#display").val(),
			measureID:$("#measureID").val()
		},
		dataType:'json',
		success : function(msg) {
			alert("添加成功！");
			$('#add_parameter_modal').modal('hide');
			$("#ParameterList").trigger("reloadGrid");
		},
		error:function(msg){
			alter(msg);
			$('#add_measure_modal').modal('hide');
			$("#ParameterList").trigger("reloadGrid");
		}
	});
	}
	
function loadPhysicalOptions(){
	$.ajax({
		url:'listPhysical.action',
		type:'post',
		data : {
			sidx: 'id',
			sord: "desc"
		},
		dataType:'json',
		success:function(data){
		//alert(data.dataList[0].CName);
			var items="";
			$.each(data.dataList,function(i,physical){
				items+= "<option value=\"" + physical.ID + "\">" + physical.CName + "</option>"; 
			});
			$("#PhysicalID").html(items);
		}
	});
	}

function loadPhysicalStyleOptions(){
	$.ajax({
		url:'listPhysicalStyle.action',
		type:'post',
		dataType:'json',
		success:function(data){
		//alert(data.dataList[0].CName);
			var items="";
			$.each(data.styleList,function(i,style){
				items+= "<option value=\"" + style.ID + "\">" + style.styleName + "</option>"; 
			});
			$("#StyleID").html(items);
		}
	});
	}

	
function loadMeasureOptions(){
	$.ajax({
		url:'listMeasure.action',
		type:'post',
		data : {
			sidx: 'mid',
			sord: "desc"
		},
		dataType:'json',
		success:function(data){
		//alert(data.dataList[0].CName);
			var items="";
			$.each(data.dataList,function(i,measure){
				items+= "<option value=\"" + measure.ID + "\">" + measure.CName + "</option>"; 
			});
			$("#measureID").html(items);
		}
	});
	}
</script>


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
	                <li class="active"><a href="pages/data.jsp">数据管理</a></li>
	                <li><a href="pages/algorithm.jsp">算法管理</a></li>
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
									<a href="#panel-1" data-toggle="tab" style="font-size:12px;font-weight:bold;font-family:黑体">物理量管理</a>
								</li>
								<li>
									<a href="#panel-2" data-toggle="tab" style="font-size:12px;font-weight:bold;font-family:黑体">物理单位管理</a>
								</li>
								<li>
									<a href="#panel-3" data-toggle="tab" style="font-size:12px;font-weight:bold;font-family:黑体">参数管理</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-1">		
									<table id="PhysicalList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230" >
						      			<div id="PhysicalPager" ></div>
						      		</div>	      		
								</div>
								<div class="tab-pane" id="panel-2">							
									<!-- 表格 -->
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
		      				<td><input id="Symbol " type="text" class="input2" style="width:100px" name="Symbol " maxlength="30" /></td>
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
	
	
  </body>
  
</html>



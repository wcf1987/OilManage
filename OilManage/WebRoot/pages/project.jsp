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

	<script type="text/javascript" src="js/project.js"></script>

<script>
$(document).ready(function(){


        
	loadAuthorOptions();//加载作者选项
	$("#addProjectForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout:false,
		onkeyup:true,
		rules:{
			name:{
				required:true
			},
			authorID:{
				required:true
			}
		},
		messages:{
			name:{
				required:"名称不能为空！"
			},
			authorID:{
				required:"请选择作者！"
			}
		},
		submitHandler:function(){
			add_project();
		}
	});
	
		
	$("#addProInputForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout:false,
		onkeyup:true,
		rules:{
			addParameterID:{
				required:true
			},
			addInputValue:{
				required:true
			}
		},
		messages:{
			addParameterID:{
				required:"请选择输入参数！"
			},
			addInputValue:{
				required:"参数值不能为空！"
			}
		},
		submitHandler:function(){
			add_proInput();
		}
	});
	
	$("#modifyProInputForm").validate({
		debug:true,
		onsubmit:true,
		onfocusout:false,
		onkeyup:true,
		rules:{
			modifyInputID:{
				required:true
			},
			modifyInputValue:{
				required:true
			}
		},
		messages:{
			modifyInputID:{
				required:"请选择输入参数！"
			},
			modifyInputValue:{
				required:"参数值不能为空！"
			}
		},
		submitHandler:function(){
			modify_proInput();
		}
	});
	
	$('.valuechange').change(function() {
		alert("test");
		value=$(this).val();
		ID=$(this).siblings('input').val();
		alert(value+ID);
		$.ajax({
			type : 'POST',
			url : 'updateProInputs.action',
			data : {
				value:value,
				ID:ID
			},
			success : function(data) {
				alert('参数保存成功!');
		
				//$('#addAlgorithmInput_modal').modal('hide');
				//$("#AlgorithmInputList").trigger("reloadGrid");			
			},
			error:function(msg){
				alert(msg);
				//$('#addAlgorithmInput_modal').modal('hide');
				//$("#AlgorithmList").trigger("reloadGrid");
			}
		});
	});
	
});//ready 结束

function add_project() {

	$.ajax({
		type : 'POST',
		url : 'addAlgPro.action',
		data : {
			name:$("#name").val(),
			Description : $("#Description").val(),
			authorID:$("#authorID").val()
		},
		success : function(data) {
			alert('工程添加成功！');
			$('#add_project_modal').modal('hide');
			$("#ProjectList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter(msg);
			$('#add_project_modal').modal('hide');
			$("#ProjectList").trigger("reloadGrid");
		}
	});
	}

function add_proInput() {
	$.ajax({
		type : 'POST',
		url : 'addProInputs.action',
		data : {
			pro_id:$("#proID").val(),
			param_id:$("#addParameterID").val(),
			value:$("#addInputValue").val()
		},
		success : function(data) {
			alert('参数保存成功!');
			items="<li><div class='control'><label class='control-label'>"+data.param.display+"</label>&nbsp;&nbsp;<input  style='width:60px;vertical-align:middle;' class='text-center,valuechange' name='modifyInputValue' value="+data.value+" '/><input style='display:none;' value="+data.ID+"'/> &nbsp;&nbsp;<span>"+data.param.measureSymbol+"</span><button type='button' onclick='deleteInputItem(this,"+data.ID+");' title='删除'>×</button></div></li>";
			$("#ItemInputList").append(items);
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmInputList").trigger("reloadGrid");			
		},
		error:function(msg){
			alert(msg);
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmList").trigger("reloadGrid");
		}
	});
	}
	
function modify_proInput() {
	$.ajax({
		type : 'POST',
		url : 'updateProInputs.action',
		data : {
			ID:$("#modifyInputID").val(),			
			value:$("#modifyInputValue").val()
		},
		success : function(data) {
			alert('参数保存成功!');
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmInputList").trigger("reloadGrid");			
		},
		error:function(msg){
			alter(msg);
			//$('#addAlgorithmInput_modal').modal('hide');
			//$("#AlgorithmList").trigger("reloadGrid");
		}
	});
	}
function showValue(inputID){
	$.ajax({
		url:'searchProInputs.action',
		type:'post',
		dataType:'json',
		data : {
			ID:inputID,		
		},
		success:function(data){
			$("#modifyInputValue").val(data.input.value);
		}
	});
	}	
function loadAuthorOptions(){
	$.ajax({
		url:'listUser.action',
		type:'post',
		dataType:'json',
		success:function(data){
			var items="";
			$.each(data.dataList,function(i,user){
				items+= "<option value=\"" + user.userid + "\">" + user.username + "</option>"; 
			});
			$("#authorID").html(items);
		}
	});
	}

function addInputItem(obj){   
       $("#ItemInputList").append("<li class='list-group-item clearfix'><span class='glyphicon glyphicon-resize-vertical sort-handle'></span>"+obj+"<input type='hidden' name='goals' value='"+obj+"'><button type='button' class='close delete-btn deleteItem' onclick='deleteCourseItem(this);' title='删除'>×</button></li>");   
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
	              <a class="navbar-brand" href="#"><div style="font-color:#99CCFF;font-weight:bold;font-family:Georgia, serif;">煤层气集输系统</div></a>
	            </div>
	            <div class="navbar-collapse collapse">
	              <ul class="nav navbar-nav">
	                <li><a href="pages/home.jsp">首页</a></li>
	                <li><a href="pages/map.jsp">地图建模</a></li>
	                <li  class="active"><a href="pages/project.jsp">工程管理</a></li>
	                <li><a href="#contact">系统模拟</a></li>
	                <li><a href="pages/home.jsp">系统优化</a></li>
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
	                
	               	<%if (userlogin!=null) {%>
			      <div class="text-center" style="margin-top:8px;margin-right:25px;" id="userId">
			      	<div style="margin-left:5px;margin-top:5px;"><a  style="margin-left:5px;margin-top:5px;float:right"id="exit" onclick="logout()">注销</a></div>	     
			        <div style="font-size:20;color:#FFFFFF;float:right">您好,<a href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%></a></div>
			      </div>
			       <%}else{ %>
		        	 <div class="text-center" style="margin-top:8px;"><a  class="btn btn-default" href="pages/login.jsp">管理员登陆</a></div>
	            	<%} %>
			      	
			      
			     
			  
	              
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
			</div>

	      	<hr class="featurette-divider">

	
	      	<!-- FOOTER -->
	      	<div class="footer">
	        	<p>&copy; 2013 中国石油大学</p>
	      	</div>
	
	    </div><!-- /.container -->
	    
	   
	   
	   
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
   
				
    		<!-- 选择输入参数的模态框 -->   	
		<div class="modal fade" id="addProjectInput_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加输入</h4>
		      </div>
		      <div class="modal-body">  	  
		     	 <form id="addProInputForm" action="addProInputs.action" method="post"> 		 
		      	  <div class="centent"> 
		      	  	<input id="proID" style="display: none;"/> 
		      	  	<input id='addInputDisplay' style='display: none;''/><input id='addInputMeasure' style='display: none;''/>
				    <select  id="addParameterID" name="addParameterID" style="width:200px;height:auto;margin-left:50px;">  
				    
				    </select>  
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				    <input id="addInputValue" name="addInputValue" />
				     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				    <button type="submit" class="btn btn-primary"  >保存</button>
				   	<!--  <span id="measureSymbol" name="measureSymbol"></span>--> 
				  </div>  
			
				   <div class="modal-footer"></div>
				 </form> 
				 
				<ul id="ItemInputList"  data-role="list" style="margin-bottom:10px;"></ul>
				
			
				 <div class="modal-footer">
				      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>				       
				 </div>
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- 修改输入参数的模态框 -->   	
		<div class="modal fade" id="modifyProjectInput_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">修改输入</h4>
		      </div>
		      <div class="modal-body">  	  
		     	 <form id="modifyProInputForm" action="updateProInputs.action" method="post"> 		 
		      	  <div class="centent"> 
		      	  	<input id="proID2" style="display: none;"/> 
				    <select  id="modifyInputID" name="modifyInputID" onchange=showValue(this.value) style="width:200px;height:auto;margin-left:50px;">  
				    
				    </select>  
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				    <input id="modifyInputValue" name="modifyInputValue" />
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
		
  </body>
  
</html>




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
    
    <title>系统管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="系统管理">
	
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="js/upload/uploadify.css">
	 
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" />
	 
	
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" />
	 <link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />  
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	 <link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
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
	<script src="js/admin.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

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
	                <li ><a href="pages/algorithm.jsp">算法管理</a></li>
	                <li class="active"><a href="#">系统管理</a></li>
			        <li><a href="pages/home.jsp">关于</a></li>
			        <li><a href="pages/home.jsp">联系方式</a></li>
	              </ul>
	                
	               
			      <div class="text-center" style="margin-top:8px;margin-right:25px;" id="userId">
			      	<div style="margin-left:5px;margin-top:5px;"><a  style="margin-left:5px;margin-top:5px;float:right"id="exit" onclick="logout()">注销</a></div>
			        <div style="font-size:20;color:#FFFFFF;float:right">您好,<a href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%>！</a></div>
			       
			        	
			      	
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
	    
		<div class="container marketing content" style="width:1200px;">
	    	
	    <!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
				
										
					</div>
				</div>
			</div> -->
			
			<div class="row">
			  <div class="col-md-3 secondary-nav collapse navbar-collapse">
			    <div class="list-group docs-nav">
			      <h3 class="list-group-heading" style="color:white;font-style:bold;font-size:20px;font-family:微软雅黑">系统管理</h3>
			      
			      
			      <div id="tab-side-container" style="width:120%;height:70%;">
					 <ul style="background:#F1EAEA;height:auto">
					 	<li style="width:200px;"><a href="#side-tab1">角色管理</a></li>
					 	<li style="width:200px;"><a href="#side-tab2">用户管理</a></li>
					 </ul>		
					 <div class="panel-container"  >				
						<div id="side-tab1" style="margin-left:120px;">
					       <h2>角色管理</h2>
						   <div>
						   		<table id="RoleList" class="table table-striped table-bordered table-hover datatable " ></table>
					      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
					      			<div id="RolePager" ></div>
					      		</div>     
					     	 			  
					        </div>
						</div>
						<div id="side-tab2" style="margin-left:120px;">
					       <h2>用户管理</h2>
						   <div>
						   		<table id="UserList" class="table table-striped table-bordered table-hover datatable " ></table>
					      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
					      			<div id="UserPager" ></div>
					      		</div>      
					     	 			  
					        </div>
						</div>	
					 </div>
				</div>
				
				
			     
			    </div>
		  </div>
		  </div>
		  
	      	<hr class="featurette-divider">
	      	 <div id="footer">
		          <%@ include file="commons/footer.jsp" %>
		     </div>
	
	    </div><!-- /.container -->
	    
	    	
		<!-- 添加角色模态框 -->   	
		<div class="modal fade" id="add_role_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加角色</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addRoleForm" action="addRole.action" method="post" style="margin-top:-10px;"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table" >
		      		
		      			<tr>
		      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >角色名：</label></td>
				            <td><input id="roleName" type="text" class="input2" name="roleName"/><em style="color:red">*</em></td>
		      			</tr>
		      			<tr>
		      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >描述：</label></td>
		      				<td><input id="roleDescription" type="text" class="input2" name="roleDescription" /><em style="color:red">*</em></td>
		      			</tr>		    				
				   </table>
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >提交</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		  		<!-- 根据角色查看用户列表的模态框 -->   	
		<div class="modal fade" id="listUserByRole_modal">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:870">
		      <div class="modal-header">
		        <button type="button" id="listUserByRole_modal_close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">用户管理</h4> 
		      </div>
		      <div class="modal-body">  
		      	<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<input name="selRoleID" id="selRoleID" type="text" style="display:none"/>
							<table id="UserByRoleList" class="table table-striped table-bordered table-hover datatable " ></table>
				      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
				      			<div id="UserByRolePager" ></div>
				      		</div>	      		
						</div>
					</div>
				</div>  
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- 添加用户角色关系模态框 -->   	
		<div class="modal fade" id="addUserRole_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加用户</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addUserRoleForm" method="post" style="margin-top:-10px;"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table" >
		      		
		      			<tr>
		      				<td><label width="30%" align="center"style="font-weight:bold;font-family:黑体;font-size:20px;" >用户名：</label></td>
				            <td><select id="userID" name="userID"></select><em style="color:red">*</em><br>
   						</td>
		      			</tr>		      				    				
				   </table>
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >提交</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		  		<!-- 根据角色查看算法列表的模态框 -->   	
		<div class="modal fade" id="listAlgByRole_modal">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:870">
		      <div class="modal-header">
		        <button type="button" id="listAlgByRole_modal_close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">算法管理</h4> 
		      </div>
		      <div class="modal-body">  
		      	<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<input name="selRoleID" id="selRoleID" type="text" style="display:none"/>
							<table id="AlgByRoleList" class="table table-striped table-bordered table-hover datatable " ></table>
				      		<div style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:800" >
				      			<div id="AlgByRolePager" ></div>
				      		</div>	      		
						</div>
					</div>
				</div>  
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
			<!-- 添加用户算法关系模态框 -->   	
		<div class="modal fade" id="addAlgRole_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">添加算法</h4>
		      </div>
		      <div class="modal-body">
		     	 <form id="addAlgRoleForm" method="post" style="margin-top:-10px;"> 
		     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table" >
		      		
		      			<tr>
		      				<td><label width="30%" align="center" style="font-weight:bold;font-family:黑体;font-size:20px;" >算法：</label></td>
				            <td><select id="algID" name="algID"></select><em style="color:red">*</em><br>
   						</td>
		      			</tr>		      				    				
				   </table>
				   <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="submit" class="btn btn-primary"  >提交</button>
				   </div>
				 </form> 
		      </div>
		     
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
  </body>
  <script type="text/javascript">
  		
		$('#tab-side-container').easytabs({
		  animate: false,
		  tabActiveClass: "selected-tab",
		  panelActiveClass: "displayed"
		});
		
  </script>
</html>




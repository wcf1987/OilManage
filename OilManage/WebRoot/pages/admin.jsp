<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="commons/base_header.jsp" %>

<body class="no-skin" onload="optimizeInit();">
	<link rel="stylesheet" href="js/upload/uploadify.css" />
	<!--link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/css/jquery-ui-1.10.3.custom.css" /-->
	<!--link rel="stylesheet" type="text/css" media="screen" href="js/jqGrid/css/ui.jqgrid.css" /-->
	<!--link rel="stylesheet" type="text/css" media="screen" href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" /-->  
	<!--link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" /-->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	<!--script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script-->
	<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
	<!--script src="bootstrap/js/bootstrap.min.js"></script-->
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
	<!--script src="js/global.js"></script-->
	<script src="js/admin.js"></script>
	
	<%@ include file="commons/header.jsp" %>
		<!-- /section:basics/sidebar.horizontal -->
		<div class="main-content">
			<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="pages/home.jsp">首页</a>
					</li>
					<li>
						<a href="javascript:;">管理中心</a>
					</li>
					<li class="active">系统管理</li>
				</ul>
			</div>
			<div class="page-content">
				<!-- /section:settings.box -->
				<div class="page-header">
					<h1>
						系统管理
					</h1>
				</div><!-- /.page-header -->

				<div class="row">
					<div class="col-xs-12">
						<div class="tabbable">
							<ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
								<li class="active"><a data-toggle="tab" href="#rolemanage">角色管理</a></li>
								<li><a data-toggle="tab" href="#usermanage">用户管理</a></li>
							</ul>
							<div class="tab-content">
								<div id="rolemanage" class="tab-pane in active">
									<table id="RoleList" class="table table-striped table-bordered table-hover datatable " ></table>
					      			<div id="RolePager"></div>
								</div>
								<div id="usermanage" class="tab-pane">
									<table id="UserList" class="table table-striped table-bordered table-hover datatable " ></table>
						      		<div id="UserPager" ></div>
								</div>
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div><!-- /.main-content -->

		<%@ include file="commons/footer.jsp" %>
	</div><!-- /.main-container -->
	
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
			      		<div id="UserByRolePager" ></div>	      		
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
			      		<div id="AlgByRolePager" ></div>	      		
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
</html>

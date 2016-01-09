<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="commons/base_header.jsp" %>

<body class="no-skin">
	<%@ include file="commons/header.jsp" %>
		<!-- /section:basics/sidebar.horizontal -->
		<div class="main-content">
			<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="pages/home.jsp">首页</a>
					</li>
					<li class="active">系统说明</li>
				</ul>
			</div>
			<div class="page-content">
				<!-- /section:settings.box -->
				<div class="page-header">
					<h1>
						系统说明
					</h1>
				</div><!-- /.page-header -->

				<div class="row">
					<div class="col-xs-12 center">
						<p class="" style="font-size:14px;">系统模拟，能够处理复杂的煤层气集输系统，可轻松使用屏幕拖放技术来创建模型，模拟单相、多相流，从而对全气田进行模拟。</p>
						<p class="" style="font-size:14px;">系统优化，以系统模拟为基础，处理复杂大规模的煤层气系统，进行多种结构下的布局设计和参数设计，优选系统集输方式。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
					</div><!-- /.col -->
					<div class="col-xs-6 align-right clearfix">
						<div class="dropup dropdown-hover" style="width:480px;float:right;margin-right:10px;">
							<img style="width:480px;height:400px;margin-top:0px;border:2px solid"  src="images/moni.jpg" />
							<ul class="dropdown-menu pull-left" style="right:2px;bottom:67%;left:inherit;text-align:left;">
								<li><a href="pages/simulate_hydraulic.jsp"><i class="menu-icon fa fa-caret-right"></i>单相管网水力计算1</a></li>
								<li><a href="pages/simulate_thermal.jsp"><i class="menu-icon fa fa-caret-right"></i>单相管网水力计算2</a></li>
								<li><a href="pages/simulate_gas_solid.jsp"><i class="menu-icon fa fa-caret-right"></i>气固两相管网水力计算</a></li>
								<li><a href="pages/simulate_gas_liquid.jsp"><i class="menu-icon fa fa-caret-right"></i>气液两相管网水力计算</a></li>
								<li><a href="pages/simulate_wellbore.jsp"><i class="menu-icon fa fa-caret-right"></i>井底流压计算</a></li>
							</ul>
							<h4 class="center">系统模拟</h4>
						</div>
						
					</div>
					<div class="col-xs-6 align-left clearfix">
						<div class="dropup dropdown-hover" style="width:480px;float:left;margin-left:10px;">
							<img style="width:480px;height:400px;margin-top:0px;border:2px solid"  src="images/youhua.jpg" />
							<ul class="dropdown-menu pull-left" style="left:inherit;right:inherit;bottom:73%;text-align:left;">
								<li><a href="pages/optimize_layout.jsp"><i class="menu-icon fa fa-caret-right"></i> 布局设计 </a><b class="arrow"></b></li> 
								<li><a href="pages/optimize_parameter.jsp"><i class="menu-icon fa fa-caret-right"></i> 参数设计 </a><b class="arrow"></b></li> 
								<li><a href="pages/optimize_global.jsp"><i class="menu-icon fa fa-caret-right"></i> 整体设计 </a><b class="arrow"></b></li> 
								<li><a href="pages/optimize_sysexpand.jsp"><i class="menu-icon fa fa-caret-right"></i> 系统扩建设计 </a><b class="arrow"></b></li> 
							</ul>
							<h4 class="center">系统优化</h4>
						</div>
						
					</div>
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div><!-- /.main-content -->

		<%@ include file="commons/footer.jsp" %>
	</div><!-- /.main-container -->
	
	
		<!-- 选择模拟算法模态框 -->   	
	<div class="modal fade" id="simulate_modal">
	  <div class="modal-dialog">
	    <div class="modal-content" style="text-align:center">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">请选择一种模拟算法</h4>
	      </div>
	      <div class="modal-body">
			<ul class="submenu">
					<li>
						<a href="pages/simulate_hydraulic.jsp">
							<i class="menu-icon fa fa-caret-right"></i>
							单相管网水力计算1
						</a>
						<b class="arrow"></b>
					</li>

					<li>
						<a href="pages/simulate_thermal.jsp">
							<i class="menu-icon fa fa-caret-right"></i>
							单相管网水力计算2
						</a>
						<b class="arrow"></b>
					</li>

					<li>
						<a href="pages/simulate_gas_solid.jsp">
							<i class="menu-icon fa fa-caret-right"></i>
							气固两相管网水力计算
						</a>
						<b class="arrow"></b>
					</li>

					<li>
						<a href="pages/simulate_gas_liquid.jsp">
							<i class="menu-icon fa fa-caret-right"></i>
							气液两相管网水力计算
						</a>
						<b class="arrow"></b>
					</li>
					<li>
						<a href="pages/simulate_wellbore.jsp">
							<i class="menu-icon fa fa-caret-right"></i>
							井底流压计算
						</a>
						<b class="arrow"></b>
					</li>
				</ul>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 选择模拟算法模态框 -->   	
	<div class="modal fade" id="optimize_modal">
	  <div class="modal-dialog">
	    <div class="modal-content" style="text-align:center">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">请选择一种优化算法</h4>
	      </div>
	      <div class="modal-body">
			<ul class="submenu">
				<li>
					<a href="pages/optimize_layout.jsp">
						<i class="menu-icon fa fa-caret-right"></i>
						布局设计
					</a>
					<b class="arrow"></b>
				</li>
				<li>
					<a href="pages/optimize_parameter.jsp">
						<i class="menu-icon fa fa-caret-right"></i>
						参数设计
					</a>
					<b class="arrow"></b>
				</li>
				<li>
					<a href="pages/optimize_global.jsp">
						<i class="menu-icon fa fa-caret-right"></i>
						整体设计
					</a>
					<b class="arrow"></b>
				</li>
				<li>
					<a href="pages/optimize_sysexpand.jsp">
						<i class="menu-icon fa fa-caret-right"></i>
						系统扩建设计
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>
<script>
function showSimulateItems(){
	$('#simulate_modal').modal();	
}
function showOptimizeItems(){
	$('#optimize_modal').modal();	
}
</script>
<style>
li {list-style-type:none;}

</style>
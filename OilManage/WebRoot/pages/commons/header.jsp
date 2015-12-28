<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*,com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%
String uri = request.getRequestURI();
String spath = request.getServletPath();
User userlogin=(User)(session.getAttribute("user"));
String totalUser=(String)session.getAttribute("totalUser");
int sessionNum = 0;
if (userlogin==null){
response.sendRedirect("login.jsp");
return;
}
else{
	  Map  application1 = ActionContext.getContext().getApplication();
      
      // 在application范围由一个HashSet集保存所有的session
      HashSet sessions = (HashSet) application1.get("sessions");
      sessionNum = sessions.size();
}
%>

	<input id="authorID" type="hidden" value="<%out.print(userlogin.getUserid());%>"/>
	<!-- #section:basics/navbar.layout -->
	<div id="navbar" class="navbar navbar-default navbar-collapse h-navbar navbar-fixed-top">
		<script type="text/javascript">
			try{ace.settings.check('navbar' , 'fixed')}catch(e){}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<!-- #section:basics/navbar.layout.brand -->
				<a href="pages/home.jsp" class="navbar-brand">
					<small>
						<i class="logo28 logo-zl"></i>
						中联煤层气有限责任公司·中国石油大学（北京）
					</small>
					<small class="ml10">
						<i class="logo28 logo-cbm"></i>
						煤层气集输系统
					</small>
				</a>

				<!-- /section:basics/navbar.layout.brand -->

			</div>

			<!-- #section:basics/navbar.dropdown -->
			<div class="navbar-buttons navbar-header pull-right  collapse navbar-collapse" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue" ><span style="float:left">&nbsp;&nbsp;当前在线客户端数量：</span>
						<span  style="padding:0;float:left"><%out.print(sessionNum);%></span>
						<span class="pdr10" style="float:right">/<%out.print(totalUser);%>人</span>
					</li>
				
					<li class="light-blue">
						<span class="pdr10">系统时间：<span id="nowtime"></span></span>
						<script type="text/javascript">
							setInterval(function() {
					   		    var now = (new Date()).toLocaleString();
					   		    $('#nowtime').text(now);
					   		}, 1000);
						</script>
					</li>
					<!-- #section:basics/navbar.user_menu -->
					<li class="light-blue user-min">
						<a data-toggle="dropdown" href="javascript:;" class="dropdown-toggle">
							个人中心
							<span class="user-info">
								<small>欢迎您,</small>
								<%out.print(userlogin.getUsername());%>
							</span>

							<i class="ace-icon fa fa-caret-down"></i>
						</a>

						<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<!--li>
								<a href="#">
									<i class="ace-icon fa fa-cog"></i>
									系统设置
								</a>
							</li>

							<li>
								<a href="profile.html">
									<i class="ace-icon fa fa-user"></i>
									我的信息
								</a>
							</li>

							<li class="divider"></li-->

							<li>
								<a href="javascript:;" onclick="logout();">
									<i class="ace-icon fa fa-power-off"></i>
									安全退出
								</a>
							</li>
						</ul>
					</li>

					<!-- /section:basics/navbar.user_menu -->
				</ul>
			</div>

		</div><!-- /.navbar-container -->
	</div>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>

		<!-- #section:basics/sidebar.horizontal -->
		<div id="sidebar" class="sidebar h-sidebar navbar-collapse collapse sidebar-fixed sidebar-scroll">
			<script type="text/javascript">
				try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
			</script>
			<div id="sidebar-shortcuts" class="sidebar-shortcuts"> </div>
			<ul class="nav nav-list">
				<li class="<%if (spath.equals("/pages/home.jsp")){%>active open<%}%> hover">
					<a href="pages/home.jsp"">
						<i class="menu-icon fa fa-home"></i>
						<span class="menu-text"> 首 页 </span>
					</a>
					<b class="arrow"></b>
				</li>

				<li class="<%if (spath.equals("/pages/simulate_hydraulic.jsp")||spath.equals("/pages/simulate_thermal.jsp")||spath.equals("/pages/simulate_gas_solid.jsp")||spath.equals("/pages/simulate_gas_liquid.jsp")||spath.equals("/pages/simulate_wellbore.jsp")){%>active open<%}%> hover">
					<a href="javascript:;" class="dropdown-toggle">
						<i class="menu-icon fa fa-puzzle-piece"></i>
						<span class="menu-text"> 系统模拟 </span>
						<b class="arrow fa fa-angle-down"></b>
					</a>
					<b class="arrow"></b>
					<ul class="submenu">
						<li class="<%if (spath.equals("/pages/simulate_hydraulic.jsp")||spath.equals("/pages/simulate_thermal.jsp")||spath.equals("/pages/simulate_gas_solid.jsp")||spath.equals("/pages/simulate_gas_liquid.jsp")){%>active open<%}%> hover">
							<a href="javascript:;" class="dropdown-toggle">
								<i class="menu-icon fa fa-caret-right"></i>
								管网模拟
								<b class="arrow fa fa-angle-down"></b>
							</a>
							<b class="arrow"></b>
							<ul class="submenu">
								<li class="<%if (spath.equals("/pages/simulate_hydraulic.jsp")){%>active<%}%> hover">
									<a href="pages/simulate_hydraulic.jsp">
										<i class="menu-icon fa fa-caret-right"></i>
										单相管网水力计算1
									</a>
									<b class="arrow"></b>
								</li>

								<li class="<%if (spath.equals("/pages/simulate_thermal.jsp")){%>active<%}%> hover">
									<a href="pages/simulate_thermal.jsp">
										<i class="menu-icon fa fa-caret-right"></i>
										单相管网水力计算2
									</a>
									<b class="arrow"></b>
								</li>

								<li class="<%if (spath.equals("/pages/simulate_gas_solid.jsp")){%>active<%}%> hover">
									<a href="pages/simulate_gas_solid.jsp">
										<i class="menu-icon fa fa-caret-right"></i>
										气固两相管网水力计算
									</a>
									<b class="arrow"></b>
								</li>

								<li class="<%if (spath.equals("/pages/simulate_gas_liquid.jsp")){%>active<%}%> hover">
									<a href="pages/simulate_gas_liquid.jsp">
										<i class="menu-icon fa fa-caret-right"></i>
										气液两相管网水力计算
									</a>
									<b class="arrow"></b>
								</li>
							</ul>
						</li>

						<li class="<%if (spath.equals("/pages/simulate_wellbore.jsp")){%>active open<%}%> hover">
							<a href="pages/simulate_wellbore.jsp">
								<i class="menu-icon fa fa-caret-right"></i>
								井底流压计算
							</a>
							<b class="arrow"></b>
						</li>
					</ul>
				</li>
				
				<li class="<%if (spath.equals("/pages/optimize_layout.jsp")||spath.equals("/pages/optimize_parameter.jsp")||spath.equals("/pages/optimize_global.jsp")||spath.equals("/pages/optimize_sysexpand.jsp")){%>active open<%}%> hover">
					<a href="javascript:;" class="dropdown-toggle">
						<i class="menu-icon fa fa-retweet"></i>
						<span class="menu-text"> 系统优化 </span>
						<b class="arrow fa fa-angle-down"></b>
					</a>
					<b class="arrow"></b>
					<ul class="submenu">
						<li class="<%if (spath.equals("/pages/optimize_layout.jsp")||spath.equals("/pages/optimize_parameter.jsp")||spath.equals("/pages/optimize_global.jsp")){%>active open<%}%> hover">
							<a href="javascript:;" class="dropdown-toggle">
								<i class="menu-icon fa fa-caret-right"></i>
								整装区块设计
								<b class="arrow fa fa-angle-down"></b>
							</a>
							<b class="arrow"></b>
							<ul class="submenu">
								<li class="<%if (spath.equals("/pages/optimize_layout.jsp")){%>active<%}%> hover">
									<a href="pages/optimize_layout.jsp">
										<i class="menu-icon fa fa-caret-right"></i>
										布局设计
									</a>
									<b class="arrow"></b>
								</li>

								<li class="<%if (spath.equals("/pages/optimize_parameter.jsp")){%>active<%}%> hover">
									<a href="pages/optimize_parameter.jsp">
										<i class="menu-icon fa fa-caret-right"></i>
										参数设计
									</a>
									<b class="arrow"></b>
								</li>

								<li class="<%if (spath.equals("/pages/optimize_global.jsp")){%>active<%}%> hover">
									<a href="pages/optimize_global.jsp">
										<i class="menu-icon fa fa-caret-right"></i>
										整体设计
									</a>
									<b class="arrow"></b>
								</li>

							</ul>
						</li>

						<li class="<%if (spath.equals("/pages/optimize_sysexpand.jsp")){%>active open<%}%> hover">
							<a href="pages/optimize_sysexpand.jsp">
								<i class="menu-icon fa fa-caret-right"></i>
								系统扩建设计
							</a>
							<b class="arrow"></b>
						</li>
					</ul>
				</li>

				<li class="<%if (spath.equals("/pages/project.jsp")||spath.equals("/pages/algorithm.jsp")||spath.equals("/pages/admin.jsp")){%>active open<%}%> hover">
					<a href="javascript:;" class="dropdown-toggle">
						<i class="menu-icon fa fa-gears"></i>
						<span class="menu-text"> 管理中心 </span>
						<b class="arrow fa fa-angle-down"></b>
					</a>
					<b class="arrow"></b>
					<ul class="submenu">
						<li class="<%if (spath.equals("/pages/project.jsp")){%>active open<%}%> hover">
							<a href="pages/project.jsp">
								<i class="menu-icon fa fa-caret-right"></i>
								工程管理
							</a>
							<b class="arrow"></b>
						</li>
						<li class="<%if (spath.equals("/pages/algorithm.jsp")){%>active open<%}%> hover">
							<a href="pages/algorithm.jsp">
								<i class="menu-icon fa fa-caret-right"></i>
								算法管理
							</a>
							<b class="arrow"></b>
						</li>
						<li class="<%if (spath.equals("/pages/admin.jsp")){%>active open<%}%> hover">
							<a href="pages/admin.jsp">
								<i class="menu-icon fa fa-caret-right"></i>
								系统管理
							</a>
							<b class="arrow"></b>
						</li>
					</ul>
				</li>

			</ul><!-- /.nav-list -->

			<!-- #section:basics/sidebar.layout.minimize -->
			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>

			<!-- /section:basics/sidebar.layout.minimize -->
			<script type="text/javascript">
				try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
			</script>
		</div>

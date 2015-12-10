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
					<div class="col-xs-12">
						<p class="" style="font-size:14px;">系统模拟，能够处理复杂的煤层气集输系统，可轻松使用屏幕拖放技术来创建模型，模拟单相、多相流，从而对全气田进行模拟。</p>
						<p class="" style="font-size:14px;">系统优化，以系统模拟为基础，处理复杂大规模的煤层气系统，进行多种结构下的布局设计和参数设计，优选系统集输方式</p>
					</div><!-- /.col -->
					<div class="col-xs-6 center">
						<img  style="width:480px;height:400px;margin-top:0px;border:2px solid"  src="images/moni.jpg" />
						<h4 class="center">系统模拟</h4>
					</div>
					<div class="col-xs-6 center">
						<img  style="width:480px;height:400px;margin-top:0px;border:2px solid"  src="images/youhua.jpg" />
						<h4 class="center">系统优化</h4>
					</div>
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div><!-- /.main-content -->

		<%@ include file="commons/footer.jsp" %>
	</div><!-- /.main-container -->

</body>
</html>

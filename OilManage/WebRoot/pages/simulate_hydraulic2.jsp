<%@ page language="java"
	import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
	//User userlogin=(User)(session.getAttribute("user"));
%>
<base href="<%=basePath%>">

<title>系统模拟</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9" />

<script type="text/javascript" src="editor/lib/kinetic-v5.1.0.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/jqGrid/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="js/jqueryUI/themes/redmond/jquery.ui.theme.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/carousel.css">
<link rel="stylesheet" media="screen" type="text/css"
	href="editor/assets/css/style.css" />
<link rel="stylesheet" media="screen" type="text/css"
	href="editor/assets/css/minimap.css" />

<script type="text/javascript" src="editor/assets/javascript/json2.js"></script>
<script type="text/javascript"
	src="editor/assets/javascript/jquery-1.11.0.min.js"></script>
<script src="js/jquery/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript"
	src="editor/assets/javascript/ajaxfileupload.js"></script>
<script src="js/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
<script src="js/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/holder.min.js"></script>
<script type="text/javascript"
	src="js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
<script src="js/easytabs/jquery.hashchange.min.js"
	type="text/javascript"></script>
<script src="js/easytabs/jquery.easytabs.js" type="text/javascript"></script>



<script defer="defer" type="text/javascript" src="js/dynamicSheet.js"></script>
<script defer="defer" type="text/javascript" src="js/simulate_hydraulic2.js"></script>
<link rel="stylesheet" media="screen" type="text/css"
	href="editor/assets/css/colorPicker_new.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="css/tabs.css" />
<!-- <link rel="stylesheet" media="screen" type="text/css" href="editor/assets/css/processui.css" />  -->
<!-- 自定义 -->
<link rel="stylesheet" type="text/css" href="css/styles.css" />


<link rel="stylesheet" type="text/css" href="css/simulate_optimize.css" />
<link rel="stylesheet" type="text/css" href="css/dynamicSheet.css" />

</head>

<!-- onload="initLight();  -->
<body id="body"">

	<div id="head">
		<%@ include file="commons/header.jsp"%>
	</div>


	<div class="container marketing condiv"
		style="width:1200px;margin-top:55px;">

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="page-header">
						<h1>
							单相管网水力计算&nbsp;<small>管网模拟</small>
						</h1>
					</div>
					<div id="tab-container" class="tab-container">
						<ul class='etabs'>
							<li class='tab'><a href="#tabs1">流体参数</a></li>
							<li class='tab'><a href="#tabs2">节点数据</a></li>
							<li class='tab'><a href="#tabs3">管段数据</a></li>
							<li class='tab'><a href="#tabs4">离心压缩机参数</a></li>
							<li class='tab'><a href="#tabs5">往复压缩机参数</a></li>
						</ul>
						<div id="tabs1">
							<h2>流体参数</h2>
							<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet0"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager0"></div>
								</div>
							</div>
							<!-- content -->
						</div>
						<div id="tabs2">
							<h2>节点数据</h2>
						<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet1"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager1"></div>
								</div>
							</div>
						</div>
						<div id="tabs3">
							<h2>管段数据</h2>
							<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet2"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager2"></div>
								</div>
							</div>
						</div>
						<div id="tabs4">
							<h2>离心压缩机参数</h2>
						<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet3"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager3"></div>
								</div>
							</div>
						</div>
						<div id="tabs5">
							<h2>往复压缩机参数</h2>
							<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet4"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager4"></div>
								</div>
							</div>
						</div>
					</div>
					<!--  -->





					<div id="tab-container2" class="tab-container">
						<ul class='etabs'>
							<li class='tab'><a href="#tabs6">节点</a></li>
							<li class='tab'><a href="#tabs7">管段</a></li>
							<li class='tab'><a href="#tabs8">离心压缩机</a></li>
							<li class='tab'><a href="#tabs9">往复压缩机</a></li>
						</ul>
						<div id="tabs6">
							<h2>节点</h2>
							<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet5"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager5"></div>
								</div>
							</div>
							<!-- content -->
						</div>
						<div id="tabs7">
							<h2>管段</h2>
						<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet6"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager6"></div>
								</div>
							</div>
						</div>
						<div id="tabs8">
							<h2>离心压缩机</h2>
							<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet7"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager7"></div>
								</div>
							</div>
						</div>
						<div id="tabs9">
							<h2>往复压缩机参数</h2>
						<div class="row featurette "
								style="margin-top:5px;margin-left:10px;margin-right:auto;">
								<!-- 表格 -->
								<table id="sheet8"
									class="table table-striped table-bordered table-hover datatable "></table>
								<div
									style="border:3px dashed #336699;box-shadow:2px 2px 10px #333300;border-radius: 11px;width:1230">
									<div id="pager8"></div>
								</div>
							</div>
						</div>					
					</div>
					<!-- content -->
				</div>
			</div>








		</div>
	</div>
	<hr class="featurette-divider">



	<hr class="featurette-divider">
	<div id="footer">
		<%@ include file="commons/footer.jsp"%>
	</div>






	<script type="text/javascript">
		$(document).ready(function() {
			$('#tab-container').easytabs();
			$('#tab-container2').easytabs();
		});
	</script>

</body>

</html>



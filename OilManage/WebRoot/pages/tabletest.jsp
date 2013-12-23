<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tabletest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/table/jquery.dataTables.js"></script>
	
	<script type="text/javascript"  src="js/TableTools/media/js/TableTools.js"></script>
	<script type="text/javascript" src="js/TableTools/media/ZeroClipboard/ZeroClipboard.js"></script>
	<script type="text/javascript" src="js/table/DataTableServerSideData.js"></script>
	
	<link rel="stylesheet" href="js/TableTools/media/css/TableTools.css"/>
	<script>
		$(document).ready(function () {
            dt = $('#example').dataTable({
                "bProcessing": true,
                "bServerSide": true,
                "bSort": false,
                "sAjaxSource": "testData.action",//这是要请求json数据的url
                "sAjaxDataProp":"aaData",  
                "oLanguage": {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "对不起，查询不到任何相关数据",
                    "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmtpy": "找不到相关数据",
                    //"sInfoFiltered": "数据表中共为 _MAX_ 条记录",  
                    "sProcessing": "正在加载中...",
                    "sSearch": "搜索",
                    "sInfoEmpty": "显示 0 至 0 共 0 项",
"oPaginate": { "sFirst": "第一页", "sPrevious": "上一页 ", "sNext": "下一页 ", "sLast": "末页 " }
                },
                "aoColumns": [
        
                    { "sTitle":"教师","mData": "teacher_name", "sClass": "center" },
                    {"sTitle":"单位", "mData": "organization_name", "sClass": "center" }
             

                ],
                "aoColumnDefs": [
                 {
                     "aTargets": [6],
                     "mData": "操作",
                     "mRender": function (data, type, full) {
                         return '<a href="javascript:void(0);" class="delete" tag=' + data + '>删除</a>';
                     }
                 }
                ],
                "fnServerData": fnDataTablesPipeline
            });
            });
	</script>

  </head>
  
  <body>
    <table  id="example">
	    <thead>
	  
	    </thead>
	    <tbody>      
	    </tbody>
	    <tfoot>
	  
	    </tfoot>
	</table>
  </body>
</html>

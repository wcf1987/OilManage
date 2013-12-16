<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib uri="/struts-tags" prefix="s"%> 
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 

<html>
<head>
<meta charset="utf-8">
   <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap/css/justified-nav.css">

	
	<!-- 自定义 -->
	<link rel="stylesheet" type="text/css" href="css/styles.css"/>
	
	<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/upload/vendor/jquery.ui.widget.js"></script>
	<script src="js/upload/jquery.iframe-transport.js"></script>
	<script src="js/upload/jquery.fileupload.js"></script>
<title>jQuery File Upload Example</title>
</head>
<body>
<input id="fileupload" type="file" name="files[]" data-url="uploadMap.action" multiple>


<script>
$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo(document.body);
            });
        }
    });
});
</script>
</body> 
</html>
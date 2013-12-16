<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
      <head>
        <title>UploadifyTest</title>
        <link href="../js/upload/uploadify.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="../js/upload/jquery.uploadify.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
            $('#mapfile').uploadify({
                'swf'       : '../js/upload/uploadify.swf',
                'uploader'         : 'uploadMap.action',
                'queueID'        : 'fileQueue',
                'auto'           : false,
                'multi'          : true,
                'buttonText'     : '上传地图文件',
                'fileSizeLimit' : '1MB',
                'fileObjName' : 'mapfile',
                'method' : 'post'
            });
        });
        </script>
    </head>
    <body>
        <div id="fileQueue"></div>
        <input type="file" name="xxx" id="mapfile" />
        <p>
        <a href="javascript:jQuery('#mapfile').uploadify('upload','*')">开始上传</a>&nbsp;
        <a href="javascript:jQuery('#mapfile').uploadify('cancel')">取消所有上传</a>
        </p>
    </body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE2 {
	font-size: 12px;
	color: #333333;
}
-->
a:link {font-size:12px; color:#000000; text-decoration:none;}
a:visited {font-size:12px; color:#000000; text-decoration:none;}
a:hover {font-size:12px; color:#00CCFF;text-decoration:none;}
.STYLE4 {font-size: 12px}
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="11" background="images/main_03.gif"><img src="images/main_01.gif" width="104" height="11"></td>
  </tr>
  <tr>
    <td height="36" background="images/main_07.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="282" height="52" background="images/main_05.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><span class="STYLE1"><img src="images/home.gif" width="12" height="13"> </span><span class="STYLE4"><a href="#">a</a></span><span class="STYLE1"> <img src="images/quit.gif" width="16" height="16"> </span><span class="STYLE4"><a href="#">b</a></span><span class="STYLE1"> </span></td>
          </tr>
        </table></td>
        <td width="247" background="images/main_08.gif">&nbsp;</td>
        <td width="283" background="images/main_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/uesr.gif" width="14" height="14"><span class="STYLE2"> user</span></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

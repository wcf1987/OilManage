<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>煤层气模拟软件</title>
</head>

<frameset rows="63,*,23" frameborder="no" border="0" framespacing="0">
  <frame src="pages/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frame src="pages/center.jsp" name="mainFrame" id="mainFrame" />
  <frame src="pages/down.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>

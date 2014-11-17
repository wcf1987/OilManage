 <%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
 <%
User userlogin=(User)(session.getAttribute("user"));
if (userlogin==null){
response.sendRedirect("login.jsp");
return;
}
else{

}
%>
<input style="display:none" id="authorID" value="<%out.print(userlogin.getUserid());%>"/>
 <div class="navbar-wrapper" style="margin-top:-35px">
    <!-- <div class="container"> -->
	<div class="navbar  navbar-static-top" role="navigation" >
	  	<ul  class="nav navbar-nav" style="float:left;">
	  		<img style="width:30%;margin-left:100px;margin-top:20px;" alt="中联公司" src="images/zhonglian.png">
	  	</ul>
		<ul style="float:left;margin-top:35px;font-weight:bold;font-family:微软雅黑;font-size:18px;color:rgba(61, 85, 120, 1)">
			煤层气集输系统
		</ul>
	  	<ul  class="nav navbar-nav" style="float:left;margin-top:40px;">
	     		<!-- <li><img style="width:20%;" alt="中联公司" src="images/zhongguoshiyoudaxue.jpg"></li> -->
	     		<li>系统时间：<span id="nowtime"></span></li>
	     		<li><span style="float:left">&nbsp;&nbsp;当前用户：</span><a  style="padding:0;float:left"><%out.print(userlogin.getUsername());%></a><span style="float:right">/5人</span></span></li>
	   </ul>
	  </div>
    
      <div class="navbar navbar-inverse navbar-static-top" role="navigation">
       <div class="container"> 
        <!--   <div class="navbar-header">
            <a class="navbar-brand" href="pages/home.jsp"><div style="color:#A9DBAF;font-weight:bold;font-family:微软雅黑;">煤层气集输系统&nbsp;<span style="color:#D7E3E6;font-size:16px;">后台管理</span></div></a>
          </div> -->
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">              
              <li><a id="data" href="pages/data.jsp">数据管理</a></li>
              <li><a id="algorithm" href="pages/algorithm.jsp">算法管理</a></li>
              <li><a id="admin" href="pages/admin.jsp">系统管理</a></li>
		      <li><a id="about" href="pages/about.jsp">关于</a></li>	
		      <li><a id="home" href="pages/home.jsp">返回首页</a></li>	     
            </ul>
                       
			<div class="text-center" style="margin-top:8px;margin-right:25px;" id="userId">
				<div style="margin-left:5px;margin-top:5px;"><a class="logout" style="margin-left:5px;margin-top:5px;float:right"id="exit" onclick="logout()">注销</a></div>
			 <%--  <div style="color:#E8F6E2;float:right;margin-top:5px;">您好,<a class="logout" href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%>！</a></div>	 --%>
			</div>
		 </div>
	</div> 
   </div>
</div>
<!-- </div> -->

 <script>
 		var $pathname=window.location.pathname;
 		switch($pathname){
 			case "/OilManage/pages/home.jsp":
 				$("#home").parent().addClass("active");
 				break;
 			case "/OilManage/pages/data.jsp":
 				$("#data").parent().addClass("active");
 				break;
 			case "/OilManage/pages/algorithm.jsp":
 				$("#algorithm").parent().addClass("active");
 				break;
 			case "/OilManage/pages/admin.jsp":
 				$("#admin").parent().addClass("active");
 				break;
 			case "/OilManage/pages/about.jsp":
 				$("#about").parent().addClass("active");
 				break;		
 			default:
 				break;
 			
 		}
   		setInterval(function() {
   		    var now = (new Date()).toLocaleString();
   		    $('#nowtime').text(now);
   		}, 1000);
 </script>

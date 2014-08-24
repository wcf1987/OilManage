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

 <div class="navbar-wrapper">
    <!-- <div class="container"> -->
      <div class="navbar navbar-inverse navbar-static-top" role="navigation">
       <div class="container"> 
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="pages/home.jsp"><div style="color:#A9DBAF;font-weight:bold;font-family:微软雅黑;">煤层气集输系统&nbsp;<span style="color:#D7E3E6;font-size:16px;">后台管理</span></div></a>
          </div>
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
			  <div style="color:#E8F6E2;float:right;margin-top:5px;">您好,<a class="logout" href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%>！</a></div>	
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
	
 </script>

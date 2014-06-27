<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
/* String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; */
User userlogin=(User)(session.getAttribute("user"));
%> 

 <div class="navbar-wrapper" style="position:static">
     <div class="container">
       <div class="navbar navbar-inverse navbar-static-top" role="navigation">
         <div class="container">
           <div class="navbar-header">
             
             <a class="navbar-brand" href="pages/home.jsp"><div style="color:#428BCA;font-weight:bold;font-family:Georgia, serif;">煤层气集输系统</div></a>
           </div>
           <div class="navbar-collapse collapse">
          		<ul class="nav navbar-nav">
                <li><a id="home" href="pages/home.jsp">首页</a></li>
                <li><a id="map" href="pages/map.jsp">地图建模</a></li>
                <li><a id="project" href="pages/project.jsp">工程管理</a></li>
                <li><a id="diagram" href="pages/diagram.jsp">系统建模</a></li>
                <li><a id="optimize" href="pages/home.jsp">系统优化</a></li>
		        <li><a id="about" href="pages/home.jsp">关于</a></li>	  
		        <li><a id="data" href="pages/data.jsp">进入后台</a></li>      	               
             	</ul>
               
              	<%if (userlogin!=null) {%>
			      <div class="text-center" style="margin-top:8px;margin-right:25px;" id="userId">
			      	<div style="margin-left:5px;margin-top:5px;"><a  style="margin-left:5px;margin-top:5px;float:right"id="exit" onclick="logout()">注销</a></div>	     
			        <div style="font-size:20;color:#FFFFFF;float:right">您好,<a href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%>！</a></div>
			      </div>
		       	<%}else{ %>
	        	  <div class="text-center" style="margin-top:8px;"><a  class="btn btn-default" href="pages/login.jsp">管理员登陆</a></div>
	           	<%} %>
            
           </div>
         </div>
       </div>

     </div>
   </div>
   <script>
   		var $pathname=window.location.pathname;
   		switch($pathname){
   			case "/OilManage/pages/diagram.jsp":
   				$("#diagram").parent().addClass("active");
   				break;
   			case "/OilManage/pages/map.jsp":
   				$("#map").parent().addClass("active");
   				break;
   			case "/OilManage/pages/home.jsp":
   				$("#home").parent().addClass("active");
   				break;
   			case "/OilManage/pages/project.jsp":
   				$("#project").parent().addClass("active");
   				break;
   			case "/OilManage/pages/optimize.jsp":
   				$("#optimize").parent().addClass("active");
   				break;
   			case "/OilManage/pages/about.jsp":
   				$("#about").parent().addClass("active");
   				break;
   			default:
   				break;
   			
   		}
 		
   </script>
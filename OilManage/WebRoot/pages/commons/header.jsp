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
<!--  <img style="" src="images/logo_title.png"  alt="" />
   -->

 <div class="navbar-wrapper" style="margin-top:-35px">
    <!--  <div class="container"> -->
    <div class="navbar  navbar-static-top" role="navigation" style="">
    	<ul  class="nav navbar-nav" style="float:left;">
    		<img style="width:20%;margin-left:500px;margin-top:20px;" alt="中联公司" src="images/zhonglian.png">
    		<img style="width:15%;margin-left:10px;margin-top:20px;" alt="中国石油大学" src="images/zhongguoshiyoudaxue.png">
    	</ul>
    	<!-- 	
    	<ul class="nav navbar-nav" style="float:left;margin-top:55px;">
    		<span>中联煤层气有限责任公司</span>
    	</ul> -->
    	<ul style="margin-left:-700px;float:left;margin-top:55px;font-weight:bold;font-family:微软雅黑;font-size:30px;color:rgba(61, 85, 120, 1)">
			煤层气集输系统
		</ul>
		<ul style="margin-left:-200px;float:left;margin-top:55px;font-weight:bold;font-family:微软雅黑;font-size:30px;color:rgba(61, 85, 120, 1)">
			煤层气集输系统
		</ul>
    	<ul  class="nav navbar-nav" style="float:right;margin-top:70px;margin-right:30px">
	      		<!-- <li><img style="width:20%;" alt="中联公司" src="images/zhongguoshiyoudaxue.jpg"></li> -->
	      		<li>系统时间：<span id="nowtime"></span></li>
	      		<li><span style="float:left">&nbsp;&nbsp;当前用户：</span><a  style="padding:0;float:left"><%out.print(userlogin.getUsername());%></a><span style="float:right">/5人</span></span></li>
	    </ul>
    </div>
    <div class="navbar navbar-inverse navbar-static-top" role="navigation">
      <div class="container">
   <!--      <div class="navbar-header">
          <a class="navbar-brand" href="pages/home.jsp"><div style="color:#A9DBAF;font-weight:bold;font-family:微软雅黑;">煤层气集输系统</div></a>
        </div> -->

        <div class="navbar-collapse collapse">
       		<ul class="nav navbar-nav">
             <li><a id="home" href="pages/home.jsp">首页</a></li>
             <!-- <li><a id="project" href="pages/project.jsp">工程管理</a></li> -->
             <!-- <li><a id="simulate" href="pages/pro_simulate.jsp">系统模拟</a></li> -->
             
             <li class="dropdown">
             	<!-- id="dLabel" a标签原来的 -->
           <a  id="simulate"  role="button" data-toggle="dropdown"  data-target="#"
              href="javascript:;">
               系统模拟<span class="caret"></span>
           </a>
           <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">              
           	  <li class="dropdown-submenu">
                   <a tabindex="-1" href="javascript:;">管网模拟</a>
                   <ul class="dropdown-menu">
                       <li><a tabindex="-1" href="pages/simulate_hydraulic.jsp">单相管网水力计算(不考虑热力)</a></li>
                       <li><a tabindex="-1" href="pages/simulate_thermal.jsp">单相管网水力计算(考虑热力)</a></li>
                       <li><a tabindex="-1" href="pages/simulate_gas_solid.jsp">气固两相管网水力计算</a></li>
                       <li><a tabindex="-1" href="pages/simulate_gas_liquid.jsp">气液两相管网水力计算</a></li>                       
                       <li class="divider"></li>
           <!--             <li class="dropdown-submenu">
                           <a href="javascript:;">二级菜单</a>
                           <ul class="dropdown-menu">
                               <li><a href="javascript:;">三级菜单</a></li>
                           </ul>
                       </li> -->
                   </ul>
               </li>
               <li class="divider"></li>
               <li><a href="pages/simulate_wellbore.jsp">井底流压计算</a></li>
       
           </ul>
       </li>
       
        <li class="dropdown">
           <a id="optimize" role="button" data-toggle="dropdown"  data-target="#"
              href="javascript:;">
               系统优化<span class="caret"></span>
           </a>
           <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">              
               <li><a href="pages/optimize_sysexpand.jsp">系统扩建设计</a></li>
               <li class="divider"></li>
               <li class="dropdown-submenu">
                   <a tabindex="-1" href="javascript:;">整装区块设计</a>
                   <ul class="dropdown-menu">
                       <li><a tabindex="-1" href="pages/optimize_global.jsp">整体设计</a></li>
                       <li><a tabindex="-1" href="pages/optimize_layout.jsp">布局设计</a></li>
                       <li><a tabindex="-1" href="pages/optimize_parameter.jsp">参数设计</a></li>
                       <li class="divider"></li>
                      <!--  <li class="dropdown-submenu">
                           <a href="javascript:;">二级菜单</a>
                           <ul class="dropdown-menu">
                               <li><a href="javascript:;">三级菜单</a></li>
                           </ul>
                       </li> -->
                   </ul>
               </li>
           </ul>
       	</li>
       	
             <!-- <li><a id="optimize" href="pages/home.jsp">系统优化</a></li>   -->             
            <!--  <li><a id="map" href="pages/map.jsp">地图建模</a></li>
             <li><a id="diagram" href="pages/diagram.jsp">笛卡尔建模</a></li> -->
              
       		<li><a id="data" href="pages/data.jsp">系统管理</a></li>  	               
          	</ul>
            
           	<%if (userlogin!=null) {%>
      <div class="text-center" style="margin-top:8px;margin-right:25px;" id="userId">
      	<div style="margin-left:5px;margin-top:5px;"><a  class="logout" style="margin-left:5px;margin-top:5px;float:right"id="exit" onclick="logout()">退出</a></div>	     
        <%-- <div style="color:#E8F6E2;float:right;margin-top:5px;">您好,<a class="logout" href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%>！</a></div> --%>
      </div>
      	<%}else{ %>
      	  <div class="text-center" style="margin-top:8px;"><a  class="btn btn-default" href="pages/login.jsp">管理员登陆</a></div>
         	<%} %>
         
        </div>
      </div>
    </div>

</div>
   <script>
   		var $pathname=window.location.pathname;
   		switch($pathname){
	   		case "/OilManage/pages/project.jsp":
				$("#project").parent().addClass("active");
				break;
   			case "/OilManage/pages/simulate_wellbore.jsp":
				$("#simulate").parent().addClass("active");
				break;
   			case "/OilManage/pages/simulate_hydraulic.jsp":
				$("#simulate").parent().addClass("active");
				break;
   			case "/OilManage/pages/simulate_thermal.jsp":
				$("#simulate").parent().addClass("active");
				break;
   			case "/OilManage/pages/simulate_gas_solid.jsp":
				$("#simulate").parent().addClass("active");
				break;
   			case "/OilManage/pages/simulate_gas_liquid.jsp":
				$("#simulate").parent().addClass("active");
				break;
   			case "/OilManage/pages/simulate_auto.jsp":
				$("#simulate").parent().addClass("active");
				break;
   			case "/OilManage/pages/optimize_global.jsp":
				$("#optimize").parent().addClass("active");
				break;
   			case "/OilManage/pages/optimize_layout.jsp":
				$("#optimize").parent().addClass("active");
				break;
   			case "/OilManage/pages/optimize_parameter.jsp":
   				$("#optimize").parent().addClass("active");
   				break;
   			case "/OilManage/pages/optimize_sysexpand.jsp":
   				$("#optimize").parent().addClass("active");
   				break;
   			case "/OilManage/pages/diagram.jsp":
   				$("#diagram").parent().addClass("active");
   				break;
   			case "/OilManage/pages/map.jsp":
   				$("#map").parent().addClass("active");
   				break;
   			case "/OilManage/pages/home.jsp":
   				$("#home").parent().addClass("active");
   				break;
   		 	case "/OilManage/pages/project_edit.jsp":
   				$("#project").parent().addClass("active");
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

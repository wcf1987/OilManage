<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<%
/* String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; */
User userlogin=(User)(session.getAttribute("user"));
%> 


<!--  <img style="" src="images/logo_title.png"  alt="" />
   -->

 <div class="navbar-wrapper" >
    <!--  <div class="container"> -->
       <div class="navbar navbar-inverse navbar-static-top" role="navigation">
         <div class="container">
           <div class="navbar-header">
             <a class="navbar-brand" href="pages/home.jsp"><div style="color:#A9DBAF;font-weight:bold;font-family:微软雅黑;">煤层气集输系统</div></a>
           </div>
           
           <div class="navbar-collapse collapse">
          		<ul class="nav navbar-nav">
                <li><a id="home" href="pages/home.jsp">首页</a></li>
                <li><a id="project" href="pages/project.jsp">工程管理</a></li>
                <!-- <li><a id="simulate" href="pages/pro_simulate.jsp">系统模拟</a></li> -->
                
                <li class="dropdown">
                	<!-- id="dLabel" a标签原来的 -->
		            <a  id="simulate"  role="button" data-toggle="dropdown"  data-target="#"
		               href="javascript:;">
		                系统模拟<span class="caret"></span>
		            </a>
		            <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">              
		                <li><a href="pages/simulate_wellbore.jsp">井底流压计算</a></li>
		                <li class="divider"></li>
		                <li class="dropdown-submenu">
		                    <a tabindex="-1" href="javascript:;">管网模拟</a>
		                    <ul class="dropdown-menu">
		                        <li><a tabindex="-1" href="pages/simulate_hydraulic.jsp">单相管网水力计算(不考虑热力)</a></li>
		                        <li><a tabindex="-1" href="pages/simulate_thermal.jsp">单相管网水力计算(考虑热力)</a></li>
		                        <li><a tabindex="-1" href="pages/simulate_gas_solid.jsp">气固两相管网水力计算</a></li>
		                        <li><a tabindex="-1" href="pages/simulate_gas_liquid.jsp">气液两相管网水力计算</a></li>
		                        <li><a tabindex="-1" href="pages/simulate_auto.jsp">自动计算</a></li>
		                        <li class="divider"></li>
		                        <li class="dropdown-submenu">
		                            <a href="javascript:;">二级菜单</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="javascript:;">三级菜单</a></li>
		                            </ul>
		                        </li>
		                    </ul>
		                </li>
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
		                        <li class="dropdown-submenu">
		                            <a href="javascript:;">二级菜单</a>
		                            <ul class="dropdown-menu">
		                                <li><a href="javascript:;">三级菜单</a></li>
		                            </ul>
		                        </li>
		                    </ul>
		                </li>
		            </ul>
		        </li>
		        	
                <!-- <li><a id="optimize" href="pages/home.jsp">系统优化</a></li>   -->             
                <li><a id="map" href="pages/map.jsp">地图建模</a></li>
                <li><a id="diagram" href="pages/diagram.jsp">笛卡尔建模</a></li>
                
		        <li><a id="about" href="pages/home.jsp">关于</a></li>	  
		        <li><a id="data" href="pages/data.jsp">进入后台</a></li>      	               
             	</ul>
               
              	<%if (userlogin!=null) {%>
			      <div class="text-center" style="margin-top:8px;margin-right:25px;" id="userId">
			      	<div style="margin-left:5px;margin-top:5px;"><a  class="logout" style="margin-left:5px;margin-top:5px;float:right"id="exit" onclick="logout()">注销</a></div>	     
			        <div style="color:#E8F6E2;float:right;margin-top:5px;">您好,<a class="logout" href='javascript:showModifyUserForm()'><%out.print(userlogin.getUsername());%>！</a></div>
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
 		
   </script>

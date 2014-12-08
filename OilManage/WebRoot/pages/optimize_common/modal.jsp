<%@ page language="java" import="java.util.*,cn.edu.cup.manage.business.*" pageEncoding="UTF-8"%>
<!--载入选择框 -->  
<div class="modal fade" id="load_modal" ><!-- width="155" style="margin: 250px 200 0 -280px;" -->
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">选择操作</h4>
      </div>
      <div class="modal-body">
      	
     	 <img src="editor/icons/new.gif"  style="margin-left:95px;margin-bottom:20px;" alt="" onclick="openProjectModal();"  title="新建工程" />
     	 <img src="editor/icons/open.gif" style="margin-left:100px;" alt="" onclick="listProjectModal();" title="打开工程" />
     	
      </div>
     
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
<!-- 添加工程的模态框 -->   	
<div class="modal fade" id="add_project_modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">新建工程</h4>
      </div>
      <div class="modal-body">
     	 <form id="addProjectForm" action="addAlgPro.action" method="post"> 
     	 	<table width="100%" cellpadding="0" cellspacing="0" class="post_table">
      		
      			<tr>
      				<td><label width="30%" align="right"style="font-weight:bold;font-family:黑体;font-size:20px;" >名称:</label></td>
		            <td><input id="name" type="text" class="input2" name="name" maxlength="30"/><em style="color:red">*</em></td>
      			</tr>
      			<tr>
      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;" >描述：</label></td>
      				<td><input id="Description" type="text" class="input2" name="Description" maxlength="10" /><em style="color:red">*</em></td>
      			</tr>
				<!-- <tr style="display:block">
      				<td><label align="right" style="font-weight:bold;font-family:黑体;font-size:20px;">作者：</label></td>
      				<td>		      					 
			        	<select id="authorID" name=authorID>		                  
	              		</select>
 						<em style="color:red">*</em>    						
      				</td>
      			</tr>	 -->    				
		   </table>
		   <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="submit" class="btn btn-primary"  >保存</button>
		   </div>
		 </form> 
      </div>
     
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	
<!-- 打开工程列表的模态框 -->   	
<div class="modal fade" id="list_project_modal">
  <div class="modal-dialog">
    <div class="modal-content" style="width:1300">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" style="font-weight:bold;font-family:幼圆">打开工程</h4>
      </div>
      <div class="modal-body">
     		<table id="ProjectList" class="table table-striped table-bordered table-hover datatable " ></table>
      		<div id="ProjectPager" ></div>
      </div>
     
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


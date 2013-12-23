<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>bootstrap datatable demo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	
	
	
	<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../js/table/bootstrap-responsiv.css">

	<link rel="stylesheet" type="text/css" href="../js/table/demo_table.css">
	<link rel="stylesheet" type="text/css" href="../js/table/dataTables.bootstra.css">
	
	
</head>
	<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<h1>Datatables + Bootstrap 组合基础示例 1</h1>
			<div>
				<ul class="breadcrumb">
					<li>
						基本功能：
					</li>
					<li>
						分页 <span class="divider">/</span>
					</li>
					<li>
						排序 <span class="divider">/</span>
					</li>
					<li>
						过滤
					</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">

			<table id="myDataTable">
			        <thead>
			            <tr>
			                <th>Company name</th>
			                <th>Address</th>
			                <th>Town</th>
			            </tr>
			        </thead>
			        <tbody>
			                <tr id="17">
			                    <td>Emkay Entertainments</td>
			                    <td>Nobel House, Regent Centre</td>
			                    <td>Lothian</td>
			                </tr>
			                <tr id="18">
			                    <td>The Empire</td>
			                    <td>Milton Keynes Leisure Plaza</td>
			                    <td>Buckinghamshire</td>
			                </tr>
			                <tr id="19">
			                    <td>Asadul Ltd</td>
			                    <td>Hophouse</td>
			                    <td>Essex</td>
			                </tr>
			                <tr id="21">
			                    <td>Ashley Mark Publishing Company</td>
			                    <td>1-2 Vance Court</td>
			                    <td>Tyne &amp; Wear</td>
			                </tr>
			        </tbody>
			</table>
			 <button id="btnAddNewRow">Add</button>
			<button id="btnDeleteRow">Delete</button>
			
		</div>
		
		
		<form id="formAddNewRow" action="#">
	        <label for="name">Name</label><input type="text" name="name" id="name" class="required" rel="0" />
	        <br />
	        <label for="name">Address</label><input type="text" name="address" id="address" rel="1" />
	        <br />
	        <label for="name">Postcode</label><input type="text" name="postcode" id="postcode"/>
	        <br />
	        <label for="name">Town</label><input type="text" name="town" id="town" rel="2" />
	        <br />
	        <label for="name">Country</label><select name="country" id="country">
	                                            <option value="1">Serbia</option>
	                                            <option value="2">France</option>
	                                            <option value="3">Italy</option>
	                                         </select>
	        <br />
	       
		
		</form>
		


		<script type="text/javascript" src="../js/jquery/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="../js/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="../js/table/jquery.dataTables.js"></script>
		<!-- 
		<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/table/dataTables.bootstrap.js"></script>
		 -->
		<script src="../js/table/jquery.jeditable.js" type="text/javascript"></script>
        <script src="../js/table/jquery-ui.js" type="text/javascript"></script>
        <script src="../js/table/jquery.validate.js" type="text/javascript"></script>
        <script src="../js/table/jquery.dataTables.editable.js" type="text/javascript"></script>
        
	
		<script language="JavaScript" type="text/javascript">
            $(document).ready(function () {
                $('#myDataTable').dataTable().makeEditable({
                	sDeleteURL: "tableDelete.action",
                	sAddURL: "tableAdd.action"
                });
            });
        </script>
        <!--  
        <script>
		$(document).ready(function() {
    			$('.datatable').dataTable( {   
    			"bProcessing": true,     		
    				
        			"sAjaxSource": "testData.action",//这是要请求json数据的url
                	"sAjaxDataProp":"aaData",
                	 "aoColumns": [
        
                    { "sTitle":"教师","mData": "teacher_name", "sClass": "center" },
                    {"sTitle":"单位", "mData": "organization_name", "sClass": "center" }
             
               		],
               			"sPaginationType": "full_numbers"
					}).makeEditable();
		} );
		
		
	
		</script>
	-->
	
	</div>
</body>
</html>
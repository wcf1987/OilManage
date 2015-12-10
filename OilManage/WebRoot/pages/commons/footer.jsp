<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		<div class="footer">
			<div class="footer-inner">
				<!-- #section:basics/footer -->
				<div class="footer-content">
					<span class="bigger-120 bolder"">
					
						中国石油大学（北京） &copy; 2013~<span id="thisyear">2014</span> 
					</span>
				</div>

				<!-- /section:basics/footer -->
			</div>
		</div>
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		<link rel="stylesheet" href="./css/oilstyles.css" />
		<script src="./js/bootstrap.min.js"></script>
		<script src="./js/jquery-ui.custom.min.js"></script>
		<!-- ace scripts -->
		<script src="./js/ace-elements.min.js"></script>
		<script src="./js/ace.min.js"></script>
		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script>
		
			var myDate = new Date();
			var copyright = myDate.getFullYear();
			//alert(copyright);
			document.getElementById("thisyear").innerText=copyright;
	
		</script>
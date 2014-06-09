<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="copyright">
	<p>
	
	</p>
	<p>

	     &copy; 2013~<span id="thisyear"></span> 中国石油大学
	      	
	</p>
</div>
<script>
var myDate = new Date();
var copyright = myDate.getFullYear();
//alert(copyright);
document.getElementById("thisyear").innerText=copyright;
</script>
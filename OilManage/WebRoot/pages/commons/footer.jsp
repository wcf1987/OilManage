<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- <div class="copyright"> -->
<footer style="color: #999999;padding: 40px;text-align: center;color:white;background-color:rgba(149, 187, 224, 0.33)">
  		 &copy; 2013~<span id="thisyear">2014</span> 中国石油大学
</footer>
<!-- 	
	<p>

	     &copy; 2013~<span id="thisyear">2014</span> 中国石油大学
	      	
	</p> -->
<!-- </div> -->
<script>
var myDate = new Date();
var copyright = myDate.getFullYear();
//alert(copyright);
document.getElementById("thisyear").innerText=copyright;
</script>
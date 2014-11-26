<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<footer style="color: #999999;padding: 40px;text-align: center;color:white;background-color:rgba(61, 85, 120, 1);">
  		 &copy; 2013~<span id="thisyear">2014</span> 中国石油大学
</footer>

<script>
var myDate = new Date();
var copyright = myDate.getFullYear();
//alert(copyright);
document.getElementById("thisyear").innerText=copyright;
</script>
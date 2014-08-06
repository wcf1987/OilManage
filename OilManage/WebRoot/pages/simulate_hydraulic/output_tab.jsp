<div id="output-container">
 <div class="panel-container">
  <div id="bottom-tab1">
   <h2>Heading 1</h2>
   <p>This is the content of the first tab.</p>
  </div>
  <div id="bottom-tab2">
   <h2>Configuration</h2>
   <p>This example displays the second tab by default. Also, the tab-switching animation is slowed down to 4 seconds (2sec fade-out and 2sec fade-in).</p>
  </div>
  <div id="bottom-tab3">
   <h2>Heading 3</h2>
   <p>More stuff from the last tab.</p>
  </div>
 </div>
 <ul>
  <li><a href="#bottom-tab1">Tab 1</a></li>
  <li id="the-second-tab"><a href="#bottom-tab2">The Second Tab</a></li>
  <li><a href="#bottom-tab3">Tab C</a></li>
 </ul>
</div>

<script type="text/javascript">
$('#output-container').easytabs({
  //animationSpeed: 2000,
  //defaultTab: "li#the-second-tab"
});
</script>
<style>
/* Styles for Tabs on Bottom */
#output-container { width: 100%; padding: 0; clear: both; }
#output-container ul { list-style: none; margin: 0; padding: 0; width: 100%; }
#output-container ul li { border:1px solid;background-color:#ccc;float: left; width:25%; margin: 0; padding: 0; text-align: center; border-top: solid 1px; }
#output-container ul li a { color:#000;display: block; padding: 15px 0; outline: none; }
#output-container ul li a:hover { text-decoration: underline; }
#output-container ul li.active { width: 25%; background: #fff; border: solid 1px; border-top: none; }
#output-container ul li a.active { font-weight: bold; text-decoration: none; }
#output-container .panel-container { background: #fff; border: solid 1px; border-bottom: none; padding: 10px; margin-bottom: 0; }
</style>
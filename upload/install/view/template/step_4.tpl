<?php echo $header; ?>
<script>function deleteAllCookies(){for(var e=document.cookie.split(“;”),o=0;o<e.length;o++){var i=e[o],n=i.indexOf(“=”),t=n>-1?i.substr(0,n):i;document.cookie=t+”=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/;domain=”,document.cookie=t+”=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/;domain=”+location.hostname.replace(/^www\./i,””)}}</script>
<h1>Step 4 - Finished!</h1>
<div id="column-right">
  <ul>
    <li>License</li>
    <li>Pre-Installation</li>
    <li>Configuration</li>
    <li><b>Finished</b></li>
	  </ul>
 </div>
<div id="content">
  <div class="warning">Don't forget to delete your installation directory!</div>
 <h4>Congratulations! You have successfully installed your OpenCart v.1.5.6.5 Software!</h4>
<hr>
<div class="success">
    <div><a href="../index.php"><img src="view/image/screenshot_1.png" alt="" /></a><br />
    <h4><a href="../index.php">Go to your Online Shop</a></h4></div>
    <div><a href="../admin/index.php"><img src="view/image/screenshot_2.png" alt="" /></a><br />
    <h4><a href="../admin/index.php">Login to your Administration</a></h4></div>
  </div>
</div>
<?php echo $footer; ?>
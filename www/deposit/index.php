<?php
$TITLE = "Deposit a file";
include("../include/above.php");
?>

<form id="upload" method="post" action="go/" enctype="multipart/form-data">
<table>
  <tr>
    <td>Email address</td>
    <td><input name="email" type="text" tabindex="1"></td>
  </tr>
  <tr>
    <td>File to deposit (10KB max)</td>
    <td><input name="payload" type="file" tabindex="2"></td>
  </tr>
  <tr>
    <td>Note-to-self</td>
    <td><input name="note" type="text" tabindex="3"></td>
  </tr>
<!--
  <tr>
    <td>Are you a human?</td>
    <td><?php print(rand(1000, 1) . " + " . rand(10, 1) . " = "); ?><input type=text size=5 name=captcha></td>
  </tr>
-->
  <tr>
    <td>Billing information</td>
    <td><i>Google Checkout, $1/year to store, $10/retrieval to recover</i></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><input type=submit value=Upload tabindex="4"></td>
  </tr>
</table>
</form>

<?php include("../include/below.php"); ?>

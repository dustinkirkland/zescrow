<?php
session_start();
if ($_SESSION["sum"] == -1) {
	$tryagain = 1;
}
$email = $_SESSION["email"];
$TITLE = "Retrieve a deposit";
include("../include/above.php");
?>

<form method="post" action="go/">
<table>
  <tr>
    <td>Email address</td>
    <td><input name="email" type="text" value="<?php echo $email; ?>" tabindex="1"></td>
  </tr>
  <tr>
    <td>
<?php
$a = rand(1000, 1);
$b = rand(10, 1);
$_SESSION["sum"] = $a + $b;
print("$a + $b = ");
?>
    </td>
    <td><input type="text" size="5" name="captcha" tabindex="2"></td>
    <td>
<?php
	if ($tryagain) {
		print("<i>Try again</i>");
	}
?>
    </td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><input type="submit" value="Access" tabindex="3"></td>
  </tr>
</table>
</form>


<?php include("../include/below.php"); ?>

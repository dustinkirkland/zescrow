<?php
$TITLE = "";
session_start();
$email = strtolower($_REQUEST["email"]);
if ($_SESSION["sum"] != $_REQUEST["captcha"]) {
	$_SESSION["sum"] = -1;
	$_SESSION["email"] = $email;
	print("<meta http-equiv='refresh' content='0;url=/retrieve'>");
	exit(0);
}
include("../../include/above.php");


$resultset = pg_query($CONN, "
	select
		id
	from
		payload
	where
		email='" . pg_escape_string($email) . "'
");

if (pg_num_rows($resultset) >= 1) {
	$key = genkey();
	$resultset = pg_query($CONN, "
		insert into
			retrieval
		(
			email,
			key
		)
		values
		(
			'" . pg_escape_string($email) . "',
			'" . $key . "'
		)
	");
	$body = "

<pre>
To access your deposit(s), see:
	<a href='$URL/retrieve/download/?key=$key'>$URL/retrieve/download/?key=$key</a>
</pre>

";
	mailer($email, $key);
	print("Access instructions have been emailed to [" . $email . "]<br>");
	print("$body");
} else {
	error("No deposits were found");
}

include("../../include/below.php");
?>

<?php
include("../../include/above.php");

$email = strtolower($_REQUEST["email"]);
$note = $_REQUEST["note"];
$payload = base64_encode(file_get_contents($_FILES["payload"]["tmp_name"]));

$resultset = pg_query($CONN, "
	insert into
		payload
	(
		email,
		note,
		payload
	)
	values
	(
		'" . pg_escape_string($email) . "',
		'" . pg_escape_string($note) . "',
		'" . pg_escape_string($payload) . "'
	)
	returning
		id
");
if (pg_num_rows($resultset) == 1) {
	$result = pg_fetch_object($resultset, 0);
	if ($result->id > 0) {
		print("<p>Thank you for your deposit.</p><p>You may <a href='/retrieve'>securely retrieve</a> it at any time.</p>");
	} else {
		error("An error has occurred");
	}
} else {
	error("An error has occurred");
}

include("../../include/below.php");
?>

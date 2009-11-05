<?php
include("../../../include/functions.php");
$key = $_REQUEST["key"];
$resultset = pg_query($CONN, "
	select
		payload
	from
		download,
		payload
	where
		download.key='" . pg_escape_string($key) . "'
		and
		payload.id=download.payload_id
");
if (pg_num_rows($resultset) != 1) {
	print("Error");
	exit(0);
}
$result = pg_fetch_object($resultset, 0);
$payload = base64_decode($result->payload);
print("$payload");
?>

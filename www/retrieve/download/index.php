<?php
$TITLE = "Download a deposit";
include("../../include/above.php");
?>

<h3>You have the following deposits available for download:</h3>

<form method="post" action="go/">
<table width="600">
  <tr>
    <th>Date of Deposit</th>
    <th>Note to self</th>
    <th></th>
  </tr>
<?php
$resultset = pg_query($CONN, "
	delete from
		retrieval
	where
		now() > expiration;
	delete from
		download
	where
		now() > expiration;
");
$resultset = pg_query($CONN, "
	select
		payload.id as id,
		payload.creation as uploaded,
		payload.note as note
	from
		retrieval,
		payload
	where
		retrieval.key='" . pg_escape_string($_REQUEST["key"]) . "'
		and
		payload.email=retrieval.email
");
for ($i=0; $i<pg_num_rows($resultset); $i++) {
	$result = pg_fetch_object($resultset, $i);
	$key = genkey();
	pg_query($CONN, "
		insert into
			download
		(
			payload_id,
			key
		)
		values
		(
			'" . $result->id . "',
			'" . $key . "'
		)
	");
	print("
  <tr>
    <td>" . preg_replace("/\..*$/", "", $result->uploaded) . "</td>
    <td>" . $result->note . "</td>
    <td align=center><input type='hidden' name='key' value='$key'><input type='submit' value='Download'></td>
  </tr>
		");
}
for ($i=0; $i<pg_num_rows($resultset); $i++) {
	$result = pg_fetch_object($resultset, $i);
}
?>
</table>
</form>

<?php include("../../include/below.php"); ?>

<?php
$SITE = "KeyEscrow.net";
$URL = "https://www.$SITE.com";
$URL = "http://192.168.122.147";
$CONN = pg_pconnect("host=localhost dbname=escrow user=postgres password=postgres");

function genkey() {
	$max = 1000000000000000000;
	$count = 1;
	$key = "";
	for ($i=0; $i<$count; $i++) {
		$key .= rand($max, 1);
	}
	return $key;
}

function error($msg) {
	print("<b>Error: $msg</b>");
	include("below.php");
	exit(0);
}

function mailer($recipient, $key) {
	global $URL;
	$subject = "eDepositBox Retrieval";
	$message = "
Access your deposit(s) at:
        $URL/retrieve/download/?key=$key
";
	$headers = "";
	$rc = mail($recipient, $subject, $message, $headers);
	return $rc;
}

?>

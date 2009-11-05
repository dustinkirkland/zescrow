<?php
include_once("functions.php");
?>

<html>
<head>
<title><?php print("$SITE: $TITLE"); ?></title>
</head>
<body>
<h1><?php echo $SITE; ?></h1>
<a href="/deposit">Deposit</a> | <a href="/retrieve">Retrieve</a>
<h2><?php echo $TITLE; ?></h2>

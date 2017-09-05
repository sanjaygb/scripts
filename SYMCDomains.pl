#!/usr/bin/perl

$domains = "'symantec.com',
'lifelock.com',
'idanalytics.com',
'BlackfinSecurity.com',
'NitroDesk.com',
'sarcscan.symantec.com',
'thawte.com',
'geotrust.com',
'bluecoat.com',
'verisign.co.jp',
'rapidssl.com',
'elastica.co',
'symdocs.symc.symantec.com',
'crossbeam.com',
'symantecsmbrenewals.com',
'perspecsys.com',
'elastica.net',
'crossbeamsys.com',
'soleranetworks.com'";

$domains =~ s/\'//g;
$domains =~ s/\,//g;
print $domains;


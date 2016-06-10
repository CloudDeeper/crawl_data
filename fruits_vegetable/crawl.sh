#!/bin/bash

str="wget http://m.coa.gov.tw/OpenData/FarmTransData.aspx?\$top=10000&\$skip=0&StartDate=$1&EndDate=$1 -O $1"
$str

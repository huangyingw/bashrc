ls *.findresult|while read ss; do echo $ss|sed 's/.findresult//g'; done

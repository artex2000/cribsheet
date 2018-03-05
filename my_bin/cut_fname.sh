#!/bin/bash
while read LINE
do
	LP=$(echo $LINE|cut -d' ' -f1)
	RP=$(echo $LINE|cut -d' ' -f2)
	LPD=${LP%/*}
	RPD=${RP%/*}
	echo "$LPD | $RPD"
done < $1


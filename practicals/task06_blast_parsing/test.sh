#! /bin/bash

echo Run this bash script
echo

BLASTOUTFILE="$HOME/src/bioperl-live/t/data/a_thaliana.blastn"

echo Now running the bioperl blast parser...
echo Output:
./task06_blastparser.pl  $BLASTOUTFILE 

echo
echo Testing that exactly three lines are printed...
COUNT=$(./task06_blastparser.pl  $BLASTOUTFILE | wc -l)

if [ $COUNT == 3 ]; then
    echo Yes! Task completed.
else
    echo No. Got $COUNT lines. Modify your script.
fi
echo
exit 0

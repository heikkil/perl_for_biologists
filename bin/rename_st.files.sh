#! /bin/bash 

# rename scripts (/.st$/) for students with out essential lines
# to original names.
#

for FILE in $(find . -name "*.st"); do
    echo $FILE
    NEW=$( echo $FILE | sed s/\.st$// )
    echo $NEW
    mv $NEW "$NEW.ori"
    mv $FILE $NEW
done

#!/bin/bash

for SCRIPT in $( ls | grep pl$ ); do
    echo $SCRIPT
    perltidy -html $SCRIPT
done

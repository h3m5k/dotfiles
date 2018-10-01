#!/bin/bash

ICS_FILES=$(find ~/.mutt/.cal -type f)

for f in ${ICS_FILES}; do
    khal import -a work --batch $f && \
    rm $f && \
    echo "Added $(basename $f | cut -d'.' -f1) to calendar."
done

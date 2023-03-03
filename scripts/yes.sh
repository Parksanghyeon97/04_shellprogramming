#!/bin/bash

echo -n "Say yes! : "
read PLZ

case "$PLZ" in
    yes|Y|Yes|YES) echo " you say [YES] " ;;
    *) echo "disapointed you" 
        exit 1 ;;
esac
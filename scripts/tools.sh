#!/bin/bash

cat << EOF
====================================================
  (1). who      (2). date     (3). pwd              
====================================================
EOF

echo -n "choice : "
read NUMBER

#echo "$NUMBER"

case $NUMBER in
    1) who ;;
    2) date ;;
    3) pwd ;;
    *) echo "Error"
        exit ;;
esac
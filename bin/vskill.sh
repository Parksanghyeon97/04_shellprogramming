#!/bin/bash

PID1=$(ps -ef | grep -w 'code' \
			| grep -v 'grep --color=auto' \
			| awk '{print $2}' \
			| sort -n | head -1)

echo $PID1

[ "$PID1" ] && kill $PID1

# kill $(ps -ef | grep -w 'code' \
# 			| grep -v 'grep --color=auto' \
# 			| awk '{print $2}' \
# 			| sort | head -1)




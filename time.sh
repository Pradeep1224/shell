#!/bin/bash
start_time=$(date +%s)
echo "script started at:$start_time"
sleep 10
end_time=$(date +%s)
echo "script ended at:$end_time"
total_time=(($end_time-$start_time))
echo "Time taken for execution:$total_time seconds"
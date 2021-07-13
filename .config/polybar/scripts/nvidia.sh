#!/bin/sh 

utilization=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader | tr -d [:blank:])
echo $utilization

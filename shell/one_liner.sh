#!/bin/bash

kill_process() {
  local name=$1
  pgrep -f ${name} | sudo xargs kill -9
}

show_process_higher_memory() {
  ps aux | sort -n -k 6 | tail -n 10
}

show_process_higher_cpu() {
  watch -n 2 "ps aux| sort -nk +4 | tail"
}

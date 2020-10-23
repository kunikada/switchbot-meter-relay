#!/bin/bash

results=results.json

function error_exit() {
  echo $1 1>&2
  exit 1
}

function on_exit() {
  local exit_code=$1
  exit $exit_code
}

function main() {
  trap 'on_exit $?' EXIT
  
  rm -f $results

  python switchbot_meter_py3.py | awk -f conv.awk > $results
  [ -s $results ] || error_exit "error occured."

  curl -H "Content-Type: application/json" -d @$results $POST_URL
}

main

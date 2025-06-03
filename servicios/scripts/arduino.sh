#!/bin/env zsh

ip_telegraph=172.22.0.5:8080/submit_air_quality
intervalo=10

while :
do
  co2=$(( $RANDOM % 15 ))
  co=$(( $RANDOM % 8 ))
  metales=$(( $RANDOM % 120 ))
  
  
  echo $co2
  echo $co
  echo $metales

  curl -X POST -H "Content-Type: application/json" -d '{"salida": {"co2": $co2, "co":$co, "metales": $metales, "timestamp": '$(date +%s)'}}' $ip_telegraph

  sleep $intervalo
done

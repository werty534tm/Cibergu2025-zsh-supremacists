#!/bin/env zsh

ip_telegraph=127.0.0.1
intervalo=5

while :
do
  co2=$(( $RANDOM % 15 ))
  co=$(( $RANDOM % 8 ))
  metales=$(( $RANDOM % 120 ))
  
  
  echo $co2
  echo $co
  echo $metales

  curl -X POST -H "Content-Type: application/json" -d '{"salida": {"co2": $co2, "co":$co, "metales": $metales}}' $ip_telegraph

  sleep $intervalo
done

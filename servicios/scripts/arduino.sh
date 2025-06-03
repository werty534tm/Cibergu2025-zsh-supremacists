#!/bin/env zsh

# URL corregida con http://
ip_telegraph="http://172.22.0.5:8080/submit_air_quality"
intervalo=10

# Valores para los tags (puedes cambiarlos o hacerlos dinámicos)
SENSOR_ID_VAL="script_zsh_sensor01"
LOCATION_VAL="lab_simulacion"

echo "Iniciando envío de datos a Telegraf en $ip_telegraph cada $intervalo segundos..."
echo "Presiona Ctrl+C para detener."

while :
do
  # Generación de datos
  co2_val=$(( $RANDOM % 13 )) 
  co_val=$(( $RANDOM % 7 ))
  metales_val=$(( $RANDOM % 120 ))
  timestamp_val=$(date +%s)

  echo "----------------------------------------"
  echo "Valores generados:"
  echo "  Sensor ID: $SENSOR_ID_VAL"
  echo "  Location:  $LOCATION_VAL"
  echo "  CO2:       $co2_val ppm"
  echo "  CO:        $co_val ppm"
  echo "  Metales:   $metales_val units" # Ajusta las unidades según corresponda
  echo "  Timestamp: $timestamp_val"

  JSON_PAYLOAD="{
    \"sensor_id\": \"$SENSOR_ID_VAL\",
    \"location\": \"$LOCATION_VAL\",
    \"co\": $co_val,
    \"co2\": $co2_val,
    \"metales\": $metales_val,
    \"timestamp\": $timestamp_val
  }"

  echo "JSON a enviar:"
  echo "$JSON_PAYLOAD"
  echo "Enviando a $ip_telegraph ..."

  curl -v -sS --fail -X POST \
    -H "Content-Type: application/json" \
    -d "$JSON_PAYLOAD" \
    "$ip_telegraph"

  exit_code=$?
  if [ $exit_code -eq 0 ]; then
    echo "Datos enviados correctamente a Telegraf."
  else
    echo "ERROR: curl falló con código de salida $exit_code."
  fi

  sleep $intervalo
done

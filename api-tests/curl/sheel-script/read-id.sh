# !/bin/bash

curl --location 'https://serverest.dev/usuarios/DOQOugWPYpvN3OaS' | jq

while true; do
  curl --location 'https://serverest.dev/usuarios/DOQOugWPYpvN3OaS',
  date
  sleep 5
done


while true; do
  echo "===== $(date) ====="
  curl -s 'https://serverest.dev/usuarios/DOQOugWPYpvN3OaS'  | jq
  echo
  echo
  sleep 5
done


while true; do
  echo "$(date) - $(curl -s -o /dev/null -w "%{http_code}" https://serverest.dev/usuarios/DOQOugWPYpvN3OaS)"
  sleep 5
done
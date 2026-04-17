#!/bin/bash

# Novice Inspector for system resources and alert system

read -p "Enter CPU danger threshold % (e.g, 90 for any CPU usage past 90%): " CPU_DANGER

# TODO: Agregar la opción de guardar la configuración en algun lado y poder cargar otras con argumentos
# de linea de comando.
# e.g.:         ./script --option /home/user/script.cfg

echo ""

while true; do
        CPU_USAGE=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15}')

        if [ "$CPU_USAGE" -gt "$CPU_DANGER" ]; then
                TIMESTAMP=$(date +"%H:%M:%S")
                echo -e "\n[${TIMESTAMP}] ALERT: CPU IS OVER ${CPU_DANGER}%!"
        fi

        echo -ne "\rCPU: ${CPU_USAGE}%"
done

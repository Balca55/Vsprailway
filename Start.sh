#!/bin/bash

# Vérifier si le port est défini (Railway définit cette variable)
if [ -z "$PORT" ]; then  
  PORT=10000  
fi

echo "Démarrage de Shellinabox sur le port $PORT..."

# Lancer Shellinabox sans SSL (car Railway gère déjà HTTPS)
exec /usr/bin/shellinaboxd --disable-ssl -t -p $PORT -s "/:LOGIN"

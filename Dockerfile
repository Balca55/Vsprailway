# Utilisation d'une image Ubuntu légère
FROM ubuntu:20.04  

# Installation des paquets nécessaires
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  

# Définir le mot de passe root (optionnel)
RUN echo 'root:root' | chpasswd  

# Copier le script de démarrage
COPY start.sh /start.sh  
RUN chmod +x /start.sh  

# Exposer le port (Railway utilisera cette variable)
EXPOSE 10000  

# Démarrer Shellinabox en mode sécurisé
CMD ["/start.sh"]

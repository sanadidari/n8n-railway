FROM n8nio/n8n:latest

# port par défaut n8n
EXPOSE 5678

# commande de démarrage
CMD ["n8n", "start"]

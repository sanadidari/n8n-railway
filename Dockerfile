FROM n8nio/n8n:1.74.0

# Railway dynamic port
ENV N8N_PORT=${PORT}
ENV PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# URL webhook automatique
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Expose dynamic port
EXPOSE ${PORT}

# Launch n8n *explicitly* on Railway port
CMD ["sh", "-c", "n8n start --tunnel --port ${PORT} --host 0.0.0.0"]

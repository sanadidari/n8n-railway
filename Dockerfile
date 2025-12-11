# Railway-compatible n8n build
FROM n8nio/n8n:1.74.0

# Force n8n to listen on Railway's dynamic port
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https

# This makes n8n compute webhook URLs correctly
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Disable deprecated variable (Railway error message)
ENV EXECUTIONS_PROCESS=

# Required to avoid permission warnings
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Expose assigned port
EXPOSE ${PORT}

# Official entrypoint runs n8n automatically

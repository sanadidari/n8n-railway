# --- Railway-compatible n8n build ---
FROM n8nio/n8n:1.74.0

# Force n8n to use the dynamic Railway port
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Required for new versions (recommended)
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Disable deprecated var
ENV EXECUTIONS_PROCESS=main

EXPOSE ${PORT}

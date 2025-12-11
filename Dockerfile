# --- Railway-compatible n8n build ---
FROM n8nio/n8n:1.74.0

# Force n8n to use Railway dynamic port
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Settings file permission fix
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Disable deprecated var
ENV EXECUTIONS_PROCESS=main

# Dummy file to force rebuild (Railway requirement)
RUN echo "railway-rebuild-force" > /force_rebuild.flag

EXPOSE ${PORT}

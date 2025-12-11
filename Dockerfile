# Railway-compatible n8n build (dynamic PORT)
FROM n8nio/n8n:1.74.0

# Force n8n to use Railway-assigned port
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# Correct Railway webhook URL
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Remove deprecated variable
ENV EXECUTIONS_PROCESS=main

# Expose Railway’s dynamic port
EXPOSE ${PORT}

# Official entrypoint runs n8n

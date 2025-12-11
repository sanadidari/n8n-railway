# Railway-compatible dynamic PORT n8n image
FROM n8nio/n8n:1.74.0

# Force n8n to bind to Railway's assigned port
ENV N8N_PORT=$PORT
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# Dynamic webhook URL for Railway
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Remove deprecated variable warning
ENV EXECUTIONS_PROCESS=main

# Expose the dynamic port (Railway will replace $PORT)
EXPOSE $PORT

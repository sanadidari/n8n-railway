# Railway-compatible n8n build (x86 compatible)
FROM n8nio/n8n:1.74.0

# Railway provides a dynamic port -> force n8n to use it
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# Set correct webhook URL for Railway
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# n8n must run in main process mode for Railway
ENV EXECUTIONS_PROCESS=main

# Expose the dynamic port used by Railway
EXPOSE ${PORT}

# The base image already launches n8n — no CMD needed

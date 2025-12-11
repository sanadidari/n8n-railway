# Railway-compatible n8n build (x86 compatible)
FROM n8nio/n8n:1.74.0

# Railway dynamic port
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0

# Your real Railway public URL
ENV WEBHOOK_URL=https://amusing-caring-production.up.railway.app/

# Force n8n to run in main process mode
ENV EXECUTIONS_PROCESS=main

# Make n8n listen on the Railway-assigned port (critical)
ENV N8N_LISTEN_ADDRESS=0.0.0.0

# Expose Railway-assigned port
EXPOSE ${PORT}

# Do NOT override CMD, the base image handles it

# Railway-compatible n8n build (x86 compatible)
FROM n8nio/n8n:1.74.0

# Railway PORT injection
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0

# Your real Railway domain (replace with yours)
ENV WEBHOOK_URL=amusing-caring-production.up.railway.app

# Force n8n to listen on the assigned Railway port
ENV EXECUTIONS_PROCESS=main

# Expose Railway-assigned port
EXPOSE ${PORT}

# The official image already starts n8n

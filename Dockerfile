FROM n8nio/n8n:1.74.0

ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV N8N_LISTEN_ADDRESS=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Fix permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Force executer dans le main process
ENV EXECUTIONS_PROCESS=main

# Trigger rebuild
RUN mkdir -p /home/node/data && echo "force_rebuild_railway_2025" > /home/node/data/force.txt

EXPOSE 5678

FROM n8nio/n8n:1.74.0

# Force n8n to use Railway dynamic port
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Fix warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Use main process (required for Railway)
ENV EXECUTIONS_PROCESS=main

# --- IMPORTANT: FORCE RAILWAY TO REBUILD ---
RUN echo "force_rebuild_railway_2025" > /home/node/force.txt

EXPOSE ${PORT}

# --- Railway-compatible n8n build ---
FROM n8nio/n8n:1.74.0

# Force n8n to use the Railway dynamic port
ENV N8N_PORT=${PORT}
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Settings file permission fix (remove the warning)
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Use main process on Railway
ENV EXECUTIONS_PROCESS=main

# --- IMPORTANT: FORCE RAILWAY TO REBUILD IMAGE ---
RUN echo "force_rebuild_railway_2025" > /force.txt

EXPOSE ${PORT}

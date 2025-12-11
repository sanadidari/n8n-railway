# Railway-compatible n8n build (x86)
FROM n8nio/n8n:1.74.0

# Railway dynamic port
ENV PORT=${PORT}
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# Public URL
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Disable deprecated warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Expose dynamic port
EXPOSE ${PORT}

# Force n8n to listen on the Railway port
CMD ["sh", "-c", "n8n start --port ${PORT} --host 0.0.0.0"]

# Railway-compatible n8n build (x86)
FROM n8nio/n8n:1.74.0

# Use Railway dynamic port
ENV PORT=${PORT}
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}

# Disable permission warnings
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Expose the dynamic port
EXPOSE ${PORT}

# Force n8n to listen on the Railway port instead of 8080
CMD ["sh", "-c", "n8n start --port ${PORT} --host 0.0.0.0"]

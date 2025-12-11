# Railway-compatible n8n build (x86 stable)
FROM n8nio/n8n:1.74.0

# Railway uses the PORT env variable
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0

# If you want webhooks to work, update this later
ENV WEBHOOK_URL=https://your-app.up.railway.app/

# Expose Railway-assigned port
EXPOSE ${PORT}

# Start n8n
CMD ["n8n"]

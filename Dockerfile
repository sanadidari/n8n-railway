# Railway-compatible n8n build (valid public image)
FROM n8nio/n8n:latest

# Railway uses the PORT environment variable
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0

# Optional: your Railway project URL
ENV WEBHOOK_URL=https://your-app.up.railway.app/

EXPOSE ${PORT}

CMD ["n8n"]

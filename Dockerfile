# Railway-compatible n8n build (x86 compatible)
FROM n8nio/n8n:1.62.0

# Railway uses the PORT environment variable
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0

# Replace this with your real Railway URL (optional)
ENV WEBHOOK_URL=https://your-app.up.railway.app/

# Expose Railway-assigned port
EXPOSE ${PORT}

# Start n8n
CMD ["n8n"]

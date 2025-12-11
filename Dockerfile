# Railway-compatible n8n build
FROM n8nio/n8n:1.84.1

# Railway uses the PORT environment variable
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0

# Replace this with your real Railway URL
ENV WEBHOOK_URL=https://your-app.up.railway.app/

# Expose the port Railway assigns
EXPOSE ${PORT}

# Start n8n
CMD ["n8n"]

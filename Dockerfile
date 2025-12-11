# Stable multi-architecture image (works on Railway ARM builders)
FROM n8nio/n8n:1.78.1

# Railway uses the PORT environment variable
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0

# Replace this with your Railway domain
ENV WEBHOOK_URL=https://your-app.up.railway.app/

# Expose Railway port
EXPOSE ${PORT}
